//
    // Project: UIKitNetworkingExample
    //  File: JSONHandler.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import Foundation

// ✅ Define a struct that matches the expected API response.
struct Todo: Decodable {
    let id: Int
    let title: String
}

// ✅ Fetch data asynchronously from a URL.
func fetchTodos() async throws -> [Todo] {
    // Create the URL (ensure it's valid, or throw an error)
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
        throw URLError(.badURL) // ✅ Handles invalid URLs properly.
    }
    
    // ✅ Perform a network request with `async/await`, avoiding completion handlers.
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // ✅ Decode the JSON response into an array of `Todo` objects.
    return try JSONDecoder().decode([Todo].self, from: data)
}
