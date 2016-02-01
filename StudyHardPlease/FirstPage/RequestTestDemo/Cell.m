//
//  Cell.m
//  StudyHardPlease
//
//  Created by 张德强 on 16/2/1.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "Cell.h"

static CGFloat heightForCell ;
static CGFloat widthForCell ;

@implementation Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, maiSrc.width, 44)];
        
        [self addSubview:_lable];
        
        _imgv = [[UIImageView alloc]init];
        
        [self addSubview:_imgv];
        
    }
    return self;
}

-(void)setHeightForLable:(NSString *)str fontForLable:(CGFloat)font CGSize:(CGSize)constraintSize{

    //文字高度计算方法
    CGFloat height = [[MineJN defaultMineJN] autoLayouHeightForLable:str fontSize:font constrainSize:CGSizeMake(maiSrc.width - widthForCell, CGFLOAT_MAX)];
    
    heightForCell = heightForCell > height ? heightForCell : height;
    
    self.lable.text = str;
    
    self.lable.numberOfLines = 0;
    
     self.lable.frame = CGRectMake(self.lable.frame.origin.x, self.lable.frame.origin.y, maiSrc.width - widthForCell, heightForCell);
    
    //获取自身高度   然后将计算出来的高度赋值给他
    CGRect frame = [self frame];
    
    frame.size.height = heightForCell;
    
    self.frame = frame;
}

-(void)setframeForImageView:(UIImage *)image{
    
    NSString *sizeStr = NSStringFromCGSize(image.size);
    
    CGSize size = CGSizeFromString(sizeStr);
    
    widthForCell = size.width;
    
    heightForCell = heightForCell > size.height ? heightForCell : size.height;
    
    _imgv.image = image;
    
    _imgv.frame = CGRectMake(maiSrc.width - size.width, 0, size.width, heightForCell);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
