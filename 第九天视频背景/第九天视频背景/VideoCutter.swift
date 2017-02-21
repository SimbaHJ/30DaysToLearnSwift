//
//  VideoCutter.swift
//  第九天视频背景
//
//  Created by 霍驹 on 17/2/21.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import AVFoundation

extension String{
    var convert : String {
        return (self as String)
    }
    
}

class VideoCutter: NSObject {

    open func compressVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath:URL, _  error: NSError?)->Void)? ){
        DispatchQueue.global().async {
            //视频压缩
            let asset = AVURLAsset.init(url: url)
            //AVAssetExportPresetHighestQuality   压缩的质量
            let exportSession = AVAssetExportSession.init(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            //获取沙盒路径
            let paths : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputUrl = paths.object(at: 0) as! String
            let manager = FileManager.default
            
            outputUrl = outputUrl.convert.appending("/output.mp4")
            do{
//            删除
                try manager.removeItem(atPath: outputUrl)
            }catch _ {
            
            }
        
            if !manager.fileExists(atPath: outputUrl){
                if let exportSession = exportSession as AVAssetExportSession?{
                exportSession.outputURL = URL.init(fileURLWithPath: outputUrl)
                    //进行优化网络使用 方便快速启动
                exportSession.shouldOptimizeForNetworkUse = true;
                    //导出类型
                exportSession.outputFileType = AVFileTypeMPEG4
                
                    //CMTimeMakeWithSeconds(a,b)    a当前时间,b每秒钟多少帧.
                    let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                    let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                    let range = CMTimeRangeMake(start, duration)
                    exportSession.timeRange = range
                    
                    exportSession.exportAsynchronously {
                        switch exportSession.status {
                        case AVAssetExportSessionStatus.completed:
                            completion?(exportSession.outputURL!, nil)
                        case AVAssetExportSessionStatus.failed:
                            print("Failed: \(exportSession.error)")
                        case AVAssetExportSessionStatus.cancelled:
                            print("Failed: \(exportSession.error)")
                        default:
                            print("default case")
                        }

                    }
                }
            }
//            else{
//                let url = URL.init(string: outputUrl)
//            completion?(url!, nil)
//            }
        }
    }
    
    
    
    
    
    
    
    
}
