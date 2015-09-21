//
//  ContentViewController.swift
//  Tutorial
//
//  Created by Mikhail Zharchev on 16/09/15.
//  Copyright (c) 2015 Mikhail Zharchev. All rights reserved.
//

import UIKit
import MediaPlayer

class ContentViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var videoFrameView: UIView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    var videoFile: NSURL!
    
    var moviePlayer : MPMoviePlayerController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleText
        
        
        self.view.backgroundColor = UIColor.clearColor()
        //println(self.videoFile)
        playVideo(self.videoFile)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func playVideo(videoUrl: NSURL!) {
        //let path = NSBundle.mainBundle().pathForResource("1upload", ofType: "mov")
        //let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: videoUrl! as NSURL)
        
        if let player = moviePlayer {
            player.view.frame = self.videoFrameView.bounds
            player.prepareToPlay()
            player.scalingMode = .AspectFill
            player.repeatMode = .One
            player.controlStyle = .None
            self.videoFrameView.addSubview(player.view)
        }
    }


}
