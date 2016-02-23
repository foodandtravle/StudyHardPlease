//
//  dispath_asyncDemo.m
//  StudyHardPlease
//
//  Created by 张德强 on 16/2/23.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "dispath_asyncDemo.h"


@interface dispath_asyncDemo ()

@end

@implementation dispath_asyncDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //do something
    });
    
    //主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        //do something
    });
    
    //一次执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //do something
    });
    
    //延迟两秒
    double a = 2.0 ;
    dispatch_time_t popTome = dispatch_time(DISPATCH_TIME_NOW, a * NSEC_PER_SEC);
    dispatch_after(popTome, dispatch_get_main_queue(), ^{
        //do something
    });
    
   
    
  
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
