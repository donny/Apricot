//: Playground - noun: a place where people can play

import Cocoa
import SwiftGit2
import Result

var str = "Hello, playground"

func trace(repository: Repository, prefix: String, commit: Commit) -> Void {
  let message = commit.message.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).prefix(30)
  print("\(prefix) Commit: \(message): \(commit.oid.description.prefix(7))")

  for (index, parent) in commit.parents.enumerated() {
    let parentCommit = repository.commit(parent.oid)
    if let parentCommit = parentCommit.value {
      var newPrefix = ""
      if index == 0 {
        newPrefix = prefix
      }

      trace(repository: repository, prefix: newPrefix, commit: parentCommit)
    }
  }
}

func commitIteratorTest(repository: Repository) {
  guard let branch = repository.localBranches().value?.first else { return }
  let commitIterator = repository.commits(in: branch)

  while let commit = commitIterator.next()?.value {
    let message = commit.message.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).prefix(50)

    print("\(commit.parents.count) Commit : \(message)... by \(commit.author.name)")

  }
}

let url = URL(fileURLWithPath: "/Users/donny.kurniawan/unix/tmp/hellogitworld")
let repo = Repository.at(url)
if let repo = repo.value {
  let latestCommit: Result<Commit, NSError> = repo
    .HEAD()
    .flatMap { repo.commit($0.oid) }

  if let commit = latestCommit.value {
//    print("Latest Commit: \(commit.message) by \(commit.author.name)")
//    trace(repository: repo, prefix: "|", commit: commit)
    commitIteratorTest(repository: repo)
  } else {
    print("Could not get commit: \(latestCommit.error!)")
  }
} else {
  print("Could not open repository: \(repo.error!)")
}
