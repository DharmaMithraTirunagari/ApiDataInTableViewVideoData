//
//  VideoModel.swift
//  ApiDataInTableViewPractice1
//
//  Created by Srikanth Kyatham on 12/2/24.
//

import Foundation

struct VideoData: Codable {
    let id: String?
    let title: String?
    let duration: Double?
    let transcodings: [Transcoding]?
}

struct Transcoding: Codable {
    let id: String?
    let title: String?
    let size: Double?
    let http_uri: String?
    let bitrate: Int?
    let height: Int?
    let width: Int?
}
