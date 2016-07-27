//
//  MenuTableViewCell.m
//  QQ侧滑菜单Demo
//
//  Created by MCL on 16/7/18.
//  Copyright © 2016年 CHLMA. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGPoint cen = self.imageView.center;
    CGRect rect = self.imageView.frame ;
    rect.size = CGSizeMake(15.f, 15.f);
    self.imageView.frame = rect;
    self.imageView.center = cen;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
