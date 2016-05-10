//
//  MainVC.swift
//  LifeSlice-Test
//
//  Created by Miwand Najafe on 2016-05-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    

    @IBOutlet weak var movieTable:UITableView!

    
    var videos = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.delegate = self
        movieTable.dataSource = self
        
        APIClient.sharedInstance.getVideosFromVine { (videos) in
            self.videos = videos
            
            dispatch_async(dispatch_get_main_queue(), {
                self.movieTable.reloadData()
            })
        }
        NSUserDefaults.standardUserDefaults().setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}

extension MainVC: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var videoUrl = [String]()
     dispatch_async(dispatch_get_main_queue()) {
        for i in indexPath.row..<self.videos.count {
            videoUrl.append(self.videos[i].videoURL)
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("PlayVideo", object: videoUrl)
        }
        
    }
}

extension MainVC: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("videocell") as? MoviePlayerCell {
            cell.configCell(videos[indexPath.row])
            return cell
        } else {
            let cell = MoviePlayerCell()
            cell.configCell(videos[indexPath.row])
            return cell
        }
    }
  
}