#!/bin/bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 
sdk install maven 
sdk install groovy 
sdk install gradle 
sdk install kotlin
sdk install visualvm
sdk install sbt
sdk install leiningen

sdk upgrade
