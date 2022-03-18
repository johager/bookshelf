//
//  Book.swift
//  Bookshelf
//
//  Created by James Hager on 3/18/22.
//

import Foundation

class Book {
    let title: String
    let authorFirstName: String
    let authorLastName: String
    let coverImageName: String
    let releaseDate: Date
    let description: String
    
    var author: String {
        return "\(authorFirstName) \(authorLastName)"
    }
    
    init(title: String, authorFirstName: String, authorLastName: String, coverImageName: String, releaseDateString: String, description: String) {
        self.title = title
        self.authorFirstName = authorFirstName
        self.authorLastName = authorLastName
        self.coverImageName = coverImageName
        self.releaseDate = Book.date(from: releaseDateString)
        self.description = description
    }
    
    static func date(from dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)!
    }
}
