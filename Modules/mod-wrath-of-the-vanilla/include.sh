#!/usr/bin/env bash
MOD_WRATH_OF_THE_VANILLA_CONFIG_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

source $MOD_WRATH_OF_THE_VANILLA_CONFIG_ROOT"/conf/conf.sh.dist"

if [ -f $MOD_WRATH_OF_THE_VANILLA_CONFIG_ROOT"/conf/conf.sh" ]; then
    source $MOD_WRATH_OF_THE_VANILLA_CONFIG_ROOT"/conf/conf.sh"
fi
