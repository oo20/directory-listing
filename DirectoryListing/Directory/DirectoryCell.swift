//
//  DirectoryCell.swift
//  DirectoryListing
//
//  Created by Michael Steele on 2/21/17.
//  Copyright © 2017 Michael Steele. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DirectoryCell: UITableViewCell {
    
    @IBOutlet var personImageView: UIImageView?
    
    var individual : Individual?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayData() {
        guard let tempIndividual = individual else {
            DLog("Individual needs to be set for directory table cell.")
            return
        }
        
        guard (tempIndividual.profilePicture != "") else {
            DLog("Individual has no profile picture.")
            return
        }
        
        guard let tempPersonImageView = personImageView else {
            DLog("Person imageview needs to be connected to directory table cell.")
            return
        }
        
        tempPersonImageView.image = nil
        tempPersonImageView.isHidden = true
        
        tempIndividual.preloadImage(finished: { () in
            tempPersonImageView.image = tempIndividual.profileImage()
            tempPersonImageView.isHidden = false
        })
    }
    
}
