//
//  InfoViewController.swift
//  Fingerpainter
//
//  Created by Mobile on 5/12/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var parentTab : TabBarController!
    
    @IBOutlet var catLabel: UILabel!
    
    @IBOutlet var mainWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parentTab = self.tabBarController as! TabBarController
        
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("fingerPainter", ofType: "html"){
            
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            mainWebView.loadData(htmlData!, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
        
        let url = NSURL(string: "http://catfacts-api.appspot.com/api/facts" )
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
                            if let feed = (try? NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)) as! NSDictionary! {
                                if let catFactArray = feed.valueForKeyPath("facts") as! NSArray! {
                                    dispatch_async(dispatch_get_main_queue(), {
                                        
                                        self.catLabel.text = catFactArray[0] as? String
                                        self.view.setNeedsDisplay()
                                        self.catLabel.setNeedsDisplay()
                                    })                                }
            
                            }
            
                })
        task.resume()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController: ViewController = segue.destinationViewController as! ViewController
        viewController.lineData.lineColor = parentTab.lineColor
        viewController.lineData.lineWidth = parentTab.lineWidth
viewController.storedImage = parentTab.imageStorage
        viewController.reverseRevision = parentTab.undoStorage!
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
