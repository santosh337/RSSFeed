//
//  FeedDetails.swift
//  RSSFeed
//
//  Created by santosh sugur on 28/05/19.
//  Copyright © 2019 santosh sugur. All rights reserved.
//

import UIKit

struct TotalFeeds : Codable {
    let items : [FeedDetails]
}

struct FeedDetails : Codable {
    let title : String?
    let pubDate : String?
    let link : String?
    let guid : String?
    let author : String?
    let thumbnail : String?
    let description : String?
    let content : String?
}
