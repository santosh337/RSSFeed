//
//  ViewController.swift
//  RSSFeed
//
//  Created by santosh sugur on 28/05/19.
//  Copyright © 2019 santosh sugur. All rights reserved.
//

import UIKit

class ThirdTabVC: BaseViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getRssFeedFromServer(urlString: "https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Ffeeds.bbci.co.uk%2Fnews%2Fworld%2Frss.xml") { (feedDetails, err) in
            self.feedsCount = feedDetails ?? []
            DispatchQueue.main.async {
                self.feedTableView.reloadData()
            }
        }
    }

    
    // Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedsCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feed3") as? Feed3TableViewCell {
            let singleFeed = self.feedsCount[indexPath.row]
            cell.titleLbl.text = singleFeed.title
            cell.publishedLbl.text = singleFeed.content
            return cell
        }
        return UITableViewCell()
    }

}

class Feed3TableViewCell: UITableViewCell {
        @IBOutlet weak var titleLbl : UILabel!
        @IBOutlet weak var publishedLbl : UILabel!
}

