//
//  ThenTests.swift
//  ThenTests
//
//  Created by 전수열 on 12/24/15.
//  Copyright © 2015 Suyeol Jeon. All rights reserved.
//

import XCTest
@testable import Then

struct User {
    var name: String?
    var email: String?
}
extension User: Then {}

class ThenTests: XCTestCase {

    func testThen_object() {
        let queue = NSOperationQueue().then {
            $0.name = "awesome"
            $0.maxConcurrentOperationCount = 5
        }
        XCTAssertEqual(queue.name, "awesome")
        XCTAssertEqual(queue.maxConcurrentOperationCount, 5)
    }

    func testThen_value() {
        let user = User().then {
            $0.name = "devxoul"
            $0.email = "devxoul@gmail.com"
        }
        XCTAssertEqual(user.name, "devxoul")
        XCTAssertEqual(user.email, "devxoul@gmail.com")
    }

}
