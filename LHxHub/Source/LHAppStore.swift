//
//  LHAppStore.swift
//  LHxHub
//
//  Created by laohanme on 05/05/2020.
//  Copyright © 2020 laohanme. All rights reserved.
//

import Foundation
import StoreKit

public struct LHAppStore {

    private init() {}

    // MARK: Open and view app in AppStore
    public static func openAppStore(app id: String) {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(id)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    // MARK: Check app is update available
    /// Request to check for the app is update avaiable or not, this request was send to itunes.apple.com and return the data
    /// - itunes server data may update every 6 hours
    public static func isUpdateAvailable(country: String? = nil, cb: @escaping (Bool)->()) {
        guard let info = Bundle.main.infoDictionary,
            let currentVersion = info["CFBundleShortVersionString"] as? String,
            let identifier = info["CFBundleIdentifier"] as? String,
            let url = URL(string: "https://itunes.apple.com/lookup?bundleId=\(identifier)&country=\(country ?? "my")") else {
                cb(false)
                return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let error = error { throw error }
                guard let data = data else {
                    cb(false)
                    return
                }
                let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any]
                guard let result = (json?["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String else {
                    cb(false)
                    return
                }

                let compareResult = currentVersion.compare(version, options: .numeric)

                DispatchQueue.main.async {
                    cb(compareResult == .orderedAscending)
                }
            } catch {
                cb(false)
            }
        }
        .resume()
    }

    // MARK: Star review prompt on app
    public static func requestInAppReview() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }

    // MARK: Write review rediect to AppStore
    public static func requestWriteReview(appID: String, force: Bool) {
        if force {
            if let url = URL(string: "itms-apps://itunes.apple.com/us/app/apple-store/id\(appID)?mt=8&action=write-review"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        } else {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            }
        }
    }

}

fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
