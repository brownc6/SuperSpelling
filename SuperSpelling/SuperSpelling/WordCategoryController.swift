//
//  SecondViewController.swift
//  subcrap
//
//  Created by Luis Mesas on 10/27/15.
//  Copyright © 2015 Awesome Crap Industries. All rights reserved.
//


import UIKit

class WordCategoryController: UITableViewController {

   

    var setLevel : String!
    private let wordCat: [String] = ["High Frequency","Word Endings","Initial Blend"]
    private var selectedCellIndexPath : NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return wordCat.count
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("BasicCellTemplate1")

        if cell == nil {
            cell = UITableViewCell()
        }

        cell?.textLabel?.text = wordCat[indexPath.row]

        return cell!
    }

//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "my stuff"
//        } else {
//            return "other stuff"
//        }
//    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SubCatSeg" {
            let destination = segue.destinationViewController as! SubCategoryController
            let myIndexPath = self.tableView.indexPathForSelectedRow
            let row = myIndexPath?.row
            destination.setLevel = setLevel
            if row == 0 {
                destination.subCat = ["1 Hundred", "2 Hundred", "3 Hundred","4 Hundred","5 Hundred"]
                destination.wordCat = wordCat[0]
            } else if row == 1 {
                destination.subCat = ["Word Endings 1","Word Endings 2","Word Endings 3"]
                destination.wordCat = wordCat[1]
            } else if row == 2 {
                destination.subCat = ["Initial Blend 1", "Initial Blend 2", "Initial Blend 3"]
                destination.wordCat = wordCat[2]
            }
        }
        
    
        
        
        
        //if let destination = segue.destinationViewController as? WordViewController {
        //    destination.words = ["this", "that"]
        //    }
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        selectedCellIndexPath = indexPath
//        self.performSegueWithIdentifier("SubCatSeg", sender: self)
//    }

}

