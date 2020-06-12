//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

enum CodingKeys: String, CodingKey {
    case title
    case messages
    case identifier

    enum MessagesKeys: String, CodingKey {
        case text
        case sender
        case timestamp
    }
}

class MessageThread: Codable, Equatable {

    let title: String
    var messages: [Message]
    let identifier: String

    init(title: String, messages: [Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let messagesDict = try container.decodeIfPresent([String: Message].self, forKey: .messages)
        let messages = messagesDict?.compactMap( { $0.value } ) ?? []
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    struct Message: Codable, Equatable {
        let text: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.text = text
            self.sender = sender
            self.timestamp = timestamp
        }
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
