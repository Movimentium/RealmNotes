//
//  NoteBooksListVC.swift
//  RealmNotes
//
//  Created by Miguel Gallego on 24/12/21.
//

import UIKit

class NoteBooksListVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    private let presenter = NoteBooksListPresenter()
    private let idCell = "noteBookCell"
    
    private lazy var addNewNoteBookAlert: UIAlertController = {
       let alertVC = UIAlertController(title: "Add new Notebook",
                                       message: "Enter the title",
                                       preferredStyle: .alert)
        alertVC.addTextField { txtField in
            txtField.placeholder = "Notebook title"
        }
        let btnCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let btnAdd = UIAlertAction(title: "Add", style: .default) { action in
            self.presenter.addNewNotebook(withTitle: alertVC.textFields?.first?.text)
        }
        return alertVC
    }()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self

    }
    
    @IBAction func onBtnAdd(_ sender: UIBarButtonItem) {
        
    }
}



// MARK: - UITableViewDataSource
extension NoteBooksListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension NoteBooksListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


