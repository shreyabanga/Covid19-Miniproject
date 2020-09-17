import 'dart:convert';

import 'package:covid19_tracker_navbar/models/api_symptom_response.dart';
import 'package:covid19_tracker_navbar/models/symptom.dart';
import 'package:covid19_tracker_navbar/models/symptom_for_listing.dart';
import 'package:covid19_tracker_navbar/models/symptom_insert.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '1baa37ff-ce8f-4d91-b35b-4c4db2e2d4c0',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'Error');
    }).catchError((_) =>
        APIResponse<List<NoteForListing>>(error: true, errorMessage: 'Error'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(
          error: true, errorMessage: 'Error getting symptom');
    }).catchError((_) =>
        APIResponse<Note>(error: true, errorMessage: 'Error getting symptom'));
  }

  Future<APIResponse<bool>> createNote(NoteManipulation item) {
    return http
        .post(API + '/notes',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          error: true, errorMessage: 'Error creating symptom');
    }).catchError((_) => APIResponse<bool>(
            error: true, errorMessage: 'Error creating symptom'));
  }

  Future<APIResponse<bool>> updateNote(String noteID, NoteManipulation item) {
    return http
        .put(API + '/notes/' + noteID,
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          error: true, errorMessage: 'Error updating symptom');
    }).catchError((_) => APIResponse<bool>(
            error: true, errorMessage: 'Error updating symptom'));
  }
}
