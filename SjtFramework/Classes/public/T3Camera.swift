//
//  T3Camera.swift
//  T3Camera
//
//  Created by EMPLOYEE on 19/11/2024.
//

import Foundation
import ThingSmartHomeKit

public final class T3Camera: NSObject {
    private static var privateShared: T3Camera? = nil
    private override init() {}
    public static var shared: T3Camera {
        if privateShared == nil {
            privateShared = T3Camera()
        }
        return privateShared!
    }
    public static func destroy() {
        T3Camera.privateShared = nil
    }
    
    private(set) var smartHomeModel: ThingSmartHomeModel!
    private(set) var smartHome: ThingSmartHome!
    
    public func loginSDK() {
        
    }
    
    public func scanBLE(with parent: UIViewController) {
        if let resourceBundleURL = Bundle.main.url(forResource: "T3Framework", withExtension: "bundle"),
                   let resourceBundle = Bundle(url: resourceBundleURL) {
                    let storyboard = UIStoryboard(name: "DualModel", bundle: resourceBundle)
                    if let myViewController = storyboard.instantiateViewController(withIdentifier: "DualModeTableViewController") as? DualModeTableViewController {
                        parent.present(myViewController, animated: true, completion: nil)
                    }
                }
    }
    
    private func getHome(completion: (() -> Void)? = nil) {
        ThingSmartHomeManager().getHomeList(success: { [weak self] homes in
            guard let self else { return }
            smartHomeModel = homes?.first
            smartHome = ThingSmartHome(homeId: smartHomeModel.homeId)
            smartHome.getDataWithSuccess(nil, failure: nil)
            completion?()
        }, failure: { error in
            print(error ?? "")
        })
    }
}
