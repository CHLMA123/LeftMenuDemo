//
//  leftView.m
//  slideView
//
//  Created by == on 16/7/15.
//  Copyright © 2016年 ==. All rights reserved.
//

#import "LeftView.h"

@interface LeftView ()

@property (nonatomic, strong) UIViewController *ContainerVC;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation LeftView

static NSInteger menuViewWith = 290;

static LeftView *menuView = nil;
+ (instancetype)ShareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menuView = [[self alloc] initWithFrame:CGRectMake(-menuViewWith, 0, menuViewWith, SCREEN_HEIGHT)];
    });
    return menuView;
}

- (instancetype)initWithContainerViewController:(UIViewController *)containerVC;
{
    if (self = [super init]) {
        
        _ContainerVC = containerVC;
        self.backgroundColor = [UIColor redColor];
        _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor blueColor];
        _maskView.alpha = 0;
        [_ContainerVC.view addSubview:_maskView];
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self addRecognizer];
    }
    return self;
}


#pragma mark - UITapGestureRecognizer
-(void)addRecognizer{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeLeftViewEvent:)];
    [_maskView addGestureRecognizer:tap];
    
}

-(void)closeLeftViewEvent:(UITapGestureRecognizer *)recognizer{
    
    [self closeLeftView];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"]) {
        
        CGRect new = [[change objectForKey:@"new"] CGRectValue];
        UITableView *tableView;
        for (UIView *obj in _ContainerVC.view.subviews) {
            if ([obj isKindOfClass:[UITableView class]]) {
                tableView = (UITableView *)obj;
            }
        }
//        UITableView *tableView = [_ContainerVC valueForKey:@"tableView"];//作用同上
        if (new.origin.x != -menuViewWith)
        {
            tableView.scrollEnabled = NO;
            _maskView.alpha = (new.origin.x + menuViewWith)/menuViewWith*0.5;
        }else
        {
            tableView.scrollEnabled = YES;
            _maskView.alpha = 0;
        }
    }
}


- (void)leftTouchMove:(NSSet<UITouch *> *)touches and:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    CGPoint prePoint = [touch previousLocationInView:self.superview];
    CGFloat offsetx = currentPoint.x - prePoint.x;
    self.frame = CGRectMake(self.frame.origin.x + offsetx, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    if (self.frame.origin.x >=0) {
        self.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
    }
    
    if (self.frame.origin.x <= -menuViewWith) {
        
        self.frame = CGRectMake(-menuViewWith, 0, self.frame.size.width,  self.frame.size.height);
        
    }

}

- (void)leftTouchEnd:(NSSet<UITouch *>  *)touches and:(UIEvent *)event;
{
    if (self.frame.origin.x >=0) {
        self.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
    }
    
    if (self.frame.origin.x <= -menuViewWith) {
        
        self.frame = CGRectMake(-menuViewWith, 0, self.frame.size.width,  self.frame.size.height);
    }
    
    if (self.frame.origin.x > -menuViewWith*0.52) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
        }];
        
    }else
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.frame = CGRectMake(-menuViewWith, 0, self.frame.size.width,  self.frame.size.height);
        }];
        
    }
}

- (void)showLeftView
{
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, 0, menuViewWith, SCREEN_HEIGHT);
        _maskView.alpha = 0.5;
    }];
    
}

- (void)closeLeftView
{
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(-menuViewWith, 0, menuViewWith, SCREEN_HEIGHT);
        _maskView.alpha = 0;
    }];
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"frame"];
}

@end
