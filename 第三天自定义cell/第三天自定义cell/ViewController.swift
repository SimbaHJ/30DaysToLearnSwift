//
//  ViewController.swift
//  第三天自定义cell
//
//  Created by 霍驹 on 17/2/14.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    var videoTable = UITableView()
    
    var playViewController = AVPlayerViewController()
    var playView = AVPlayer()
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatTable()
    }
    
    
    func creatTable() {
        videoTable = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: WIDTH, height: HEIGHT - 64))
        videoTable.delegate = self
        videoTable.dataSource = self
        videoTable.separatorStyle = UITableViewCellSeparatorStyle.none
        videoTable.register(VideoCell.self, forCellReuseIdentifier: "videoCell")
        self.view.addSubview(videoTable)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideoCell
        
        let video = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage.init(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        cell.videoStarBtn.tag = indexPath.row
        cell.videoStarBtn.addTarget(self, action: #selector(starVideo(_:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func starVideo(_ btn: UIButton)  {
        print( btn.tag)
        
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        
        playView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController.player = playView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400*pix
    }
}











