//
//  Style.swift
//  RealmNotes
//
//  Created by Miguel on 24/12/21.
//

import UIKit

class Style {
    
    static var dateForm: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return df
    }()
    
    static func configNavigatorBarAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
