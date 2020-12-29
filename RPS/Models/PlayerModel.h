//
//  PlayerModel.h
//  RPS
//
//  Created by Miguel Solans on 29/12/2020.
//

#import <Foundation/Foundation.h>


@interface PlayerModel : NSObject

@property (nonatomic, strong) NSString *playerName;
@property (nonatomic, strong) NSNumber *victories;


- (instancetype) initWithName: (NSString*) name;


- (void) resetVictories;
- (void) win;

@end
