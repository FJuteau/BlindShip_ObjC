//
//  MenuController.h
//  WarShips
//
//  Created by François Juteau on 10/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *HeadshotSwitch;

@property (weak, nonatomic) IBOutlet UIPickerView *LevelPicker;

@property (weak, nonatomic) IBOutlet UISwitch *visibilitySwitch;

@end
