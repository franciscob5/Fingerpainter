//
//  ViewController.swift
//  Fingerpainter
//
//  Created by Mobile on 1/12/16.
//  Copyright © 2016 com.sbhscs.Mobile. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var start: CGPoint?
    var storedImage : UIImage  =  UIImage()
    var newMedia: Bool?
    var reverseRevision : [UIImage] = [ UIImage() , UIImage() , UIImage() , UIImage() , UIImage(), UIImage(), UIImage(), UIImage(), UIImage(), UIImage(), UIImage() ]
    var hasUndoSinceDraw = 0
    var hasRedoSinceUndo = 0
    
    let lineData: LineData = LineData()
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var canvas: UIImageView!
    @IBOutlet var undoButton: UIBarButtonItem!
    @IBOutlet var redoButton: UIBarButtonItem!
    @IBOutlet var moreButton: UIBarButtonItem!
    

    @IBAction func undoPressed(sender: UIBarButtonItem) {
        print("\(hasUndoSinceDraw)")
        redoButton.enabled = true
        hasRedoSinceUndo = 0
        if hasRedoSinceUndo != 0{
            hasRedoSinceUndo--
        }
        if hasUndoSinceDraw == 0{
            reverseRevision[5] = canvas.image!
            canvas.image = reverseRevision[1]
            hasUndoSinceDraw = 1
            if reverseRevision[2] == UIImage(){
                sender.enabled = false
            }
        }
       else if hasUndoSinceDraw == 1{
            reverseRevision[6] = reverseRevision[5]
            reverseRevision[5] = canvas.image!
            canvas.image = reverseRevision[2]
            hasUndoSinceDraw = 2
            if reverseRevision[3] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasUndoSinceDraw == 2{
            reverseRevision[7] = reverseRevision[6]
            reverseRevision[6] = reverseRevision[5]
            reverseRevision[5] = canvas.image!
            canvas.image = reverseRevision[3]
            hasUndoSinceDraw = 3
            if reverseRevision[4] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasUndoSinceDraw == 3{
            reverseRevision[8] = reverseRevision[7]
            reverseRevision[7] = reverseRevision[6]
            reverseRevision[6] = reverseRevision[5]
            reverseRevision[5] = canvas.image!
            canvas.image = reverseRevision[4]
            hasUndoSinceDraw = 4
            if reverseRevision[10] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasUndoSinceDraw == 4{
            reverseRevision[9] = reverseRevision[8]
            reverseRevision[8] = reverseRevision[7]
            reverseRevision[7] = reverseRevision[6]
            reverseRevision[6] = reverseRevision[5]
            reverseRevision[5] = canvas.image!
            canvas.image = reverseRevision[10]
            sender.enabled = false
    
        }
    }
    @IBAction func redoPressed(sender: UIBarButtonItem) {
        undoButton.enabled = true
        hasUndoSinceDraw--
        if hasRedoSinceUndo == 0{
            reverseRevision[0] = canvas.image!
            canvas.image = reverseRevision[5]
            hasRedoSinceUndo = 1
            if reverseRevision[5] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasRedoSinceUndo == 1{
            reverseRevision[1] = reverseRevision[0]
            reverseRevision[0] = canvas.image!
            canvas.image = reverseRevision[6]
            hasRedoSinceUndo = 2
            if reverseRevision[6] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasRedoSinceUndo == 2{
            reverseRevision[2] = reverseRevision[1]
            reverseRevision[1] = reverseRevision[0]
            reverseRevision[0] = canvas.image!
            canvas.image = reverseRevision[7]
            hasRedoSinceUndo = 3
            if reverseRevision[7] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasRedoSinceUndo == 3{
            reverseRevision[3] = reverseRevision[2]
            reverseRevision[2] = reverseRevision[1]
            reverseRevision[1] = reverseRevision[0]
            reverseRevision[0] = canvas.image!
            canvas.image = reverseRevision[8]
            hasRedoSinceUndo = 4
            if reverseRevision[8] == UIImage(){
                sender.enabled = false
            }
        }
        else if hasRedoSinceUndo == 4{
            reverseRevision[4] = reverseRevision[3]
            reverseRevision[3] = reverseRevision[2]
            reverseRevision[2] = reverseRevision[1]
            reverseRevision[1] = reverseRevision[0]
            reverseRevision[0] = canvas.image!
            canvas.image = reverseRevision[9]
            sender.enabled = false
            
        }

    }
    
    @IBAction func clearImage(sender: AnyObject) {
        canvas.image = nil
        clearRedo()
        clearUndo()
        moreButton.enabled = false
    }
    @IBAction func saveToPhotoAlbum(sender: AnyObject) {
        UIImageWriteToSavedPhotosAlbum(canvas.image!, nil, nil, nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    @IBAction func pictureLoad(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                
                
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = false
                
        }
    }
    
    func imagePickerController( picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
    
        
       
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
       
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            canvas.image = image
            
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreButton.enabled = false
        canvas.image = storedImage
        imagePicker.delegate = self
        redoButton.enabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        start = touch.locationInView(canvas)
        //print message with breakpoint here
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if canvas.image != UIImage(){
        reverseRevision[10] = reverseRevision[4]
        reverseRevision[4] = reverseRevision[3]
        reverseRevision[3] = reverseRevision[2]
        reverseRevision[2] = reverseRevision[1]
        reverseRevision[1] = reverseRevision[0]
        reverseRevision[0] = canvas.image!

        hasUndoSinceDraw = 0
        hasRedoSinceUndo = 0
        clearRedo()
        undoButton.enabled = true
        redoButton.enabled = false
        moreButton.enabled = true
        }
        
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        let end = touch.locationInView(canvas)
        if let fromPoint = self.start{
            drawFromPoint(fromPoint, toPoint: end)
        }
        start = end
        
        //print message with breakpoint here
    }

    func drawFromPoint(start: CGPoint, toPoint end : CGPoint){
        UIGraphicsBeginImageContext(canvas.frame.size)
        let context = UIGraphicsGetCurrentContext()
        canvas.image?.drawInRect(CGRect(x: 0, y: 0, width: canvas.frame.size.width, height: canvas.frame.size.height))
        CGContextSetLineWidth(context, CGFloat(lineData.lineWidth))
        CGContextSetStrokeColorWithColor(context, lineData.lineColor.CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        let newimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        canvas.image = newimage
        
        
        print("\(hasUndoSinceDraw)")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController: TabBarController = segue.destinationViewController as! TabBarController
        viewController.imageStorage =  canvas.image!
        viewController.lineWidth = lineData.lineWidth
        viewController.lineColor = lineData.lineColor
        viewController.undoStorage = reverseRevision
    }
    func clearRedo(){
        reverseRevision[5] = UIImage()
        reverseRevision[6] = UIImage()
        reverseRevision[7] = UIImage()
        reverseRevision[8] = UIImage()
        reverseRevision[9] = UIImage()
    }
    func clearUndo(){
        reverseRevision[0] = UIImage()
        reverseRevision[1] = UIImage()
        reverseRevision[2] = UIImage()
        reverseRevision[3] = UIImage()
        reverseRevision[4] = UIImage()
    }

}

