//
//  VideoPlayer.swift
//  LifeSlice-Test
//
//  Created by Miwand Najafe on 2016-05-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



class VideoPlayer: AVPlayerViewController {
    
    var playerItems = [AVPlayerItem]()
    var isDownloadComplete:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(setVideoURL(_:)), name: "PlayVideo", object: nil)
    }
    
    
    func setVideoURL(notif:NSNotification) {
        
        player?.pause()
        playerItems.removeAll()
        isDownloadComplete = false
        if let videoURL = notif.object as? [String] {
            getVideos(videoURL, completion: { (booleanVal) in
                self.isDownloadComplete = booleanVal
                
            })
            if self.isDownloadComplete! {
                let queplayer = AVQueuePlayer(items: self.playerItems)
                self.player = queplayer
                
                self.player?.play()
                if AVPlayerItemDidPlayToEndTimeNotification == "item has played to its end time" {
                    queplayer.advanceToNextItem()
                }
            }
        }
    }
    
    func getVideos(urlString:[String], completion:(Bool) -> ()) -> (){
        
        for item in urlString {
            guard let url = NSURL(string: item) else {return}
            
            let item = AVPlayerItem(URL: url)
            self.playerItems.append(item)
        }
        
        if playerItems[0].asset.playable {
            completion(true)
        }
    }
}
