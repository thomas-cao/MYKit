//
//  NSObject+Swizzling.m
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

- (void)setAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAssociateWeakValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

- (id)getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

/**
 *  @brief  交换实例方法的实现
 *
 *  @param cls         类
 *  @param oldSelector
 *  @param newSelector
 */
+ (void)instanceSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    Method oldMethod = class_getInstanceMethod(cls, oldSelector);
    Method newMethod = class_getInstanceMethod(cls, newSelector);
    
    if (class_addMethod(cls, oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls, newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

/**
 *  @brief  交换类方法的实现
 *
 *  @param cls         类
 *  @param oldSelector
 *  @param newSelector
 */
+ (void)classSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    cls = object_getClass(cls);
    [NSObject instanceSwizzle:cls oldSelector:oldSelector newSelector:newSelector];
}

- (void)instanceSwizzle:(SEL)oldSelector newSelector:(SEL)newSElector {
    [NSObject instanceSwizzle:[self class] oldSelector:oldSelector newSelector:newSElector];
}

- (void)classSwizzle:(SEL)oldSelector newSelector:(SEL)newSelector {
    [NSObject classSwizzle:[self class] oldSelector:oldSelector newSelector:newSelector];
}

@end
