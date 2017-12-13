//
//  XWTagView.h
//  XWTagView
//
//  Created by LeonJing on 13/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import <YYText/YYText.h>
#import "XWTagMaker.h"
#import "NSMutableAttributedString+XWTagView.h"
@interface XWTagView : YYLabel
/**
 *NSMutableAttributedString
 */
@property (nonatomic,strong) NSMutableAttributedString * tagAttr;
/**
 快速创建tag标签所需样式
 @param tags 字符串数组
 @param maskBlock 初始化标签样式
 @return 标签所需的NSMutableAttributedString
 */
+(NSMutableAttributedString *)xw_makeTagView:(NSArray *)tags tagMaker:(void (^)(XWTagMaker *))maskBlock;
@end
