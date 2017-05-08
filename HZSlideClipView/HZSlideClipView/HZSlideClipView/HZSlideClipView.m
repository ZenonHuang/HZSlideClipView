//
//  HZSlideClipView.m
//  HZSlideClipView
//
//  Created by zz go on 2017/5/8.
//  Copyright © 2017年 zzgo. All rights reserved.
//

#import "HZSlideClipView.h"

@interface HZSlideClipView ()
@property (nonatomic,readwrite,strong) NSArray *dataList;
@property (nonatomic,readwrite,assign) CGFloat subWidth;
@property (nonatomic,readwrite,strong) UIView *showView;
@property (nonatomic,readwrite,strong) UIView *clipView;
@end


@implementation HZSlideClipView

- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (!self||
        !(titleArr.count>0)) {
        return nil;
    }
    
    self.backgroundColor = [UIColor orangeColor];
    self.subWidth = self.frame.size.width / titleArr.count;
    self.dataList=[titleArr copy];
    
//   添加label
    for (int i = 0;i < titleArr.count ; i++)
    {
        UILabel *label=[self createLabel:titleArr[i]
                                andFrame:CGRectMake(i*self.subWidth, 0, self.subWidth, self.frame.size.height)
                                andColor:[UIColor redColor]];
        [self addSubview:label];
    }
    
    //添加滑块
    [self addSubview:self.clipView];
    
    //添加拖动手势
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self 
                                                                          action:@selector(panView:)];
    [self.clipView addGestureRecognizer:pan];
    return self;
}

#pragma mark - action
-(void)panView:(UIPanGestureRecognizer *)sender
{
    CGPoint pt = [sender translationInView:self];
    
    CGPoint clipCenter = self.clipView.center;
    CGPoint showCenter = self.showView.center;
    
    clipCenter.x += pt.x;
    showCenter.x -= pt.x; //退行
    
    self.clipView.center = clipCenter;
    self.showView.center = showCenter;
    
    [sender setTranslation:CGPointZero inView:self];
}

#pragma mark - private
- (UILabel *)createLabel:(NSString *)title andFrame:(CGRect)rect andColor:(UIColor *)color
{
    UILabel * label = [[UILabel alloc]initWithFrame:rect];
    label.font = [UIFont boldSystemFontOfSize:20];
    label.textColor = color;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
#pragma mark - getter
-(UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //showview添加label
        for (int i = 0; i < self.dataList.count ; i++)
        {
            UILabel *label=[self createLabel:self.dataList[i] 
                                    andFrame:CGRectMake(i*self.subWidth, 0, self.subWidth, self.frame.size.height) 
                                    andColor:[UIColor blackColor]];
            
            [self.showView addSubview:label];
        }
        
        
    }
    return _showView;
}

-(UIView *)clipView{
    if (!_clipView) {
        _clipView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.subWidth, self.frame.size.height)];
        _clipView.backgroundColor = [UIColor greenColor];
        _clipView.userInteractionEnabled = YES;
        //设置不显示超出的部分
        _clipView.clipsToBounds = YES;
        [_clipView addSubview:self.showView];
    }
    return _clipView;
}
@end
