This is a test deployment project.


Steps to recreate

  install homebrew http://brew.sh/

  install rvm https://rvm.io/rvm/install

  install virtualbox  https://www.virtualbox.org/wiki/Downloads

  download ubuntu 12.04 server ISO
  http://mirror.os6.org/ubuntu//precise/ubuntu-12.04.3-server-amd64.iso



  mkdir test-project-deploy-donovan

  cd test-project-deploy-donovan

  git init

  rvm install ruby-2.0.0-p353


  # Requires Update to xcode >= 4.6.2 http://connect.apple.com

  to download xcode you need a free developer account

  xcode 5.0.2 from the mac app store it's free
  https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12

  xcode 5.0.2 requires OSX 10.8.4 or higher

  I installed xcode 4.6.3 which requires Mountain Lion or Lion

  https://developer.apple.com/downloads/index.action#

  Search for "xcode"

  I also grabbed the update osx lion april 2013 command line tools since I'm on 10.7

  # https://rvm.io/workflow/projects
  rvm --ruby-version use ruby-2.0.0-p353@test-project-deploy-donovan

  gem install rails -v 4.0.2

  rails new .




