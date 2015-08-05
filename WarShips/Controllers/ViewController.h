//
//  ViewController.h
//  WarShips
//
//  Created by Thibault Le Cornec on 04/08/15.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;

- (IBAction)fireOnIndex:(id)sender;

@end

