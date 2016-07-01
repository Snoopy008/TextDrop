//
//  GCMDropList.m
//  TextDrop
//
//  Created by macavilang on 16/7/1.
//  Copyright © 2016年 Snoopy. All rights reserved.
//

#import "GCMDropList.h"
#import "UIView+Extension.h"
@interface GCMDropList ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation GCMDropList


- (instancetype)initWithFrameEqualTo:(UIView *)view
{
    self = [super init];
    if (self) {
        UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
        [window addSubview:self];
        self.frame = window.bounds;
        CGRect newFrame = [view convertRect:view.bounds toView:window];
        
        UITableView *containerTableView = [[UITableView alloc] init];
        containerTableView.userInteractionEnabled = YES;
        containerTableView.layer.borderWidth = 1;
        containerTableView.dataSource = self;
        containerTableView.delegate = self;
        containerTableView.rowHeight = 40;
        containerTableView.frame = CGRectMake(CGRectGetMinX(newFrame), CGRectGetMaxY(newFrame), view.width, 100);
        [self addSubview:containerTableView];
        self.containerTableView = containerTableView;
    }
    return self;
}


- (void)dismiss
{
    [self removeFromSuperview];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
    [self.delegate dropListDidDismissGetData:@"default Item"];
}


#pragma mark - Tableview Delegate
//设置单元格组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//设置单元格组数中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

//设置每个单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.text = @"123";
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismiss];
    NSString *textshow = [NSString stringWithFormat:@"selected Item %ld",(long)indexPath.row];
    [self.delegate dropListDidDismissGetData:textshow];
}



@end
