//
//  ViewController.m
//  一登刷脸
//
//  Created by 蒋永昌 on 16/4/15.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

#import "SuperID.h"


@interface ViewController ()<SuperIDDelegate>



@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [SuperID sharedInstance].delegate = self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    

    
}

- (IBAction)faceLoginBtn:(UIButton *)sender {
    
    NSError *error = nil;
    
    id SIDLoginViewController = [[SuperID sharedInstance]obtainLoginViewControllerWithError:&error];
    
    if (SIDLoginViewController) {
        
        [self presentViewController:SIDLoginViewController animated:YES completion:nil];
        
    }else{
        
        NSLog(@"Error =%ld,%@",(long)[error code],[error localizedDescription]);
    }

}

/**
 *  添加一登 SDK 的委托方法
 */
- (void)superID:(SuperID *)sender userDidFinishLoginWithUserInfo:(NSDictionary *)userInfo withOpenId:(NSString *)openId error:(NSError *)error{
    
    if (!error) {
        
        //授权登录成功
        NSLog(@"userInfo:%@", userInfo);
        NSLog(@"openId = %@", openId);
        
        /**
         userInfo:{
         avatar = "xxxxx.jpg";
         name = "\U5f90\U9a8f\U6770V1\Uff01";
         persona = {
         character = reserved;
         gender = male;
         generation = 90s;
         location = {
         city = "\U6df1\U5733";
         country = CN;
         province = "\U5e7f\U4e1c";
         };
         tags = (
         eyeglasses
         );
         };
         phone = 136xxxx9914;
         }
         openId = xxxxxxxxxxxxxx
         
         */
        
        TableViewController *tableVC = [[TableViewController alloc]init];
        tableVC.userInfo = userInfo;
        tableVC.openId = openId;
        tableVC.navigationItem.hidesBackButton = YES;
        [self.navigationController pushViewController:tableVC animated:YES];

        
        
    }else{
        
        //授权登录失败
        NSLog(@"Login Fail Error =%ld,%@",(long)[error code],[error localizedDescription]);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
