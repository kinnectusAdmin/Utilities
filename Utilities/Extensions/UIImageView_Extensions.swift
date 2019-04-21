//
//  UIImageView_Extensions.swift
//  Utilities
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension UIImageView{
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - mode: <#mode description#>
    ///   - cornerRadius: <#cornerRadius description#>
    ///   - maskBounds: <#maskBounds description#>
    /// - Returns: <#return value description#>
    static public func view(mode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0, maskBounds: Bool = true) -> UIImageView {
        let image = UIImageView()
        image.contentMode = mode
        image.layer.cornerRadius = cornerRadius
        image.layer.masksToBounds = maskBounds
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    public func session()-> URLSession{
        let sessDefined = Foundation.URLSession.shared
        return sessDefined
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - data: <#data description#>
    ///   - response: <#response description#>
    ///   - error: <#error description#>
    public func getImageHandler(data: Data?,response: URLResponse?,error: Error?) {
        if error == nil{
            if let dataImage = UIImage(data: data!) {
                imageCache.setObject(dataImage, forKey: response!.url!.absoluteString as AnyObject)
                DispatchQueue.main.async {
                    self.image = dataImage
                    if let loader = self.viewWithTag(33) as? UIActivityIndicatorView{
                        loader.stopAnimating()
                        loader.removeFromSuperview()
                    }
                }
            }
        } else {
            print(error?.localizedDescription ?? "Error")
        }
    }
    
    /// <#Description#>
    ///
    /// - Parameter url: <#url description#>
    public func loadImageWithURL(url: String) {
        print(url)
        if let image = imageCache.object(forKey: url as AnyObject) {
            DispatchQueue.main.async {
                self.image = image as UIImage
            }
        } else {
            let url = URL(string:url)
            if url != nil{
                let task = session().dataTask(with: url!, completionHandler: getImageHandler)
                task.resume()
            }
        }
    }
    /// <#Description#>
    ///
    /// - Parameter view: <#view description#>
    /// - Returns: <#return value description#>
    public func withScreen(view: UIView) -> UIImageView {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.constrainInView(view: self, top: 0, left: 0, right: 0, bottom: 0)
        return self
    }
}
extension UIImageView {
    /// Create and image view with custom radius, alpha and interaction
    ///
    /// - Parameters:
    ///   - radius: CGFloat - Default 0.0
    ///   - visible: Bool - Default true
    ///   - interactionOn: Bool - Default false
    /// - Returns: UIImageView
    static public func image(image: UIImage? = nil, mode: UIView.ContentMode = .scaleAspectFit, radius: CGFloat = 0.0, visible: Bool = true, interactionOn: Bool = false, tintColor: UIColor? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.alpha = visible ? 1.0 : 0.0
        imageView.contentMode = mode
        if let color = tintColor {
            imageView.tintColor = color
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
        } else {
            imageView.image = image
        }
        imageView.isUserInteractionEnabled = interactionOn
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = radius
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
