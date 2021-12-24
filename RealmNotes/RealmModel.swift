//
//  RealmModel.swift
//  RealmNotes
//
//  Created by Miguel Gallego on 24/12/21.
//

import RealmSwift

class RNote: Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var date = Date()
}

class RNoteBook: Object {
    @objc dynamic var title = ""
    @objc dynamic var date = Date()
    let notes = List<RNote>()
}

