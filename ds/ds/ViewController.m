//
//  ViewController.m
//  ds
//
//  Created by Apple on 2017/11/10.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *ma;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%@",_ma);
    
    _ma.placeholder = @"dasdasdasda";
    
    
    UISearchBar*sea = [UISearchBar new];
    
    sea.placeholder = @"大手大脚";
    
    [self.view addSubview:sea];
    
    sea.frame = CGRectMake(100, 100, 100, 100);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
