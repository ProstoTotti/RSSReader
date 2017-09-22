//
//  New.swift
//  RSSReader
//
//  Created by Игорь Лисицкий on 22.09.17.
//  Copyright © 2017 Igor Lisitzki. All rights reserved.
//

import Foundation
import RealmSwift

class News : Object {
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @objc dynamic var title = ""
    @objc dynamic var descriptionNews = ""
    @objc dynamic var imageURL = ""
    @objc dynamic var imageURLContent = ""
    @objc dynamic var pubDate = Date()
}

