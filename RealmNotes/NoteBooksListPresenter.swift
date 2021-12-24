//
//  NoteBooksListPresenter.swift
//  RealmNotes
//
//  Created by Miguel Gallego on 24/12/21.
//

import Foundation

typealias TupleTitleStrDate = (title: String, strDate: String)

protocol NoteBooksListViewInterface: AnyObject {
    func presentAddNewNotebookAlert()
    func reloadData()
}

class NoteBooksListPresenter {

    weak var viewInterface: NoteBooksListViewInterface!
    private let db = DBManager.shared
    
    func addNewNotebook(withTitle title: String?) {
        guard let theTitle = title, !theTitle.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return
        }
        db.addNewNoteBook(withTitle: theTitle)
        DispatchQueue.main.async {
            self.viewInterface.reloadData()
        }
        db.debug_printNoteBooks()
    }
    
    func onBtnAdd() {
        viewInterface.presentAddNewNotebookAlert()
    }
    
    // MARK: - Table props & methods
    var numOfNoteBooks: Int {
        return db.noteBooks.count
    }
    
    func cellInfo(at i: Int) -> TupleTitleStrDate {
        let title = db.noteBooks[i].title
        let date = db.noteBooks[i].date
        let strDate = Style.dateForm.string(from: date)
        return (title, strDate)
    }
    
    func deleteNoteBook(at idx: Int) {
        let rNoteBook = db.noteBooks[idx]
        db.delete(notebook: rNoteBook)
        db.debug_printNoteBooks()
    }
    
    func didSelectNotebook(at idx: Int) {
        
    }
}
