//
//  BookController.swift
//  Bookshelf
//
//  Created by James Hager on 3/18/22.
//

import Foundation

class BookController {
    
    var books = [Book]()
    
    // MARK: - Init
    
    init() {
        self.books = [
            Book(title: "Flatland: A Romance of Many Dimensions", authorFirstName: "Edwin Abbott", authorLastName: "Abbott", coverImageName: "flatland", releaseDateString: "1884-06-01", description: "Flatland: A Romance of Many Dimensions is a satirical novella by the English schoolmaster Edwin Abbott Abbott, first published in 1884 by Seeley & Co. of London. Written pseudonymously by \"A Square\", the book used the fictional two-dimensional world of Flatland to comment on the hierarchy of Victorian culture, but the novella's more enduring contribution is its examination of dimensions."),
            Book(title: "Stranger in a Strange Land", authorFirstName: "Robert A.", authorLastName: "Heinlein", coverImageName: "strangerInAStrangeLand", releaseDateString: "1961-06-01", description: "Stranger in a Strange Land is a 1961 science fiction novel by American author Robert A. Heinlein. It tells the story of Valentine Michael Smith, a human who comes to Earth in early adulthood after being born on the planet Mars and raised by Martians, and explores his interaction with and eventual transformation of Terran culture."),
            Book(title: "The Blind Watchmaker: Why the Evidence of Evolution Reveals a Universe without Design", authorFirstName: "Richard", authorLastName: "Dawkins", coverImageName: "blindWatchmaker", releaseDateString: "1986-01-01", description: "The Blind Watchmaker: Why the Evidence of Evolution Reveals a Universe without Design is a 1986 book by Richard Dawkins, in which the author presents an explanation of, and argument for, the theory of evolution by means of natural selection. He also presents arguments to refute certain criticisms made on his first book, The Selfish Gene."),
            Book(title: "A Brief History of Time: From the Big Bang to Black Holes", authorFirstName: "Stephen", authorLastName: "Hawking", coverImageName: "briefHistoryOfTime", releaseDateString: "1988-09-01", description: "A Brief History of Time: From the Big Bang to Black Holes is a book on theoretical cosmology by English physicist Stephen Hawking. It was first published in 1988. Hawking wrote the book for readers who had no prior knowledge of physics and people who are interested in learning something new about interesting subjects.\n\nIn A Brief History of Time, Hawking writes in non-technical terms about the structure, origin, development and eventual fate of the Universe, which is the object of study of astronomy and modern physics. He talks about basic concepts like space and time, basic building blocks that make up the Universe (such as quarks) and the fundamental forces that govern it (such as gravity). He writes about cosmological phenomena such as the Big Bang and black holes. He discusses two major theories, general relativity and quantum mechanics, that modern scientists use to describe the Universe. Finally, he talks about the search for a unifying theory that describes everything in the Universe in a coherent manner.\n\nThe book became a bestseller and sold more than 25 million copies."),
            Book(title: "Enlightenment Now: The Case for Reason, Science, Humanism, and Progress", authorFirstName: "Steven", authorLastName: "Pinker", coverImageName: "enlightenmentNow", releaseDateString: "2018-02-13", description: "Enlightenment Now: The Case for Reason, Science, Humanism, and Progress is a 2018 book written by Canadian-American cognitive scientist Steven Pinker. It argues that the Enlightenment values of reason, science, and humanism have brought progress; shows our progress with data that health, prosperity, safety, peace, and happiness have tended to rise worldwide; and explains the cognitive science of why this progress should be appreciated.\n\nA commonly-held lay public perception holds that the world is in terrible shape; for some, 2016 was the \"worst year ever\" and the year that liberalism died. In contrast, Pinker argues that life has been getting better for most people. He sets out 15 different measures of human wellbeing to support this argument, with the most obvious being the uncontroversial fact that, statistically, people live longer and healthier lives on average than ever before. Pinker ascribes modern improvements to trends of liberal humanism and scientific rationality that first took root in Europe around the 17th and 18th centuries.\n\nThe book concludes with three chapters defending what Pinker sees as Enlightenment values: reason, science, and humanism. Pinker argues that these values are under threat from modern trends such as religious fundamentalism, political correctness, and postmodernism. In an interview about the book published in Scientific American, Pinker has clarified that his book is not merely an expression of hope???it is a documentation of how much we have gained as a result of Enlightenment values, and how much we have to lose if those values are abandoned."),
            Book(title: "Steve Jobs", authorFirstName: "Walter", authorLastName: "Isaacson", coverImageName: "steveJobs", releaseDateString: "2011-10-24", description: "Steve Jobs is the authorized self-titled biography of American business magnate and Apple co-founder Steve Jobs. The book was written at the request of Jobs by Walter Isaacson, a former executive at CNN and TIME who has written best-selling biographies of Benjamin Franklin and Albert Einstein.\n\nBased on more than forty interviews with Jobs conducted over two years???in addition to interviews with more than one hundred family members, friends, adversaries, competitors, and colleagues???Isaacson was given \"unprecedented\" access to Jobs's life. Jobs is said to have encouraged the people interviewed to speak honestly. Although Jobs cooperated with the book, he asked for no control over its content other than the book's cover, and waived the right to read it before it was published. Describing his writing, Issacson commented that he had striven to take a balanced view of his subject that did not sugarcoat Jobs's flaws.")
        ]
    }
    
    // MARK: - Methods
    
    func sort(by sortBy: BookSortBy) {
        switch sortBy {
        case .author:
            books.sort(by: {$0.authorLastName < $1.authorLastName})
        case .releaseDate:
            books.sort(by: {$0.releaseDate < $1.releaseDate})
        case .title:
            books.sort(by: {$0.titleForSort < $1.titleForSort})
        }
    }
}
