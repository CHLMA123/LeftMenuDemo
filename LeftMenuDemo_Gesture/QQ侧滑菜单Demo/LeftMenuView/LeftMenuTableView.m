//
//  AppDelegate.h
//  QQ侧滑菜单Demo
//
//  Created by MCL on 16/7/13.
//  Copyright © 2016年 CHLMA. All rights reserved.
//

#import "LeftMenuTableView.h"
#import "MenuTableViewCell.h"

@interface LeftMenuTableView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) NSArray *imageSourceArr;
@property (nonatomic, strong) NSArray *classSourceArr;

@end

@implementation LeftMenuTableView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        
        self.delegate=self;
        self.dataSource=self;
        self.rowHeight = 40;
        self.scrollEnabled = NO;
        self.separatorColor = [UIColor clearColor];
        self.separatorStyle= UITableViewCellSeparatorStyleNone;
        
        self.dataSourceArr = @[@[@"cell_row_00",@"cell_row_01"], @[@"cell_row_10",@"cell_row_11",@"cell_row_12",@"cell_row_13"], @[@"cell_row_20"]];
        self.imageSourceArr= @[@[@"image1", @"image2"], @[@"image3", @"image4", @"image5", @"image6"], @[@"image7"]];
        
        self.classSourceArr= @[@[@"Action1", @"Action2"], @[@"Action3", @"Action4", @"Action5", @"Action6"], @[@"Action7"]];
        
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor redColor];
        self.tableFooterView = footerView;
    }
    return  self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *arr = [_dataSourceArr objectAtIndex:section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"menu";
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.text = _dataSourceArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.highlightedTextColor = RGBCOLOR(9, 235, 255);
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    NSString *norImage = [NSString stringWithFormat:@"%@", _imageSourceArr[indexPath.section][indexPath.row]];
//    NSString *norImage = [NSString stringWithFormat:@"%@_nor", _imageSourceArr[indexPath.section][indexPath.row]];
//    NSString *selImage = [NSString stringWithFormat:@"%@_press", _imageSourceArr[indexPath.section][indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:norImage];
//    cell.imageView.highlightedImage = [UIImage imageNamed:selImage];
    cell.selectedBackgroundView = [[UIView alloc] init];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击了 tableView的第 %ld 个cell", (long)indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *actionName = _classSourceArr[indexPath.section][indexPath.row];
    if (_menuActionBlock) {
        _menuActionBlock(actionName);
    }
    
//    NSLog(@"点击了 tableView的第 %ld 个cell", (long)indexPath.row);
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSString *className = _classSourceArr[0];
//    UIViewController *vc = [[NSClassFromString(className) alloc] init];
//    [[AppDelegate appDelegate].home.navigationController pushViewController:vc animated:YES];
//    [[AppDelegate appDelegate].home.menuView closeLeftView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _dataSourceArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    return view;
}

@end
