//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title
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

        let message = messageThread?.messages[indexPath.row]
        
        cell.textLabel?.text = message?.messageText
        cell.detailTextLabel?.text = message?.sender
        
        cell.accessibilityIdentifier = "\(indexPath.row)"
        
        return cell
    }
    

    // MARK:- Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
        
        destinationVC.messageThreadController = messageThreadController
        destinationVC.messageThread = messageThread
        
        switch segue.identifier {
        case "ShowMessage":
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            destinationVC.message = messageThread?.messages[index]
        default:
            destinationVC.message = nil
        }
    }
    
    // MARK: - Properties

    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
}
