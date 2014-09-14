//
//  WaltMenuTableViewController.m
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import "WaltMenuTableViewController.h"
#import "WaltTableViewCell.h"
#import "WaltTableViewMenuCell.h"
#import "MenuItem.h"

@interface WaltMenuTableViewController ()

@end

@implementation WaltMenuTableViewController {
    NSMutableArray *menuItems;
    NSMutableArray *selectedMenuItems;
    
    NSArray *topPicks;
    NSArray *starters;
    NSArray *mainCourse;
    NSArray *desserts;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:180/255.0f green:19/255.0f blue:27/255.0f alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    menuItems = [[NSMutableArray alloc] init];
    selectedMenuItems = [[NSMutableArray alloc] init];
    
    NSDictionary *menu = self.restaurant.menu;
    topPicks = [menu objectForKey:@"Top Picks"];
    starters = [menu objectForKey:@"Starters"];
    mainCourse = [menu objectForKey:@"Main Course"];
    desserts = [menu objectForKey:@"Desserts"];
    
//    menuItems = [self.restaurant.menu objectForKey:<#(id)#>];
    
//    menuItems = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
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
    return [self.restaurant.menu count] + 1; // +1 for the header section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return [topPicks count];
    }
    else if (section == 2) {
        return [starters count];
    }
    else if (section == 3) {
        return [mainCourse count];
    }
    else if (section == 4) {
        return [desserts count];
    }
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    
    // Configure the cell...
    if (section == 0) {
        WaltTableViewCell *cell;
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCellIdentifier" forIndexPath:indexPath];
        cell.restaurantName.text = self.restaurant.name;
        cell.restaurantDescription.text = self.restaurant.menuDescription;
        
        int stars = self.restaurant.rating;
        switch(stars) {
            case 0:
                cell.restaurantRating.image = [UIImage imageNamed:@"Stars-0.png"];
                break;
            case 1:
                cell.restaurantRating.image = [UIImage imageNamed:@"Stars-1.png"];
                break;
            case 2:
                cell.restaurantRating.image = [UIImage imageNamed:@"Stars-2.png"];
                break;
            case 3:
                cell.restaurantRating.image = [UIImage imageNamed:@"Stars-3.png"];
                break;
            case 4:
                cell.restaurantRating.image = [UIImage imageNamed:@"Stars-4.png"];
                break;
            case 5:
                cell.restaurantRating.image = [UIImage imageNamed:@"Stars-5.png"];
                break;
        }
        
        return cell;
    }
    else {
        WaltTableViewMenuCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCellIdentifier" forIndexPath:indexPath];

        NSArray *sectionItems;
        if (section == 1) {
            sectionItems = [self.restaurant.menu objectForKey:@"Top Picks"];
        } else if (section == 2) {
            sectionItems = [self.restaurant.menu objectForKey:@"Starters"];
        } else if (section == 3) {
            sectionItems = [self.restaurant.menu objectForKey:@"Main Course"];
        } else if (section == 4) {
            sectionItems = [self.restaurant.menu objectForKey:@"Desserts"];
        } else {
            sectionItems = @[];
        }

        MenuItem *menuItem = ((MenuItem*)[sectionItems objectAtIndex:indexPath.row]);
        cell.menuItemName.text = menuItem.name;
        cell.menuItemPrice.text = [NSString stringWithFormat:@"%.2f", menuItem.price];
        cell.menuItemDescription.text = menuItem.itemDescription;
        cell.menuItemImage.image = menuItem.thumbnail;
        
        
        int tag;
        if([menuItems containsObject:menuItem]) {
            tag = (int)[menuItems indexOfObject:menuItem];
        } else {
            tag = (int)[menuItems count];
            [menuItems addObject:menuItem];
        }
        
        cell.addItemButton.tag = tag;
        
        if([selectedMenuItems containsObject:menuItem]) {
            menuItem.isChecked = YES;
            [cell.addItemButton setBackgroundImage:[UIImage imageNamed:@"CheckedItem.png"] forState:UIControlStateNormal];

        } else {
            menuItem.isChecked = NO;
            [cell.addItemButton setBackgroundImage:[UIImage imageNamed:@"AddItem.png"] forState:UIControlStateNormal];
        }
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone; // Disable grey selection
        
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return @"★ Top Picks";
    }
    else if (section == 2) {
        return @"Starters";
    }
    else if (section == 3) {
        return @"Main Course";
    }
    else if (section == 4) {
        return @"Desserts";
    }
    else {
        return @"";
    }
}

- (IBAction)addMenuItem:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSInteger tag = [button tag];
    
    MenuItem *menuItem = menuItems[(int)tag];
    
    
    // ERROR: Top pick items can be double-picked; should be synced
    
    if(menuItem.isChecked) {
        menuItem.isChecked = NO;
        [selectedMenuItems removeObject:menuItem];
        [button setBackgroundImage:[UIImage imageNamed:@"AddItem.png"] forState:UIControlStateNormal];
        
        if(menuItem.isTopPick) {
            
        }
    } else {
        menuItem.isChecked = YES;
        [selectedMenuItems addObject:menuItem]; // Select Item
        [button setBackgroundImage:[UIImage imageNamed:@"CheckedItem.png"] forState:UIControlStateNormal];
    }
    
    NSString *reviewOrderString = [NSString stringWithFormat:@"Review Order (%d)", (int)[selectedMenuItems count]];
    [self.reviewOrderButton setTitle:reviewOrderString forState:UIControlStateNormal];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 75;
    } else {
        return 84;
    }
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"viewOrderDetail"]) {
        WaltConfirmOrderTableViewController *destViewController = segue.destinationViewController;
        destViewController.selectedItems = selectedMenuItems;
        destViewController.restaurant = self.restaurant;
    }
}


@end
