//
//  ViewController.swift
//  TestApp
//
//  Created by Dinesh on 26/10/19.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
   //  @IBOutlet var myCollectionView: UICollectionView!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    // @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
   
    @IBOutlet weak var Previous: UIButton!
    @IBOutlet weak var Next: UIButton!
   // var items: [Page] = []
    
    var pages = [WKWebView]()
    let reuseIdentifier = "wcell"
    
   
    
    @IBAction func addPage(_ sender: Any) {
        
    }
    
    @IBAction func deletePage(_ sender: Any) {
        
    }
    
    @IBAction func previousPage(_ sender: Any) {
        let visibleItems: NSArray = self.myCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 1) as! IndexPath
        let previousItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        // for enabling and disabling previous button
        if previousItem.row > 0 {
            Previous.isEnabled = true
            self.myCollectionView.scrollToItem(at: previousItem, at: .right, animated: true)
            
        }else{
            Previous.isEnabled = false
            Previous.alpha = 0.5
        }
        
    }
    @IBAction func nextPage(_ sender: Any) {
        
        let visibleItems: NSArray = self.myCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        // for enabling and disabling next button
        if nextItem.row < self.pages.count {
            Next.isEnabled = true
            self.myCollectionView.scrollToItem(at: nextItem, at: .left, animated: true)
            
        }else{
            Next.isEnabled = false
            Next.alpha = 0.5
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return self.pages.count
       // return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wcell", for: indexPath) as! CollectionViewCellCls
        if (self.pages.count>=1) {
            
        
        cell.myWebView.load(NSURLRequest(url: Bundle.main.url(forResource: "random", withExtension: "html") as! URL) as URLRequest);
       
        }else{
            
            
        }
       
         return cell
        
        //return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let numberOfItems = [self.myCollectionView .numberOfItems(inSection: 0)]
        if numberOfItems.count <= 1 {
            Next.isEnabled = false
            Previous.isEnabled = false
            Next.alpha = 0.5
            Previous.alpha = 0.5
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

