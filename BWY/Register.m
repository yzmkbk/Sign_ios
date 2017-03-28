//
//  Register.m
//  BWY
//
//  Created by 姚云丽 on 17/3/4.
//  Copyright © 2017年 姚云丽. All rights reserved.
//

#import "Register.h"
#import "ViewController.h"
#import <BmobSDK/Bmob.h>
#import <BmobSDK/BmobQuery.h>
#import <BmobSDK/BmobObject.h>

@interface Register ()
@property (strong,nonatomic) UIButton* ReturnToVC;
@property (strong,nonatomic) UITextField* Phone;
@property (strong,nonatomic) UITextField* Password;
@property (strong,nonatomic) UIButton* Sure;
@property NSString* un;
@property NSString* pw;

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mebg.png"]];
    [self initview];
}

- (void)initview{
    self.ReturnToVC = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 15, 10)];
    [self.ReturnToVC setTitle:@"<" forState:UIControlStateNormal];
    [self.ReturnToVC addTarget:self action:@selector(tovc) forControlEvents:UIControlEventTouchUpInside];
    
    self.Phone = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 130, 30)];
    self.Phone.placeholder = @"PhoneNumber";
    [self.Phone.layer setBorderWidth:1.0];
    [self.Phone.layer setCornerRadius:8];
    self.Phone.font = [UIFont systemFontOfSize:14];
    //设置隐藏字体居中显示
    self.Phone.textAlignment = NSTextAlignmentCenter;
    
    
    self.Password = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 130, 30)];
    self.Password.placeholder = @"Password";
    [self.Password.layer setBorderWidth:1.0];
    [self.Password.layer setCornerRadius:8];
    self.Password.font = [UIFont systemFontOfSize:14];
    self.Password.textAlignment = NSTextAlignmentCenter;
    
    self.Sure = [[UIButton alloc] initWithFrame:CGRectMake(130,350, 50, 50)];
    [self.Sure setTitle:@"提交" forState:UIControlStateNormal];
    [self.Sure addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:_ReturnToVC];
    [self.view addSubview:_Phone];
    [self.view addSubview:_Password];
    [self.view addSubview:_Sure];

}

- (void)tovc{
    ViewController* vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)sure{
    NSString *un = self.Phone.text;
    NSString *pw = self.Password.text;
    NSLog(@"%@  %@",un,pw);
    //添加数据到后端User表中
    BmobObject* user = [BmobObject objectWithClassName:@"User"];
    [user setObject:un forKey:@"username"];
    [user setObject:pw forKey:@"password"];
    [user saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            //创建成功后会返回objectId，updatedAt，createdAt等信息
            //创建对象成功，打印对象值
            NSLog(@"%@",user);
        } else if (error){
            //发生错误后的动作
            NSLog(@"%@",error);
        } else {
            NSLog(@"Unknow error");
        }
    }];
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
