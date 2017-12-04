//
//  ViewController.m
//  afn---test
//
//  Created by Apple on 2017/11/30.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    AFHTTPResponseSerializer *responseJson = [AFHTTPResponseSerializer serializer];
    
//    responseJson.readingOptions = NSJSONReadingAllowFragments;
//
//    responseJson.removesKeysWithNullValues = YES;
    
    session.responseSerializer = responseJson;
    
    
    session.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    
    
    [session POST:@"http://mxr.lxyzxm.com/Api/EmployeeDemand/EmployeeDemand_list" parameters:@{@"token":@"bb3663554d9b9ce6e689cbba7271777e",@"uid":@"28"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSString*str = [[NSString alloc] initWithData:(NSData*)responseObject encoding:NSUTF8StringEncoding];
//
//        str =[str stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
//
//        NSData*data = [str dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSError*err;
//
//        NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
         NSLog(@"%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
       
//        NSLog(@"responseObject == %@",responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        NSLog(@"error == %@",error);
        
    }];
    
    
    
    
    
    
}


@end
