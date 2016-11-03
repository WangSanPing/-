//
//  ViewController.m
//  九宫格
//
//  Created by 王旭 on 2016/11/3.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *addView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.backgroundColor = [UIColor whiteColor];
    btn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 100, 100, 100);
    [btn addTarget:self action:@selector(addLabel) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:btn];
}

- (void) addLabel{
    
    // 列数
    NSInteger clos = 2;
    // 宽
    NSInteger width = 80;
    // 高
    NSInteger height = 70;
    for (NSInteger i = 0; i < 12; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100) / 100.0 green:arc4random_uniform(100) / 100.0 blue:arc4random_uniform(100) / 100.0 alpha:1];
        
        // 索引
        NSInteger index = self.addView.subviews.count;
        // 在哪列
        NSInteger clo = index % clos;
        // 在哪行
        NSInteger row = index / clos;
        // 间距
        CGFloat marginX = (self.addView.frame.size.width - clos * width) / (clos - 1);
        
        view.frame = CGRectMake(clo * (width + marginX), row * (height + 40), width, height);
        
        [self.addView addSubview:view];
    }
}

@end
