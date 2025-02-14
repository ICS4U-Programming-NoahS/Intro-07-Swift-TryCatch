//
// Try Catch.swift
//
// Created by Noah Smith
// Created on 2025-02-12
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The TryCatch program asks the user to enter a radius,
// then calculates and displays the sphere's volume with the given radius.
// It also includes a Try Catch to catch invalid input

// Import foundation library
import Foundation

// Define the different possible error types
enum InputError: Error {
    case invalidInput
    case negativeOrZeroRadius
}

// Catch invalid input
do {
    // Ask the user to enter the radius
    print("Enter the radius of a sphere: ")

    // typecast the radius from a string into a double
    if let radiusString = readLine(), let radius = Double(radiusString) {
        // Check user's radius to make sure it is greater than zero
        if radius <= 0 {
            // Catch invalid number for radius
            throw InputError.negativeOrZeroRadius
        } else {
            // Calculate volume
            let volume: Double = 4.0 / 3.0 * pow(radius, 3) * Double.pi

            // Display volume to the user, rounded to 2 decimal places
            print(
                ("The volume of the sphere with a radius of \(radius) is \(String(format: "%.2f", volume)).")
            )
        }
    } else {
        // Catches the invalid input
        throw InputError.invalidInput
    }
} catch InputError.invalidInput {
    // If user does not enter a number
    print("Please enter a number.")
} catch InputError.negativeOrZeroRadius {
    // If user does not enter a valid number
    print("Please enter a radius greater than or equal to zero.")
}
