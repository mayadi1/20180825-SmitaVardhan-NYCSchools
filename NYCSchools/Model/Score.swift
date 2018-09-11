//
//  Score.swift
//  NYCSchools
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//


import Foundation

//Score Model
struct Score: Codable {
  let schoolName: String?
  let scoreCritical: String?
  let scoreMaths: String?
  let scoreWriting: String?
  let testTakers: String?
  
  //coding Keys is used to create a mapping between Swift names and JSON names
  enum  CodingKeys: String, CodingKey {
    case schoolName = "school_name"
    case scoreCritical = "sat_critical_reading_avg_score"
    case scoreMaths = "sat_math_avg_score"
    case scoreWriting = "sat_writing_avg_score"
    case testTakers = "num_of_sat_test_takers"
}
}
