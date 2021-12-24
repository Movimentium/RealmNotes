//
//  NoteBooksListPresenter.swift
//  RealmNotes
//
//  Created by Miguel Gallego on 24/12/21.
//

import Foundation

protocol NoteBooksListViewInterface: AnyObject {
    func presentAddNewNotebookAlert()
}

class NoteBooksListPresenter {

    private let db = DBManager.shared
    
    func addNewNotebook(withTitle title: String?) {
        guard let theTitle = title, !theTitle.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return
        }
        db.addNewNoteBook(withTitle: theTitle)
        // reload data
    }
    
    
}
