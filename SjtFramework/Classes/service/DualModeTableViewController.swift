//
//  DualModeTableViewController.swift
//  ThingAppSDKSample-iOS-Swift
//
//  Copyright (c) 2014-2021 Thing Inc. (https://developer.tuya.com/)

import UIKit
import ThingSmartBLEKit

class DualModeTableViewController: UITableViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var ssidTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Property
    private var isSuccess = false

    override func viewDidLoad() {
        super.viewDidLoad()
        ssidTextField.text = "Tim"
        passwordTextField.text = "s88888888"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopConfiguring()
    }

    @IBAction func searchTapped(_ sender: UIButton) {
        ThingSmartBLEManager.sharedInstance().delegate = self
        
        // Start finding un-paired BLE devices, it's the same process as single BLE mode.
        ThingSmartBLEManager.sharedInstance().startListening(true)
        
        
        
    }
    
    // MARK: - Private method
    private func stopConfiguring() {
        if !isSuccess {
        }
        
        ThingSmartBLEManager.sharedInstance().delegate = nil
        ThingSmartBLEManager.sharedInstance().stopListening(true)
        
        ThingSmartBLEWifiActivator.sharedInstance().bleWifiDelegate = nil
        ThingSmartBLEWifiActivator.sharedInstance().stopDiscover()
    }
}

extension DualModeTableViewController: ThingSmartBLEManagerDelegate {
    
    // When the BLE detector finds one un-paired BLE device, this delegate method will be called.
    func didDiscoveryDevice(withDeviceInfo deviceInfo: ThingBLEAdvModel) {
//        guard let homeID = Home.current?.homeId else {
//            SVProgressHUD.showError(withStatus: NSLocalizedString("No Home Selected", comment: ""))
//            return
//        }
        
        let bleType = deviceInfo.bleType
        if bleType == ThingSmartBLETypeUnknow ||
            bleType == ThingSmartBLETypeBLE ||
            bleType == ThingSmartBLETypeBLESecurity ||
            bleType == ThingSmartBLETypeBLEPlus ||
            bleType == ThingSmartBLETypeBLEZigbee ||
            bleType == ThingSmartBLETypeBLEBeacon {
            print("Please use BLE to pair: %@", deviceInfo.uuid ?? "")
            return
        }
        
        
        // Found a BLE device, then try to config that using ThingSmartBLEWifiActivator.
        
        ThingSmartBLEWifiActivator.sharedInstance().bleWifiDelegate = self
        
        ThingSmartBLEWifiActivator.sharedInstance().startConfigBLEWifiDevice(withUUID: deviceInfo.uuid, homeId: 9071, productId: deviceInfo.productId, ssid: ssidTextField.text ?? "", password: passwordTextField.text ?? "", timeout: 100) {
        } failure: {
        }

    }
}

extension DualModeTableViewController: ThingSmartBLEWifiActivatorDelegate {
    
    // When the device connected to the router and activate itself successfully to the cloud, this delegate method will be called.
    func bleWifiActivator(_ activator: ThingSmartBLEWifiActivator, didReceiveBLEWifiConfigDevice deviceModel: ThingSmartDeviceModel?, error: Error?) {
        
        guard error == nil,
              let deviceModel = deviceModel else {
            return
        }
        
        let name = deviceModel.name ?? NSLocalizedString("Unknown Name", comment: "Unknown name device.")
        

        isSuccess = true
        self.navigationController?.popViewController(animated: true)
    }
}
