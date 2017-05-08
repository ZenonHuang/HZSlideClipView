//
//  ViewController.m
//  HZSlideClipView
//
//  Created by zz go on 2017/5/8.
//  Copyright © 2017年 zzgo. All rights reserved.
//

#import "ViewController.h"
#import "HZSlideClipView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HZSlideClipView *customView=[[HZSlideClipView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 40) 
                                                         andTitleArray:@[@"12",@"oo",@"hi",@"12"]];
    [self.view addSubview:customView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
