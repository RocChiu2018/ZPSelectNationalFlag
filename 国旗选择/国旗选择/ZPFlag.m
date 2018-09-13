//
//  ZPFlag.m
//  国旗选择
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPFlag.h"

@implementation ZPFlag

+ (instancetype)flagWithDict:(NSDictionary *)dict
{
    /**
     哪个类调用这个方法，self就指谁；
     self在类方法中指类，在实例方法中指本类的一个对象。
     */
    ZPFlag *flag = [[self alloc] init];
    [flag setValuesForKeysWithDictionary:dict];
    
    return flag;
}

@end
