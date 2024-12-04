//
//  VideoService.swift
//  ApiDataInTableViewPractice1
//
//  Created by Srikanth Kyatham on 12/2/24.
//

import Foundation

class VideoService: @unchecked Sendable {
    static let sharedInstance = VideoService()
    private init() {}
    func getData(from url: String, completion: @escaping ([VideoData]?) -> Void) {
        guard let url = URL(string: url) else {
        print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler:  { data, response, error in
            guard let data, error == nil else {
                print("Error: \(error!.localizedDescription)")
                completion(nil)
                return
            }
            do {
                let recievedVideoData = try JSONDecoder().decode([VideoData].self, from: data)
                print(recievedVideoData)
                completion(recievedVideoData)
            } catch {
                print("Unaable to decode the JSON data to VideoData")
                completion(nil)
            }
        }).resume()
        
    }
    
}
