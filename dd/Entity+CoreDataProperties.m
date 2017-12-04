//
//  Entity+CoreDataProperties.m
//  dd
//
//  Created by Apple on 2017/11/21.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//
//

#import "Entity+CoreDataProperties.h"

@implementation Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
}

@dynamic attribute;
@dynamic attribute1;

@end
