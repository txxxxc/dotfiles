# NOTE: 色々依存関係があるので、homebrewでパッケージインストールしてからこいつ走らせたほうが良さそう
NODE_VERSION=16.17.1
RUBY_VERSION=3.1.2
GO_VERSION=1.18
JAVA_VERSION=14.0
PYTHON2_VERSION=2.7.18
PYTHON3_VERSION=3.9.14

## ここ後々変える必要ありそう
# export ASDF_DIR=/usr/local/Cellar/asdf/0.10.2/libexec
# source /opt/homebrew/opt/asdf/libexec/asdf.fish

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs ${NODE_VERSION}
asdf reshim nodejs
asdf global nodejs ${NODE_VERSION}

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby ${RUBY_VERSION}
asdf reshim ruby
asdf global ruby ${RUBY_VERSION}

asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang ${GO_VERSION}
asdf reshim golang
asdf global golang ${GO_VERSION}

asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java ${JAVA_VERSION}
asdf reshim java
asdf global java ${JAVA_VERSION}

asdf plugin-add python
asdf install python ${PYTHON2_VERSION}
asdf install python ${PYTHON3_VERSION}
asdf reshim java
asdf global python ${PYTHON3_VERSION} ${PYTHON2_VERSION}

