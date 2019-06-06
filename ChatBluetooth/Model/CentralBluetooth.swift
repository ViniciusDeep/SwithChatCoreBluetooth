//
//  Central.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol ObserverPeripheralsList {
    func update()
}

class CentralBluetooth: NSObject, CBCentralManagerDelegate {
    static let shared = CentralBluetooth()
    
    fileprivate var manager: CBCentralManager!
    
    private var observersPeripheralsList: [ObserverPeripheralsList] = []
    var peripheralsList: [CBPeripheral] = [] {
        didSet {
            for observer in observersPeripheralsList {
                observer.update()
            }
        }
    }
    
    private var waitPeripheralConnectionCallback: [CBPeripheral: (_ peripheral: CBPeripheral, _ error: Error?) -> ()] = [:]
    
    private override init() {
        super.init()
        
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func stopScan() {
        print("Scan for peripheral stoped")
        manager.stopScan()
    }
    
 
    func attachObserverPeripheralsList(_ newObserver: ObserverPeripheralsList) {
        observersPeripheralsList.append(newObserver)
    }
    
    
    internal func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Start scan for peripherals")
            manager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    internal func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if peripheralsList.contains(peripheral) == false {
            peripheralsList.append(peripheral)
        }
    }
    
    func connect(in peripheral: CBPeripheral, callback: @escaping (_ peripheral: CBPeripheral, _ error: Error?) -> ()) {
        print("Trying connect in peripheral...")
        
        waitPeripheralConnectionCallback[peripheral] = callback
        manager.connect(peripheral, options: nil)
    }
    
    internal func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Success to connect in peripheral")
        
        waitPeripheralConnectionCallback[peripheral]!(peripheral, nil)
        waitPeripheralConnectionCallback.removeValue(forKey: peripheral)
    }
    
    internal func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("Failed to connect in peripheral!")
        
        waitPeripheralConnectionCallback[peripheral]!(peripheral, error)
        waitPeripheralConnectionCallback.removeValue(forKey: peripheral)
    }
}

