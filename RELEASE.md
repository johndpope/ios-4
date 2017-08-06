Releasing Sourcer
===============

1. Create a new git branch for the release with the following name `release/x.y.z`, where `x.y.z` is the version to be released.
2. Update `Info.plist` and bump the version number.
3. Generate a zip file with the new version with `bundle exec rake release:zip`.
4. Sign the zip file with `bundle exec rake release:sign[dsa_priv.pem]` where `dsa_priv.pem` is the private certificate generated for Sparkle updates. The output script will provide you with a signature token and the file size. 
5. Update `CHANGELOG.md` including all the changes for the last version.
6. Update `appcast.xml` adding an entry for the new version.
7. Commit all the changes and tag them with the new version `x.y.z`.
8. Create a release on GitHub with that tag, including the changelog, and uploading the zip file that has been generated before.
9. Close the version milestone on GitHub and create a new one for the next version.
10. Rebase `release/x.y.z` into `master`.
