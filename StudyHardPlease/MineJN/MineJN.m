//
//  MineJN.m
//  StudyHardPlease
//
//  Created by 张德强 on 16/1/28.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "MineJN.h"

@implementation MineJN

//单例方法  创建自己的工具类
+(instancetype)defaultMineJN{
    
    static MineJN * mine = nil;
    
    @synchronized(self) {
        
        if (!mine) {
            
            mine = [MineJN new];
        }
    }
    return mine;
}

-(CGFloat)autoLayouHeightForLable:(NSString *)lableText fontSize:(CGFloat)fontSize constrainSize:(CGSize)maxSize{
    
    CGSize constraintSize;
    
    //对比最大约束maxSize与CGSizeZero是否相等,如果是的话给他赋一个初值。以无限高为最大高度，以屏幕宽-30为宽度。如果不相等可以直接沿用
    if (CGSizeEqualToSize(maxSize, CGSizeZero)) {
        
        constraintSize = CGSizeMake(maiSrc.width, CGFLOAT_MAX);
    }else{
        constraintSize = maxSize;
    }
    
    
    //计算方式   记得一般情况要有Origin
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin;
    /*
     *字符串计算方式，NSStringDrawingUsesLineFragmentOrigin是以每行组成的矩形为单位计算整个文本的尺寸
     *UsesFontLeading则以字体间的行距（leading，行距：从一行文字的底部到另一行文字底部的间距。）来计算。
     *如果为NSStringDrawingTruncatesLastVisibleLine那么计算文本尺寸时将以每个字或字形为单位来计算。
     *如果为NSStringDrawingUsesDeviceMetric，那么计算文本尺寸时将以每个字或字形为单位来计算。
     */
    
    //设置字符串字体号,字体颜色
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:@[[UIFont systemFontOfSize:fontSize],[UIColor blueColor]] forKeys:@[NSFontAttributeName,NSForegroundColorAttributeName]];
    
    //iOS7以后用这个方法来计算lable自定义高度
    CGRect stringRect = [lableText boundingRectWithSize:constraintSize options:options attributes:dic context:nil];
    
    return stringRect.size.height;
}

@end
