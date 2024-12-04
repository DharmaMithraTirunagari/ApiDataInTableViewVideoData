//
//  TranscodingCell.swift
//  ApiDataInTableViewPractice1
//
//  Created by Srikanth Kyatham on 12/2/24.
//

import UIKit

class TranscodingCell: UITableViewCell {

    @IBOutlet weak var transcodingTitle: UILabel!
    
    @IBOutlet weak var transcodingId: UILabel!
    
    @IBOutlet weak var transcodingSize: UILabel!
    
    @IBOutlet weak var transcodingHttpUri: UILabel!
    
    @IBOutlet weak var transcodingBitrate: UILabel!
    
    @IBOutlet weak var transcodingHeight: UILabel!
    
    @IBOutlet weak var transcodingWidth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(from transcoding: Transcoding) {
            transcodingTitle.text = "Title: \(transcoding.title ?? "N/A")"
            transcodingId.text = "ID: \(transcoding.id ?? "N/A")"
            transcodingSize.text = "Size: \(transcoding.size != nil ? "\(transcoding.size!) bytes" : "N/A")"
            transcodingHttpUri.text = "URI: \(transcoding.http_uri ?? "No URI")"
            transcodingBitrate.text = "Bitrate: \(transcoding.bitrate != nil ? "\(transcoding.bitrate!) kbps" : "N/A")"
            transcodingHeight.text = "Height: \(transcoding.height != nil ? "\(transcoding.height!) px" : "N/A")"
            transcodingWidth.text = "Width: \(transcoding.width != nil ? "\(transcoding.width!) px" : "N/A")"
        }

}
