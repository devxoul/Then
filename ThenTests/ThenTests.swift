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
        let label = UILabel().then {
            $0.text = "I am a label."
            $0.textColor = .blackColor()
        }
        XCTAssertEqual(label.text, "I am a label.")
        XCTAssertEqual(label.textColor, UIColor.blackColor())
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
