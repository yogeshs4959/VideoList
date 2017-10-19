//
//  ViewController.swift
//  VideoApp
//
//  Created by Yogesh S on 2017-10-19.
//  Copyright © 2017 Yogesh S. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        guard let path = Bundle.main.path(forResource:"TheBeautyoftheNature", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return cell
        }
        let url = URL.init(fileURLWithPath: path)
        let player = AVPlayer(url: url)
        cell.playerLayer = AVPlayerLayer(player: player)
        cell.playerLayer?.frame = cell.bounds
        cell.playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cell.layer.addSublayer(cell.playerLayer!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = (cell as? VideoTableViewCell) else { return }
        cell.playerLayer?.player?.play()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? VideoTableViewCell else { return }
        cell.playerLayer?.player?.pause()
        cell.playerLayer?.player = nil
    }

}

