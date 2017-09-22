//
//  DetailViewController.swift
//  RSSReader
//
//  Created by Игорь Лисицкий on 22.09.17.
//  Copyright © 2017 Igor Lisitzki. All rights reserved.
//

import UIKit
import PINRemoteImage

class DetailViewController: UIViewController {
    
    var news : News!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let news = news {
            indicator.startAnimating()
            self.indicator.hidesWhenStopped = true
            imageView.pin_setImage(from: URL(string: news.imageURLContent), completion: { (result) in
                self.indicator.stopAnimating()
            })
            titleLabel.text = news.title
            descriptionTextView.text = news.descriptionNews
            dateLabel.text = "Posted by: \(News.dateFormatter.string(from: news.pubDate))"
        }

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
