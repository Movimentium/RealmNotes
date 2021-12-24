//
//  DBManager.swift
//  RealmNotes
//
//  Created by Miguel Gallego on 24/12/21.
//

import RealmSwift

class DBManager {

    static let shared = DBManager()
    private let realm: Realm!
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            realm = nil
            fatalError("\(Self.self) \(#function) \(error.localizedDescription)")
            // TODO: handle this error better
        }
    }
    
    // MARK: - Read
    var noteBooks: [RNoteBook] {
        let noteBooksResults: Results<RNoteBook> = realm.objects(RNoteBook.self)
        let noteBooks: [RNoteBook] = noteBooksResults.map{$0}
        return noteBooks
    }
    
    func notesOf(noteBook: RNoteBook) -> [RNote] {
        let notes = noteBook.notes
        return notes.map {$0}
    }
    
    
    // MARK: - Create
    func addNewNoteBook(withTitle title: String) {
        let newRNoteBook = RNoteBook()
        newRNoteBook.title = title
        do {
            try realm.write {
                realm.add(newRNoteBook)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addNewNoteTo(noteBook: RNoteBook, title: String, content: String) {
        let newRNote = RNote()
        newRNote.title = title
        newRNote.content = content
        do {
            try realm.write {
                realm.add(newRNote)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    // MARK: - Update
    func update(note: RNote, title: String, content: String) {
        do {
            try realm.write {
                note.title = title
                note.content = content
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    
    // MARK: - Delete
    func delete(note: RNote) {
        do {
            try realm.write {
                realm.delete(note)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    
}
