//
//  DataManager.h
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ship.h"

@interface DataManager : NSObject

#pragma mark - Properties

/**
 *  @author François  Juteau, 15-08-05 00:08:07
 *
 *  @brief  array of ships positions
 */
@property (strong, nonatomic, readonly) NSMutableArray *grid;

/**
 *  @author François  Juteau, 15-08-05 00:08:03
 *
 *  @brief  array of every ships
 */
@property (strong, nonatomic, readonly) NSMutableArray *shipArray;


#pragma mark - Instance Methods

/**
 *  @author François  Juteau, 15-08-05 00:08:51
 *
 *  @brief  Static method to return the instancied object
 *  @return instance of DataManager
 */
+(DataManager*)sharedDataManager;


#pragma mark - Inits & resets

/**
 *  @author François  Juteau, 15-08-05 02:08:52
 *
 *  @brief  Resets ships to random positions
 */
-(void)reset;


#pragma mark - Extern methods

/**
 *  @author François  Juteau, 15-08-05 02:08:54
 *
 *  @brief  Impact the ship touch to the ship properties
 *  @param _index index of the touch
 *  @return array of indexes if the ship is sunk / nil if it's only touch
 */
-(NSMutableArray *)shipTouch:(NSInteger)_index;

/**
 *  @author François  Juteau, 15-08-05 02:08:58
 *
 *  @brief  Get all indexes for all the ships in game
 *  @return array of all the indexes
 */
-(NSMutableArray *)getAllIndexesForAllShips;

/**
 *  @author François  Juteau, 15-08-05 07:08:40
 *
 *  @brief  Return the game status
 *  @return true if the game is ended
 */
-(BOOL)isEndOfGame;


#pragma mark - DEBUG

/**
 *  @author François  Juteau, 15-08-06 00:08:43
 *
 *  @brief  Get the ship type for the ship in parameter
 *  @param _index ship index
 *  @return ship type
 */
-(NSUInteger)getShipType:(NSUInteger)_index;

@end
