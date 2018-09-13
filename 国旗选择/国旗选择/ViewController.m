//
//  ViewController.m
//  国旗选择
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ZPFlag.h"
#import "ZPFlagView.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *flags;

@end

@implementation ViewController

#pragma mark ————— 懒加载 —————
- (NSMutableArray *)flags
{
    if (_flags == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray)
        {
            ZPFlag *flag = [ZPFlag flagWithDict:dict];
            [tempArray addObject:flag];
        }
        
        _flags = tempArray;
    }
    
    return _flags;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置代理
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

#pragma mark ————— UIPickerViewDataSource —————
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flags.count;
}

#pragma mark ————— UIPickerViewDelegate —————
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //加载xib文件
    ZPFlagView *flagView = [[[NSBundle mainBundle] loadNibNamed:@"ZPFlagView" owner:nil options:nil] lastObject];
    flagView.flag = [self.flags objectAtIndex:row];
    
    return flagView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
