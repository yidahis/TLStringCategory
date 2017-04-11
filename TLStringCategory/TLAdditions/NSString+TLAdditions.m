//
//  TLAdditions.m
//  TLStringCategory
//
//  Created by zhouyi on 2017/4/12.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "NSString+TLAdditions.h"

@implementation NSString(TLAdditions)

- (void)rangesOfString:(NSString *)string Array:(NSMutableArray *)arrayM{
    if (!arrayM) {
        arrayM = [[NSMutableArray alloc]initWithCapacity:4];
    }
    //获取关键字出现的第一个位置
    NSRange range = [self rangeOfString:string];
    //没有找到关键字，直接返回数组
    if (range.length < 1) {
        return ;
    }
    //下面要递归调用，会截取字符串，递归后拿到的 location 是子串中的，所以这里要加上父串的长度才是正确的
    NSInteger index = range.location;//单独赋值给临时变量 index 避免影响截取子串
    if (arrayM.count > 0) {
        index += [arrayM.lastObject integerValue];
        index ++;
    }
    [arrayM addObject:@(index)];
    
    //递归调用
    [[self substringFromIndex:range.location+1] rangesOfString:string Array:arrayM];
}

- (NSMutableAttributedString *)highLightWithKey:(NSString *)key FontSize:(CGFloat)fontSize Color:(UIColor *)color {
   NSAssert(key.length < 2, @"目前只支持长度为1的 key");
    //初始化NSMutableAttributedString
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    [self rangesOfString:key Array:indexArray];
    
    //遍历 range 数组，并添加属性文字
    for (NSInteger i = 0; i < indexArray.count; i ++ ) {
        NSRange range = NSMakeRange([indexArray[i] integerValue], 1);
        //设置字号
        [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
        //设置文字颜色
        [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attString;
}

@end
