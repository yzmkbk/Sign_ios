//
//  ListOne.m
//  BWY
//
//  Created by 姚云丽 on 17/3/5.
//  Copyright © 2017年 姚云丽. All rights reserved.
//

#import "ListOne.h"
#import "Amusement.h"

@interface ListOne ()
@property (strong,nonatomic) UIButton* ReturnToA;
@end

@implementation ListOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"otbg.png"]];
    [self initview];
}

- (void)initview{
    self.ReturnToA = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 15, 10)];
    [self.ReturnToA setTitle:@"<" forState:UIControlStateNormal];
    [self.ReturnToA addTarget:self action:@selector(toAmu) forControlEvents:UIControlEventTouchUpInside
     ];
    
    [self.view addSubview:_ReturnToA];
}

- (void)toAmu{
    Amusement* amu = [Amusement new];
    [self.navigationController pushViewController:amu animated:YES];
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
