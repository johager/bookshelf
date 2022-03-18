//
//  Book.swift
//  Bookshelf
//
//  Created by James Hager on 3/18/22.
//

import Foundation

class Book {
    let title: String
    let author: String
    let coverImageName: String
    let releaseDate: Date
    let description: String
    
    init(title: String, author: String, coverImageName: String, releaseDateString: String, description: String) {
        self.title = title
        self.author = author
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
