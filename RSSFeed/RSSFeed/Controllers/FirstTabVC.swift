//
//  FirstTabVC.swift
//  RSSFeed
//
//  Created by santosh sugur on 28/05/19.
//  Copyright © 2019 santosh sugur. All rights reserved.
//

import UIKit

class FirstTabVC: BaseViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        
        getRssFeedFromServer(urlString: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Ftechcrunch.com%2Ffeed%2F") { (feedDetails , error) in
            self.feedsCount = feedDetails ?? []
            DispatchQueue.main.async {
                self.feedTableView.reloadData()
            }
        }
    }
    
    // Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feed1") as? Feed1TableViewCell {
            let singleFeed = self.feedsCount[indexPath.row]
            cell.publishedDateLbl.text = singleFeed.pubDate
            cell.feedLabel.text = singleFeed.title
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class Feed1TableViewCell: UITableViewCell {
    @IBOutlet weak var publishedDateLbl: UILabel!
    @IBOutlet weak var feedLabel: UILabel!
}
