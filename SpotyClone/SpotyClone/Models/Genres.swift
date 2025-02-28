//
//  Genres.swift
//  SpotyClone
//
//  Created by Ana on 28/2/25.
//

import Foundation

struct Genre: Hashable {
    let id: Int
    let name: String
    let description: String
    let color: String
}

// Representación de todos los generos
enum GenresLocalRepository {
    static let pop = Genre(id: 1, name: "Pop", description: "Catchy and mainstream hits from top artists.", color: "#FF4D6D")
    static let rock = Genre(id: 2, name: "Rock", description: "Powerful guitars, drums, and legendary vocals.", color: "#D7263D")
    static let hipHop = Genre(id: 3, name: "Hip-Hop", description: "Beats, rhymes, and the culture of rap music.", color: "#FF9F1C")
    static let jazz = Genre(id: 4, name: "Jazz", description: "Smooth, soulful, and instrumental excellence.", color: "#8B5E3B")
    static let electronic = Genre(id: 5, name: "Electronic", description: "Synths, bass drops, and futuristic sounds.", color: "#3A86FF")
    static let classical = Genre(id: 6, name: "Classical", description: "Timeless orchestral pieces and piano melodies.", color: "#D4A373")
    static let reggae = Genre(id: 7, name: "Reggae", description: "Laid-back vibes and island rhythms.", color: "#F4A261")
    static let blues = Genre(id: 8, name: "Blues", description: "Deep emotions and guitar-driven storytelling.", color: "#264653")
    static let metal = Genre(id: 9, name: "Metal", description: "Heavy riffs, fast drums, and intense energy.", color: "#4F4F4F")
    static let country = Genre(id: 10, name: "Country", description: "Tales of life, love, and adventure with a twang.", color: "#F4E285")
    static let folk = Genre(id: 11, name: "Folk", description: "Storytelling and acoustic melodies from the heart.", color: "#A7C957")
    static let rnb = Genre(id: 12, name: "R&B", description: "Soulful vocals and smooth grooves.", color: "#FF006E")
    static let latin = Genre(id: 13, name: "Latin", description: "Rhythmic and energetic beats from Latin America.", color: "#E63946")
    static let kpop = Genre(id: 14, name: "K-Pop", description: "Vibrant beats and iconic performances from Korea.", color: "#FB6F92")
    static let loFi = Genre(id: 15, name: "Lo-Fi", description: "Chill and relaxing beats for study and work.", color: "#7F5539")
    
    static let allGenres: [Genre] = [pop, rock, hipHop, jazz, electronic, classical, reggae, blues, metal, country, folk, rnb, latin, kpop, loFi]
}

