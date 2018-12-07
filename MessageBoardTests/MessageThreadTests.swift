//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    let messageThreadController = MessageThreadController()
    
    func testCreateMessageThread() {
        
        messageThreadController.createMessageThread(with: "Testing") {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
        }
    }
    
    
}
