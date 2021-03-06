//
//  Loader.swift
//  mobile-challenger
//
//  Created by Leonardo Sugano on 20/02/21.
//

import UIKit

extension UIView {
    func showLoader() {
        let loader = Loader(frame: frame)
        self.addSubview(loader)
    }

    func removeLoader() {
        if let loader = subviews.first(where: { $0 is Loader }) {
            loader.removeFromSuperview()
        }
    }
}


class Loader: UIView {

    var blurEffectView: UIVisualEffectView?

    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView = blurEffectView
        super.init(frame: frame)
        addSubview(blurEffectView)
        addLoader()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func addLoader() {
        if let blurEffectView = blurEffectView {
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            blurEffectView.contentView.addSubview(activityIndicator)
            activityIndicator.center = blurEffectView.contentView.center
            activityIndicator.startAnimating()
        }
    }
}
