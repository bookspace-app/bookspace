
// Function to extract the usernames from a text
List<String> ExtractUsernames(String content) {
  // Regex to match usernames
  // ignore: omit_local_variable_types
  RegExp usernameExp = RegExp(r'\@\w+');
  Iterable<Match> usernameMatches = usernameExp.allMatches(content);
  // ignore: omit_local_variable_types
  List<String> usernames = [];
  // Map matches to strings
  usernameMatches.forEach((m)=>usernames.add(m.group(0).substring(1)));
  print('Found usernames: ${usernames}');
  return usernames;
}


