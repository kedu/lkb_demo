//
//  ViewController.m
//  cocoadata
//
//  Created by Apple on 2017/11/21.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"

#import <CoreData/CoreData.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    创建MOC
//
//    下面是根据Company模型文件，创建了一个主队列并发类型的MOC。
//
//    // 创建上下文对象，并发队列设置为主队列
//    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//
//    // 创建托管对象模型，并使用Company.momd路径当做初始化参数
//    NSURL *modelPath = [[NSBundle mainBundle] URLForResource:@"Company" withExtension:@"momd"];
//    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelPath];
//
//    // 创建持久化存储调度器
//    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
//
//    // 创建并关联SQLite数据库文件，如果已经存在则不会重复创建
//    NSString *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
//    dataPath = [dataPath stringByAppendingFormat:@"/%@.sqlite", @"Company"];
//    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:dataPath] options:nil error:nil];
//
//    // 上下文对象设置属性为持久化存储器
//    context.persistentStoreCoordinator = coordinator;
    
    NSManagedObjectContext*context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];//NSPrivateQueueConcurrencyType 私有并发队列
    
    
    NSURL*modelUrl = [[NSBundle mainBundle] URLForResource:@"SQL" withExtension:@"momd"];
    NSManagedObjectModel*model = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    
    NSPersistentStoreCoordinator*coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    
    
    // 创建并关联SQLite数据库文件，如果已经存在则不会重复创建
    //    NSString *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    //    dataPath = [dataPath stringByAppendingFormat:@"/%@.sqlite", @"Company"];
    //    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:dataPath] options:nil error:nil];
    
    NSString*path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    path = [path stringByAppendingString:@"/SQL.sqlite"];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL URLWithString:path] options:nil error:nil];
    
    
    context.persistentStoreCoordinator = coordinator;
    
    
    //创建moc完成.
    
    
    
    
    
    
    
    
    
    
    

//    // 创建托管对象，并指明创建的托管对象所属实体名
//    Employee *emp = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
//    emp.name = @"lxz";
//    emp.height = @1.7;
//    emp.brithday = [NSDate date];
//
//    // 通过上下文保存对象，并在保存前判断是否有更改
//    NSError *error = nil;
//    if (context.hasChanges) {
//        [context save:&error];
//    }
//
//    // 错误处理
//    if (error) {
//        NSLog(@"CoreData Insert Data Error : %@", error);
//    }
    
//    删除操作
//
//    // 建立获取数据的请求对象，指明对Employee实体进行删除操作
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
//
//    // 创建谓词对象，过滤出符合要求的对象，也就是要删除的对象
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", @"lxz"];
//    request.predicate = predicate;
//
//    // 执行获取操作，找到要删除的对象
//    NSError *error = nil;
//    NSArray<Employee *> *employees = [context executeFetchRequest:request error:&error];
//
//    // 遍历符合删除要求的对象数组，执行删除操作
//    [employees enumerateObjectsUsingBlock:^(Employee * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [context deleteObject:obj];
//    }];
//
//    // 保存上下文
//    if (context.hasChanges) {
//        [context save:nil];
//    }
//
//    // 错误处理
//    if (error) {
//        NSLog(@"CoreData Delete Data Error : %@", error);
//    }
  
//    // 建立获取数据的请求对象，并指明操作的实体为Employee
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
//
//    // 创建谓词对象，设置过滤条件
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", @"lxz"];
//    request.predicate = predicate;
//
//    // 执行获取请求，获取到符合要求的托管对象
//    NSError *error = nil;
//    NSArray<Employee *> *employees = [context executeFetchRequest:request error:&error];
//    [employees enumerateObjectsUsingBlock:^(Employee * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.height = @3.f;
//    }];
//
//    // 将上面的修改进行存储
//    if (context.hasChanges) {
//        [context save:nil];
//    }
//
//    // 错误处理
//    if (error) {
//        NSLog(@"CoreData Update Data Error : %@", error);
//    }

//    // 建立获取数据的请求对象，指明操作的实体为Employee
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
//
//    // 执行获取操作，获取所有Employee托管对象
//    NSError *error = nil;
//    NSArray<Employee *> *employees = [context executeFetchRequest:request error:&error];
//    [employees enumerateObjectsUsingBlock:^(Employee * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"Employee Name : %@, Height : %@, Brithday : %@", obj.name, obj.height, obj.brithday);
//    }];
//
//    // 错误处理
//    if (error) {
//        NSLog(@"CoreData Ergodic Data Error : %@", error);
//    }
    

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}






@end
