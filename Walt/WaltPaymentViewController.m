//
//  WaltPaymentViewController.m
//  Walt
//
//  Created by Athyuttam Reddy on 9/14/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import "WaltPaymentViewController.h"
#import "PTKView.h"
#import "PaymentTableViewCell.h"
#import "MenuItem.h"


@interface WaltPaymentViewController ()<PTKViewDelegate>
@property(weak, nonatomic) PTKView *paymentView;

@end

@implementation WaltPaymentViewController {
    float price;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view.
//    self.navigationItem.hidesBackButton = YES;
//    PTKView *view = [[PTKView alloc] initWithFrame:CGRectMake(15,20,290,55)];
//    self.paymentView = view;
//    self.paymentView.delegate = self;
//    [self.view addSubview:self.paymentView];
    for (int i = 0; i < [self.selectedItems count]; i++) {
        price += ((MenuItem *)[self.selectedItems objectAtIndex:i]).price;
    }
}

- (void)paymentView:(PTKView *)view withCard:(PTKCard *)card isValid:(BOOL)valid
{
    // Toggle navigation, for example
//    self.saveButton.enabled = valid;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
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
        PaymentTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"TaxIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.itemTax.text = [NSString stringWithFormat:@"%.2f", 0.03 * price];
        
        return cell;
    }
    else if (indexPath.section == 1) {
        PaymentTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"TotalIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.itemSubTotal.text = [NSString stringWithFormat:@"%.2f", price];
        
        return cell;
    }
    else if (indexPath.section == 3) {
        PaymentTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"TipIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    else if (indexPath.section == 4)
    {
        PaymentTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"CardIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.itemTotal.text = [NSString stringWithFormat:@"%.2f", price + (0.03 * price) + 3.25];
        
        return cell;
    }
    else {
        PaymentTableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCellIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Configure the cell...
        
        cell.itemIndex.text = [NSString stringWithFormat:@"%ld.", (long)indexPath.row + 1];
        cell.itemName.text = ((MenuItem *)[self.selectedItems objectAtIndex:indexPath.row]).name;
        MenuItem *item = [self.selectedItems objectAtIndex:indexPath.row];
        cell.itemPrice.text = [NSString stringWithFormat:@"%.2f", item.price];
        
        return cell;
    }
    
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
