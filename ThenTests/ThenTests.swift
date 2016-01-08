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
        // Configure default UILabel
        let label = UILabel().then {
            $0.text = "I am a label."
            $0.textColor = .blackColor()
        }
        
        // Test color and text equality
        XCTAssertEqual(label.text, "I am a label.")
        XCTAssertEqual(label.textColor, UIColor.blackColor())
    }
    
    
    func testWhen() {
        // Configure default UILabel
        let label = UILabel().when(true) {
            $0.text = "I am a label."
            $0.textColor = .blackColor()
        }
        
        // Test color and text equality
        XCTAssertEqual(label.text, "I am a label.")
        XCTAssertEqual(label.textColor, UIColor.blackColor())
        
        // Try to reconfigure it
        label.when(false) {
            $0.text = "I will break your test if true."
            $0.textColor = .whiteColor()
        }
        
        // Test color and text equality again
        XCTAssertEqual(label.text, "I am a label.")
        XCTAssertEqual(label.textColor, UIColor.blackColor())
    }
}
