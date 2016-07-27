//
//  HomeViewController.m
//  QQ侧滑菜单Demo
//
//  Created by MCL on 16/7/14.
//  Copyright © 2016年 CHLMA. All rights reserved.
//

#import "HomeViewController.h"
#import "OtherViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, LeftMenuViewDelegate>

@property (nonatomic, strong) UITableView *homeTableView;

@end

@implementation HomeViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Home";
    [self setupNavView];
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews{
    
    _homeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _homeTableView.backgroundColor=[UIColor whiteColor];
    _homeTableView.delegate = self;
    _homeTableView.dataSource = self;
    [self.view addSubview:_homeTableView];
    
    self.menuView = [[LeftMenuView ShareManager] initWithContainerViewController:self];
    self.menuView.menuViewDelegate = self;
    //NSLog(@"----LeftMenuView0---- %@",self.menuView);
    [self.navigationController.view addSubview:self.menuView];
    
}

- (void)setupNavView{
    
    self.navigationController.navigationBar.backgroundColor = [UIColor darkGrayColor];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"topnav_menu_nor"] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [leftBtn addTarget:self action:@selector(OpenLeftMenuView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)OpenLeftMenuView{
    
    NSLog(@"OpenLeftMenuView");

    if (self.menuView.isLeftViewHidden) {
    
        [self.menuView openLeftView];
    }
}

#pragma mark - LeftMenuViewDelegate
- (void)LeftMenuViewActionIndex:(NSString *)vType{
    
//    if ([vType isEqualToString:@"..."]) {
//        //。。。自定义实现。。。
//    }
    NSLog(@"inter >>> Action");
    OtherViewController *otherVC =[[OtherViewController alloc]init];
    [self.navigationController pushViewController:otherVC animated:YES];
    
    [self.menuView closeLeftView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    if (indexPath.row %2 ==0) {
        cell.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.25];
    }else{
        cell.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.25];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
//#ifdef DEBUG
//    NSLog(@"Cell recursive description:\n\n%@\n\n", [cell performSelector:@selector(recursiveDescription)]);
//#endif
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 210;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return @"删除";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"UITableViewCellEditingStyleDelete");
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击了 tableView的第 %ld 个cell", (long)indexPath.row);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
