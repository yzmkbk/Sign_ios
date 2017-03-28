//
//  ViewController.m
//  BWY
//
//  Created by 姚云丽 on 17/3/3.
//  Copyright © 2017年 姚云丽. All rights reserved.
//

#import "ViewController.h"
#import <BmobSDK/BmobObject.h>
#import <BmobSDK/Bmob.h>
#import <BmobSDK/BmobQuery.h>

@interface ViewController ()
@property (strong,nonatomic) UITextField* Phone;
@property (strong,nonatomic) UITextField* PassWord;
@property (strong,nonatomic) UIButton* Signin;
@property (strong,nonatomic) UIButton* Register;
@property (strong,nonatomic) UIImage* Cat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initview];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vcbg.png"]];
    
}

- (void)initview {
    self.Phone = [[UITextField alloc] initWithFrame:CGRectMake(110, 300, 120, 35)];
    [self.Phone setBackgroundColor:[UIColor whiteColor]];
    self.Phone.layer.borderWidth = 1.0;
    //设置圆角
    self.Phone.layer.cornerRadius = 8;
    //设置textview里面的字体颜色
    self.PassWord.textColor = [UIColor blackColor];
    //设置隐藏字体
    self.Phone.placeholder = @"Phone Number";
    self.Phone.font = [UIFont fontWithName:@"Times New Roman" size:14];
    
    
    self.PassWord = [[UITextField alloc] initWithFrame:CGRectMake(110, 350, 120, 35)];
    [self.PassWord setBackgroundColor:[UIColor whiteColor]];
    self.PassWord.layer.borderWidth = 1.0;
    //设置圆角
    self.PassWord.layer.cornerRadius = 8;
    //设置textview里面的字体颜色
    self.PassWord.textColor = [UIColor blackColor];
    //设置隐藏字体
    self.PassWord.placeholder = @"Password";
    self.PassWord.font = [UIFont fontWithName:@"Times New Roman" size:14];
    
    
    self.Signin = [[UIButton alloc] initWithFrame:CGRectMake(110, 400, 120 , 30)];
    [self.Signin setTitle:@"Sing in" forState:UIControlStateNormal];
    [self.Signin addTarget:self action:@selector(toMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.Signin.layer setCornerRadius:10];
    [self.Signin.layer setBorderWidth:1.0];
    self.Signin.backgroundColor = [UIColor grayColor];
    //设置title字体颜色
    [self.Signin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置title字体大小
    self.Signin.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    self.Register = [[UIButton alloc] initWithFrame:CGRectMake(110, 450, 120, 30)];
    [self.Register setTitle:@"Register" forState:UIControlStateNormal];
    [self.Register addTarget:self action:@selector(toRegister) forControlEvents:UIControlEventTouchUpInside];
    self.Register.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.Register setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    [self.view addSubview:_Phone];
    [self.view addSubview:_PassWord];
    [self.view addSubview:_Signin];
    [self.view addSubview:_Register];
}


- (void)toMenu{
    NSString *un = self.Phone.text;
    NSString *pw = self.PassWord.text;
    __block int flag = 0;
    NSLog(@"%@",un);
    NSLog(@"%@",pw);
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"User"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if(error){
            NSLog(@"%@",error);
        }
        else{
            for (BmobObject *obj in array) {
                if([obj objectForKey:@"username"] == un){
                    if([obj objectForKey:@"password"] == pw){
                        Menu* me = [Menu new];
                        [self.navigationController pushViewController:me animated:YES];
                    }
                    else{
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码出现错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    flag ++;
                    break;
                }
            }
            if(!flag){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名不存在请先注册" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }];
    
    //代理
    
}


- (void)toRegister{
    Register* re = [Register new];
    [self.navigationController pushViewController:re animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
