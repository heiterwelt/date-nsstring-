//
//  ViewController.m
//  picker
//
//  Created by Linyou-IOS-1 on 16/4/26.
//  Copyright © 2016年 MuYou INTERACTIVE TECHNOLOGY LIMITED. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UILabel *lb;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDatePicker *datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 100)];
    [self.view addSubview:datePicker];
    datePicker.datePickerMode = UIDatePickerModeTime;
    
    datePicker.maximumDate=[NSDate date];
    datePicker.minimumDate=[NSDate distantPast];
    
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    self.lb=[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 100, 30)];
    [self.view addSubview:self.lb];
    self.lb.text=datePicker.date;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* _date = control.date;
    /*添加你自己响应代码*/
}

+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

- (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    
    
    
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    
    
    
    
    
    return destDate;
    
}


- (NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    
    
    
    return destDateString;
    
}

- (NSMutableArray *)arrayFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    
    NSArray *   arr0 = [[destDateString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]componentsSeparatedByString:@"-"];
    
    //    NSString *year=arr[0];
    //    NSString*month=arr[1];
    //    NSString *day=arr[2];
    
    NSMutableArray *arr=[NSMutableArray arrayWithArray:arr0];
    
    
    
    return arr;
    
}

-(NSString *)getAgeFromDate:(NSDate *)date
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    NSString *datenow=[dateFormatter stringFromDate:[NSDate date]];
    
    NSArray *   arr0 = [[destDateString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]componentsSeparatedByString:@"-"];
    
    NSArray *arrnow=[[datenow stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]componentsSeparatedByString:@"-"];
    
    NSString *year=arr0[0];
    NSString *yearnow=arrnow[0];
    
    float yearfloat=[year floatValue];
    float  yearnowfloat=[yearnow floatValue];
    
    NSString *month=arr0[1];
    NSString *monthnow=arrnow[1];
    
    float monthfloat=[month floatValue];
    float monthnowfloat=[monthnow floatValue];
    
    NSString *day=arr0[2];
    NSString *daynow=arrnow[2];
    
    float dayfloat=[day floatValue];
    float daynowfloat=[datenow floatValue];
    
    
    float birth= yearfloat + monthfloat/12 + dayfloat/365;
    float now = yearnowfloat + monthnowfloat/12 + daynowfloat/365;
    
    float  baseage= yearnowfloat -yearfloat;
    if (baseage>=1&&(monthnowfloat-monthfloat)) {
        return [NSString stringWithFormat:@"%f",baseage];
    }
    
    
    NSString *age;
    return age;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
