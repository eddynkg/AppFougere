//
//  CommentsComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 05/11/2025.
//

import SwiftUI

struct CommentsComponent: View {
    let activity: Activity
    let comments: [Comment]
    let users: [User]
    
    private var usersById: [UUID: User] {
        Dictionary(uniqueKeysWithValues: users.map { ($0.id, $0) })
    }
    
    private var commentsForActivity: [Comment] {
        comments
            .filter { $0.activityId == activity.id }
            .sorted { $0.date > $1.date } // plus récents en premier
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Commentaires")
                    .font(.title2)
                    .foregroundStyle(.capVerde)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                Spacer()
            }
            
            if commentsForActivity.isEmpty {
                Text("Aucun commentaire pour le moment.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            } else {
                VStack(spacing: 8) {
                    ForEach(commentsForActivity) { comment in
                        let author = usersById[comment.userId]
                        CommentRow(
                            authorName: author?.userName ?? "Utilisateur",
                            authorAvatarName: author?.profilePicture,
                            comment: comment
                        )
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 4)
            }
        }
    }
}

private struct CommentRow: View {
    let authorName: String
    let authorAvatarName: String?
    let comment: Comment
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            avatarView
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(authorName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    Spacer()
                    Text(comment.date, style: .date)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Text(comment.content)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
    
    @ViewBuilder
    private var avatarView: some View {
        if let name = authorAvatarName, !name.isEmpty {
            Image(name)
                .resizable()
                .scaledToFill()
        } else {
            ZStack {
                Circle().fill(Color.gray.opacity(0.2))
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(2)
            }
        }
    }
}

#Preview {
    // Démo avec 2 users et 2 commentaires
    let demoActivity = Activity(
        name: "Exemple",
        actDescription: "Une rando incroyable dans le Luberon ! 😍",
        location: "Quelque part",
        difficulty: 2.0,
        handicap: false,
        userId: UUID(),
        accessibility: [.foot, .car],
        durationHour: 2,
        durationMin: 30
    )
    
    let user1 = User(userName: "Fanny", email: "fanny@example.com", password: "pwd", profilePicture: "user11")
    let user2 = User(userName: "Marc", email: "marc@example.com", password: "pwd", profilePicture: nil)
    
    let demoComments: [Comment] = [
        Comment(userId: user1.id, activityId: demoActivity.id, content: "Super balade, très beau site !", date: Date()),
        Comment(userId: user2.id, activityId: demoActivity.id, content: "Un peu de monde mais ça vaut le coup.", date: Date().addingTimeInterval(-86400)),
        Comment(userId: UUID(), activityId: UUID(), content: "Hors activité (ne doit pas s'afficher)", date: Date())
    ]
    
    return CommentsComponent(activity: demoActivity, comments: demoComments, users: [user1, user2])
}
