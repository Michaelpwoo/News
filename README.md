# News App Example MVVM + Combine 
1. Go to https://newsdata.io and get an API Key for free. 
2. Update the Constant.swift with the API Key. 

NOTE:
If the API Key is not set, it will use the local json file. You will get  warning because the infinite scrolling uses the articleIDs as the unique identifier but the mock repository uses the same 10 articles.

# Overview
The project is using https://newsdata.io (free tier) to get a list of trending U.S. news articles. It features infinite scrolling with the ability to see the full article when clicked. The strechy header in the DetailArticleView is done using a GeometryReader.
There is in memory caching mechanism to efficiently load images. The LazyVStack with the onAppear modifier checks if the threshold article has been reached and if so, we make an API call to fetch more articles.
 
# What I like about the project? (3 - 4 hours)

The project is based on the Clean Code Architecture with MVVM + Combine. It is essentially broken down into 3 layers.

Data Layer: low level module like networking, local storage, etc..

Domain Layer: responsible for encapsulating complex business logic. It can be broken down into use cases.

Presentation Layer: responsible for displaying the UI. This can be SwiftUI or UIKIT and any architecture pattern (MVVM, VIPER, TCA, etc..)

With the clear separation of concerns, refactoring the application to use a different architectural pattern only requires updating the presentation layer. The presentation layer does not need to know anything about the low level module and only interacts with the domain layer.
Since the repository are protocols, we are able to update, refactor, and clean up the data layer without modifying code in the presentation layer. This also allows us to create mock data in the view model and write tests. 

The project is loads a json file that can be used as a fixture and enable to use of previews while developing the app.

I've added a test in NewsTests.Swift to mock the API reponse.

# What would I improve?


I would add SwiftLint to enforce good programming practices, add more tests, add support for localization, dynamic font size and dark/light mode. Those are just some improvements that tend to be easier to implement at the start of a new iOS project.
The UI folder should be a SPM. This is to demonstrate modularity and code reusability when working on an iOS application.

# UI
<img width="259" alt="Screenshot 2023-10-10 at 4 16 58 PM" src="https://github.com/Michaelpwoo/News/assets/6344231/cbbdfb1f-b9ad-4835-8b43-aa241503c42a">
<img width="259" alt="Screenshot 2023-10-10 at 4 17 14 PM" src="https://github.com/Michaelpwoo/News/assets/6344231/6ff63376-e62a-4862-a120-c63f6b0131c6">



