//
//  ViewController.m
//  GCDSocket
//
//  Created by Apple on 2017/11/18.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"

#import <CocoaAsyncSocket/GCDAsyncSocket.h>

#import <CocoaAsyncSocket/GCDAsyncUdpSocket.h>

// When using iOS 8+ frameworks
//@import CocoaAsyncSocket;
//这个socket用来做发送使用 当然也可以接收
GCDAsyncUdpSocket *sendUdpSocket;

@interface ViewController ()<GCDAsyncUdpSocketDelegate>

@property (nonatomic , strong )  GCDAsyncUdpSocket  *socket ;

@property (nonatomic , strong )  GCDAsyncUdpSocket  *socke2 ;

@property (nonatomic , strong )  GCDAsyncUdpSocket  *sendUdpSocket ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //创建tcp
//
////    GCDAsyncSocket  *socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];//在主队列
//    GCDAsyncUdpSocket *socket = [[GCDAsyncUdpSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
//
//    _socket = socket;
//
//    NSError * error = nil;
//
////    [socket acceptOnPort:[self.portTextField.text integerValue] error:&error];/
////  BOOL success =  [socket acceptOnPort:10223 error:&error];//监听端口
////    [socket acceptOnUrl:[NSURL URLWithString:@""] error:&error];//监听网址的主机地址.
//
////  BOOL success = [socket connectToHost:@"0.0.0.0" onPort:10241 withTimeout:-1 error:&error];
//
//
//
////    NSLog(@"success = %d",success);
//
//    if (error != nil) {
//
//        NSLog(@"error== %@",error);
//
//    }
 
    
  
    
    //1.创建一个 udp socket用来和服务器端进行通讯
//    sendUdpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    
    sendUdpSocket = [[GCDAsyncUdpSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    //2.banding一个端口(可选),如果不绑定端口, 那么就会随机产生一个随机的电脑唯一的端口
    
    _sendUdpSocket = sendUdpSocket;
    
    //端口数字范围(1024,2^16-1)
    NSError * error = nil;
    [sendUdpSocket bindToPort:10245 error:&error];
    //启用广播
    [sendUdpSocket enableBroadcast:YES error:&error];
    
    [self startScan];
    
    if (error) {//监听错误打印错误信息
        NSLog(@"error:%@",error);
    }else {//监听成功则开始接收信息
        [sendUdpSocket beginReceiving:&error];
    }
    
    
}

//* Called when a socket connects and is ready for reading and writing.
//* The host parameter will be an IP address, not a DNS name.
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    
    
    NSLog(@"连接了主机 host = %@,%d",host,port);
    NSString*str= @"我来了";
    
    for (int i =0 ; i<2; i++) {
        
        [sock writeData:[str dataUsingEncoding:NSUTF8StringEncoding]  withTimeout:-1 tag:0];//发送数据
    }
    
//    [sock readDataToData:[GCDAsyncSocket CRLFData] withTimeout:10 maxLength:0 tag:0];

    [sock readDataWithTimeout:-1 tag:0];//取数据
    
    
}
//等待连接
- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
    //这里需要对Socket的工作原理进行一点解释，当Socket accept一个连接服务请求时，将生成一个新的Socket，即此处的newSocket。在此可查看newSocket.connectedHost和newSocket.connectedPort等参数，并通过新的socket向客户端发送一包数据后会关闭你一开始创建的socket(self.serverSocket),接下来你都将使用newSocket(我将此保存为self.clientSocket)
//    self.clientSocket = newSocket;
    
    
    //注意此处使用的是上面的newSocket
//    [self.clientSocket writeData:[self.sendTextView.text dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
//    //我创建了一个Socket单例，这里只讨论Socket,单例创建可看Demo
//    SocketManager * socketManager = [SocketManager sharedSocketManager];
//    [socketManager.mySocket readDataWithTimeout:-1 tag:0];
    NSString*str= @"我来了";
    
    _socke2 = newSocket;
    
    [newSocket writeData:[str dataUsingEncoding:NSUTF8StringEncoding]  withTimeout:-1 tag:100];//发送数据
    
    NSLog(@"开启端口成功");
    
    [newSocket readDataWithTimeout:-1 tag:0];//获取返回的数据
    

    
}
//连接失败
///Called when a socket disconnects with or without error.
//If you call the disconnect method, and the socket wasn't already disconnected, then an invocation of this delegate method will be enqueued on the delegateQueue before the disconnect method returns.
//Note: If the GCDAsyncSocket instance is deallocated while it is still connected, and the delegate is not also deallocated, then this method will be invoked, but the sock parameter will be nil. (It must necessarily be nil since it is no longer available.) This is a generally rare, but is possible if one writes code like this:
//asyncSocket = nil; // I'm implicitly disconnecting the socket
//In this case it may preferrable to nil the delegate beforehand, like this:
//asyncSocket.delegate = nil; // Don't invoke my delegate method asyncSocket = nil; // I'm implicitly disconnecting the socket
//Of course, this depends on how your state machine is configured.
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err;
{
    NSLog(@"连接失败,要怎么做,你自己看着办吧, err == %@",err);
}
//Called when a socket has completed writing the requested data. Not called if there is an error.
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
  
    
    NSLog(@"可通过参数中的tag值管理发送的数据，想怎么管理，您看着办tag = %ld",tag);
    
    
    
}
// Called when a socket has completed reading the requested data into memory.
//* Not called if there is an error.
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    
   NSLog(@"接收到消息%@,要怎么处理，您看着办",data);
    
    
    
     [sock readDataWithTimeout:-1 tag:0];//获取返回的数据
    
    
}


//5.发送消息
-(void)startScan{
    
    NSString *s = @"mapleTest";
    NSData *data = [s dataUsingEncoding:NSUTF8StringEncoding];
    NSString *host = @"255.255.255.255";//此处如果写成固定的IP就是对特定的server监测；我这种写法是为了多方监测
    uint16_t port = 36877;//通过端口监测
    
    [sendUdpSocket sendData:data toHost:host port:port withTimeout:-1 tag:100];
    
    
    
}
//6.相关的代理
#pragma mark -GCDAsyncUdpSocketDelegate
-(void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag{
//    if (tag == 100) {
    
        NSLog(@"表示标记为tag的数据发送完成了");
//    }

}

-(void)udpSocket:(GCDAsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error{
    NSLog(@"标记为tag %ld的发送失败 失败原因 %@",tag, error);
}

-(void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext{
    
    NSString *ip = [GCDAsyncUdpSocket hostFromAddress:address];
    uint16_t port = [GCDAsyncUdpSocket portFromAddress:address];
    NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // 继续来等待接收下一次消息
    NSLog(@"收到服务端的响应 [%@:%d] %@", ip, port, s);
    [sock receiveOnce:nil];
    //此处根据实际和硬件商定的需求决定是否主动回一条消息
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self sendBackToHost:ip port:port withMessage:s];
    });
}

- (void)udpSocketDidClose:(GCDAsyncUdpSocket *)sock withError:(NSError *)error
{
    NSLog(@"udpSocket关闭");
}

-(void)sendBackToHost:(NSString *)ip port:(uint16_t)port withMessage:(NSString *)s{
    
    NSString *msg = @"我收到了";
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
    
    [sendUdpSocket sendData:data toHost:ip port:port withTimeout:0.1 tag:200];
    
    NSLog(@"我收到了");
    
}




@end
