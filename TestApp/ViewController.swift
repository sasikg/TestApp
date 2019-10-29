//
//  ViewController.swift
//  TestApp
//
//  Created by Dinesh on 26/10/19.
//  Copyright © 2019 Dinesh. All rights reserved.
//

import UIKit

<<<<<<< HEAD
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
    var collectionViewCellCls = CollectionViewCellCls()
    //let collectionViewCell: UICollectionViewCell = collectionViewCellCls.myWebView.load(NSURLRequest(url: Bundle.main.url(forResource: "random", withExtension: "html") as! URL) as URLRequest);
    var countOfCells : Int = 3
    
    @IBAction func addPage(_ sender: Any) {
        /*let cellItems: NSMutableArray = self.myCollectionView.indexPathsForVisibleItems as! NSMutableArray
        let currentpage: IndexPath = cellItems.object(at: 1) as! IndexPath
        let tCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "wcell", for: currentpage) as! CollectionViewCellCls
        tCell.myWebView.load(NSURLRequest(url: Bundle.main.url(forResource: "random", withExtension: "html") as! URL) as URLRequest);
        cellItems.insert(tCell, at: currentpage.item+1)
        self.myCollectionView.insertItems(at: [IndexPath(item: currentpage.item + 1, section: 0)])*/
        
        
    }
    
    @IBAction func deletePage(_ sender: Any) {
        //let cellItems: NSMutableArray = self.myCollectionView.indexPathsForVisibleItems as! NSMutableArray
        let cellItems = NSMutableArray(array: self.myCollectionView.indexPathsForVisibleItems)
        let currentpage: IndexPath = cellItems.object(at: 0) as! IndexPath
        let tCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "wcell", for: currentpage) as! CollectionViewCellCls
        tCell.myWebView.load(NSURLRequest(url: Bundle.main.url(forResource: "random", withExtension: "html") as! URL) as URLRequest);
        //cellItems.insert(tCell, at: currentpage.item+1)
        cellItems.remove(currentpage.item)
        self.myCollectionView.deleteItems(at: [currentpage])
        
    }
    
    @IBAction func previousPage(_ sender: Any) {
        let visibleItems: NSArray = self.myCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let previousItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        
        // for enabling and disabling previous button
        if previousItem.row < countOfCells  {
            Previous.isEnabled = true
            Previous.alpha = 1.0
            Next.isEnabled = true
            Next.alpha = 1.0
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
        if nextItem.row < countOfCells {
            Next.isEnabled = true
            Next.alpha = 1.0
            self.myCollectionView.scrollToItem(at: nextItem, at: .left, animated: true)
            
        }else{
            Next.isEnabled = false
            Next.alpha = 0.5
            Previous.isEnabled = true
            Previous.alpha = 1.0
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       //return self.pages.count
        
       return countOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wcell", for: indexPath) as! CollectionViewCellCls
        if (countOfCells>=1) {
            
        
        cell.myWebView.load(NSURLRequest(url: Bundle.main.url(forResource: "random", withExtension: "html") as! URL) as URLRequest);
        pages.insert(cell.myWebView, at: indexPath.item)
       
        }else{
            
            
        }
       
         return cell
        
        //return cell
    }
    
=======
class ViewController: UIViewController {
>>>>>>> parent of 24d86e6... first commit

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
        countOfCells = 3
        Next.isEnabled = true
        Previous.isEnabled = true
        Next.alpha = 1.0
        Previous.alpha = 1.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let numberOfItems = self.myCollectionView.numberOfItems(inSection: 0)
        if numberOfItems > 1 {
            Next.isEnabled = true
            Previous.isEnabled = true
            Next.alpha = 1.0
            Previous.alpha = 1.0
        }else{
            Next.isEnabled = false
            Previous.isEnabled = false
            Next.alpha = 0.5
            Previous.alpha = 0.5
        }
=======
>>>>>>> parent of 24d86e6... first commit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

