#!/usr/bin/env bash
MOD_VANILLA_CONFIG_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

source $MOD_VANILLA_CONFIG_ROOT"/conf/conf.sh.dist"

if [ -f $MOD_VANILLA_CONFIG_ROOT"/conf/conf.sh" ]; then
    source $MOD_VANILLA_CONFIG_ROOT"/conf/conf.sh"
fi
