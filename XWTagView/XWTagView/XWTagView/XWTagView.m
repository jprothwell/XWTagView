//
//  XWTagView.m
//  XWTagView
//
//  Created by LeonJing on 13/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "XWTagView.h"

@implementation XWTagView
+(NSMutableAttributedString *)xw_makeTagView:(NSArray *)tags  tagMaker:(void (^)(XWTagMaker *))maskBlock{
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    NSInteger height = 0;
    XWTagMaker *maker = [[XWTagMaker alloc] init];
    if (maskBlock) {
        maskBlock(maker);
    }
    
    for (int i = 0; i < tags.count; i++) {
        NSString *tag = tags[i];
        NSMutableAttributedString *tagText = [[NSMutableAttributedString alloc] initWithString:tag];
        [tagText yy_insertString:@" " atIndex:0];
        [tagText yy_appendString:@"  "];
        tagText.yy_font = maker.font;
        tagText.yy_color = maker.textColor;
        [tagText yy_setTextBinding:[YYTextBinding bindingWithDeleteConfirm:NO] range:tagText.yy_rangeOfAll];
        
        //设置item外观样式
        [tagText yy_setTextBackgroundBorder:[self createTextBorder:maker] range:[tagText.string rangeOfString:tag]];
        
        [text appendAttributedString:tagText];
        text.yy_lineSpacing = maker.lineSpace;
        text.yy_lineBreakMode = NSLineBreakByWordWrapping;
        
        YYTextContainer  *tagContarer = [YYTextContainer new];
        //tagContarer.size = CGSizeMake(maker.tagAlignment == XWTagAlignmentRight ? (maker.maxWidth - fabs(maker.insets.right)) : maker.maxWidth ,CGFLOAT_MAX);
        tagContarer.size = CGSizeMake(maker.tagAlignment == XWTagAlignmentRight ? (maker.maxWidth - fabs(maker.insets.right)) : (maker.maxWidth - fabs(maker.insets.left)) ,CGFLOAT_MAX);
        YYTextLayout *tagLayout = [YYTextLayout layoutWithContainer:tagContarer text:text];
        if (tagLayout.textBoundingSize.height > height) {
            
            if (i != 0) {
                [text yy_insertString:@"\n" atIndex:text.length - tagText.length];
            }
            height = tagLayout.textBoundingSize.height;
        }
    }
    
    text.tagHeight = height + maker.lineSpace;
    [text addAttribute:NSParagraphStyleAttributeName value:[self createTextStyle:maker] range:NSMakeRange(0, text.length)];
    
    return text;
}

+ (NSMutableParagraphStyle*) createTextStyle:(XWTagMaker*)maker{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing =  maker.lineSpace;
    switch (maker.tagAlignment) {
        case XWTagAlignmentLeft:
            style.alignment = NSTextAlignmentLeft;
            //style.firstLineHeadIndent = fabs(maker.insets.left) ;//设置与首部的距离
            break;
        case XWTagAlignmentCenter:
            style.alignment = NSTextAlignmentCenter;
            break;
        case XWTagAlignmentRight:
            style.alignment = NSTextAlignmentRight;
            style.tailIndent = maker.insets.right - 2; //设置与尾部的距离
            break;
        default:
            break;
    }
    return style;
}

+ (YYTextBorder*)createTextBorder:(XWTagMaker*)maker{
    
    YYTextBorder *border = [YYTextBorder new];
    border.strokeWidth = maker.strokeWidth;
    border.strokeColor = maker.strokeColor;
    border.fillColor = maker.fillColor;
    border.cornerRadius = maker.cornerRadius; // a huge value
    border.lineJoin = maker.lineJoin;
    border.insets = maker.insets;
    
    return border;
}

- (void) setTagAttr:(NSMutableAttributedString *)tagAttr{
    if (_tagAttr != tagAttr) {
        _tagAttr = tagAttr;
        
        self.attributedText = tagAttr;
    }
}

@end
