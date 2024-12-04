//
//  ViewController.swift
//  ApiDataInTableViewPractice1
//
//  Created by Srikanth Kyatham on 12/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    
    var transcodings : [Transcoding] = []
    var videoData : [VideoData] = []
    var serverUrl = "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 225
        getDataFromServer()
    }
    func getDataFromServer() {
        let sharedInstance = VideoService.sharedInstance
        sharedInstance.getData(from: serverUrl) { [weak self] videoDataArray in
            DispatchQueue.main.async {
                guard let videoDataArray else { return }
                self?.videoData = videoDataArray
                self?.transcodings = self?.videoData[0].transcodings ?? []
                self?.tableView.reloadData()
                self?.updateUI()
            }
        }
    }
    func updateUI(){
        guard let firstvideoData = videoData.first else { return }
        titleLabel.text = "Title: \(firstvideoData.title ?? " ")"
        idLabel.text = "ID:\(firstvideoData.id ?? " ")"
        durationLabel.text = "Duration: \(firstvideoData.duration ?? 0)"
    }


}

extension ViewController  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transcodings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TranscodingCell", for: indexPath) as! TranscodingCell
        let transcoding = transcodings[indexPath.row]
        cell.config(from: transcoding)
        return cell
    }
    
}
