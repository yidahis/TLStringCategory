//
//  ViewController.m
//  TLStringCategory
//
//  Created by zhouyi on 2017/4/12.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "ViewController.h"
#import "NSString+TLAdditions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self highLightKeyString];
}


/**
 高亮显示字符串中关键字
 
 */
- (void)highLightKeyString{
    //初始化 label
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(50, 220, 280, 44)];
    label.text = @"神仙衣服->一点衣间->好衣服";
    [label setTextColor:[UIColor blackColor]];
    [self.view addSubview:label];
    
    //高亮显示 “衣” 字
    label.attributedText = [label.text highLightWithKey:@"衣" FontSize:24.0f Color:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
