//
//  MineJN.h
//  StudyHardPlease
//
//  Created by 张德强 on 16/1/28.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MineJN : NSObject

//自我工具初始化
+(instancetype)defaultMineJN;

//lable高度自适应
-(CGFloat)autoLayouHeightForLable:(NSString *)lableText fontSize:(CGFloat)fontSize constrainSize:(CGSize)maxSize;



@end
