//
//  Ship.m
//  WarShips
//
//  Created by Julien Poumarat on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "Ship.h"

@implementation Ship

static NSArray *lengthTab; // Array de la taille des bateaux


-(id) initWithType:(NSInteger)_type // Constructeur de Ship
{
    self = [super init];
    
    if (self)
    {
        if (lengthTab == nil)
        {
            lengthTab = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", nil];
        }
        
        _idType = _type;
        _length = [lengthTab[_idType] integerValue]; // initialistaion de la longueur d'un bateau
    }

    return self;
}

/**
 *  @author François  Juteau, 15-08-11 05:08:56
 *
 *  @brief  Set the positionning properties
 *  @param isVertical  is vertical
 *  @param _positive   is positive
 *  @param originPoint origine point
 */
-(void)affectShip:(BOOL)isVertical withPositive:(BOOL)_positive originPoint:(NSInteger)originPoint
{ // Méthode d'affectation des paramètres d'un objet Ship
    _isVertical = isVertical; // Intialisation de la position du bateau
    _isPositif = _positive;
    _originPoint = originPoint; // Initialisation du point d'origine
    
}

/**
 *  @author François  Juteau, 15-08-11 05:08:03
 *
 *  @brief  Check if all the ship is touch and thus sunk
 *  @return true if sunk
 */
-(BOOL)isShipSunk
{
    return _nbCaseTouch == _length;
}

/**
 *  @author François  Juteau, 15-08-11 05:08:07
 *
 *  @brief  Check if the head is touch
 *  @param _index touch index
 *  @return true if the ship got headshot
 */
-(BOOL)isHeadshot:(NSUInteger)_index
{
    return _originPoint == _index;
}

/**
 *  @author François  Juteau, 15-08-11 05:08:10
 *
 *  @brief  Resets the ship sunk stats
 */
-(void)resetSunkStats
{
    _nbCaseTouch = 0; // Initialisation des nombres de touches
    _isSunk = NO;
}

@end
