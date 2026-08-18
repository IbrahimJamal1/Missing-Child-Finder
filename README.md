# 🛡️ AI-SafeTrack

**AI-SafeTrack** is a Flutter-based mobile safety application designed to help users report, track, and locate missing people, identify found persons, and report accidents.

The application combines **location services, interactive maps, QR codes, image-based identification, and emergency reporting** into one simple and user-friendly mobile application.

---

## 📱 Project Overview

AI-SafeTrack aims to provide a digital platform that helps communities respond faster to missing-person cases and emergency situations.

The application allows users to:

* Report missing persons.
* Report found persons.
* View and track reported cases.
* Display locations on an interactive map.
* Generate and scan QR codes.
* Share important information about a person.
* Report accidents and emergency situations.
* View detailed information about reported cases.
* Locate reported people using geographical coordinates.

---

## 🎯 Project Goals

The main goals of AI-SafeTrack are:

* 🚨 Improve the process of reporting missing persons.
* 📍 Help users locate reported cases.
* 🗺️ Provide an interactive map for locations.
* 👤 Store and display information about reported people.
* 📱 Provide a simple and accessible mobile experience.
* ⚡ Make emergency reporting faster.
* 🔍 Help identify found persons.
* 🔐 Provide a structured and secure user experience.

---

# ✨ Main Features

## 👤 Missing Person Reports

Users can create reports containing information about a missing person.

A report can include:

* Person's name
* Age
* Personal image
* Description
* Phone number
* Last seen location
* Last seen date/time
* Current report status
* Location coordinates
* Reporter information

Example information:

```text
Name: Ahmed Mohamed
Age: 12
Status: Missing
Last Seen: Quesna
Phone: 01XXXXXXXXX
Description: Wearing a blue shirt and black pants
```

---

## 🔎 Found Person Reports

Users can also report a person who has been found.

The application can display the person's:

* Image
* Name
* Age
* Description
* Location
* Contact information
* Report status

This helps connect found-person reports with missing-person cases.

---

# 🗺️ Interactive Maps

AI-SafeTrack includes an interactive map to display reported locations.

The map can be used to:

* View reported cases.
* Display the last known location.
* Show markers on the map.
* Select a specific location.
* Navigate between different locations.

### Technologies

* Flutter Map
* Geolocation
* Latitude & Longitude
* Location services

Example:

```text
Latitude: 30.123456
Longitude: 31.234567
```

---

# 📍 Location Services

The application uses geographical coordinates to identify the location of reported cases.

Location information can be associated with:

* Missing person reports
* Found person reports
* Accident reports
* Last seen locations

The application works with:

```text
Latitude
Longitude
Location Name
```

---

# 🧭 Location Selection

Users can select or display a location through the interactive map.

The selected location can then be associated with a report.

This makes it easier to identify where:

* A person was last seen.
* A person was found.
* An accident occurred.

---

# 📷 QR Code System

AI-SafeTrack includes a QR Code system to provide quick access to important information.

## Generate QR Code

Users can create a QR code containing information related to a person or report.

The QR code can be:

* Generated inside the application.
* Displayed to the user.
* Used for quick identification.

## Scan QR Code

Users can scan a QR code to quickly access the associated information.

This can reduce the time needed to manually search for a report.

---

# 🚨 Accident Reporting

AI-SafeTrack also provides functionality for reporting accidents and emergency situations.

Users can provide information such as:

* Accident location
* Description
* Date/time
* Contact information
* Additional details

The location can be displayed on the map to help identify where the incident occurred.

---

# 🖼️ Person Profiles

The application provides detailed information about reported people.

When the user selects a person's image or report, they can open a detailed profile containing information such as:

```text
Person Name
Age
Status
Description
Phone Number
Location
Last Seen
Report Date
```

---

# 📊 Report Status

Reports can have different statuses depending on the current situation.

Examples:

```text
Missing
Found
Resolved
```

The status helps users understand the current state of a report.

---

# 📞 Emergency Contact

The application can provide contact information associated with reports.

Users can use the available phone number to contact the reporter or relevant person.

---

# 🎨 User Interface

AI-SafeTrack focuses on creating a simple and modern interface that makes important safety features easy to access.

The design uses a safety-oriented visual identity based around:

* 🛡️ Shield
* 📍 Location Pin
* 👤 Human Silhouette
* 🔍 Search
* 🚨 Emergency

### Main Colors

```text
Primary: Deep Blue
Secondary: Cyan
Background: White
```

The interface is designed to communicate:

**Safety + Location + Emergency + Trust**

---

# 📱 Main Screens

The application contains several screens and components, including:

### Welcome Screen

The initial screen that introduces the application to the user.

It provides access to the main functionality of the application.

### Home Screen

The main application dashboard where users can access different safety features.

### Missing Person Screen

