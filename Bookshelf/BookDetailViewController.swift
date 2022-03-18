//
//  BookDetailViewController.swift
//  Bookshelf
//
//  Created by James Hager on 3/18/22.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    
    var bookController: BookController?
    var bookIndex: Int?
    
    var book: Book? {
        guard let bookIndex = bookIndex else { return nil }
        return bookController?.books[bookIndex]
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSwipeGestureRecognisers()
        updateViews()
    }

    // MARK: - View methods
    
    func setUpSwipeGestureRecognisers(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight))
        swipeRight.direction = .right
        
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleSwipeLeft() {
        guard let bookController = bookController else { return }
        
        doSwipe() { index in
            var newIndex = index + 1
            if newIndex == bookController.books.count {
                newIndex = 0
            }
            return newIndex
        }
    }
    
    @objc func handleSwipeRight() {
        guard let bookController = bookController else { return }
        
        doSwipe() { index in
            var newIndex = index - 1
            if newIndex < 0 {
                newIndex = bookController.books.count - 1
            }
            return newIndex
        }
    }
    
    func doSwipe(newIndexFrom: (Int) -> Int) {
        guard let bookIndex = bookIndex else { return }
        
        self.bookIndex = newIndexFrom(bookIndex)
        
        updateViews()
    }
    
    func updateViews() {
        guard let book = book else { return }
        
        imageView.image = UIImage(named: book.coverImageName)
        titleLabel.text = book.title
        authorLabel.text = book.author
        releaseDateLabel.text = dateString(from: book.releaseDate)
        descriptionTextView.text = book.description
    }
    
    func dateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
