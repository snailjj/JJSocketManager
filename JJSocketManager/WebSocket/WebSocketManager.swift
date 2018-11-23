//
//  WebSocketManager.swift
//  Pods
//
//  Created by snailjj on 2018/11/22.
//

import UIKit
import SocketIO

class WebSocketManager: NSObject {
    
    public static var shared : WebSocketManager = WebSocketManager()
    
    private var manager: SocketManager!
    private var socket: SocketIOClient!
    
    public func connect(withUrl: String) {
        let url = URL(string: withUrl)
        if manager == nil {
            manager = SocketManager(socketURL: url!, config: nil)
            socket = manager.defaultSocket
            socket.connect(timeoutAfter: 10) {
                print("连接超时")
            }
            
            socket.on("getData") { (data, sae) in
                print(data)
                if sae.expected {
                    print("应答")
                } else {
                    print("不应答")
                }
            }
            
            
            socket.handleEvent("asd", data: [], isInternalMessage: true, withAck: 2)
            
            
        }
    }
    
}
