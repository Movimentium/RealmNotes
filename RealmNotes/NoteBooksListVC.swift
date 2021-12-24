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
        alertVC.addAction(btnCancel)
        alertVC.addAction(btnAdd)
        return alertVC
    }()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Notebooks"
        presenter.viewInterface = self
        table.dataSource = self
        table.delegate = self
    }
    
    @IBAction func onBtnAdd(_ sender: UIBarButtonItem) {
        presenter.onBtnAdd()
    }
}

// MARK: - NoteBooksListViewInterface
extension NoteBooksListVC: NoteBooksListViewInterface {
    
    func presentAddNewNotebookAlert() {
        present(addNewNoteBookAlert, animated: true, completion: nil)
    }
    
    func reloadData() {
        table.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension NoteBooksListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numOfNoteBooks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tupleInfo = presenter.cellInfo(at: indexPath.row)
        let cell: UITableViewCell = table.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = tupleInfo.title
        cell.detailTextLabel?.text = tupleInfo.strDate
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NoteBooksListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        presenter.didSelectNotebook(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteNoteBook(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

