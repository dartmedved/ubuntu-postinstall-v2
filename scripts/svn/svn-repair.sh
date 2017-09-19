#!/bin/bash

sqlite3 .svn/wc.db "pragma integrity_check"

sqlite3 .svn/wc.db "reindex nodes"
sqlite3 .svn/wc.db "reindex pristine"

svn cleanup