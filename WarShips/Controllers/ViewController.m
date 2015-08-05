//
//  ViewController.m
//  WarShips
//
//  Created by Thibault Le Cornec on 04/08/15.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "ViewController.h"
#import "ShipButton.h"
#import "DataManager.h"

#define DEBUG 1

@interface ViewController ()
    @property DataManager *sharedDataManager;
@end

@implementation ViewController
@synthesize sharedDataManager, labelNbShots, labelNbPartsOfShipsTouched, labelNbShipsSunken, allButtons;

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        sharedDataManager = [DataManager sharedDataManager];
        nbShots = 0;
        nbPartsOfShipsTouched = 0;
        nbShipsSunken = 0;
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateLabels];
    NSArray *indexesOfShipsPlaces = [sharedDataManager getAllIndexesForAllShips];
    
    [self setButtonsAtIndexes:indexesOfShipsPlaces];
}


- (void)updateLabels
{
    [labelNbShots setText:[NSString stringWithFormat:@"Nombre de tirs : %d", nbShots]];
    [labelNbPartsOfShipsTouched setText:[NSString stringWithFormat:@"Touchés : %d", nbPartsOfShipsTouched]];
    [labelNbShipsSunken setText:[NSString stringWithFormat:@"Coulés : %d", nbShipsSunken]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*!
 *  @author Thibault Le Cornec
 *  
 *  @brief  Method called when user touch a button
 *
 *  @param sender The button touched
 */
- (IBAction)fireOnIndex:(id)sender
{
    nbShots++;
    
    if ([sender isThereAShip])
    {
        nbPartsOfShipsTouched++;
        
        // Récupération de l'index du bouton touché
        NSUInteger indexOfTheButton = [allButtons indexOfObject:sender];
        
        // Si le bâteau est coulé on reçoit le tableau des index où il est présent.
        // Sinon on reçoit nil.
        NSArray *indexesOfShipPlaces = [sharedDataManager shipTouch:indexOfTheButton];
        
        if (indexesOfShipPlaces != nil) // Le bâteau a été coulé
        {
            nbShipsSunken++;

            // Toutes les cases du bateau deviennent rouges
            for (NSUInteger i =0; i < [indexesOfShipPlaces count]; i++)
            {
                NSUInteger index = [[indexesOfShipPlaces objectAtIndex:i] integerValue];
                ShipButton *button = [allButtons objectAtIndex:index];
                [button setBackgroundColor:[UIColor colorWithRed:0.8 green:0.11 blue:0 alpha:1]];
            }
            
            BOOL isEndOfGame = [sharedDataManager isEndOfGame];
            
            if (isEndOfGame)
            {
                NSString *messageWinner = [NSString stringWithFormat:@"Vous avez trouvé tout les bateaux !\nVotre score : %d", nbShots];
                UIAlertView *win = [[UIAlertView alloc] initWithTitle:@"Bravo !" 
                                                              message:messageWinner 
                                                             delegate:nil 
                                                    cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
                [win show];
                [self newGame];
            }
        }
        else
        {
            // Bâteau touché mais pas coulé = case orange
            [sender setBackgroundColor:[UIColor colorWithRed:1 green:0.58 blue:0 alpha:1]];
        }
    }
    else
    {
        // Aucun bâteau touché = case bleu clair
        [sender setBackgroundColor:[UIColor colorWithRed:0.02 green:0.59 blue:1 alpha:1]];
    }
    
    [self updateLabels];
    // Désactivation du bouton pour que l'utilisateur ne puisse "tirer" 2 fois au même endroit
    [sender setEnabled:NO];
}


- (IBAction)newGame
{
    [sharedDataManager reset];
    
    nbShots = 0;
    nbPartsOfShipsTouched = 0;
    nbShipsSunken = 0;
    
    [self updateLabels];
    
    NSArray *indexesOfShipsPlaces = [sharedDataManager getAllIndexesForAllShips];
    [self resetButtons];
    [self setButtonsAtIndexes:indexesOfShipsPlaces];
}


-(void)resetButtons
{
    for (ShipButton *button in allButtons)
    {
        [button setIsThereAShip:NO];
        [button setBackgroundColor:[UIColor colorWithRed:0 green:0.29 blue:0.55 alpha:1]];
    }
}


-(void)setButtonsAtIndexes:(NSArray*)indexesOfShips
{
     for (NSUInteger i =0; i < [indexesOfShips count]; i++)
     {
         NSUInteger index = [[indexesOfShips objectAtIndex:i] integerValue];
         ShipButton *button = [allButtons objectAtIndex:index];
         [button setIsThereAShip:YES];
         
         if (DEBUG)
         {
             [button setBackgroundColor:[UIColor colorWithRed:1 green:0.58 blue:0 alpha:1]];
         }
     } 
}

@end
