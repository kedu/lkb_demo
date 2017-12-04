//
//  ViewController.m
//  socket
//
//  Created by Apple on 2017/11/22.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"
#import "MyOCSocket.h"

#import "MJExtension.h"

#import <GPUImage.h>

@interface ViewController ()

@property (nonatomic , strong ) MyOCSocket *my ;

@property (nonatomic , strong ) UIImageView * img1 ;

@property (nonatomic , strong ) UIImageView * img2 ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _img1 = [UIImageView new];
    _img1.image = [UIImage imageNamed:@"name"];
    
    _img1.frame = CGRectMake(0, 0, 100, 100);
    
    _img2 = [UIImageView new];
    
    _img2.frame = CGRectMake(0, 110, 100, 100);
    
    [self.view addSubview:_img1];
    
    [self.view addSubview:_img2];
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"被触摸了");
    
//    [self GPUIImage];
//    
//    return;
    //
    MyOCSocket *my = [MyOCSocket new];
    
    _my = my;
    
    [my GET:@"" parameters:@"" success:^(id responseObject) {
        
        
        
        
    } failure:^(NSError *error) {
        
        
        
    }];
    
    
    
    
}

- (void)GPUIImage{
    
    
//    初始化 图片
//    GPUImagePicture *staticPicture = [[GPUImagePicture alloc]initWithImage:chooseImage smoothlyScaleOutput:YES];
    
//    UIImage*img = [UIImage imageNamed:@"name"];
//
//    GPUImagePicture*staticPicture = [[GPUImagePicture alloc]initWithImage:img smoothlyScaleOutput:YES];
    
//    简单实用(补光)
    
    UIImage *image = [UIImage imageNamed:@"name"];
    
    //创建一个亮度的滤镜
    
    GPUImageBrightnessFilter *passthroughFilter = [[GPUImageBrightnessFilter alloc] init];
    
    passthroughFilter.brightness = 0.5f;
    
    //设置要渲染的区域
    
    [passthroughFilter forceProcessingAtSize:image.size];
    
    [passthroughFilter useNextFrameForImageCapture];//保存
    
    //获取数据源
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image];
    
    //添加上滤镜
    
    [stillImageSource addTarget:passthroughFilter];
    
    //开始渲染
    
    [stillImageSource processImage];
    
    //获取渲染后的图片
    
    UIImage *nearestNeighborImage = [passthroughFilter imageFromCurrentFramebuffer];
    
    _img2.image = nearestNeighborImage; //获取处理过的图片
 
    
    
    
 
    
    
    
    
    
}


@end
