//
    // Project: UIKitNetworkingExample
    //  File: TableViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import UIKit

class TableViewController: UITableViewController {
    var todos: [Todo] = [] // ✅ Stores fetched data

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // ✅ Fetch and update data asynchronously
        Task {
            do {
                self.todos = try await fetchTodos()
                tableView.reloadData() // ✅ Ensure UI is updated after fetching data
            } catch {
                print("Failed to fetch todos:", error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        return cell
    }
}