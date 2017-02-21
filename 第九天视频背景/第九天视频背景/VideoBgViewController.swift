//
//  VideoBgViewController.swift
//  第九天视频背景
//
//  Created by 霍驹 on 17/2/21.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

class VideoBgViewController: UIViewController {

    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel = 1.0
    
    open var videoFrame: CGRect  = CGRect.init()
    open var startTime : CGFloat = 0.0
    open var duration  : CGFloat = 0.0
    
    open var sound: Bool = true {
        didSet{
            if sound {
                moviePlayerSoundLevel = 1.0
            }
            else
            {
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    open var alpha: CGFloat = 1.0 {
        didSet{
        moviePlayer.view.alpha = alpha
        }
    }
    
    open var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    open var alwaysRepeat : Bool = true {
        didSet{
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(self.playerItemDidReachEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
                //moviePlayer.player?.currentItem
            }
        }
        
    }
    
    open var contentURL: URL = URL.init(string: "1")! {
        didSet {
            setMoviePlayerView(contentURL)
        }
    }
    
    fileprivate func setMoviePlayerView(_ url: URL){
        let videoCutter = VideoCutter()
        videoCutter.compressVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (path, error) in
            if let videoPath = path as URL? {
                self.moviePlayer.player = AVPlayer.init(url: videoPath)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = Float(self.moviePlayerSoundLevel)
            }
        }
        
        
        }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpUI()
        moviePlayer.view.frame = view.frame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
        
    }
    

    func playerItemDidReachEnd() {
      moviePlayer.player?.seek(to: kCMTimeZero)
      moviePlayer.player?.play()
    }
}







