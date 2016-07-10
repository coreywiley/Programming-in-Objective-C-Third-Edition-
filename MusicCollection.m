//
//  MusicCollection.m
//  prog1
//
//  Created by Corey Wiley on 7/6/16.
//  Copyright © 2016 Corey Wiley. All rights reserved.
//

#import "MusicCollection.h"
#import "PlayList.h"
#import "Song.h"





@implementation MusicCollection

@synthesize musicCollection, name, library;

-(id) init
{
    return [self initWithName:@"NoName"];
}

-(id) initWithName:(NSString *)theName
{
    self = [super init];
    if (self)
    {
        name = [[NSString alloc]initWithString:theName];
        musicCollection = [[NSMutableArray alloc]init];
        library = [[PlayList alloc]initWithName:@"Library" andIsDeletable:NO];
        [musicCollection addObject:library];
    }
    
    return self;
}


-(void) removePlayList:(NSString *)thePlaylist
{
    for (int i = 0; i < musicCollection.count; i++) {
        if ([thePlaylist compare:[musicCollection[i] name]] == NSOrderedSame && [musicCollection[i] deletable] == YES) {
            [musicCollection removeObject:musicCollection[i]];
        }
    }
}


-(NSUInteger) searchForPlaylist:(NSString *) playListName
{

    NSUInteger index = -1;
    
    for (PlayList *aPlaylist in musicCollection) {
        if ([playListName compare:[aPlaylist name]] == NSOrderedSame){
            index = [musicCollection indexOfObject:aPlaylist];
        }
    }
    
    return index;
}

-(NSUInteger) searchForSong:(NSString *)songName
{
 
    NSUInteger index = -1;
    for (Song *aSong in library.playList) {
        if ([songName compare:[aSong title]] == NSOrderedSame){
            index = [library.playList indexOfObject:aSong];
            return index;
        }
    }
    
    return index;
}


-(void) listPlayLists
{
    
    NSLog(@"======== PlayLists of: %@ ========", name);
    for (PlayList *list in musicCollection) {
        NSLog(@"%s", [list.name UTF8String]);
    }
    NSLog(@"======================================");
    
}


-(void) listSongsInLibrary
{
    [library listAll];
}


-(void) listSongsInPlaylist:(NSString *)thePlaylist
{
    
    NSUInteger index = [self searchForPlaylist:thePlaylist];
    PlayList *returnedPlaylist = [musicCollection objectAtIndex:index];
    [returnedPlaylist listAll];
}

-(void) addSong:(NSString *)theSong toPlaylist:(NSString *)thePlaylist
{
    
    
    if([self searchForSong:theSong] == -1)
    {
        NSLog(@"Song does not exist");
        return;
    }
    
    
    if ([self searchForPlaylist:thePlaylist] == -1) {
        [self createPlayListWithName:thePlaylist];
    }
    
    PlayList *newPlaylist = [musicCollection objectAtIndex:[self searchForPlaylist:thePlaylist]];
    Song *newSong = [library.playList objectAtIndex:[self searchForSong:theSong]];
    
    
    [newPlaylist addSong:newSong];
    
}

-(void) removeSong:(NSString *)theSong fromPlaylist:(NSString *)thePlaylist
{
    
    if ([self searchForSong:theSong] == -1 || [self searchForPlaylist:thePlaylist] == -1) {
        NSLog(@"Either the song or playlist does not exist");
    }
    
    PlayList *newPlaylist = [musicCollection objectAtIndex:[self searchForPlaylist:thePlaylist]];
    
    for (Song *song in newPlaylist.playList) {
        if ([[song title] compare:theSong] == NSOrderedSame) {
            NSUInteger index = [newPlaylist.playList indexOfObject:song];
            [newPlaylist.playList removeObjectAtIndex:index];
        }
    }
    
}


-(void) removeSongFromLibrary:(NSString *)theSong
{
    
    NSUInteger indexOfObject;
    
    for (PlayList *list in musicCollection) {
        for (int i = 0; i < list.count; i++) {
            if ([[list.playList[i] title] compare:theSong] == NSOrderedSame)
            {
                indexOfObject = [list.playList indexOfObject:list.playList[i]];
                [list.playList removeObjectAtIndex:indexOfObject];
            }
        }
    }
}


-(void) createPlayListWithName:(NSString *)theName
{
    BOOL isDeletable = YES;
    if ([self searchForPlaylist:theName] != -1) {
        return;
    }
    else
    {
        
        if ([theName isEqualToString:@"Library"]) {
            isDeletable = NO;
        }
        
        PlayList *newPlaylist = [[PlayList alloc]initWithName:theName andIsDeletable:isDeletable];
        [musicCollection addObject:newPlaylist];
    }
    
    
}



-(void) createSongWithTitle:(NSString *)theTitle andArtist:(NSString *)theArtist andAlbum:(NSString *)theAlbum andDuration:(NSString *)theDuration inPlayList:(NSString*)thePlaylist
{
    
    if ([self searchForSong:theTitle] == -1) {
        Song *newSong = [[Song alloc]initSongTitle:theTitle andArtist:theArtist andAlbum:theAlbum andDuration:theDuration];
        [library addSong:newSong];
    }

    if ([thePlaylist isNotEqualTo:@"Library"] && [thePlaylist isNotEqualTo:@"library"] && [thePlaylist isNotEqualTo: nil]) {
        [self addSong:theTitle toPlaylist:thePlaylist];
    }
    
}



@end
