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
  PublicationView({
    Key key,
    this.id
  }) : super(key: key);

  @override
  _PublicationViewState createState() => _PublicationViewState();
}

class _PublicationViewState extends State<PublicationView> {
  Publication _publication;
  List<Comment> _comments;
  int rate = 2;
  int loadedComments = 2;

  void getPublication(int id) async {
    Publication publication = await PublicationController.getPublication(id);
    List<Comment> comments = [];
    print(publication);
    if (!disposed){
      setState(() => _publication = publication);
      comments = await CommentController.getComments(_publication.commentsUri);
      setState(() => _comments = comments);
      print(_comments);
    }
    print(_publication);
  }

  @override
  void initState() { 
    super.initState();
    getPublication(widget.id);
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();

  }

  void refresh() {
    print(_publication.comments);
    getPublication(widget.id);
    print(_publication.comments);
  }
  
  @override
  Widget build(BuildContext context) {

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
                        setState(() {
                          loadedComments = (loadedComments + rate > _publication.comments)
                          ? _publication.comments
                          : loadedComments + rate;
                        });
                      }
                    )
                )
              ],
            ), 
          );
    }
    return (_publication != null && _comments != null)? ListView(
       children: <Widget>[
         PublicationHero(
           publication: _publication,
         ),
         UserCard(
           author: _publication.author,
           dop: _publication.dop,
           principal: true,
         ),
         Container(
           padding: EdgeInsets.only(left: 10),
           child: Text(
             '${_publication.comments} responses',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 15.0,
             ),
           ),
         ),
         for (var i = 0; i < loadedComments; i++)Container(
           child: Column(
            children: <Widget> [
              ResponseCard(
                response: _comments[i]
              ),
              UserCard(
                author: _comments[i].author,
                dop: _comments[i].dop,
                principal: false,
                likes: _comments[i].likes,
                dislikes: _comments[i].dislikes,
                replies: _comments[i].replies,
              ),
            ]
          )
         ),
         (loadedComments < _publication.comments)
         ? loadMoreComments()
         : Container(),
          CreateComment(
            id: _publication.id,
            notifyOnNewComment: refresh
          )
       ],
    ): Center(child:CircularProgressIndicator());
  }
}