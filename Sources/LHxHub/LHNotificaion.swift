//
//  LHNotificaion.swift
//  LHxHub
//
//  Created by laohanme on 05/05/2020.
//  Copyright © 2020 laohanme. All rights reserved.
//

import UIKit
import UserNotifications

@available(iOS 10.0, *)
private let notificationCenter = UNUserNotificationCenter.current()

public struct ScheduledData {
    var id, title, body: String
    var date: DateComponents
    var category: String?
    var isRepeat: Bool?
    var isActive: Bool

    public init(id: String, title: String, body: String, date: DateComponents, category: String? = nil, isRepeat: Bool? = nil, isActive: Bool) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.category = category
        self.isRepeat = isRepeat
        self.isActive = isActive
    }
}

public enum RemoveNotificationType {
    case isRemoveByID(id: String)
    case isRemoveAllPending
    case isRemoveAllDelivered
}

@available(iOS 10.0, *)
public struct LHNotification {

    // MARK: Permission to allow user notification
    /// Request authorization user notification permission
    public static func registerNotification(cb: @escaping(Bool)->()) {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard granted else {
                cb(false)
                isEnableLog ? print("***** LH USER DENIED NOTIFICATION *****") : nil
                return
            }
            DispatchQueue.main.async {
                cb(true)
                UIApplication.shared.registerForRemoteNotifications()
                isEnableLog ? print("***** LH USER ALLOW NOTIFICATION *****") : nil
            }
        }
    }

    // MARK: Add scheduled notification
    /// Request to add scheduled nofitication `ScheduledData`
    public static func scheduledNotfication(data scheduled: ScheduledData) {
        guard scheduled.isActive == true else { return }
        let content = UNMutableNotificationContent()
        content.title = scheduled.title
        content.body = scheduled.body
        content.categoryIdentifier = scheduled.category ?? "Uncategories"
        content.sound = .default
        //content.userInfo = ["customData": "fizzbuzz"]

        let isRepeat = scheduled.isRepeat ?? false
        let trigger = UNCalendarNotificationTrigger(dateMatching: scheduled.date, repeats: isRepeat)
        let request = UNNotificationRequest(identifier: scheduled.id, content: content, trigger: trigger)
        notificationCenter.add(request)
        isEnableLog ? print("***** LH SUCCESS: ADD SCHEDULED NOTIFICATION ID: \(scheduled.id) *****") : nil
    }

    // MARK: Remove notification by type
    /// Request to remove nofitication by type selected  `removeNotificationType`
    public static func removeNotification(remove type: RemoveNotificationType) {
        switch type {
        case let .isRemoveByID(id: id):
            guard id.trimmingCharacters(in: .whitespacesAndNewlines) != "" else { return print("Something Wrong!") }
            notificationCenter.removePendingNotificationRequests(withIdentifiers: [id])
            isEnableLog ? print("***** LH SUCCESS: REMOVE SCHEDULED NOTIFICATION BY ID: \(id) *****") : nil
        case .isRemoveAllPending:
            notificationCenter.removeAllPendingNotificationRequests()
            isEnableLog ? print("***** LH SUCCESS: REMOVE ALL PENDING NOTIFICATION *****") : nil
        case .isRemoveAllDelivered:
            notificationCenter.removeAllDeliveredNotifications()
            isEnableLog ? print("***** LH SUCCESS: REMOVE ALL DELIVERED NOTIFICATION *****") : nil
        }
    }

    // MARK: Retrieved pending notification
    /// Retrieved  all current pending notification
    public static func getAllPendingNotification(cb: @escaping(([String])->())) {
        var pendingArr = [String]()
        notificationCenter.getPendingNotificationRequests { data in
            for notification: UNNotificationRequest in data {
                pendingArr.append(notification.identifier)
            }
            cb(pendingArr)
        }
    }
}
