rvm cleanup all
rvm repair all
gem update
gem cleanup
brew cleanup
brew update
brew upgrade
bower cache clean
bower update
npm cache clean
npm update -g
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U