//
//  NSObject+Swizzling.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

/**
 Swap two instance method's implementation in one class. Dangerous, be careful.
 
 @param originalSel   Selector 1.
 @param newSel        Selector 2.
 @return              YES if swizzling succeed; otherwise, NO.
 */
+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

/**
 Swap two class method's implementation in one class. Dangerous, be careful.
 
 @param originalSel   Selector 1.
 @param newSel        Selector 2.
 @return              YES if swizzling succeed; otherwise, NO.
 */
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;


#pragma mark - Associate value
///=============================================================================
/// @name Associate value
///=============================================================================

/**
 Associate one object to `self`, as if it was a strong property (strong, nonatomic).
 
 @param value   The object to associate.
 @param key     The pointer to get value from `self`.
 */
- (void)setAssociateValue:(nullable id)value withKey:(void *)key;

/**
 Associate one object to `self`, as if it was a weak property (week, nonatomic).
 
 @param value  The object to associate.
 @param key    The pointer to get value from `self`.
 */
- (void)setAssociateWeakValue:(nullable id)value withKey:(void *)key;

/**
 Get the associated value from `self`.
 
 @param key The pointer to get value from `self`.
 */
- (nullable id)getAssociatedValueForKey:(void *)key;

/**
 Remove all associated values.
 */
- (void)removeAssociatedValues;

/**
 *  @brief  交换一个类方法的实现
 *
 *  @param oldSelector  原类方法的实现
 *  @param newSelector  新类方法的实现
 */
+ (void)classSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 *  @brief 交换一个实例方法的实现
 *
 *  @param oldSelector  原实例方法的实现
 *  @param newSelector  新实例方法的实现
 */
+ (void)instanceSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 *  @brief  交换当前类方法的实现
 *
 *  @param oldSelector  原类方法的实现
 *  @param newSelector  新类方法的实现
 */
- (void)classSwizzle:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 *  @brief  交换当前类的实例方法的实现
 *
 *  @param oldSelector  原实例方法的实现
 *  @param newSElector  新实例方法的实现
 */
- (void)instanceSwizzle:(SEL)oldSelector newSelector:(SEL)newSElector;

@end
