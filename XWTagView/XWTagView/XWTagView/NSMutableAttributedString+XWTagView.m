//
//  NSMutableAttributedString+XWTagView.m
//  XWTagView
//
//  Created by LeonJing on 13/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "NSMutableAttributedString+XWTagView.h"
#import <objc/runtime.h>

@implementation NSMutableAttributedString (XWTagView)

- (void) setTagHeight:(CGFloat)tagHeight{
    objc_setAssociatedObject(self, @selector(tagHeight), [NSNumber numberWithFloat:tagHeight], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat) tagHeight{
    NSNumber* value = objc_getAssociatedObject(self, @selector(tagHeight));
    return value.floatValue;
}

@end
