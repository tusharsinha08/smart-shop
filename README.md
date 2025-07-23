# Smart Shop - Mini E-commerce Flutter App 🛍️

Smart Shop is a beautifully designed mini e-commerce application built using **Flutter**. It fetches product data from the **FakeStore API** and includes essential shopping features such as login, cart, favorites, category filtering, and theme switching.

---

## 📋 Table of Contents

* [Overview](#-overview)
* [Features](#-features)
* [Screenshots](#-screenshots)
* [Getting Started](#-getting-started)
    * [Prerequisites](#prerequisites)
    * [Installation](#installation)
* [Technologies Used](#-technologies-used)
* [API](#api)
* [How to Use](#-how-to-use)
* [Known Issues](#-known-issues)
* [Contributing](#-contributing)
* [Download App](#-download-app)
* [Credits](#-credits)

---

## 📖 Overview

Smart Shop is a Flutter-based mobile shopping app that allows users to browse products, add them to their cart, mark favorites, and toggle between dark and light themes. It demonstrates essential mobile app development concepts using **Provider** for state management, **SharedPreferences** for local data persistence, **REST APIs** for data fetching, and more.

---

## ✨ Features

* 🔐 **Login screen** with dummy credentials and validation.
* 🏠 **Product listing** with name, price, rating, and favorite toggle.
* 💖 **Favorites screen** with persistent favorite items.
* 🛒 **Cart page** with total price and item count badge.
* 🎨 **Theme toggling** (Dark/Light mode).
* 🔄 **`RefreshIndicator`** to reload the product list.
* 📂 **Category filter** using the FakeStore API.
* 🔁 **Drawer navigation** with routes to all screens.
* 🚪 **Logout** with confirmation and state clearing.

---

## 📸 Screenshots

<img width="541" height="786" alt="Screenshot 2025-07-23 062853" src="https://github.com/user-attachments/assets/94050d04-a6ce-4644-b75a-e19dc9f806f4" />
<img width="368" height="807" alt="Screenshot 2025-07-23 063035" src="https://github.com/user-attachments/assets/ec57a377-d3e0-47e8-ade8-961d36dbeb2f" />
<img width="370" height="805" alt="Screenshot 2025-07-23 063117" src="https://github.com/user-attachments/assets/88db588a-6c24-4e99-82ff-817e70ed9d00" />
<img width="367" height="261" alt="Screenshot 2025-07-23 063224" src="https://github.com/user-attachments/assets/b9fbc4c2-6049-4f90-ba29-38a35d8d3368" />
<img width="372" height="800" alt="Screenshot 2025-07-23 063312" src="https://github.com/user-attachments/assets/ab7fb7d4-ec1a-4489-b0c5-3e939105af44" />
<img width="372" height="792" alt="Screenshot 2025-07-23 063355" src="https://github.com/user-attachments/assets/148c5dbc-ad77-44ba-bb2f-4eba23d643a4" />

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Make sure you have Flutter installed on your system.
* [Flutter SDK](https://flutter.dev/docs/get-started/install)

### Installation

1.  Clone the repository:
    ```bash
    git clone [https://github.com/tusharsinha08/smart-shop.git](https://github.com/tusharsinha08/smart-shop.git)
    ```
2.  Navigate to the project directory:
    ```bash
    cd smart-shop
    ```
3.  Install the dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the app:
    ```bash
    flutter run
    ```

---

## 💻 Technologies Used

* **Flutter**: UI Toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Provider**: State management solution.
* **SharedPreferences**: For persistent local storage of key-value pairs.
* **http**: For making HTTP requests to REST APIs.

---

## 🌐 API

This app utilizes the [FakeStore API](https://fakestoreapi.com/) to fetch product data.

---

## 💡 How to Use

1.  **Login**: Use dummy credentials (e.g., username: `user`, password: `password`) to log in.
2.  **Browse Products**: Scroll through the list of products on the home screen.
3.  **Add to Cart**: Tap the cart icon on a product to add it to your cart.
4.  **Mark Favorites**: Tap the heart icon to add/remove products from your favorites list.
5.  **Filter Categories**: Use the category filter from the drawer to view products by category.
6.  **Switch Theme**: Toggle between dark and light themes from the drawer.

---

## ⚠️ Known Issues

*(List any known bugs or limitations here.)*

---

## 🙌 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## ⬇️ Download App

*(Provide links to download the app, e.g., APK for Android, or mention if it's not yet released on app stores.)*

---

## 👏 Credits

* Inspired by various e-commerce app designs.
* Product data powered by [FakeStore API](https://fakestoreapi.com/).
