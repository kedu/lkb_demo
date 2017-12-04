//
//  Entity+CoreDataProperties.h
//  dd
//
//  Created by Apple on 2017/11/21.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//
//

#import "Entity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest;

@property (nonatomic) int32_t attribute;
@property (nullable, nonatomic, copy) NSString *attribute1;

@end

NS_ASSUME_NONNULL_END
