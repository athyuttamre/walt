//
//  WaltConfirmOrderTableViewController.m
//  Walt
//
//  Created by Athyuttam Reddy on 9/14/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import "WaltConfirmOrderTableViewController.h"
#import "WaltReviewOrderTableViewCell.h"
#import "MenuItem.h"

@interface WaltConfirmOrderTableViewController ()

@end

@implementation WaltConfirmOrderTableViewController {
    BOOL isConfirmed;
    NSMutableArray *cells;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isConfirmed = NO;
    cells = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView addSubview:self.bottomFloatingView];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, CGRectGetHeight(self.bottomFloatingView.bounds), 0.0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, CGRectGetHeight(self.bottomFloatingView.bounds), 0.0);
    
    [self.tableView addObserver:self
                     forKeyPath:@"frame"
                        options:0
                        context:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return [self.selectedItems count];
    }
    else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        WaltReviewOrderTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCellIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    else if (indexPath.section == 1) {
        WaltReviewOrderTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"TimeCellIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    else {
        WaltReviewOrderTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCellIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Configure the cell...
        
        cell.itemIndex.text = [NSString stringWithFormat:@"%li.", indexPath.row + 1];
        cell.itemName.text = ((MenuItem *)[self.selectedItems objectAtIndex:indexPath.row]).name;
        MenuItem *item = [self.selectedItems objectAtIndex:indexPath.row];
        cell.itemPrice.text = [NSString stringWithFormat:@"%.2f", item.price];
        
        int statusIntMap = arc4random() % 2;
        if (statusIntMap == 0) {
            cell.itemStatus.text = @"Ordered";
            [cell.itemStatus setTextColor:[UIColor darkGrayColor]];
        }
        else {
            cell.itemStatus.text = @"Cooking";
        }
        [cell.itemStatus setHidden:YES];
        
        [cells addObject:cell];
        return cell;
    }
    
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Your Order";
    }
    else {
        return @"";
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 1) {
//        return 100;
//    } else {
//        return 45;
//    }
//}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self adjustFloatingViewFrame];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if([keyPath isEqualToString:@"frame"]) {
        [self adjustFloatingViewFrame];
    }
}

- (void)adjustFloatingViewFrame
{
    CGRect newFrame = self.bottomFloatingView.frame;
    
    newFrame.origin.x = 0;
    newFrame.origin.y = self.tableView.contentOffset.y + CGRectGetHeight(self.tableView.bounds) - CGRectGetHeight(self.bottomFloatingView.bounds);
    
    self.bottomFloatingView.frame = newFrame;
    [self.tableView bringSubviewToFront:self.bottomFloatingView];
}

- (IBAction)confirmOrder:(id)sender {
    if (!isConfirmed) {
        for(int i = 0; i < [cells count]; i++) {
            WaltReviewOrderTableViewCell *cell = cells[i];
            [cell.itemStatus setHidden:NO];
        }
        
        UIButton *button = (UIButton *)sender;
        [button setTitle:@"Finish Meal" forState:UIControlStateNormal];
        isConfirmed = YES;
    }
    else {
        [self performSegueWithIdentifier:@"ViewPaymentDetail" sender:nil];
    }
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if ([segue.identifier isEqualToString:@"ViewPaymentDetail"]) {
         WaltConfirmOrderTableViewController *destViewController = segue.destinationViewController;
         destViewController.selectedItems = self.selectedItems;
     }
 }

@end
