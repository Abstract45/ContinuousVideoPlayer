//
//  VideoModel.swift
//  LifeSlice-Test
//
//  Created by Miwand Najafe on 2016-05-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import SwiftyJSON

struct VideoModel {
    private var _thumbnailImgURL:String!
    private var _username:String!
    private var _videoURL:String!
    
    var thumnailImgURL:NSURL? {
        let url = NSURL(string: _thumbnailImgURL)
        return url
    }
    var username:String {
        return _username.capitalizedString
    }
    var videoURL:String {
        return _videoURL
    }
    
    init(json:JSON) {
        _thumbnailImgURL = json["thumbnailUrl"].stringValue
        _videoURL = json["videoLowURL"].stringValue
        _username = json["username"].stringValue
    }
}