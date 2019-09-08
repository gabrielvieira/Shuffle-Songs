//
//  PlayListTableViewCell.swift
//  Shuffle Songs
//
//  Created by Gabriel Tomaz on 08/09/19.
//  Copyright © 2019 Gabriel Tomaz. All rights reserved.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {

    @IBOutlet weak var artWorkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = ColorConstants.purple
        self.trackNameLabel.textColor = ColorConstants.pink
        self.artistNameLabel.textColor = ColorConstants.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.setSelected(false, animated: false)
    }
    
    public func setup(_ viewModel: TrackViewModel) {
        
    }
}
