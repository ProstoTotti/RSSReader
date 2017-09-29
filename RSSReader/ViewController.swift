//
//  ViewController.swift
//  RSSReader
//
//  Created by Игорь Лисицкий on 21.09.17.
//  Copyright © 2017 Igor Lisitzki. All rights reserved.
//

import UIKit
import AlamofireRSSParser
import Alamofire
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.startAnimating()
        APIManager.sharedInstance.getRSSFeedResponse { (response, status) in
            try! self.realm.write {
                if !self.realm.isEmpty {
                    self.realm.deleteAll()
                }
                for item in response!.items {
                    let newNews = News()
                    newNews.descriptionNews = APIManager.sharedInstance.parseDescriptionRSS(item.description)
                    newNews.imageURL = item.imagesFromDescription!.first!
                    newNews.imageURLContent = item.mediaContent!
                    newNews.title = item.title!
                    newNews.pubDate = item.pubDate!
                    self.realm.add(newNews)
                }
            }
            self.indicator.stopAnimating()
            self.performSegue(withIdentifier: "main", sender: nil)
            
        }
    }
    
}

