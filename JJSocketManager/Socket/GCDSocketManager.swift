//
//  GCDSocketManager.swift
//  CocoaAsyncSocket
//
//  Created by snailjj on 2018/11/21.
//

import UIKit
import CocoaAsyncSocket

enum SocketOffLine: Int {
    case byServer = 1
    case byUser = 2
}

public class GCDSocketManager: NSObject {
    
    public static let shared = GCDSocketManager()           //单例
    
    private var loginInfo: [String : String]?               //登录信息
    private var socketClient: GCDAsyncSocket!               //连接对象
    private var timeout: TimeInterval = 30                  //超时
    private var sendMessageTimeout: TimeInterval = 20       //发送数据超时
    private var readMessageTimeout: TimeInterval = 310      //读取数据超时
    private var heartTimer: Timer?                          //发送心跳包的定时器
    private var orderArray = [AnyObject]()                  //信息队列
    private var socketQueue = DispatchQueue.global()        //消息队列
    private var heartPeriod: TimeInterval = 5               //心跳包的间隔
    
    public var isConnected: Bool = false                    //是否连接
    
    override init() {
        super.init()
    }
    
}

extension GCDSocketManager {
    /**
     连接服务器
     */
    func connectWith(loginDict: [String: String], host: String, port: String) {
        if socketClient != nil {
            socketClient = nil
        }
        socketClient = GCDAsyncSocket(delegate: self, delegateQueue: socketQueue)
        loginInfo = loginDict
        do {
            try socketClient.connect(toHost: host, onPort: UInt16(port)!, withTimeout: timeout)
        } catch {
            print("connect error:\(error.localizedDescription)")
        }
    }
}

extension GCDSocketManager: GCDAsyncSocketDelegate {
    
    public func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        sock.userData = SocketOffLine.byServer.rawValue
        if heartTimer != nil {
            heartTimer?.invalidate()
            heartTimer = nil
        }
        socketClient.readData(withTimeout: readMessageTimeout, tag: 0)
        RunLoop.current.run()
    }
    
    public func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        if let ss = sock.userData as? Int {
            if ss == SocketOffLine.byUser.rawValue {
                return
            }
        }
        connectWith(loginDict: loginInfo!, host: "", port: "")
    }

    public func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        print("发送消息成功")
    }
    
    public func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
//        let str = String.init(data: data, encoding: .utf8)
        sock.readData(withTimeout: readMessageTimeout, tag: 0)
    }
    
}
