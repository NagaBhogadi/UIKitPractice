# 📱 MobileApp

A clean and modern iOS application built with **UIKit** using **Programmatic Auto Layout** and the **MVVM Architecture**. The app fetches smartphone products from the DummyJSON REST API and displays them in a responsive table view with asynchronous image loading.

---

# ✨ Features

* 📱 Display smartphone products
* 🌐 REST API Integration using URLSession
* 🏗️ MVVM Architecture
* 🧩 Dependency Injection
* 📦 Codable JSON Parsing
* 🖼️ Asynchronous Image Loading
* 📋 Custom UITableViewCell
* 🎯 Programmatic UIKit (No Storyboards)
* ⏳ Activity Indicator while loading data
* 🧹 Clean Code with MARK sections
* ♻️ Reusable Components

---

# 📸 Screenshots

<img width="300" height="700" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-25 at 10 36 47" src="https://github.com/user-attachments/assets/79a6b9fb-0fd9-452b-8286-e40a01e2a3d3" />

---

# 🛠️ Tech Stack

| Technology            | Description              |
| --------------------- | ------------------------ |
| Swift                 | Programming Language     |
| UIKit                 | User Interface Framework |
| MVVM                  | Architecture Pattern     |
| URLSession            | Networking               |
| Codable               | JSON Parsing             |
| Auto Layout           | Programmatic Constraints |
| UITableView           | Product Listing          |
| UIImageView Extension | Image Downloading        |
| Dependency Injection  | Loose Coupling           |

---

# 📂 Project Structure

```text
MobileApp
│
├── Constants
│   └── APIConstants.swift
│
├── Models
│   └── Product.swift
│
├── ViewModels
│   └── ProductViewModel.swift
│
├── Views
│   └── ProductCell.swift
│
├── Controllers
│   └── ProductViewController.swift
│
├── Network
│   └── NetworkManager.swift
│
├── Extensions
│   └── UIImageView+Extension.swift
│
├── Assets.xcassets
├── AppDelegate.swift
└── SceneDelegate.swift
```

---

# 🔄 Application Flow

```text
App Launch
      │
      ▼
SceneDelegate
      │
      ▼
ProductViewController
      │
      ▼
ProductViewModel
      │
      ▼
NetworkManager
      │
      ▼
DummyJSON REST API
      │
      ▼
JSON Response
      │
      ▼
Codable Decoding
      │
      ▼
Product Model
      │
      ▼
ViewModel Stores Data
      │
      ▼
UITableView Reload
      │
      ▼
Display Products
```

---

# 🌐 API

Endpoint:

```text
https://dummyjson.com/products/category/smartphones
```

---

# 🧠 Concepts Practiced

* MVVM Architecture
* Protocol-Oriented Programming
* Dependency Injection
* URLSession Networking
* Codable
* Auto Layout
* UITableView
* UITableViewCell
* Async Image Loading
* Extensions
* Singleton Pattern
* Activity Indicator
* Memory Management (`weak self`)
* Programmatic UIKit

---

# 🚀 Future Improvements

* 🔍 Product Search
* ❤️ Favorites
* 📄 Product Detail Screen
* 🗂️ Category Filtering
* 💾 Offline Caching
* 🔄 Pull to Refresh
* 📖 Pagination
* 🧪 Unit Testing
* ⚡ Swift Concurrency (async/await)

---

# 👩‍💻 Author

**Naga Rajitha Bhogadi**

Passionate iOS Developer focused on building scalable, maintainable, and user-friendly iOS applications using UIKit and modern software design principles.
