//
//  MoviePlayerCell.swift
//  LifeSlice-Test
//
//  Created by Miwand Najafe on 2016-05-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import AFNetworking

class MoviePlayerCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutMargins = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            username.textColor = UIColor(red: 126/255, green: 174/255, blue: 199/255, alpha: 1)
            thumbnailImg.layer.borderColor = UIColor(red: 126/255, green: 174/255, blue: 199/255, alpha: 1).CGColor
        } else {
            username.textColor = UIColor.darkGrayColor()
            thumbnailImg.layer.borderColor = UIColor.darkGrayColor().CGColor
        }
    }
    
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        thumbnailImg.layer.cornerRadius = thumbnailImg.frame.size.width / 2
        thumbnailImg.clipsToBounds = true
        thumbnailImg.layer.borderWidth = 2
        
    }
    
    
    func configCell(Video:VideoModel) {
        self.username.text = Video.username
        self.thumbnailImg.setImageWithURL(Video.thumnailImgURL!, placeholderImage: UIImage(named: "user"))
    }

}
