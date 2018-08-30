//
//  ViewController.m
//  ADWindow
//
//  Created by lrb on 2018/8/29.
//  Copyright © 2018年 lrb. All rights reserved.
//

#import "ViewController.h"
#import "RBADWindow.h"

NSString *currentURL = @"https://testfmsapp.cedarhd.com/";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /* Upload\\Upload2018\\12628\\69500\\8\\28\\微信图片_201808281817361535480406381.74.jpg */
    self.navigationController.navigationBarHidden = YES;
    
    NSString *imageUrl =  [@"Upload\\Upload2018\\12628\\69500\\8\\28\\微信图片_201808281817361535480406381.74.jpg" stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
    imageUrl = [NSString stringWithFormat:@"%@%@",currentURL,imageUrl];
    imageUrl = [imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *urlStr = @"https://www.baidu.com";
    
    //先调用接口,获取图片地址和跳转页面地址,这里省略获取步骤.
    RBADWindow *ADWindow = [[RBADWindow alloc]init];
    ADWindow.imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.width /2, [UIScreen mainScreen].bounds.size.height /2);
    ADWindow.imageUrl = imageUrl;
    ADWindow.urlStr = urlStr;
    [self.view addSubview:ADWindow];
    ADWindow.frame = self.view.frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
