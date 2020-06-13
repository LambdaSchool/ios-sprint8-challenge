    import XCTest
    class Message_BoardUITests: XCTestCase {
        
        var app: XCUIApplication!
        
        override func setUp() {
            super.setUp()
            
            continueAfterFailure = false
            app = XCUIApplication()
    
    app.launchArguments = ["UITesting"]
    app.launch()


}
        
        private var threadTextField: XCUIElement {
                   return app.textFields["threadTextField"]
               }
        
        private var nameTextField: XCUIElement {
            return app.textFields["nameTextField"]
        }

        private var newMessageTextView: XCUIElement {
            return app.textViews["newMessageTextView"]
        }

        private var sendButton: XCUIElement {
            return app.buttons["send"]
        }

        private var addButton: XCUIElement {
            return app.buttons["Add"]
        }
        
        private var tappedCell: XCUIElement {
               return app.cells["messageThreadCell"]
           }
        private var returnButton: XCUIElement {
            return app.keyboards.buttons["Return"]
        }
        
        
func testAddNewMessageThread() {

       XCTAssertTrue(threadTextField.exists)
       threadTextField.tap()
        threadTextField.typeText("UI Works.\n")
        returnButton.tap()
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let checkForThread = table.cells.staticTexts["UI Works."]
        XCTAssertTrue(checkForThread.label == "UI Works.")
        }
    
 func testEnterThreadDetail() {
        threadTextField.tap()
        threadTextField.typeText("UI Works.")
        app.buttons["return"].tap()
    
    }

   }
    
