//
//  ViewController.swift
//  Bookshelf
//
//  Created by James Hager on 3/18/22.
//

import UIKit

class BookListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let bookController = BookController()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showBookDetail" {
            guard
                let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? BookDetailViewController
            else { return }
            destination.book = bookController.books[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource

extension BookListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookController.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)

        cell.textLabel?.text = bookController.books[indexPath.row].title
        cell.detailTextLabel?.text = bookController.books[indexPath.row].author

        return cell
    }
}
