# UIKit Practice Repository

A hands-on iOS practice repository for learning UIKit, programmatic UI, table views, navigation, API integration, JSON parsing, and unit testing using Swift.

---

## Overview

This repository contains multiple UIKit practice projects and coding exercises.  
The main focus is learning iOS development using Swift and UIKit with real examples.

---

## Repository Structure

```text
├── CalculatorTest
│   ├── Calculator.swift
│   ├── CalculatorProtocol.swift
│   └── Unit Test Examples
│
├── MatrixController
│   ├── MatrixController.swift
│   └── Matrix Operation Examples
│
├── MobileApp
│   ├── Constants
│   │   └── APIConstants.swift
│   │
│   ├── Model
│   │   └── Product.swift
│   │
│   ├── View
│   │   └── ProductCell.swift
│   │
│   ├── Controller
│   │   └── ProductViewController.swift
│   │
│   ├── NetworkManager
│   │   └── NetworkManager.swift
│   │
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── Info.plist
│   ├── Assets.xcassets
│   └── LaunchScreen.storyboard
│
├── MyTableView
│   ├── Movie.swift
│   ├── MovieListViewController.swift
│   ├── MovieCell.swift
│   └── Assets.xcassets
│
├── MyTableView.xcodeproj
│
├── MyTableViewTests
│   └── Unit Tests
│
├── MyTableViewUITests
│   └── UI Tests
│
├── ProgramNavigUI
│   ├── HomeViewController.swift
│   ├── DetailViewController.swift
│   └── Programmatic Navigation Examples
│
└── MovieCellTableViewCell.swift
```

---

## Product API UIKit Project

The `MobileApp` folder contains a UIKit application that fetches smartphone product data from a public REST API and displays it in a `UITableView`.

### API Used

```text
https://dummyjson.com/products/category/smartphones
```

---

## Product API App Flow

API URL
   ↓
URLRequest
   ↓
URLSession.shared.dataTask
   ↓
JSON Data
   ↓
JSONDecoder
   ↓
ProductResponse Model
   ↓
Products Array
   ↓
UITableView reloadData
   ↓
ProductCell Configure
   ↓
Image URL
   ↓
UIImageView Extension
   ↓
URLSession Image Fetch
   ↓
Product List with Images

---

## Screenshots

### Product API Screen
<img width="295" height="640" alt="Simulator Screen Recording - iPhone 17 Pro - 2026-06-24 at 08 11 07" src="https://github.com/user-attachments/assets/e94c30c0-36b1-4072-999b-197a0820da8c" />



---

## Features

- UIKit Programmatic UI
- UITableView
- Custom UITableViewCell
- REST API Integration
- URLSession Networking
- JSON Parsing using Decodable
- Product Image Loading from URL
- UIImageView Extension for Reusable Image Fetching
- MVC Architecture
- Completion Handler
- @escaping Closure
- @Sendable Practice
- Navigation Controller
- Unit Testing Practice

---

## Concepts Practiced

### UIKit

- UIViewController
- UITableView
- UITableViewDataSource
- UITableViewCell
- UINavigationController
- Auto Layout
- Programmatic Constraints

### Networking

- URL
- URLRequest
- URLSession
- dataTask
- REST API
- JSONDecoder
- Decodable

### Swift

- Struct
- Class
- Protocol
- Singleton
- Closure
- @escaping
- @Sendable
- MVC
- ARC
- Memory Management

### Testing

- XCTest
- Unit Testing
- UI Testing

---

## Architecture

This project follows MVC architecture.

```text
Model
  ↓
Controller
  ↓
View
```

### View

ProductCell displays:

- Product Image
- Product Title
- Product Price
- Product Description

### Controller

`ProductViewController` fetches data and reloads the table view.

### Networking

- URL
- URLRequest
- URLSession
- dataTask
- REST API
- JSONDecoder
- Decodable
- Image Downloading
- UIImageView Extension
- Async Image Loading
---

## Getting Started

### Clone Repository

```bash
git clone https://github.com/NagaBhogadi/MobileApp.git
```

### Open Project

```bash
open MyTableView.xcodeproj
```

### Run App

```text
Command + R
```

### Run Tests

```text
Command + U
```

---

## Xcode Shortcuts Used

```text
Command + R        Run App
Command + .        Stop App
Shift + Command + K Clean Build Folder
Command + /        Comment or Uncomment
Control + I        Format Code
Shift + Command + Y Show Console
```

---

## Future Improvements

- Add product detail screen
- Add search functionality
- Add async/await networking
- Add image caching
- Add MVVM architecture
- Add pagination

---

## Author

**Naga Rajitha Bhogadi**

Learning iOS Development using Swift, UIKit, SwiftUI, Networking, and Testing.
