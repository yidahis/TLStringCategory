//
//  TLAdditions.h
//  TLStringCategory
//
//  Created by zhouyi on 2017/4/12.
//  Copyright © 2017年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(TLAdditions)

/**
 搜索字符串中关键字出现的所有的位置
 
 @param string 关键字
 @param arrayM 保存结果的数组
 */
- (void)rangesOfString:(NSString*)string Array:(NSMutableArray *)arrayM;

/**
 高亮显示关键字

 @param key 目标关键字
 @param fontSize 字体大小
 @param color 颜色
 @return AttributedString
 */
- (NSMutableAttributedString *)highLightWithKey:(NSString *)key FontSize:(CGFloat)fontSize Color:(UIColor *)color ;
@end
