//
//  VideoTableViewCell.swift
//  VideoApp
//
//  Created by Yogesh S on 2017-10-19.
//  Copyright © 2017 Yogesh S. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoTableViewCell: UITableViewCell {
    
    var playerLayer: AVPlayerLayer?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
