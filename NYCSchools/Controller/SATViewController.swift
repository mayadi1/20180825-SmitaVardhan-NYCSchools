//
//  SATViewController.swift
//  NYCSchools
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//
//This class shows the details of the school SAT scores in various categories

import UIKit
import SVProgressHUD

class SATViewController: UIViewController {
 
  //IBOutlets
  @IBOutlet weak var schoolName: UILabel!
  @IBOutlet weak var readingLbl: UILabel!
  @IBOutlet weak var writingLbl: UILabel!
  @IBOutlet weak var testTakersLbl: UILabel!
  @IBOutlet weak var mathlabl: UILabel!
  
  let networkCall = NetworkRequest()
  var satArray = [Score]()
  var dbnText = String()
  
  override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        getSatScore(dbn: dbnText)
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.title = "SAT Scores"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    
    }
 
  //fetching sat score from server
  
  func getSatScore(dbn:String){
    
    networkCall.getSatScore(dbn: dbn) { [weak self] (result) in
      
      switch result{
      case .success(let scoreList):
        guard scoreList.count > 0 else {
          SVProgressHUD.dismiss()
          return
        }
        self?.satArray = scoreList
        DispatchQueue.main.async {
          SVProgressHUD.dismiss()
          self?.updateUI()
        }
      case .failure(_):
        SVProgressHUD.dismiss()
        Alert.showBasicAlert(title: "Error Connecting", message:"Loading failed, Check your Network Connection", vc: self!)
      }
      }
    }
  
  //Updating the UI with the response data
  
  func updateUI(){
    for values in satArray{
      schoolName.text = values.schoolName ?? "No Name"
      readingLbl.text = values.scoreCritical ?? "No Scores"
      writingLbl.text = values.scoreWriting ?? "No Scores"
      testTakersLbl.text = values.testTakers ?? "No Scores"
      mathlabl.text = values.scoreMaths ?? "No Scores"
    }
  }
  }

