
//
//  MyOCSocket.m
//  Template
//
//  Created by Apple on 2017/11/22.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "MyOCSocket.h"

#import "GCDAsyncSocket.h"

#import "MJExtension.h"

@interface MyOCSocket()<GCDAsyncSocketDelegate>

@property (nonatomic , strong ) GCDAsyncSocket * tcpSocket;

@property (nonatomic , strong ) id  parameters ;


@end

@implementation MyOCSocket

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure{
    
    //创建scocket
    _tcpSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    if (parameters != nil) {
        
        _parameters = parameters;
    }
    
    NSError*error;
//    http://mxr.lxyzxm.com/Api/
//    Api/HirerDemand/HirerDemand_list
 BOOL isSuc =  [_tcpSocket connectToHost:@"mxr.lxyzxm.com" onPort:80 error:&error];//mxr.lxyzxm.com
    
//  BOOL isSuc =  [_tcpSocket connectToUrl:[NSURL URLWithString:@"http://mxr.lxyzxm.com/Api/user/login"] withTimeout:-1 error:&error];
    
    if (!isSuc || error!=nil) {
        
        NSLog(@"连接主机步骤失败,error=%@",error);
        
    }
    
    
   
    
    

    
    
    
    
}

#pragma mark socketDelegate

//已经连接到主机
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    
    NSLog(@"连接到了服务器");
    
    //写东西给服务器,然后等待服务器的响应
   
    NSDictionary*dict = @{@"name":@"lkb",@"key":@1};
    
    
    NSData*data = [@"name:lkb,key:1,age:14" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *requestStrFrmt = @"POST /Api/user/login  HTTP/1.0\r\n Host: %@\r\nConnection: keep-alive\r\n\r\n%@";
    
    NSString *requestStr = [NSString stringWithFormat:requestStrFrmt, @"mxr.lxyzxm.com",@"username:15216111235,password:15216111235,age:14"];
  
//    NSString*pathstr = @"POST /Api//user/login HTTP/1.1\r\nHost: mxr.lxyzxm.com\r\nCache-Control: no-cache\
//    ----WebKitFormBoundaryE19zNvXGzXaLvS5C\
//    Content-Disposition: form-data; name=\"username\"\
//
//    15216111235
//    ----WebKitFormBoundaryE19zNvXGzXaLvS5C
//    Content-Disposition: form-data; name="password"
//
//    15216111235
//    ----WebKitFormBoundaryE19zNvXGzXaLvS5C
//    ";
NSString*ss = @"POST /Api//user/login HTTP/1.1\r\nHost: mxr.lxyzxm.com\r\nCache-Control: no-cache\r\n\r\n----WebKitFormBoundaryE19zNvXGzXaLvS5C\r\nContent-Disposition: form-data; name=\"username\"\r\n\r\n15216111235\r\n----WebKitFormBoundaryE19zNvXGzXaLvS5C\r\nContent-Disposition: form-data; name=\"password\"\r\n\r\n15216111235\r\n----WebKitFormBoundaryE19zNvXGzXaLvS5C\r\n";
    
    NSString*st1 = @"POST /Api/HirerDemand/HirerDemand_list HTTP/1.1\r\n\
    Host: mxr.lxyzxm.com\r\n\
    Connection: close\r\n\
    Content-Length: 256\r\n\
    Cache-Control: no-cache\r\n\
    Origin: chrome-extension:\/\/fdmmgilgnpjigdojojpjoooidkmcomcm\r\n\
    User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36\r\n\
    Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
    Accept: */*\r\n\
    Accept-Encoding: identity; q=0.5, *;q=0 \r\n\
    Accept-Language: zh-CN,zh;q=0.9,en;q=0.8\r\n\
    Cookie: PHPSESSID=723roo5jdruvhfbs6tpnmbnma3\r\n\
    \r\n\
    ------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
    Content-Disposition: form-data; name=\"username\"\r\n\
    \r\n\
    15216111235\r\n\
    ------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
    Content-Disposition: form-data; name=\"password\"\r\n\
    \r\n\
    15216111235\r\n\
    ------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n";
    
    NSString*st4 = @"POST /Api/EmployeeDemand/EmployeeDemand_list HTTP/1.1\r\n\
    Host: mxr.lxyzxm.com\r\n\
    Connection: close\r\n\
    Content-Length: 256\r\n\
    Cache-Control: no-cache\r\n\
    Origin: chrome-extension:\/\/fdmmgilgnpjigdojojpjoooidkmcomcm\r\n\
    User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36\r\n\
    Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
    Accept: */*\r\n\
    Accept-Encoding: identity; q=0.5, *;q=0 \r\n\
    Accept-Language: zh-CN,zh;q=0.9,en;q=0.8\r\n\
    Cookie: PHPSESSID=723roo5jdruvhfbs6tpnmbnma3\r\n\
    \r\n\
    ------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
    Content-Disposition: form-data; name=\"token\"\r\n\
    \r\n\
    0cbcc5cf3dfc72e86e7819d7aa6ecff4\r\n\
    ------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
    Content-Disposition: form-data; name=\"uid\"\r\n\
    \r\n\
    28\r\n\
    ------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n";
    
    
  //
    
NSString*st = @"POST /Api/HirerDemand/HirerDemand_list HTTP/1.1\r\n\
Host: mxr.lxyzxm.com\r\n\
Connection: close\r\n\
Content-Length: 10000\r\n\
Cache-Control: no-cache\r\n\
Origin: chrome-extension:\/\/fdmmgilgnpjigdojojpjoooidkmcomcm\r\n\
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36\r\n\
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
Accept: */*\r\n\
Accept-Encoding: identity; q=0.5, *;q=0 \r\n\
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8\r\n\
Cookie: PHPSESSID=723roo5jdruvhfbs6tpnmbnma3\r\n\
\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
Content-Disposition: form-data; name=\"claim\"\r\n\
\r\n\
无\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
Content-Disposition: form-data; name=\"end_time\"\r\n\
\r\n\
1543546500\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n\
Content-Disposition: form-data; name=\"lng_lat\"\r\n\
\r\n\
114.0381315104167,22.63413357204861\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n\
Content-Disposition: form-data; name=\"start_time\"\r\n\
\r\n\
1512010500\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n\
Content-Disposition: form-data; name=\"things\"\r\n\
\r\n\
苹果\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s\r\n\
Content-Disposition: form-data; name=\"token\"\r\n\
\r\n\
6a216d2afeddf55bb21d7784c4072f40\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n\
Content-Disposition: form-data; name=\"uid\"\r\n\
\r\n\
7\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n\
Content-Disposition: form-data; name=\"work_place\"\r\n\
\r\n\
北京市\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n\
Content-Disposition: form-data; name=\"work_place_city\"\r\n\
\r\n\
北京市\r\n\
------WebKitFormBoundaryr4oTiFOxH8RiFG2s--\r\n";
    
    
    NSString*str6 = @"POST /Api/HirerDemand/HirerDemand_list HTTP/1.1\r\n\
    Host: mxr.lxyzxm.com\r\n\
    Content-Type: multipart/form-data;\r\n\
    boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW\r\n\
    Cache-Control: no-cache\r\n\
    Postman-Token: 5a2d8110-c1ea-0b7f-2aa2-fc3f72b64a93\r\n\
    \r\n\
    ------WebKitFormBoundary7MA4YWxkTrZu0gW\r\n\
    Content-Disposition: form-data; name=\"token\"\r\n\
    \r\n\
    bb3663554d9b9ce6e689cbba7271777e\r\n\
    ------WebKitFormBoundary7MA4YWxkTrZu0gW\r\n\
    Content-Disposition: form-data; name=\"uid\"\r\n\
    \r\n\
    28\r\n\
    ------WebKitFormBoundary7MA4YWxkTrZu0gW--";
    
    NSLog(@"请求头\r\n%@",str6);
//
//    {
//        claim = Hhhhh;
//        "end_time" = 1543546500;
//        "lng_lat" = "114.0381315104167,22.63413357204861";
//        "start_time" = 1512010500;
//        things = "\U82f9\U679c";
//        token = 6a216d2afeddf55bb21d7784c4072f40;
//        uid = 7;
//        "work_place" = "\U5317\U4eac\U5e02 \U5317\U4eac\U5e02 \U4e1c\U57ce\U533a \U4e1c\U534e\U95e8\U8857\U9053 Hhh";
//        "work_place_city" = "\U5317\U4eac\U5e02";
//    }
//
    NSData *requestData = [str6 dataUsingEncoding:NSASCIIStringEncoding];
//

    
    [sock writeData:requestData withTimeout:-1 tag:1];
    
    
    //等待回复
    //[sock readDataWithTimeout:-1 tag:1];
    
    NSString*stt = @"\r\n\r\n";
    
    //这个是头
    //取出响应头
   // [sock readDataToData:[stt dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:1];
    
    [sock readDataWithTimeout:-1 tag:1];
    
    //去除无用参数
  //  [sock readDataToData: [@"\r\n"  dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:1];
    
    //去除post体
 //   [sock readDataToData: [@"\r\n"  dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:1];
    
    
//    NSData *responseTerminatorData = [@"\r\n\r\n" dataUsingEncoding:NSASCIIStringEncoding];
//
//    [sock readDataToData:responseTerminatorData withTimeout:-1.0 tag:1];
    

    
    
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    
   
    NSString*str = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
    
    NSLog(@"服务器回我了,str=%@,tag=%ld",str,tag);
    
 
    
  //  NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
  //  NSLog(@"dict== \r\n%@",dict);
    
    //NSData*data2 = [@"我收到了" dataUsingEncoding:NSASCIIStringEncoding];
    
//    [sock writeData:data2 withTimeout:-1 tag:1];
    
    //继续等待
   // [sock readDataWithTimeout:-1 tag:1];
    
    
    
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    
    NSLog(@"失去连接%@",err);
    
    
    
    
    
}






@end
