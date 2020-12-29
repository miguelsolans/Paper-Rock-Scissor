//
//  PlayerModel.m
//  RPS
//
//  Created by Miguel Solans on 29/12/2020.
//

#import "PlayerModel.h"

@implementation PlayerModel

- (instancetype) initWithName: (NSString*) name {
    self = [super init];
    
    if(!self) {
        self.playerName = name;
        self.victories = [[NSNumber alloc] initWithInt:0];
    }
    
    return self;
}

- (void) resetVictories {
    self.victories = @0;
}

- (void) win {
    int n = [self.victories intValue];
    n += 1;
    self.victories = [NSNumber numberWithInt: n];
}
@end
