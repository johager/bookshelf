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
    
    var book: Book?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

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
