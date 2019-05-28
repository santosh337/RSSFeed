//
//  SecondTabVC.swift
//  RSSFeed
//
//  Created by santosh sugur on 28/05/19.
//  Copyright © 2019 santosh sugur. All rights reserved.
//

import UIKit

class SecondTabVC: BaseViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getRssFeedFromServer(urlString: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Ftechcrunch.com%2Ffeed%2F") { (feedDetails, err) in
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feed2") as? Feed2TableViewCell {
            let singleFeed = self.feedsCount[indexPath.row]
            cell.titleLbl.text = singleFeed.title
            cell.publishedLbl.text = singleFeed.pubDate
            if singleFeed.thumbnail == "" {
                cell.thumbnailImage.image = UIImage(named: "feed.png")
            } else {
                DispatchQueue.main.async {
                    cell.thumbnailImage.image = UIImage(url: URL(string: singleFeed.thumbnail ?? ""))
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class Feed2TableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage : UIImageView!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var publishedLbl : UILabel!
}
