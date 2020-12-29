//
//  GameViewModel.m
//  RPS
//
//  Created by Miguel Solans on 29/12/2020.
//

#import "GameViewModel.h"
#import "GameChoices.h"

@implementation GameViewModel

- (instancetype) init {
    self = [super init];
    
    if(!self) {
        self.machineModel = [[PlayerModel alloc] initWithName:@"Machine"];
        self.userModel = [[PlayerModel alloc] initWithName:@"User"];
    }
    return self;
}

- (instancetype) initWithUserName: (NSString *) username {
    self = [super init];
    
    if(!self) {
        self.machineModel = [[PlayerModel alloc] initWithName:@"Machine"];
        self.userModel = [[PlayerModel alloc] initWithName:username];
    }
    return self;
}

- (void) setUsername: (NSString *) username {
    self.userModel.playerName = username;
}

- (void) resetGame {
    [self.machineModel resetVictories];
    [self.userModel resetVictories];
}

- (void) playGame: (GameChoice) choice {
    NSLog(@"Starting game...");
    NSInteger number = arc4random_uniform((uint32_t)(3));
    GameChoice machineChoice = number;
    
    if(machineChoice == choice) {
        NSLog(@"It's a tie");
        [self postNotification:@"aTie" choiceNumber:number];
    } else {
        switch (choice) {
            case ROCK:
                if(machineChoice == SCISSOR) {
                    // User Wins
                    NSLog(@"User Wins");
                    
                    [self.userModel win];
                    [self postNotification:@"userWon" choiceNumber:number];
                } else {
                    // User Loses
                    NSLog(@"User Loses");
                    
                    [self.machineModel win];
                    [self postNotification:@"machineWon" choiceNumber:number];
                }
                break;
            case PAPER:
                if(machineChoice == ROCK) {
                    // User Wins
                    NSLog(@"User Wins");
                    
                    [self.userModel win];
                    [self postNotification:@"userWon" choiceNumber:number];
                } else {
                    // User Loses
                    NSLog(@"User Loses");
                    
                    [self.machineModel win];
                    [self postNotification:@"machineWon" choiceNumber:number];
                    
                }
                break;
            case SCISSOR:
                if(machineChoice == PAPER) {
                    // User Wins
                    NSLog(@"User Wins");
                    
                    [self.userModel win];
                    [self postNotification:@"userWon" choiceNumber:number];
                } else {
                    // User Loses
                    NSLog(@"User Loses");
                    
                    [self.machineModel win];
                    [self postNotification:@"machineWon" choiceNumber:number];
                }
                break;
        }
    }
    
}

- (void) postNotification: (NSString *) notificationName choiceNumber: (NSInteger) number {
    NSNumber *n = [NSNumber numberWithInteger:number];
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    
    [notification postNotificationName:notificationName object:n];
    
}

@end
