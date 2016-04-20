//
//  TableViewController.m
//  一登刷脸
//
//  Created by 蒋永昌 on 16/4/15.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "TableViewController.h"
#import "ChangeViewController.h"
#import "UIImageView+WebCache.h"
#import "SuperID.h"

@interface TableViewController ()

@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation TableViewController

-(NSArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = @[self.userInfo[@"avatar"],self.userInfo[@"name"],self.userInfo[@"phone"],self.openId,@""];
    }
    
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(loginOut:)];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    
    self.navigationItem.title = self.userInfo[@"name"];
}

- (void)loginOut:(UIBarButtonItem *)sender{
    
     [[SuperID sharedInstance]appUserLogoutCurrentAccount];
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    
    cell.textLabel.text = self.dataArray[indexPath.row];

    if (indexPath.row == 0) {
        
        NSURL *url = [NSURL URLWithString:self.dataArray[indexPath.row]];
        [cell.imageView sd_setImageWithURL:url];
        cell.textLabel.text = @"";
    }
    
    
//    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 4) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        ChangeViewController *changeVC = [storyboard instantiateViewControllerWithIdentifier:@"change"];

        
        changeVC.userInfo = self.userInfo;
        
        [self.navigationController pushViewController:changeVC animated:YES];
        
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
