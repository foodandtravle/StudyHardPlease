//
//  RequestTestTableViewController.m
//  StudyHardPlease
//
//  Created by 张德强 on 16/1/29.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "RequestTestTableViewController.h"

static NSString *str = @"identifier";

@interface RequestTestTableViewController ()

@end

@implementation RequestTestTableViewController

-(void)viewWillAppear:(BOOL)animated{
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"30" forKey:@"p"];
    
    if (!_dataArr) {
        
        _dataArr = [NSMutableArray new];
    }
    
    [[RequestTestDemo sharedRequest] postInformationSuccess:^(funny *fun) {
        
        _dataArr = fun.arr;
        
        [self.tableView reloadData];
        
    } failure:^(NSString *errorMessage) {
        
        NSLog(@"failure === %@",errorMessage);
        
    } parameters:dic];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
        
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArr.count;
}

/*
 *dequeueReusableCellWithIdentifier:forIndexPath:方法
 *dequeueReusableCellWithIdentifier:方法
 *
 *对比上面两者的区别。第一个方法需要有配套的注册方法去写，就是在ViewDidLoad里面register一个class或者nib方法，作用是给每一个cell注册
 *身份,这样注册完了在cellForRowAtIndexPath方法里面就直接设置cell属性就可以了，不需要再做重用处理。
 *
 *第二个方法是建立在ViewDidLoad方法没有做注册的基础上，需要在cellForRowAtIndexPath方法里做重用处理
 *
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    //获取数据源
    Info *io = _dataArr[indexPath.row];
    
    if (!cell) {
    
        cell = [[Cell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:str];

    }
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:io.pic]]];
    
    [cell setframeForImageView:img];
    
    [cell setHeightForLable:io.intro fontForLable:18 CGSize:CGSizeMake(maiSrc.width, CGFLOAT_MAX)];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
