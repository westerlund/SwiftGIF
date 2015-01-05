//
//  SwiftGIF.swift
//  Pods
//
//  Created by Simon Westerlund on 05/01/15.
//
//

import UIKit
import ImageIO
import MobileCoreServices

private func createErrorFromString(string: String, code: Int = -1) -> NSError {
    let dict = [NSLocalizedDescriptionKey: string]
    return NSError(domain: "com.simonwesterlund.SwiftGIF", code: code, userInfo: dict)
}

/**
 Create a GIF using a set of images

 You can specify the loop count and the delays between the frames.
 
 :param: images an array of images
 :param: repeatCount the repeat count, defaults to 0 which is infinity
 :param: frameDelay an delay in seconds between each frame
 :param: callback set a block that will get called when done, it'll return with data and error, both which can be nil
*/
public func createGIF(with images: [UIImage], repeatCount: Int = 0, frameDelay: Double, callback: (data: NSData?, error: NSError?) -> ()) {
    
    let fileProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: repeatCount]]
    let frameProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: frameDelay]]
    
    let documentsDirectory = NSTemporaryDirectory()
    let url = NSURL(fileURLWithPath: documentsDirectory)?.URLByAppendingPathComponent("animated.gif")
    
    if let url = url {
        let destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, UInt(images.count), nil)
        CGImageDestinationSetProperties(destination, fileProperties)
        
        for i in 0..<images.count {
            CGImageDestinationAddImage(destination, images[i].CGImage, frameProperties)
        }
        
        if CGImageDestinationFinalize(destination) {
            callback(data: NSData(contentsOfURL: url), error: nil)
        } else {
            callback(data: nil, error: createErrorFromString("Couldn't create the final image"))
        }
    } else  {
        callback(data: nil, error: createErrorFromString("There's something wrong with the document directory", code: 1))
    }
}