//
//  SchoolListModel.swift
//  NYCSchools
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
// 


import Foundation

//School Model
struct School: Codable {
  let schoolName: String?
  let dbn: String?
  
  //coding Keys is used to create a mapping between Swift names and JSON names
  enum  CodingKeys: String, CodingKey {
    case schoolName =  "school_name"
    case dbn
  }
}
