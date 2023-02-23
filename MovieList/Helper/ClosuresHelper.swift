//
//  ClosuresHelper.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

public typealias BoolClosure = ((Bool) -> Void)
public typealias StringClosure = ((String) -> Void)
public typealias VoidClosure = (() -> Void)
public typealias IndexPathClosure = ((IndexPath) -> Void)
public typealias DecodableClosure<T: Decodable> = ((T) -> Void)
public typealias DoubleClosure = ((Double) -> Void)
public typealias IntClosure = ((Int) -> Void)
public typealias CGFloatClosure = ((CGFloat) -> Void)
