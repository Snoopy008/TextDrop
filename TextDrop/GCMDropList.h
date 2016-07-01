//
//  GCMDropList.h
//  TextDrop
//
//  Created by macavilang on 16/7/1.
//  Copyright © 2016年 Snoopy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GCMDropListDelegate <NSObject>

- (void)dropListDidDismissGetData:(NSString *)string;

@end

@interface GCMDropList : UIView

@property (nonatomic, weak) UITableView *containerTableView;
@property (nonatomic,weak) id <GCMDropListDelegate> delegate;

- (instancetype)initWithFrameEqualTo:(UIView *)view;
@end
