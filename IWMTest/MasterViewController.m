//
//  MasterViewController.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "IWMNetworkManager.h"
#import "IWMApplicationsManager.h"
#import "IWMApplication.h"
#import "IWMApplicationTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MBProgressHUD.h"
@interface MasterViewController ()

@property NSArray *objects;
@property IWMApplicationsManager *applicationsManager;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //Custom setup
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    IWMNetworkManager *nw = [[IWMNetworkManager alloc] init];
    self.applicationsManager = [[IWMApplicationsManager alloc] initWithNetworkManager:nw];
    
    __weak typeof (self) weakSelf = self;
    [self.applicationsManager getApplicationsWithSuccessBlock:^(NSArray *applicationsArray) {
        weakSelf.objects = applicationsArray;
        [weakSelf.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failureBlock:^(NSString *message) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"No data available"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        IWMApplication *selectedApp = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:selectedApp];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IWMApplicationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ApplicationCell" forIndexPath:indexPath];

    IWMApplication *app = self.objects[indexPath.row];
    cell.nameLabel.text = app.name;
    cell.categoryLabel.text = app.category;
    cell.artistLabel.text = app.artist;
    [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:app.photo]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
}


@end
