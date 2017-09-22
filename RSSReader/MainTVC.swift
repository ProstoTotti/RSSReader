//
//  MainTVC.swift
//  RSSReader
//
//  Created by Игорь Лисицкий on 22.09.17.
//  Copyright © 2017 Igor Lisitzki. All rights reserved.
//

import UIKit
import AlamofireRSSParser
import RealmSwift
import PINRemoteImage

class MainTVC: UITableViewController {
    
    let realm = try! Realm()
    
    lazy var news: Results<News> = {
        self.realm.objects(News.self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 90
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let new = news[indexPath.row]
        cell.textLabel?.text = new.title
        cell.detailTextLabel?.text = News.dateFormatter.string(from: new.pubDate)
        
        if let url = URL(string: new.imageURL) {
            cell.imageView?.pin_setImage(from: url, placeholderImage: UIImage(named: "placeholder.png"), completion: { result in
                if let cellToUpdate = self.tableView.cellForRow(at: indexPath) {
                    cellToUpdate.setNeedsLayout()
                }
            })
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
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.news = news[tableView.indexPathForSelectedRow!.row]
            }
        }
    }

}
