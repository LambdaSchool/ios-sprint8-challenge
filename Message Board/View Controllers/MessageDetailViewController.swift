//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!

    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        guard let senderName = senderNameTextField.text else {
            NSLog("senderName found to be nil")
            return
        }
        
        guard let messageText = messageTextView.text else {
            NSLog("messageText found to be nil")
            return
        }
        
        guard let messageThread = messageThread else {
            NSLog("messageThread found to be nil")
            return
        }
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
            self.popViewController()
        })
    }
    
    private func popViewController() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
