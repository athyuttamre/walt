//
//  MasterViewController.m
//  BeaconSample
//
//  Created by Krishna Chaitanya Aluru on 9/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RestaurantLandingViewController.h"

@interface RestaurantLandingViewController () {
    
}

@end

@implementation RestaurantLandingViewController {
    Restaurant *kabobAndCurry;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView setImage:[UIImage imageNamed:@"KabobAndCurry.png"]];
    
    [self.view insertSubview:imageView atIndex:0];
    
    // Menu Items Start
    
    MenuItem *samosa = [[MenuItem alloc] initWithName:@"Samosa" withCategory:@"Starters" withDescription:@"Crispy turnover, seasoned potato and pea filling." withImage:[UIImage imageNamed:@"Samosa"] withPrice:3.00 withSpice:2 withVegetarian:NO withTopBool:NO withCheckValue:NO];
    MenuItem *paneerTikka = [[MenuItem alloc] initWithName:@"Paneer Tikka" withCategory:@"Starters" withDescription:@"Cottage cheese slices, marinated and grilled with peppers and onions." withImage:[UIImage imageNamed:@"PaneerTikka"] withPrice:4.00 withSpice:2 withVegetarian:YES withTopBool:NO withCheckValue:NO];
    MenuItem *shahiPaneer = [[MenuItem alloc] initWithName:@"Shahi Paneer" withCategory:@"Main Course" withDescription:@"Preparation of paneer in a thick gravy made up of cream, tomatoes, and traditional Indian spices." withImage:[UIImage imageNamed:@"ShahiPaneer"] withPrice:6.25 withSpice:2 withVegetarian:YES withTopBool:YES withCheckValue:NO];
    MenuItem *chickenBiryani = [[MenuItem alloc] initWithName:@"Chicken Biryani" withCategory:@"Main Course" withDescription:@"Delicious mixed rice dish with spices, meat and vegetables. Served hot with curd mixture." withImage:[UIImage imageNamed:@"ChickenBiryani"] withPrice:7.25 withSpice:3 withVegetarian:NO withTopBool:YES withCheckValue:NO];
    MenuItem *dalTadka = [[MenuItem alloc] initWithName:@"Dal Tadka" withCategory:@"Main Course" withDescription:@"Preparation of yellow lentils with spices, cumin and tomatoes" withImage:[UIImage imageNamed:@"DalTadka"] withPrice:6.25 withSpice:2 withVegetarian:YES withTopBool:NO withCheckValue:NO];
    MenuItem *eggCurry = [[MenuItem alloc] initWithName:@"Egg Curry" withCategory:@"Main Course" withDescription:@"Hard-boiled eggs made with potato dices, onion, tomatoes and cilantro masala." withImage:[UIImage imageNamed:@"EggCurry"] withPrice:6.25 withSpice:3 withVegetarian:YES withTopBool:NO withCheckValue:NO];
    MenuItem *gulabJamun = [[MenuItem alloc] initWithName:@"Gulab Jamun" withCategory:@"Desserts" withDescription:@"Creamy dumplings in rosewater syrup. Served with a scoop of ice-cream." withImage:[UIImage imageNamed:@"GulabJamun"] withPrice:4.00 withSpice:0 withVegetarian:YES withTopBool:NO withCheckValue:NO];
    MenuItem *kulfi = [[MenuItem alloc] initWithName:@"Kulfi" withCategory:@"Desserts" withDescription:@"A classic homemade ice-cream with pistachio, cardamom and saffron." withImage:[UIImage imageNamed:@"Kulfi"] withPrice:4.00 withSpice:0 withVegetarian:YES withTopBool:NO withCheckValue:NO];
    MenuItem *mangoLassi = [[MenuItem alloc] initWithName:@"Mango Lassi" withCategory:@"Desserts" withDescription:@"Delicious mango and yogurt shake." withImage:[UIImage imageNamed:@"MangoLassi"] withPrice:3.00 withSpice:0 withVegetarian:YES withTopBool:NO withCheckValue:NO];
    NSMutableArray *allDishes = [[NSMutableArray alloc] initWithObjects:samosa, paneerTikka, shahiPaneer, chickenBiryani, dalTadka, eggCurry, gulabJamun, kulfi, mangoLassi, nil];
    
    NSMutableArray *topPicks = [[NSMutableArray alloc] init];
    NSMutableArray *starters = [[NSMutableArray alloc] initWithObjects:samosa, paneerTikka, nil];
    NSMutableArray *mainCourse = [[NSMutableArray alloc] initWithObjects:shahiPaneer, chickenBiryani, eggCurry, dalTadka, nil];
    NSMutableArray *desserts = [[NSMutableArray alloc] initWithObjects:gulabJamun, kulfi, mangoLassi, nil];
    
    for (MenuItem *dish in allDishes) {
        if (dish.isTopPick) {
            [topPicks addObject:dish];
        }
    }
    
    // Menu Items End
    
    NSString *str1 = @"Authentic Indian cuisine • Minimum $10/person dinner.";
    NSString *str2 = @"Please let us know if a member of your party has an allergy.";
    NSString *menuDescription=[NSString stringWithFormat:@"%@\n%@",str1,str2];
    NSDictionary *menu = [NSDictionary dictionaryWithObjectsAndKeys:
                          topPicks, @"Top Picks",
                          starters, @"Starters",
                          mainCourse, @"Main Course",
                          desserts, @"Desserts", nil];
    kabobAndCurry = [[Restaurant alloc] initWithName:@"Kabob and Curry" withLocation:@"Thayer Street" withImage:[UIImage imageNamed:@"KabobAndCurry.png"] withRating:4 withMenuDescription:menuDescription withMenu:menu];
    self.restaurantName.text = kabobAndCurry.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"viewMenuDetail"]) {
        WaltMenuTableViewController *destViewController = segue.destinationViewController;
        destViewController.restaurant = kabobAndCurry;
    }
}

@end