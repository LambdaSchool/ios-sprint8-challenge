//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {

    
    var array:[MessageThread.Message]? = []
    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title
        
        array = messageThread?.messages
        array = array?.sorted(by: {$0.timestamp < $1.timestamp })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)

        let message = array?[indexPath.row]
        
        cell.textLabel?.text = message?.text
        cell.detailTextLabel?.text = message?.sender
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" {
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
    }
    
    // MARK: - Properties

    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
}
