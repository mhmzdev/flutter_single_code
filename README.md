# Flutter Single Code Base
This repo is giving a minimal example of setting up and managing the single code for mobile, tablet and desktop in flutter.

| A complete guide is available in [architecture_guide.md](docs/architecture_guide.md)

## 📸 Video & Written Tutorial
- YouTube video series: https://youtu.be/_ZASShlSHs8. If you want to follow the progress, you can follow along the Parts branches given.
- Written tutorial: https://mhmzdev.medium.com/the-art-of-managing-single-code-base-flutter-part-01-80ab2ad2ad9d

<a href="https://youtube.com/happyfluttering"><img src="showcase/youtube.png" width="500" height="auto" alt="art of managing single code youtube"></a>

## Overview
It covers the flow as:
- ✅ Separate UI for each view
- ✅ Shared state/logic for all views - Single Source of Truth
- ✅ Platform specific UI and Functionality

<img src="showcase/overview.gif" width="800" height="auto" alt="overview">

## 🧱 Architecture
A screen structure would like this:
```
tasks/
├── tasks.dart           # Main screen entry point
├── _state.dart          # Shared state management
├── views/
│   ├── _desktop.dart    # Desktop-specific UI
│   ├── _mobile.dart     # Mobile-specific UI
│   └── _tablet.dart     # Tablet-specific UI
└── widgets/
    ├── _categories_list.dart
    ├── _task_details.dart
    └── _tasks_list.dart
```

## ➡️ Up next
Will be talking about following in coming tutorials:

- Managing single code via Monorepo architecture
- Modularization
- Melos package


## 🔑 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details

## 🙋‍♂️ Author
#### Muhammad Hamza
[![LinkedIn Link](https://img.shields.io/badge/Connect-Hamza-blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/mhmzdev)

You can also follow my GitHub Profile to stay updated about my latest projects:

[![GitHub Follow](https://img.shields.io/badge/Connect-Hamza-blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/mhmzdev)

If you liked the repo then kindly support it by giving it a star ⭐!

Copyright (c) 2025 MUHAMMAD HAMZA