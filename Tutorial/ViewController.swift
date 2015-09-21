//
//  ViewController.swift
//  Tutorial
//
//  Created by Mikhail Zharchev on 16/09/15.
//  Copyright (c) 2015 Mikhail Zharchev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    var pageVideos: NSArray!
    
    var index: Int!
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path1 = NSBundle.mainBundle().pathForResource("1upload", ofType: "mov")
        let url1 = NSURL.fileURLWithPath(path1!)
        
        let path2 = NSBundle.mainBundle().pathForResource("2trim", ofType: "mov")
        let url2 = NSURL.fileURLWithPath(path2!)
        
        let path3 = NSBundle.mainBundle().pathForResource("1upload", ofType: "mov")
        let url3 = NSURL.fileURLWithPath(path3!)
        
        let path4 = NSBundle.mainBundle().pathForResource("2trim", ofType: "mov")
        let url4 = NSURL.fileURLWithPath(path4!)
        
        self.pageVideos = NSArray(objects: url1!, url2!, url3!, url4!)
        
        
        self.pageTitles = NSArray(objects: "Use any video!", "Trim the best part", "Use multiple pieces", "Save for later")
        self.pageImages = NSArray(objects: "emptyPhone.png", "emptyPhone.png", "emptyPhone.png", "emptyPhone.png")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        var startVC =  self.viewControllerAtIndex(0) as ContentViewController
        var viewControlers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControlers as [AnyObject], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 20, self.view.frame.width, self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }



    @IBAction func nextAction(sender: AnyObject) {
        
        
        

        

        
        
        if (index == nil) {
            
            var nextVC = self.viewControllerAtIndex(1) as ContentViewController
            var viewControllers = NSArray(object: nextVC)
            
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
            
            self.index = 1
            
        }  else if (self.index >= pageTitles.count - 2) {
            
            sender.setTitle("Got it!", forState: .Normal)
            
            var nextVC = self.viewControllerAtIndex(index + 1) as ContentViewController
            var viewControllers = NSArray(object: nextVC)
            
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
        }
        
        
        
        else {
            
            var nextVC = self.viewControllerAtIndex(index + 1) as ContentViewController
            var viewControllers = NSArray(object: nextVC)
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
            self.index = self.index + 1
            
            
        }
        
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController
    {
        
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count))
        {
            return ContentViewController()
        }
        
        var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.videoFile = self.pageVideos[index] as! NSURL
        vc.pageIndex = index
        
        
        return vc
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! ContentViewController
        index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        
        index = index - 1
        return self.viewControllerAtIndex(index)
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        
        var vc = viewController as! ContentViewController
        index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index = index + 1
        
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
        
    }
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return self.pageTitles.count
        
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return 0
        
    }
    
    
    
    
    
    
}

