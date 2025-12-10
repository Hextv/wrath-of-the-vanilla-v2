#!/usr/bin/env bash
MOD_DISABLE_ACHIEVEMENTS_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

source $MOD_DISABLE_ACHIEVEMENTS_ROOT"/conf/conf.sh.dist"

if [ -f $MOD_DISABLE_ACHIEVEMENTS_ROOT"/conf/conf.sh" ]; then
    source $MOD_DISABLE_ACHIEVEMENTS_ROOT"/conf/conf.sh"
fi
