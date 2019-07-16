//
//  UXImage.swift
//  Journey
//
//  Created by blakerogers on 3/12/19.
//  Copyright © 2019 Blake Rogers. All rights reserved.
//

import UIKit
public class UXImage {
    public var imageView: UIImageView!
    var defaultImage: UIImage?
    init(_ image: UIImageView, defaultImage: UIImage? = nil) {
        self.imageView = image
        self.defaultImage = defaultImage
    }
    /// Loads an image async and defaults to
    ///
    /// - Parameter url: String
    public func loadImageWithURL(url: String, defaultImage: UIImage? = nil) {
        self.defaultImage = defaultImage
        if let image = imageCache.object(forKey: url as AnyObject) {
            DispatchQueue.main.async {
                self.imageView.image = image as UIImage
            }
        } else {
            let url = URL(string:url)
            if url != nil{
                let task = session().dataTask(with: url!, completionHandler: getImageHandler)
                task.resume()
            } else {
                self.imageView.image = defaultImage
            }
        }
    }
    /// URL Session used to fetch image
    public func session()-> URLSession{
        let sessDefined = Foundation.URLSession.shared
        return sessDefined
    }
    /// Handler utilized to set image in response to url request for image
    ///
    /// - Parameters:
    ///   - data: Data
    ///   - response: URLResponse
    ///   - error: Error
    public func getImageHandler(data: Data?,response: URLResponse?,error: Error?) {
        if error == nil{
            if let dataImage = UIImage(data: data!) {
                imageCache.setObject(dataImage, forKey: response!.url!.absoluteString as AnyObject)
                DispatchQueue.main.async {
                    self.imageView.image = dataImage
                }
            } else {
                self.imageView.image = defaultImage
            }
        }
    }
}
extension UXImage {
    ///Creates UXImage
    ///
    /// - Parameters:
    ///   - mode: Contenmode defautl aspectFill
    ///   - cornerRadius: CGFloat
    ///   - maskBounds: Bool
    /// - Returns: UXImage
    static public func view(mode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0, maskBounds: Bool = true, defaultImage: UIImage? = nil) -> UXImage {
        let image = UXImage(UIImageView.view(mode: mode, cornerRadius: cornerRadius, maskBounds: maskBounds), defaultImage: defaultImage)
        return image
    }
    /// Create and image view with custom radius, alpha and interaction
    ///
    /// - Parameters:
    ///   - radius: CGFloat - Default 0.0
    ///   - visible: Bool - Default true
    ///   - interactionOn: Bool - Default false
    /// - Returns: UIImageView
    static public func image(image: UIImage? = nil, mode: UIView.ContentMode = .scaleAspectFit, radius: CGFloat = 0.0, visible: Bool = true, interactionOn: Bool = false, tintColor: UIColor? = nil, defaultImage: UIImage? = nil) -> UXImage {
        let image = UXImage(UIImageView.image(image: image, mode: mode, radius: radius, visible: visible, interactionOn: interactionOn, tintColor: tintColor), defaultImage: defaultImage)
        return image
    }
    /// Return a bordered avatar UXImage
    ///
    /// - Parameters:
    ///   - image: UIImage
    ///   - mode: ContentMode
    ///   - radius: CGFLoat
    ///   - visible: Bool
    ///   - interactionOn: Bool
    ///   - tintColor: UIColor
    ///   - defaultImage: UIImage (optional)
    ///   - borderColors: (UIColor, UIColor)
    ///   - size: CGFloat size of outer border view
    /// - Returns: UXImage
    static public func borderedAvatarImage(image: UIImage? = nil, mode: UIView.ContentMode = .scaleAspectFit, radius: CGFloat = 0.0, visible: Bool = true, interactionOn: Bool = false, tintColor: UIColor? = nil, defaultImage: UIImage? = nil, borderColors: (outer: UIColor, inner: UIColor), size: CGFloat) -> UXImage {
        let outerBorderView = UIView.containerView(background: borderColors.outer, radius: size*0.5)
        outerBorderView.constrainWidth_Height(width: size, height: size)
        let innerBorderView = UIView.containerView(background: borderColors.inner, radius: size*0.5)
        innerBorderView.constrainWidth_Height(width: size*0.90, height: size*0.90)
        let imageView = UIImageView.image(image: image, mode: mode, radius: radius, visible: visible, interactionOn: interactionOn, tintColor: tintColor)
        imageView.constrainWidth_Height(width: size*0.70, height:size*0.70)
        outerBorderView.add(views: innerBorderView, imageView)
        innerBorderView.constrainCenterToCenter(of: outerBorderView)
        imageView.constrainCenterToCenter(of: innerBorderView)
        return UXImage(imageView, defaultImage: defaultImage)
    }
}
