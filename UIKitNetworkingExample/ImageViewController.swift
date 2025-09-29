//
    // Project: UIKitNetworkingExample
    //  File: ImageViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import UIKit

class ImageViewController: UIViewController {
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        Task {
            do {
                let image = try await fetchImage(from: "https://picsum.photos/200/300")
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } catch {
                print("Failed to load image:", error)
            }
        }
    }

    func setupUI() {
        imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }

    func fetchImage(from urlString: String) async throws -> UIImage {
        // ✅ Ensure the URL is valid
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        // ✅ Perform the network request asynchronously
        let (data, _) = try await URLSession.shared.data(from: url)

        // ✅ Convert data to UIImage
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeRawData)
        }
        return image
    }
}
