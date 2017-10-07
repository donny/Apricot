//: Playground - noun: a place where people can play

import Cocoa
import SwiftGit2
import Result

var str = "Hello, playground"

func trace(repository: Repository, prefix: String, commit: Commit) -> Void {
  print("\(prefix) Commit: \(commit.message)")
  commit.parents.forEach { (parent) in
    let parentCommit = repository.commit(parent.oid)
    if let parentCommit = parentCommit.value {
      let prefix = "\(prefix)-"
      trace(repository: repository, prefix: prefix, commit: parentCommit)
    }
  }
}



let url = URL(fileURLWithPath: "/Users/donny.kurniawan/unix/tmp/hellogitworld")
let repo = Repository.at(url)
if let repo = repo.value {
  let latestCommit: Result<Commit, NSError> = repo
    .HEAD()
    .flatMap { ref in
      return repo.commit(ref.oid)
    }
  if let commit = latestCommit.value {
    // print("Latest Commit: \(commit.message) by \(commit.author.name)")

    trace(repository: repo, prefix: "-", commit: commit)
  } else {
    print("Could not get commit: \(latestCommit.error!)")
  }
} else {
  print("Could not open repository: \(repo.error!)")
}
