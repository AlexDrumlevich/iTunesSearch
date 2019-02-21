//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Друмлевич on 17.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    var info: Info?
    
  
    let url = URL(string: "https://itunes.apple.com/search")!
    
   // var query: [String: String] = [:]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    func setQuerys() -> [String: String] {
        guard let termValue = textView.text else {
            print("Error in \(#function), \(#line): term not set")
            return [:]
        }
        var term = ""
        for value in termValue {
            if value == " " {
             term.append("+")
            } else {
                term.append(value)
            }
        }
        return ["term": term, "limit": "50"]
    }
    
    
    func requestData() {
        
        InfoController.shared.fetchInfo(url: url.withQueries(self.setQuerys())) { info in
            
            self.info = info
            
            if let _ = self.info {
                for (index, value) in self.info!.results.enumerated()
                {
                    InfoController.shared.fetchImage(url: value.artworkUrl100, completion: { (image) in
                        self.info?.results[index].image = image
                        
                        if index == self.info!.results.count - 1 {
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "tableView", sender: self)
                            }
                        }
                    })
                }
            }
        }
    }
            

//            PhotoInfoController.shared.fetchImage(url: photoInfo.url, completion: { image in
//                guard let image = image else {
//                    self.dataRequested = false
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    self.photoImageView.image = image
//                }
            
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableView" {
        let dvc = segue.destination as! TableViewController
            guard let info = info else {
                return
            }
        dvc.info = info
    }
    }
    
    @IBAction func send(_ sender: UIButton) {
        guard let text = textView.text else {
            return
        }
        guard !text.isEmpty else {
            return
        }
    requestData()
    
    }
}

