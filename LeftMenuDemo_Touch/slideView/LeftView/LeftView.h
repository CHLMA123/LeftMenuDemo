//
//  leftView.h
//  slideView
//
//  Created by == on 16/7/15.
//  Copyright © 2016年 ==. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftView : UIView

+ (instancetype)ShareManager;

- (instancetype)initWithContainerViewController:(UIViewController *)containerVC;

- (void)leftTouchMove:(NSSet<UITouch *>  *)touches and:(UIEvent *)event;

- (void)leftTouchEnd:(NSSet<UITouch *>  *)touches and:(UIEvent *)event;

- (void)showLeftView;

- (void)closeLeftView;

@end

