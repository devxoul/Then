//
//  ThenTests.swift
//  ThenTests
//
//  Created by 전수열 on 12/24/15.
//  Copyright © 2015 Suyeol Jeon. All rights reserved.
//

import XCTest
@testable import Then

class ThenTests: XCTestCase {

    func testThen() {
        let label = UILabel().then {
            $0.text = "I am a label."
            $0.textColor = .blackColor()
        }
        XCTAssertEqual(label.text, "I am a label.")
    }
    
    func testThenOperator() {
        let label = UILabel() => {
            $0.text = "I am a label."
            $0.textColor = .blackColor()
        }
        XCTAssertEqual(label.text, "I am a label.")
    }
}
