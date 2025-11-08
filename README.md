# Six Am Tech Task - Flutter App

A cross-platform Flutter application demonstrating a food ordering interface with campaigns, categories, and popular food sections. Built with GetX for state management and clean, modular architecture.


## Features

- **Banner & Search**: Carousel banner with a custom search bar.  
- **Category Section**: Displays food categories dynamically from API.  
- **Campaign Section**: Fetch and display food campaigns with variations, add-ons, and discounts.  
- **Popular Food Nearby**: Shows popular food items with real-time data from API.  
- **UI Enhancements**:  
  - Custom cards for categories, campaigns, and food items.  
  - Skeleton loaders with shimmer effect during API calls.  
  - Responsive font and UI using `FontConstants`, `TextSize`, and `ResponsiveScale`.  
- **State Management**: GetX for controllers and reactive UI updates.  
- **Network Handling**: Dio with PrettyDioLogger for API calls and error handling.  
- **Permissions**: INTERNET and ACCESS_NETWORK_STATE added for network operations.  

---

## Screenshots

*(Add screenshots here once available)*

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/YourUsername/six_am_tech_task.git
 
  
## Structure
  ```bash
  lib/
  ├── controllers/        # GetX controllers for state management
  ├── models/             # Data models for API responses
  ├── repository/         # API integration and data fetching
  ├── screens/            # UI screens
  ├── widgets/            # Reusable widgets
  └── utils/              # App constants, colors, and responsive sizing



