//
//  ViewController.m
//  XWTagView
//
//  Created by LeonJing on 13/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "ViewController.h"
#import "XWTagView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XWTagView *tagView = [[XWTagView alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width-20, 50)];
    
    NSArray *tags = @[
                      @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                      @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦"
                      ];
    NSMutableAttributedString *attr = [XWTagView xw_makeTagView:tags tagMaker:^(XWTagMaker *make){
        
        make.strokeColor = [UIColor greenColor];
        make.fillColor = [UIColor clearColor];
        make.strokeWidth = 1;
        make.cornerRadius = 100;
        make.insets =  UIEdgeInsetsMake(-2, -6, -2, -6);
        make.font = [UIFont systemFontOfSize:14];
        make.textColor = [UIColor greenColor];
        make.lineSpace = 10;
        make.maxWidth = [UIScreen mainScreen].bounds.size.width - 20;
        make.tagAlignment = XWTagAlignmentLeft;
    }];
    
    tagView.tagAttr = attr;
    
    tagView.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, attr.tagHeight);
    
    
    tagView.numberOfLines = 0;

    
    [self.view addSubview:tagView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
