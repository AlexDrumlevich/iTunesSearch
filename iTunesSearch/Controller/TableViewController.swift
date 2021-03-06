//
//  TableViewController.swift
//  iTunesSearch
//
//  Created by Друмлевич on 18.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

   
   
    
    var info: Info!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return info.results.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let index = indexPath.row
        if let text = info.results[index].wrapperType {
        cell.wrapperTypeLabel.text = text
        } else {
            cell.wrapperTypeLabel.isHidden = true
        }
        
        if let text = info.results[index].artistName {
            cell.artistNameLabel.text = text
        } else {
            cell.artistNameLabel.isHidden = true
        }
        
        if let text = info.results[index].kind {
            cell.kindLabel.text = text
        } else {
            cell.kindLabel.isHidden = true
        }
        
        if let text = info.results[index].collectionName {
            cell.collectionNameLabel.text = text
        } else {
            cell.collectionNameLabel.isHidden = true
        }
        
        if let text = info.results[index].trackName {
            cell.trackNamelabel.text = text
        } else {
            cell.trackNamelabel.isHidden = true
        }
        
        if let image = info.results[index].image {
            cell.imageTheInfo.image = image
        }
       
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
