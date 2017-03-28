//
//  Amusement.m
//  BWY
//
//  Created by 姚云丽 on 17/3/4.
//  Copyright © 2017年 姚云丽. All rights reserved.
//

#import "Amusement.h"
#import "ListOne.h"
#import "Menu.h"

//在tableViewController中设置好 代理和数据源方法：
@interface Amusement () <UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView* aTV;
@property (strong,nonatomic) UIButton* RetoMenu;
@end

@implementation Amusement

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initview];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"otbg.png"]];
    }

- (void)initview{
    self.aTV = [[UITableView alloc] initWithFrame:CGRectMake(60, 60, 200, 450)];
    //设置数据源
    self.aTV.dataSource = self;
    self.aTV.delegate = self;
    //cell的点击事件调用，但是如何获取当前indexpath？？？
    //NSIndexPath* ip = [NSIndexPath alloc]
    //[self tableView:self.aTV didSelectRowAtIndexPath:[NSIndexPath ]];
    
    self.RetoMenu = [[UIButton alloc] initWithFrame:CGRectMake(10,20, 15, 10)];
    [self.RetoMenu setTitle:@"<" forState:UIControlStateNormal];
    [self.RetoMenu addTarget:self action:@selector(toMenu) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_aTV];
    [self.view addSubview:_RetoMenu];
    
}

- (void)toMenu{
    Menu* me = [Menu new];
    [self.navigationController pushViewController:me animated:YES];
}

//numberOfSectionsInTableView方法,返回一共多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//返回每一组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
//返回当前行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [UITableViewCell new];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
        if(indexPath.row == 0){
            cell.textLabel.text = @"大一";

        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"大二";
        }
        else{
            cell.textLabel.text = @"大三";
        }
        return cell;
}
//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"aaaaaaa");
    
    if (0 == indexPath.section) {
        [self btnActionForUserSetting:self];
        
    }
    ListOne *lo = [ListOne new];
    [self.navigationController pushViewController:lo animated:YES];
}

- (void)btnActionForUserSetting:(id) sender {
    NSIndexPath *indexPath = [self.aTV indexPathForSelectedRow];
    UITableViewCell *cell = [self.aTV cellForRowAtIndexPath:indexPath];
    cell.textLabel.text= @"abc";
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return @"类别列表";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
