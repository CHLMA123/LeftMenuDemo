# LeftMenuDemo

工程简介：左划菜单界面的封装。包含两种实现方式。

使用方法很简单：
  self.menuView = [[LeftMenuView ShareManager] initWithContainerViewController:self];
  self.menuView.menuViewDelegate = self;
  [self.navigationController.view addSubview:self.menuView];

1 LeftMenuDemo_Gesture 高级手势实现LeftMenu
  给TableView添加手势冲突解决方案：
  UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer*)gestureRecognizer;

  pan.delegate = (id<</span>UIGestureRecognizerDelegate>)self;

  - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

     if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {

          return YES;

      }     

     return NO;

  }
  

2 LeftMenuDemo_Touch 采用touch实现LeftMenu 
  解决左划手势与tableView手势的冲突：
  增加UITableView+touch分类，响应链问题，tableview响应以后，还可以传递给下一层。
  
  
3  记录一下问题解决的思路（LeftMenuDemo_Gesture 使用代理方法完成push）

通常使用self.navgationController是在Viewcontroller里面调用的，但是有的时候需要在view上也需要调用push或者present推出新的页面的方法，那么可以使用以下三种。

1、block方法。

2、代理方法。

3、获取该View所在的Viewcontroller。【这个也是我要说的方法】


//获取View所在的Viewcontroller方法

- (UIViewController *)viewController {

    for (UIView* next = [self superview]; next; next = next.superview) {

        UIResponder *nextResponder = [next nextResponder];

        if ([nextResponder isKindOfClass:[UIViewController class]]) {

            return (UIViewController *)nextResponder;

        }

    }

    return nil;

}

//使用方法：
[[self viewController].navigationController pushViewController:[yourViewController new] animated:YES];

感谢：http://blog.csdn.net/iosworker/article/details/51568326

