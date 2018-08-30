//
//  RBADWindow.m
//  ADWindow
//
//  Created by lrb on 2018/8/29.
//  Copyright © 2018年 lrb. All rights reserved.
//

#import "RBADWindow.h"
#import "RBWebViewController.h"
#import "UIImageView+WebCache.h"
#import "UIViewController+Nav.h"

@interface RBADWindow()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *closeBtn;
@end

@implementation RBADWindow


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:11/255.0 green:11/255.0 blue:11/255.0 alpha:0.5];
        [self addSubview:self.imageView];
        [self addSubview:self.closeBtn];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.center = self.center;
    self.imageView.bounds = CGRectMake(0, 0, self.imageSize.width,self.imageSize.height);
    self.closeBtn.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 20, CGRectGetMinY(self.imageView.frame) - 50, 50, 50);
    SDWebImageManager * manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.imageUrl]] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        //显示广告窗
        self.imageView.image = image;
    }];
}

-(void)tapImage {
    UINavigationController *nav = [[UINavigationController alloc]init];
    RBWebViewController *webVC = [[RBWebViewController alloc]init];
    webVC.URLString = self.urlStr;
    [nav addChildViewController:webVC];
    UIViewController* rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
//    [rootVC.myNavigationController pushViewController:webVC animated:YES];
    [rootVC presentViewController:nav animated:YES completion:^{
        [self closeClick];
    }];
    
    
}

-(void)closeClick {
    [self removeFromSuperview];
}

#pragma mark - 懒加载
-(UIButton *)closeBtn {
    if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc]init];
//        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_closeBtn setImage:[UIImage imageNamed:@"cancleBtn"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

-(UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.userInteractionEnabled = YES;
        _imageView.layer.cornerRadius = 10;
        _imageView.layer.masksToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage)];
        [_imageView addGestureRecognizer:tap];
    }
    return _imageView;
}
@end
