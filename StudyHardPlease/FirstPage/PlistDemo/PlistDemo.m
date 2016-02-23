//
//  PlistDemo.m
//  StudyHardPlease
//
//  Created by 张德强 on 16/2/23.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "PlistDemo.h"

@interface PlistDemo ()

@end

@implementation PlistDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //沙盒中创建的plist文件   可以读取 写入
    NSArray * pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * path = pathArr[0];
    
    NSString * filePath = [path stringByAppendingPathComponent:@"test.plist"];
    
    //项目中手动创建的plist文件只可以读取不可以写入
//    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"plist"];
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"test",@"1",@"test2",@"2", nil];
    
    [dic writeToFile:filePath atomically:YES];
    
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
    
    NSFileManager * manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]) {
        
        NSError * error = nil ;
        
        [manager removeItemAtPath:filePath error:&error];
    }
    
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
