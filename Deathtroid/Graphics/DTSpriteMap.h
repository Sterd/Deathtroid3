//
//  DTSpriteMap.h
//  Deathtroid
//
//  Created by Patrik Sjöberg on 2011-10-09.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DTResource.h"
#import "Vector2.h"

typedef struct {
	int nr;			 // the frame number
	Vec2 coords[4]; // texture coords for each corner in counter clockwise order
} DTSpriteMapFrame;

@class DTTexture;

@interface DTSpriteMap : DTResource
@property (nonatomic, readonly) NSInteger frameCount;
@property (nonatomic, strong, readonly) DTTexture *texture;
@property (nonatomic, readonly) CGSize frameSize;

-(DTSpriteMapFrame)frameAtIndex:(NSInteger)frameIndex;
@end


@interface DTResourceManager (DTSpriteMap)
-(DTSpriteMap *)spriteMapNamed:(NSString *)name;
@end