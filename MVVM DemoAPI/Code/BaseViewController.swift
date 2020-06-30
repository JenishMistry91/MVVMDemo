//
//  ViewController.swift
//  astryve
//
//  Created by Jeet Dholakia on 04/02/20.
//  Copyright © 2020 Finablr. All rights reserved.
//

import UIKit
import MBProgressHUD
import NotificationBannerSwift

class BaseViewController: UIViewController {
    // MARK: - Enums -
    enum ToastStatus: Int {
        case success = 0
        case error = 1
    }
    // MARK: - Attributes -
    private var messageViewHeight: CGFloat!

    // MARK: - Hide or show loader
    func showHUDProcessView() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    func hideHUDProcessView() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    func showToast(message: String, status: ToastStatus) {
        if CurrentDevice.isNotchFeaturedIPhone() {
            self.messageViewHeight = 60
        } else {
            self.messageViewHeight = 50
        }
        var banner = StatusBarNotificationBanner(title: message, style: .success)
        banner.duration = 2.0
        if CurrentDevice.isIpad {
            banner.bannerHeight = 50
            banner.titleLabel!.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        } else {
            banner.bannerHeight = self.messageViewHeight
            banner.titleLabel!.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.7 * CGFloat(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {() -> Void in
            switch status {
            case .error:
                banner = StatusBarNotificationBanner(title: message, style: .danger)
            default:
                return
            }
            banner.show(queuePosition: .front, bannerPosition: .top)
            banner.autoDismiss = true
        })
    }
    func showNoInternetConnectionToast() {
        self.showToast(message: "No Internet Connection", status: .error)
        self.hideHUDProcessView()
    }
}
