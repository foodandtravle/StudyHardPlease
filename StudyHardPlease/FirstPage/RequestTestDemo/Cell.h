//
//  Cell.h
//  StudyHardPlease
//
//  Created by 张德强 on 16/2/1.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineJN.h"
@interface Cell : UITableViewCell


@property(nonatomic,strong)UILabel *lable;

@property(nonatomic,strong)UIImageView *imgv;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)setHeightForLable:(NSString *)str fontForLable:(CGFloat)font CGSize:(CGSize)constraintSize;

-(void)setframeForImageView:(UIImage *)image;


@end
