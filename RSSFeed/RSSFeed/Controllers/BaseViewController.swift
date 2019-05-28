//
//  BaseViewController.swift
//  RSSFeed
//
//  Created by santosh sugur on 28/05/19.
//  Copyright © 2019 santosh sugur. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var feedDetails : [FeedDetails] = []
    var feedsCount : [FeedDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getRssFeedFromServer(urlString : String , completionHandler : @escaping ([FeedDetails]? , Error?) -> ()) {
        
        if feedDetails.count > 0 {
            completionHandler(feedDetails , nil)
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                do {
                    guard let data = data else { return }
                    
                    let feedDetails = try JSONDecoder().decode(TotalFeeds.self, from: data)
                    self.feedDetails = feedDetails.items
                    completionHandler(feedDetails.items , nil)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                    completionHandler(nil , error)
                }
                }.resume()
        }
    }
}

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
