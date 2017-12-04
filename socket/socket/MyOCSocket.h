//
//  MyOCSocket.h
//  Template
//
//  Created by Apple on 2017/11/22.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id responseObject);
typedef void(^failureBlock)(NSError * error);

//(void (^)(id responseObject))

@interface MyOCSocket : NSObject

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure;





@end
