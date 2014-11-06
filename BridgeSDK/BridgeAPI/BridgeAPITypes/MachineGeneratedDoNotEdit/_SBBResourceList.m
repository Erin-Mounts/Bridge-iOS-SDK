//
//  SBBResourceList.m
//
//  $Id$
//
// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SBBResourceList.h instead.
//

#import "_SBBResourceList.h"
#import "NSDate+SBBAdditions.h"

#import "SBBBridgeObject.h"

@interface _SBBResourceList()
@property (nonatomic, strong, readwrite) NSArray *items;

@end

/** \ingroup DataModel */

@implementation _SBBResourceList

- (id)init
{
	if((self = [super init]))
	{

	}

	return self;
}

#pragma mark Scalar values

- (int64_t)totalValue
{
	return [self.total longLongValue];
}

- (void)setTotalValue:(int64_t)value_
{
	self.total = [NSNumber numberWithLongLong:value_];
}

#pragma mark Dictionary representation

- (id)initWithDictionaryRepresentation:(NSDictionary *)dictionary
{
	if((self = [super initWithDictionaryRepresentation:dictionary]))
	{

        self.total = [dictionary objectForKey:@"total"];

		for(id objectRepresentationForDict in [dictionary objectForKey:@"items"])
		{

 			SBBBridgeObject *itemsObj = [[SBBBridgeObject alloc] initWithDictionaryRepresentation:objectRepresentationForDict];

			[self addItemsObject:itemsObj];
		}
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[super dictionaryRepresentation]];

    [dict setObjectIfNotNil:self.total forKey:@"total"];

    if([self.items count] > 0)
	{

		NSMutableArray *itemsRepresentationsForDictionary = [NSMutableArray arrayWithCapacity:[self.items count]];
		for(SBBBridgeObject *obj in self.items)
		{
			[itemsRepresentationsForDictionary addObject:[obj dictionaryRepresentation]];
		}
		[dict setObjectIfNotNil:itemsRepresentationsForDictionary forKey:@"items"];

	}

	return dict;
}

- (void)awakeFromDictionaryRepresentationInit
{
	if(self.sourceDictionaryRepresentation == nil)
		return; // awakeFromDictionaryRepresentationInit has been already executed on this object.

	for(SBBBridgeObject *itemsObj in self.items)
	{
		[itemsObj awakeFromDictionaryRepresentationInit];
	}

	[super awakeFromDictionaryRepresentationInit];
}

#pragma mark Direct access

- (void)addItemsObject:(SBBBridgeObject*)value_ settingInverse: (BOOL) setInverse
{
    if(self.items == nil)
	{

		self.items = [NSMutableArray array];

	}

	[(NSMutableArray *)self.items addObject:value_];
	if (setInverse == YES) {
	    [value_ setResourceList: (SBBResourceList*)self settingInverse: NO];
	}
}
- (void)addItemsObject:(SBBBridgeObject*)value_
{
    [self addItemsObject:(SBBBridgeObject*)value_ settingInverse: YES];
}

- (void)removeItemsObjects
{

	self.items = [NSMutableArray array];

}

- (void)removeItemsObject:(SBBBridgeObject*)value_ settingInverse: (BOOL) setInverse
{
    if (setInverse == YES) {
        [value_ setResourceList: nil settingInverse: NO];
    }
    [(NSMutableArray *)self.items removeObject:value_];
}

- (void)removeItemsObject:(SBBBridgeObject*)value_
{
    [self removeItemsObject:(SBBBridgeObject*)value_ settingInverse: YES];
}

- (void)insertObject:(SBBBridgeObject*)value inItemsAtIndex:(NSUInteger)idx {
    [self insertObject:value inItemsAtIndex:idx settingInverse:YES];
}

- (void)insertObject:(SBBBridgeObject*)value inItemsAtIndex:(NSUInteger)idx settingInverse:(BOOL)setInverse {

    [(NSMutableArray *)self.items insertObject:value atIndex:idx];
    if (setInverse == YES) {
    [value setResourceList:(SBBResourceList*)self settingInverse: NO];
    }
}

- (void)removeObjectFromItemsAtIndex:(NSUInteger)idx {
    [self removeObjectFromItemsAtIndex:idx settingInverse:YES];
}

- (void)removeObjectFromItemsAtIndex:(NSUInteger)idx settingInverse:(BOOL)setInverse {
    SBBBridgeObject *object = [self.items objectAtIndex:idx];
    [self removeItemsObject:object settingInverse:YES];
}

- (void)insertItems:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self insertItems:value atIndexes:indexes settingInverse:YES];
}

- (void)insertItems:(NSArray *)value atIndexes:(NSIndexSet *)indexes settingInverse:(BOOL)setInverse {
    [(NSMutableArray *)self.items insertObjects:value atIndexes:indexes];
    if (setInverse == YES) {
        for (SBBBridgeObject* object in value) {
            [object setResourceList:(SBBResourceList*)self settingInverse: NO];
        }
    }
}

- (void)removeItemsAtIndexes:(NSIndexSet *)indexes {
    [self removeItemsAtIndexes:indexes settingInverse:YES];
}

- (void)removeItemsAtIndexes:(NSIndexSet *)indexes settingInverse:(BOOL)setInverse {
    if (setInverse == YES) {
    NSArray *objectsRemoved = [(NSMutableArray *)self.items objectsAtIndexes:indexes];
        for (SBBBridgeObject* object in objectsRemoved) {
            [object setResourceList:nil settingInverse: NO];
        }
    }
    [(NSMutableArray *)self.items removeObjectsAtIndexes:indexes];
}

- (void)replaceObjectInItemsAtIndex:(NSUInteger)idx withObject:(SBBBridgeObject*)value {
    [self replaceObjectInItemsAtIndex:idx withObject:value settingInverse:YES];
}

- (void)replaceObjectInItemsAtIndex:(NSUInteger)idx withObject:(SBBBridgeObject*)value settingInverse:(BOOL)setInverse {
    if (setInverse == YES) {
    SBBBridgeObject* objectReplaced = [(NSMutableArray *)self.items objectAtIndex:idx];
    [objectReplaced setResourceList:nil settingInverse: NO];
    [value setResourceList:(SBBResourceList*)self settingInverse: NO];
    }
    [(NSMutableArray *)self.items replaceObjectAtIndex:idx withObject:value];
}

- (void)replaceItemsAtIndexes:(NSIndexSet *)indexes withItems:(NSArray *)value {
    [self replaceItemsAtIndexes:indexes withItems:value settingInverse:YES];
}

- (void)replaceItemsAtIndexes:(NSIndexSet *)indexes withItems:(NSArray *)value settingInverse:(BOOL)setInverse {
    if (setInverse == YES) {
    NSArray *objectsReplaced = [(NSMutableArray *)self.items objectsAtIndexes:indexes];
        for (SBBBridgeObject* object in objectsReplaced) {
            [object setResourceList:nil settingInverse: NO];
        }
        for (SBBBridgeObject* object in value) {
            [object setResourceList:(SBBResourceList*)self settingInverse: NO];
        }
    }
    [(NSMutableArray *)self.items replaceObjectsAtIndexes:indexes withObjects:value];
}

@end
