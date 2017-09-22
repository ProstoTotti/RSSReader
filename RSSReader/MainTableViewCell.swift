//
//  MainTableViewCell.swift
//  RSSReader
//
//  Created by Игорь Лисицкий on 22.09.17.
//  Copyright © 2017 Igor Lisitzki. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func updateCell(with new: News,tableView: UITableView) {
        titleLabel?.text = new.title
        dateLabel?.text = News.dateFormatter.string(from: new.pubDate)
        
        if let url = URL(string: new.imageURL) {
            titleImageView.pin_setImage(from: url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
