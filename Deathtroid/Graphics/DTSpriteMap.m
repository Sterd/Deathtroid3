//
//  DTSpriteMap.m
//  Deathtroid
//
//  Created by Patrik Sjöberg on 2011-10-09.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DTSpriteMap.h"
#import "DTTexture.h"

@interface DTSpriteMap ()
@property (nonatomic) CGSize imageSize;
@property (nonatomic, readwrite) CGSize frameSize;
@property (nonatomic, readwrite) NSInteger frameCount;

@property (nonatomic, strong) DTTexture *texture;
@end


@implementation DTSpriteMap
@synthesize frameCount;
@synthesize imageSize, frameSize;
@synthesize texture;

-(id)initWithResourceId:(NSString *)resourceId Texture:(DTTexture *)_texture frameSize:(CGSize)_frameSize frameCount:(int)_frameCount;
{
	if(!(self = [self initWithResourceId:resourceId])) return nil;
	
	self.texture = _texture;
	self.frameSize = _frameSize;
    self.frameCount = _frameCount;
	self.imageSize = texture.pixelSize;
	return self;
}

-(DTSpriteMapFrame)frameAtIndex:(NSInteger)frameIndex
{
	float cWidth = frameSize.width / imageSize.width;
	float cHeight = frameSize.height / imageSize.height;
	
	float top = 0; //TODO: maps with several rows
	float left = frameIndex * cWidth;
	float bottom = cHeight;
	float right = left + cWidth;
	DTSpriteMapFrame frame;
	
	frame.nr = (int)frameIndex;
	frame.coords[0].x = left;
	frame.coords[0].y = top;
	frame.coords[1].x = left;
	frame.coords[1].y = bottom;
	frame.coords[2].x = right;
	frame.coords[2].y = bottom;
	frame.coords[3].x = right;
	frame.coords[3].y = top;
	return frame;
}

@end


@interface DTSpriteMapLoader : DTResourceLoader
@end

@implementation DTSpriteMapLoader
+(void)load{
	[DTResourceManager registerResourceLoader:self withTypeName:@"spritemap"];
}

- (id<DTResource>)createResourceWithManager:(DTResourceManager *)manager
{
    return [[DTSpriteMap alloc] initWithResourceId:self.path.dt_resourceId];
}

- (BOOL)loadResource:(DTSpriteMap *)map usingManager:(DTResourceManager *)manager error:(NSError *__autoreleasing *)error
{
	NSArray *sizes = [self.definition objectForKey:@"frameSize"];
	CGSize frameSize = CGSizeMake([[sizes objectAtIndex:0] floatValue], [[sizes objectAtIndex:1] floatValue]);
    NSString* numFrames = [self.definition objectForKey:@"frameCount"];
    
	DTTexture *texture = [manager textureNamed:[self.definition objectForKey:@"texture"]];
    
    map.texture = texture;
    map.frameSize = frameSize;
    map.frameCount = [numFrames intValue];
    map.imageSize = texture.pixelSize;
    return YES;
}

@end




@implementation DTResourceManager (DTSpriteMap)
-(DTSpriteMap *)spriteMapNamed:(NSString *)name;{
	return [self resourceNamed:name];
}
@end