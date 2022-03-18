//
//  ViewController.swift
//  Bookshelf
//
//  Created by James Hager on 3/18/22.
//

import UIKit

class BookListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var sortBySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let bookController = BookController()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Books"
        
        setUpSortBySegmentedControl()
        
        bookController.sort(by: .title)
    }
    
    func setUpSortBySegmentedControl() {
        sortBySegmentedControl.setTitle("Title", forSegmentAt: 0)
        sortBySegmentedControl.setTitle("Author", forSegmentAt: 1)
        sortBySegmentedControl.setTitle("Date", forSegmentAt: 2)
        
        sortBySegmentedControl.addTarget(self, action: #selector(handleSegmentedControlChanged(_:)), for: .valueChanged)
    }
    
    @objc func handleSegmentedControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            bookController.sort(by: .title)
        case 1:
            bookController.sort(by: .author)
        case 2:
            bookController.sort(by: .releaseDate)
        default:
            break
        }
        tableView.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showBookDetail" {
            guard
                let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? BookDetailViewController
            else { return }
            destination.bookController = bookController
            destination.bookIndex = indexPath.row
            tableView.deselectRow(at: indexPath, animated: true)
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
