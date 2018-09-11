//
//  ScoreTest.swift
//  NYCSchoolsTests
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//


import XCTest

@testable import NYCSchools

class ScoreTest: XCTestCase{
  func testSuccessfulInit() {
    let testSuccessfulJson:JSON = ["dbn":"24Q264","testTakers":"89","scoreCritical":"405","scoreMaths":"454","scoreWriting":"421","schoolName":"ACADEMY OF FINANCE AND ENTERPRISE"]
    XCTAssertNotNil(Score(json:testSuccessfulJson))  }
}

private extension Score{
  init?(json:JSON) {
    guard let schoolName = json["schoolName"] as? String,
    let testTakers = json["testTakers"] as? String,
    let scoreCritical = json["scoreCritical"] as? String,
    let scoreWriting = json["scoreWriting"] as? String,
    let scoreMaths = json["scoreMaths"] as? String else{
        return nil
    }
    self.schoolName = schoolName
    self.testTakers = testTakers
    self.scoreCritical = scoreCritical
    self.scoreWriting = scoreWriting
    self.scoreMaths  = scoreMaths
  }
}
