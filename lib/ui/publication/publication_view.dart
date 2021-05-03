import 'package:bookspace/controllers/comment_controller.dart';
import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/models/comment.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/ui/publication/widgets/create_comment.dart';
import 'package:bookspace/ui/publication/widgets/publication_hero.dart';
import 'package:bookspace/ui/publication/widgets/response_card.dart';
import 'package:bookspace/ui/publication/widgets/user_card.dart';
import 'package:flutter/material.dart';

class PublicationView extends StatefulWidget {
  final int id;
  final bool isPublication;
  PublicationView({
    Key key,
    this.id,
    this.isPublication
  }) : super(key: key);

  @override
  _PublicationViewState createState() => _PublicationViewState();
}

class _PublicationViewState extends State<PublicationView> {
  Publication _publication;
  Comment _comment;
  List<Comment> _comments;
  // Rate is the number of comments that are added
  // when you ask for more
  int rate = 2;
  // Loaded comments is the initial number of loaded comments
  // in the view
  int loadedComments = 2;

  // API call to get the publication of the view by id
  void getPublication(int id) async {
    Publication publication = await PublicationController.getPublication(id);
    List<Comment> comments = [];
    print(publication);
    if (!disposed){
      setState(() => _publication = publication);
      // If there are no comments, do not overload
      // by API call
      if (_publication.comments ==  0) {
        setState(() => loadedComments = 0);
      } else {
        comments = await CommentController.getComments(_publication.commentsUri);
        setState(() => _comments = comments);
        print(_comments);
      }
    }
  }

  // API call to get the comment of the view by id
  void getComment(int id) async {
    Comment comment = await CommentController.getComment(id);
    List<Comment> comments = [];
    print(comment);
    if (!disposed){
      setState(() => _comment = comment);
      // If there are no replies, do not overload
      // by API call
      if (_comment.replies ==  0) {
        setState(() => loadedComments = 0);
        setState(() => _comments = comments);
      } else  {
        comments = await CommentController.getComments(_comment.repliesUri);
        setState(() => _comments = comments);
        print(_comments);
      }
    }
  }

  @override
  void initState() { 
    super.initState();
    // Load comment or publication
    // depending on  the type
    if (widget.isPublication) {
      getPublication(widget.id);
    } else {
      getComment(widget.id);
    }
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();

  }

  // Refresh the view on update
  // When new comments are added
  void refresh() {
    if (widget.isPublication) {
      getPublication(widget.id);
    } else {
      getComment(widget.id);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // Widget button -- allows showing
    // more comments in the view
    Widget loadMoreComments() {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 35,
              child: RaisedButton(
                textColor: Colors.white,
                color: Color.fromRGBO(250, 198, 65, 1),
                child: Text(
                  'Load more',
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black),
                  ),
                  onPressed: () {
                    // Show comments with the specified rate
                    setState(() {
                      int comments = (widget.isPublication)
                      ? _publication.comments
                      : _comment.replies;
                      loadedComments = (loadedComments + rate > comments)
                      ? comments
                      : loadedComments + rate; 
                    }
                  );
                }
              )
            )
          ],
        ), 
      );
    }
    // Return the view if the objects are loaded (are not null)
    return ((_publication != null || _comment != null) && _comments != null)? ListView(
       children: <Widget>[
         // Publication hero is the top widget that
         // shows the content of the contribution
          PublicationHero(
            publication: (widget.isPublication) 
            ? _publication
            : _comment,
            isPublication: widget.isPublication,
          ),
         // User card is the widget of the author
         UserCard(
           author: (widget.isPublication)
           ? _publication.author
           : _comment.author,
           dop: (widget.isPublication)
           ? _publication.dop
           : _comment.dop,
           principal: true,
           isPublication: widget.isPublication,
         ),
         // The container shows the total 
         // number of responses
         Container(
           padding: EdgeInsets.only(left: 10),
           child: Text(
             (widget.isPublication)
             ? '${_publication.comments} responses'
             : '${_comment.replies} replies',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 15.0,
             ),
           ),
         ),
         // This iterator renders the comments
         // to the principal contribution of the view
         for (var i = 0; i < loadedComments; i++)Container(
           child: Column(
            children: <Widget> [
              ResponseCard(
                response: _comments[i]
              ),
              // The corresponding author of the comment
              UserCard(
                commentId: _comments[i].id,
                author: _comments[i].author,
                dop: _comments[i].dop,
                principal: false,
                isPublication: false,
                likes: _comments[i].likes,
                dislikes: _comments[i].dislikes,
                replies: _comments[i].replies,
              ),
            ]
          )
         ),
         // If the number of loaded comments has
         // not achieved its limit, we can 
         // use the loadMoreComments widget
         (loadedComments < (
           (widget.isPublication)
           ? _publication.comments
           : _comment.replies)
          )
         ? loadMoreComments()
         : Container(),
         // Create Comment  is a widget for
         // posting new comments
          CreateComment(
            id: (widget.isPublication)
            ? _publication.id
            : _comment.publicationId,
            commentId: (widget.isPublication)
            ? null
            : _comment.id,
            notifyOnNewComment: refresh
          )
       ],
    ): Center(child:CircularProgressIndicator());
  }
}