//
    // Project: UIKitNetworkingExample
    //  File: ViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import UIKit

class ViewController: UIViewController {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // ✅ Configure UI before loading data
        
        // ✅ Perform network request using `Task` to allow async code in UIKit.
        Task {
            await fetchAndDisplayData()
        }
    }

    func setupUI() {
        label.frame = CGRect(x: 20, y: 100, width: 300, height: 100)
        label.numberOfLines = 0
        view.addSubview(label)
    }

    func fetchAndDisplayData() async {
        do {
            // ✅ Fetch data using `await`
            let todos = try await fetchTodos()
            let jsonString = todos.map { $0.title }.joined(separator: "\n")
            
            // ✅ Ensure UI updates happen on the main thread!
            DispatchQueue.main.async {
                self.label.text = jsonString
            }
        } catch {
            print("Error fetching data:", error)
        }
    }
}
