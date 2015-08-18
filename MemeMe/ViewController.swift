//
//  ViewController.swift
//  MemeMe
//
//  Created by Neha Agarwal on 7/12/15.
//  Copyright (c) 2015 Neha Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memes: [Meme]!
    
    // MARK: Table View Data Source
    
    @IBAction func createMeme(sender: AnyObject) {
        let memeEditor = MemeEditorViewController()
        presentViewController(memeEditor, animated: true, completion: nil)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeReuseID", forIndexPath: indexPath) as! UITableViewCell
        
        let meme = memes[indexPath.row]
        cell.imageView?.image = meme.memedImage
        return cell
    }
}

