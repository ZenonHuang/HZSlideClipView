//
//  HZSlideClipView.h
//  HZSlideClipView
//
//  Created by zz go on 2017/5/8.
//  Copyright © 2017年 zzgo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZSlideClipView : UIView

- (instancetype)initWithFrame:(CGRect)frame 
                andTitleArray:(NSArray *)titleArr
              backgroundColor:(UIColor *)bgColor 
                   titleColor:(UIColor *)textColor
          maskBackgroundColor:(UIColor *)maskBgColor
                  maskTitleColor:(UIColor *)maskTextColor;

@end
