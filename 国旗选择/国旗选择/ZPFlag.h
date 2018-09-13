//
//  ZPFlag.h
//  国旗选择
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPFlag : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)flagWithDict:(NSDictionary *)dict;

@end