Displays missing-person reports.

### Person Details Screen

Displays complete information about a selected person.

### Map Screen

Displays locations and reported cases on an interactive map.

### QR Code Screen

Allows users to generate or work with QR codes.

### Accident Reporting Screen

Allows users to report accidents and emergency situations.

---

# 🏗️ Flutter Architecture

The project follows a **Feature-First** folder structure to keep the application organized and scalable.

Example:

```text
lib/
│
├── core/
│   ├── theme/
│   ├── constants/
│   ├── utils/
│   └── ...
│
├── features/
│   │
│   ├── loading/
│   ├── home/
│   ├── reports/
│   ├── map/
│   ├── qr/
│   ├── profile/
│   └── ...
│
└── main.dart
```

Each feature contains its own screens, widgets, and related components.

---

# 🛠️ Technologies & Packages

## Flutter

The application is developed using:

```text
Flutter
Dart
```

Flutter provides the cross-platform mobile application framework.

---

## 🗺️ Maps

The project uses map and location packages such as:

```text
flutter_map
latlong2
geolocator
```

These packages are used for displaying maps and handling geographical coordinates.

---

## 📷 QR Codes

QR functionality is implemented using Flutter QR-related packages.

The QR system allows the application to generate and scan codes associated with information.

---

## 🖼️ Image Handling

The application supports selecting and working with images for person reports.

Packages used include:

```text
image_picker
file_picker
```

---

## 🎨 UI & Responsive Design

The project uses:

```text
flutter_screenutil
```

to help create responsive layouts across different screen sizes.

---

# 🧩 Project Structure

```text
AI-SafeTrack/
│
├── Mobile-App/
│   │
│   └── lib/
│       │
│       ├── core/
│       │   ├── theme/
│       │   ├── constants/
│       │   └── utils/
│       │
│       ├── features/
│       │   │
│       │   ├── loading/
│       │   ├── home/
│       │   ├── reports/
│       │   ├── map/
│       │   ├── qr/
│       │   ├── profile/
│       │   └── ...
│       │
│       └── main.dart
│
├── Dashboard/
│
├── Database/
│
└── Docs/
```

> **Note:** The current README focuses on the Flutter mobile application. Backend/API details are intentionally excluded for now.

---

# 🔄 Application Flow

The general application flow is:

```text
Launch Application
        ↓
Welcome Screen
        ↓
Home Screen
        ↓
Choose Feature
   ┌────┼─────┬─────────┐
   ↓    ↓     ↓         ↓
Missing Found Map       QR
Person  Person          Code
   ↓      ↓     ↓         ↓
Report  Report Location Scan/
Details Details         Generate
   ↓      ↓     ↓         ↓
        Information
```

---

# 📍 Example Use Case

### Missing Person

1. User opens AI-SafeTrack.
2. User selects **Report Missing Person**.
3. User enters the person's information.
4. User adds a person's image.
5. User selects the last known location.
6. The report is created.
7. The case appears on the application.
8. Users can view the report and location.
9. The report status can later be updated when the person is found.

---

# 🔐 Data Information

A person report can contain information such as:

```text
Reporter Name
Reporter Image
Report Date
Person Image
Person Name
Status
Description
Age
Phone
Location Name
Latitude
Longitude
Last Seen
Contact Information
```

---

# 📦 Current Development Status

### Completed / Implemented

* [x] Flutter mobile application
* [x] UI design
* [x] Welcome screen
* [x] Report UI
* [x] Person information UI
* [x] Interactive maps
* [x] Location coordinates
* [x] QR Code functionality
* [x] Image handling
* [x] Responsive UI
* [x] Feature-First project structure
* [x] Map integration

### Future Improvements

* [ ] Connect mobile application with backend API
* [ ] Complete authentication system
* [ ] Connect reports with database
* [ ] Implement real-time report updates
* [ ] Improve person identification
* [ ] Add push notifications
* [ ] Add advanced search and filtering
* [ ] Add report verification
* [ ] Complete admin dashboard integration

---

# 🚀 Future Vision

AI-SafeTrack can be expanded into a complete safety ecosystem connecting:

```text
Mobile Application
        ↓
Backend API
        ↓
Database
        ↓
Admin Dashboard
        ↓
Reports & Emergency Management
```

The goal is to provide a complete platform for managing missing-person cases, found-person cases, locations, QR identification, and emergency reports.

---

# 👨‍💻 Developer

**Ibrahim Gamal Ibrahim**

Computer Science Student
Faculty of Computers & Artificial Intelligence
Benha University

### Skills Used

```text
Flutter
Dart
Mobile Development
UI/UX
Maps Integration
Location Services
QR Code
Git & GitHub
```

---

# 📄 License

This project is developed for **educational and graduation-project purposes**.

© 2026 Ibrahim Gamal
