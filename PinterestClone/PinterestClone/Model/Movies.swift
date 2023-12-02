//
//  Movies.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import Foundation

struct Movie {
    let title: String
    let totalWatchingTime: Int
    let genres: [String]
    let year: Int
    let shortDescription: String
    let posterURL: String
    let rating: Double
}

let movies = [
    Movie(
        title: "The Shawshank Redemption",
        totalWatchingTime: 142,
        genres: ["Drama"],
        year: 1994,
        shortDescription: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
        posterURL: "https://example.com/poster1.jpg",
        rating: 9.3
    ),
    Movie(
        title: "The Godfather",
        totalWatchingTime: 175,
        genres: ["Crime", "Drama"],
        year: 1972,
        shortDescription: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
        posterURL: "https://example.com/poster2.jpg",
        rating: 9.2
    ),
    Movie(
        title: "The Dark Knight",
        totalWatchingTime: 152,
        genres: ["Action", "Crime", "Drama"],
        year: 2008,
        shortDescription: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        posterURL: "https://example.com/poster3.jpg",
        rating: 9.0
    ),
    Movie(
        title: "Pulp Fiction",
        totalWatchingTime: 154,
        genres: ["Crime", "Drama"],
        year: 1994,
        shortDescription: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
        posterURL: "https://example.com/poster4.jpg",
        rating: 8.9
    ),
    Movie(
        title: "Fight Club",
        totalWatchingTime: 139,
        genres: ["Drama"],
        year: 1999,
        shortDescription: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.",
        posterURL: "https://example.com/poster5.jpg",
        rating: 8.8
    ),
    Movie(
        title: "Forrest Gump",
        totalWatchingTime: 142,
        genres: ["Drama", "Romance"],
        year: 1994,
        shortDescription: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.",
        posterURL: "https://example.com/poster6.jpg",
        rating: 8.8
    )
]


