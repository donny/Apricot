//: Playground - noun: a place where people can play

import Cocoa
import SwiftGit2
import Result

var str = "Hello, playground"

let url = URL(fileURLWithPath: "/Users/donny.kurniawan/unix/projects/github/Apricot")
let repo = Repository.at(url)
if let repo = repo.value {
  let latestCommit: Result<Commit, NSError> = repo
    .HEAD()
    .flatMap { repo.commit($0.oid) }
  if let commit = latestCommit.value {
    print("Latest Commit: \(commit.message) by \(commit.author.name)")
  } else {
    print("Could not get commit: \(latestCommit.error!)")
  }
} else {
  print("Could not open repository: \(repo.error!)")
}
