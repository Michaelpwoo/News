//
//  ContentView.swift
//  News
//
//  Created by Michael Woo on 10/2/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach( $viewModel.newsArticles, id: \.articleID) { $newsArticle in
                        CardView(newsArticle: $newsArticle)
                            .onTapGesture {
                                appCoordinator.path.append(newsArticle)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 2)
                            .onAppear {
                                viewModel.shouldLoadMoreNewsArticles(newsArticle: newsArticle)
                            }
                            .padding()
                    }
                    if viewModel.isLoading {
                      ProgressView()
                    }
                }
            }
            .onAppear {
                viewModel.getArticles()
            }
            .navigationTitle("News")
            .navigationDestination(for: NewsArticle.self) { newsArticle in
                DetailArticleView(newsArticle: newsArticle)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let appCoordinator = AppCoordinator(path: NavigationPath())
    static var previews: some View {
        HomeView(viewModel: development.createMockMainViewModel())
            .environmentObject(appCoordinator)
    }
}
