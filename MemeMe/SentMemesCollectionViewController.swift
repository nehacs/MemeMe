//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Neha Agarwal on 8/17/15.
//  Copyright (c) 2015 Neha Agarwal. All rights reserved.
//

import Foundation

import UIKit

class SentMemesCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var memes: [Meme]!
    
    @IBOutlet weak var flowLayout:UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension: CGFloat = (self.view.frame.size.width - (2*space))/3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    @IBAction func createMeme(sender: AnyObject) {
        let memeEditor = storyboard!.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        presentViewController(memeEditor, animated: true, completion: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        collectionView?.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeReuseID", forIndexPath: indexPath) as! SentMemesCollectionViewCell
        
        let meme = memes[indexPath.row]
        let memeImageView = UIImageView(image: meme.memedImage)
        
        memeImageView.contentMode = UIViewContentMode.Redraw
        cell.memeImage.image = memeImageView.image
        return cell
    }
    
    override
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
    }
}