//
//  DTWorld.h
//  Deathtroid
//
//  Created by Per Borgman on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTMap, DTLevel, Vector2, DTEntity, DTServer;

@interface DTTraceResult : NSObject
-(id)initWithX:(BOOL)_x y:(BOOL)_y entity:(DTEntity*)_entity collisionPosition:(Vector2*)colPos velocity:(Vector2*)_velocity;
@property (nonatomic) BOOL x, y;
@property (nonatomic,strong) DTEntity *entity;
@property (nonatomic,strong) Vector2 *collisionPosition;
@property (nonatomic,strong) Vector2 *velocity;   // Entity's velocity at impact
@end

@interface DTWorld : NSObject

-(id)initWithLevel:(DTLevel*)_level;

-(DTTraceResult*)traceBox:(Vector2*)box from:(Vector2*)from to:(Vector2*)to exclude:(DTEntity*)exclude;
-(DTTraceResult*)traceBox:(Vector2*)box from:(Vector2*)from to:(Vector2*)to exclude:(DTEntity*)exclude inverted:(BOOL)inverted;
-(DTTraceResult*)traceBoxStep:(Vector2*)position size:(Vector2*)size vx:(float)vx vy:(float)vy map:(DTMap*)map exclude:(DTEntity*)exclude inverted:(BOOL)inverted;

-(BOOL)boxCollideBoxA:(Vector2*)boxA sizeA:(Vector2*)sizeA boxB:(Vector2*)boxB sizeB:(Vector2*)sizeB;

@property (nonatomic,weak) DTServer *server; // nil if world is on client
@property (nonatomic,weak) DTLevel *level;

@end
