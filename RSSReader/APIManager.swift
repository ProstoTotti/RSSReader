//
//  APIManager.swift
//  RSSReader
//
//  Created by Игорь Лисицкий on 22.09.17.
//  Copyright © 2017 Igor Lisitzki. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireRSSParser

public enum NetworkResponseStatus {
    case success
    case error(string: String?)
}

class APIManager {
    static let sharedInstance = APIManager()
    
    let path = "https://news.tut.by/rss/all.rss"
    
    func getRSSFeedResponse(completionHandler: @escaping (_ response: RSSFeed?, _ status: NetworkResponseStatus) -> Void) {
        Alamofire.request(self.path).responseRSS { (response) in
            if let rssFeedXML = response.result.value {
                completionHandler(rssFeedXML, .success)
            } else {
                completionHandler(nil, .error(string: response.result.error?.localizedDescription))
            }
        }
    }
    
    func parseDescriptionRSS(_ someString: String) -> String? {
        let strText = someString.range(of: ">(.*)<", options: .regularExpression, range: nil, locale: nil)
        if let someRange = strText {
            let some = someString[someRange]
            let start = some.index(someRange.lowerBound, offsetBy: 1)
            let end = some.index(someRange.upperBound, offsetBy: -1)
            let qwerty = some[start..<end]
            let stringQwerty = String(qwerty).replacingOccurrences(of: "\\", with: "")
            return stringQwerty
        }
        return nil
    }
    
}
