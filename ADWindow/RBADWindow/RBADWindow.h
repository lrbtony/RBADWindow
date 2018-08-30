//
//  RBADWindow.h
//  ADWindow
//
//  Created by lrb on 2018/8/29.
//  Copyright © 2018年 lrb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBADWindow : UIView

//-(void)initWithFrame:(CGRect)imageFrame andAddress:(NSString *)urlStr;
@property (assign, nonatomic) CGSize imageSize;
@property (copy, nonatomic) NSString *urlStr;
@property (copy, nonatomic) NSString *imageUrl;

@end
