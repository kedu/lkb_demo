//
//  AppDelegate.h
//  新应用
//
//  Created by Apple on 2017/11/17.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

