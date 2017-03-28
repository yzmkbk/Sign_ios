//
//  Menu.m
//  BWY
//
//  Created by 姚云丽 on 17/3/4.
//  Copyright © 2017年 姚云丽. All rights reserved.
//

#import "Menu.h"
#import "Amusement.h"


@interface Menu ()
@property (strong,nonatomic) UIButton* ReturnToVC;
@property (strong,nonatomic) UIButton* Amusement;
@property (strong,nonatomic) UIButton* Sign;
@property (strong,nonatomic) UIButton* Others;
@end

@implementation Menu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mebg.png"]];
    [self initview];
}

- (void)initview{
    
    self.ReturnToVC = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 15, 10)];
    [self.ReturnToVC setTitle:@"<" forState:UIControlStateNormal];
    [self.ReturnToVC addTarget:self action:@selector(toVC) forControlEvents:UIControlEventTouchUpInside];
    
    //生活乐趣
    self.Amusement = [[UIButton alloc] initWithFrame:CGRectMake(86, 150, 160, 40)];
    [self.Amusement setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.Amusement setTitle:@"生活乐趣" forState:UIControlStateNormal];
    [self.Amusement.layer setBorderWidth:1.0];
    [self.Amusement.layer setCornerRadius:8];
    self.Amusement.titleLabel.font = [UIFont systemFontOfSize:14];
    self.Amusement.backgroundColor = [UIColor grayColor];
    [self.Amusement addTarget:self action:@selector(toAmusement) forControlEvents:UIControlEventTouchUpInside];
    
    //云端速签
    self.Sign = [[UIButton alloc] initWithFrame:CGRectMake(86, 210, 160, 40)];
    [self.Sign setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.Sign setTitle:@"云端速签" forState:UIControlStateNormal];
    [self.Sign.layer setBorderWidth:1.0];
    [self.Sign.layer setCornerRadius:8];
    self.Sign.titleLabel.font = [UIFont systemFontOfSize:14];
    self.Sign.backgroundColor = [UIColor grayColor];
    [self.Sign addTarget:self action:@selector(toSign) forControlEvents:UIControlEventTouchUpInside];
    
    //其他操作
    self.Others = [[UIButton alloc] initWithFrame:CGRectMake(86, 270, 160, 40)];
    [self.Others setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.Others setTitle:@"其他操作" forState:UIControlStateNormal];
    [self.Others.layer setBorderWidth:1.0];
    [self.Others.layer setCornerRadius:8];
    self.Others.titleLabel.font = [UIFont systemFontOfSize:14];
    self.Others.backgroundColor = [UIColor grayColor];
    [self.Others addTarget:self action:@selector(toOthers) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_ReturnToVC];
    [self.view addSubview:_Amusement];
    [self.view addSubview:_Sign];
    [self.view addSubview:_Others];
}

- (void)toVC{
    ViewController* vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toAmusement{
    Amusement* am = [Amusement new];
    [self.navigationController pushViewController:am animated:YES];
}

- (void)toSign{
}

- (void)toOthers{
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
