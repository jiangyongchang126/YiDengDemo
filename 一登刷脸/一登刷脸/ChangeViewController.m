//
//  ChangeViewController.m
//  一登刷脸
//
//  Created by 蒋永昌 on 16/4/16.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "ChangeViewController.h"
#import "UIImageView+WebCache.h"
#import "SuperID.h"

@interface ChangeViewController ()<SuperIDDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;

@property (weak, nonatomic) IBOutlet UITextField *nameTextF;


@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;

@end

@implementation ChangeViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [SuperID sharedInstance].delegate = self;
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextF.text = self.userInfo[@"name"];
    self.phoneTextF.text = self.userInfo[@"phone"];
    NSURL *url = [NSURL URLWithString:@"http://ac-nwyekrdd.clouddn.com/VlJW7oBcE9nUsIwnFvBcKGD"];
    [self.iconImageV sd_setImageWithURL:url];
    
    // http://ac-nwyekrdd.clouddn.com/VlJW7oBcE9nUsIwnFvBcKGD
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)saveBtn:(UIButton *)sender {
    
      // 当用户修改了app的个人资料以后，请调用此接口进行资料上传更新。
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc]init];
    
      //  更新用户的APP个人信息
        [userInfo setObject:self.nameTextF.text forKey:@"name"];
        [userInfo setObject:self.phoneTextF.text forKey:@"iphone"];
        [userInfo setObject:@"http://ac-nwyekrdd.clouddn.com/VlJW7oBcE9nUsIwnFvBcKGD" forKey:@"avatar"];
    
    
    [[SuperID sharedInstance] updateAppUserInfo:userInfo];

}

- (void)superID:(SuperID *)sender updateAppUserInfoStateResponse:(SIDUserUpdateResponseState)state{
    
    if (state == SIDUpdateUserInfoSucceed) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
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
