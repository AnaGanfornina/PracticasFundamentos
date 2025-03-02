//
//  Playlist.swift
//  SpotyClone
//
//  Created by Ana on 1/3/25.
//

import Foundation

struct Playlist: Hashable {
    let id: Int
    let title: String
    let description: String
    let emoji: String
    let color: String
    let songs: [Song]
}

struct Song: Hashable {
    let title: String
    let artist: String
    let duration: String
}


enum PlaylistRepository {
    static let allPlaylists: [Playlist] = [
        Playlist(
            id: 1,
            title: "Top Hits 2025",
            description: "The hottest tracks of the year, updated weekly!",
            emoji: "🔥",
            color: "#FF4500",
            songs: [
                Song(title: "Blinding Lights", artist: "The Weeknd", duration: "3:22"),
                Song(title: "Levitating", artist: "Dua Lipa", duration: "3:23"),
                Song(title: "Stay", artist: "The Kid LAROI & Justin Bieber", duration: "2:21")
            ]
        ),
        Playlist(
            id: 2,
            title: "Rock Classics",
            description: "Timeless rock anthems from legendary bands.",
            emoji: "🎸",
            color: "#8B4513",
            songs: [
                Song(title: "Bohemian Rhapsody", artist: "Queen", duration: "5:55"),
                Song(title: "Hotel California", artist: "Eagles", duration: "6:30"),
                Song(title: "Sweet Child O' Mine", artist: "Guns N' Roses", duration: "5:56")
            ]
        ),
        Playlist(
            id: 3,
            title: "Chill Vibes",
            description: "Relaxing and soothing tunes for any mood.",
            emoji: "🌊",
            color: "#00BFFF",
            songs: [
                Song(title: "Sunflower", artist: "Post Malone & Swae Lee", duration: "2:38"),
                Song(title: "Lovely", artist: "Billie Eilish & Khalid", duration: "3:20"),
                Song(title: "Night Owl", artist: "Galimatias", duration: "4:10")
            ]
        ),
        Playlist(
            id: 4,
            title: "Hip-Hop Bangers",
            description: "Hard-hitting beats and fire bars.",
            emoji: "🎤",
            color: "#FF1493",
            songs: [
                Song(title: "Sicko Mode", artist: "Travis Scott", duration: "5:12"),
                Song(title: "God's Plan", artist: "Drake", duration: "3:18"),
                Song(title: "HUMBLE.", artist: "Kendrick Lamar", duration: "2:57")
            ]
        ),
        Playlist(
            id: 5,
            title: "Electronic Essentials",
            description: "The best electronic beats and festival anthems.",
            emoji: "⚡️",
            color: "#FFD700",
            songs: [
                Song(title: "Strobe", artist: "deadmau5", duration: "10:33"),
                Song(title: "Titanium", artist: "David Guetta ft. Sia", duration: "4:05"),
                Song(title: "Opus", artist: "Eric Prydz", duration: "9:03")
            ]
        ),
        Playlist(
            id: 6,
            title: "Acoustic Mornings",
            description: "Start your day with soft, acoustic melodies.",
            emoji: "🌞",
            color: "#FFA500",
            songs: [
                Song(title: "Banana Pancakes", artist: "Jack Johnson", duration: "3:12"),
                Song(title: "Photograph", artist: "Ed Sheeran", duration: "4:19"),
                Song(title: "Rivers and Roads", artist: "The Head and the Heart", duration: "4:44")
            ]
        ),
        Playlist(
            id: 7,
            title: "90s Nostalgia",
            description: "A throwback to the best hits of the 90s.",
            emoji: "📼",
            color: "#800080",
            songs: [
                Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: "5:01"),
                Song(title: "Wannabe", artist: "Spice Girls", duration: "2:53"),
                Song(title: "I Want It That Way", artist: "Backstreet Boys", duration: "3:33")
            ]
        ),
        Playlist(
            id: 8,
            title: "Workout Pump",
            description: "High-energy tracks to keep you moving.",
            emoji: "💪",
            color: "#DC143C",
            songs: [
                Song(title: "Till I Collapse", artist: "Eminem", duration: "4:58"),
                Song(title: "Stronger", artist: "Kanye West", duration: "5:12"),
                Song(title: "Power", artist: "Kanye West", duration: "3:41")
            ]
        ),
        Playlist(
            id: 9,
            title: "Indie Gems",
            description: "Discover hidden gems from the indie scene.",
            emoji: "🎨",
            color: "#FF69B4",
            songs: [
                Song(title: "Take a Walk", artist: "Passion Pit", duration: "4:24"),
                Song(title: "Dog Days Are Over", artist: "Florence + The Machine", duration: "4:12"),
                Song(title: "Electric Feel", artist: "MGMT", duration: "3:49")
            ]
        ),
        Playlist(
            id: 10,
            title: "Latin Fire",
            description: "The best Latin hits to spice up your playlist.",
            emoji: "🔥",
            color: "#FF0000",
            songs: [
                Song(title: "Despacito", artist: "Luis Fonsi ft. Daddy Yankee", duration: "4:42"),
                Song(title: "Bailando", artist: "Enrique Iglesias", duration: "4:03"),
                Song(title: "Taki Taki", artist: "DJ Snake ft. Selena Gomez, Ozuna, Cardi B", duration: "3:32")
            ]
        ),
        Playlist(
            id: 11,
            title: "Lofi Beats",
            description: "Relax and focus with these chill beats.",
            emoji: "☕️",
            color: "#A0522D",
            songs: [
                Song(title: "Snowfall", artist: "ØDYSSEE", duration: "2:34"),
                Song(title: "Morning Coffee", artist: "Lofi Fruits", duration: "2:47"),
                Song(title: "Cozy Nights", artist: "Sleepy Fish", duration: "3:10")
            ]
        ),
        Playlist(
            id: 12,
            title: "R&B Smooth",
            description: "Sultry and soulful R&B classics.",
            emoji: "💖",
            color: "#FF69B4",
            songs: [
                Song(title: "Adorn", artist: "Miguel", duration: "3:13"),
                Song(title: "No Guidance", artist: "Chris Brown ft. Drake", duration: "4:22"),
                Song(title: "Earned It", artist: "The Weeknd", duration: "4:37")
            ]
        ),
        Playlist(
            id: 13,
            title: "Jazz Essentials",
            description: "A selection of classic jazz masterpieces.",
            emoji: "🎷",
            color: "#4B0082",
            songs: [
                Song(title: "Take Five", artist: "Dave Brubeck", duration: "5:24"),
                Song(title: "So What", artist: "Miles Davis", duration: "9:22"),
                Song(title: "Feeling Good", artist: "Nina Simone", duration: "2:55")
            ]
        ),
        Playlist(
            id: 14,
            title: "Country Roads",
            description: "Country hits for your next road trip.",
            emoji: "🤠",
            color: "#8B4513",
            songs: [
                Song(title: "Take Me Home, Country Roads", artist: "John Denver", duration: "3:10"),
                Song(title: "Tennessee Whiskey", artist: "Chris Stapleton", duration: "4:53"),
                Song(title: "Wagon Wheel", artist: "Darius Rucker", duration: "4:57")
            ]
        ),
        Playlist(
            id: 15,
            title: "Classical Masterpieces",
            description: "Relax and enjoy the greatest classical compositions.",
            emoji: "🎻",
            color: "#483D8B",
            songs: [
                Song(title: "Clair de Lune", artist: "Claude Debussy", duration: "5:09"),
                Song(title: "Moonlight Sonata", artist: "Beethoven", duration: "6:55"),
                Song(title: "The Four Seasons: Spring", artist: "Vivaldi", duration: "3:32")
            ]
        )
    ]
}
