//
//  MessageBoardPage.swift
//  Message BoardUITests
//
//  Created by Victor  on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageBoardPage: TestPage {
    var testCase: XCTestCase

    // MARK: - Elements
    var tableview: XCUIElement {
        return app.tables.element
    }
    
    func tableViewCell(for index: Int) -> XCUIElement {
        return tableview.cells.element(boundBy: index)
    }
    
    var tableViewCells: XCUIElementQuery {
        return tableview.cells
    }
    
    var navigationElement: XCUIElement {
        return app.navigationBars.element(boundBy: 0)
    }
    
    var navigationTitle: String {
        return navigationElement.staticTexts.element.label
    }
    
    var navigationBarButton: XCUIElement {
        return navigationElement.buttons.element(boundBy: 1)
    }
    
    var nameTextField: XCUIElement {
        return app.textFields.element(boundBy: 0)
    }
    
    var messageTextField: XCUIElement {
        return app.textViews.element(boundBy: 0)
    }

}
