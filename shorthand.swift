#!/usr/bin/env xcrun swift
 
// Test-case for experimental shorthand syntax sugaring in swiftc
// TODO: add AST checks

import Foundation

func gen() -> String? {
  let x = arc4random_uniform(10)
  return x % 2 == 0 ? "string2" : nil;
}

var x = gen()
let xxx = gen()

//if let xxx = xxx {
//  print("normal\(xxx)")
//}

if let! xxx {
  print("let: \(xxx)")
}


if var! x {
  x = "value"		// new value
  print("var: \(x)")
}

