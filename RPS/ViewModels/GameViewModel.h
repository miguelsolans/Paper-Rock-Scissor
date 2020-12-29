//
//  GameViewModel.h
//  RPS
//
//  Created by Miguel Solans on 29/12/2020.
//

#import <Foundation/Foundation.h>
#import "PlayerModel.h"
#import "GameChoices.h"

@interface GameViewModel : NSObject

@property (strong, nonatomic) PlayerModel *userModel;
@property (strong, nonatomic) PlayerModel *machineModel;

- (instancetype) init;
- (instancetype) initWithUserName: (NSString *) username;

- (void) setUsername: (NSString *) username;

- (void) playGame: (GameChoice) choice;
@end

