//
//  UITableView+touch.m
//  slideView
//
//  Created by == on 16/7/15.
//  Copyright © 2016年 ==. All rights reserved.
//

#import "UITableView+touch.h"

@implementation UITableView (touch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    [[[self nextResponder] nextResponder] touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    [[[self nextResponder] nextResponder] touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];

    [[[self nextResponder] nextResponder] touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    
    [[[self nextResponder] nextResponder] touchesCancelled:touches withEvent:event];
}

@end
