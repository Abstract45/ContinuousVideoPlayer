//
//  APIClient.swift
//  LifeSlice-Test
//
//  Created by Miwand Najafe on 2016-05-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import SwiftyJSON

class APIClient {
    static let sharedInstance = APIClient()
    private init() {}
    
    
    // MARK: Getting data from Vine
    func getVideosFromVine(videoData: completion) -> () {
        guard let url = NSURL(string:VINE_URL_BASE + VINE_URL_RESOURCE) else {return}
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url) { (data, response, error) in
            var videos = [VideoModel]()
            
            if let data = data {
                let json = JSON(data: data)
                let jsonArray = json["data"]["records"]
                
                for record in jsonArray {
                    let video = VideoModel(json: record.1)
                    videos.append(video)
                }
                 videoData(videos)
            } else {
                print(error.debugDescription)
            }
            }.resume()
    }
}