//
//  MainViewController.swift
//  Tutorial
//
//  Created by Mikhail Zharchev on 17/09/15.
//  Copyright (c) 2015 Mikhail Zharchev. All rights reserved.
//

import UIKit
import MediaPlayer



class MainViewController: UIViewController {
    
    @IBOutlet weak var phoneView: UIImageView!
    @IBOutlet weak var moviewView: UIView!
    
    @IBOutlet weak var movie2view: UIView!
    var moviePlayer : MPMoviePlayerController?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        playVideo()

        // Do any additional setup after loading the view.
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
    @IBAction func startTutorial(sender: AnyObject) {
        
        
    }
    
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("1upload", ofType: "mov")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
        if let player = moviePlayer {
            player.view.frame = self.movie2view.bounds
            //player.view.center.x = self.moviewView.center.x
//            player.view.center.y = self.view.center.y
            player.prepareToPlay()
            player.scalingMode = .AspectFill
            player.repeatMode = .One
            player.controlStyle = .None
            self.movie2view.addSubview(player.view)
        }
    }

}
