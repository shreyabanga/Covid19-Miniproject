class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteForListing(
      {this.noteID,
      this.createDateTime,
      this.latestEditDateTime,
      this.noteTitle});
}
