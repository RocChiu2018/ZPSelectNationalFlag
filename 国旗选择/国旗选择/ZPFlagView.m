//
//  ZPFlagView.m
//  国旗选择
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPFlagView.h"
#import "ZPFlag.h"

@interface ZPFlagView()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZPFlagView

- (void)setFlag:(ZPFlag *)flag
{
    _flag = flag;
    
    _label.text = flag.name;
    _imageView.image = [UIImage imageNamed:flag.icon];
}

@end
