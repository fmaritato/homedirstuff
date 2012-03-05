#!/bin/bash

perl -pi.bak -e 's/import java.util.logging.Level/import org.apache.commons.logging.Log/; s/import java.util.logging.Logger/import org.apache.commons.logging.LogFactory/; s/(.*?).log\(Level.SEVERE,/${1}.error(/g; s/(.*?).log\(Level.FINE,/${1}.debug(/g; s/(.*?).log\(Level.INFO,/${1}.info(/g; s/(.*?).log\(Level.FINER,/${1}.debug(/g; s/(.*?).log\(Level.FINEST,/${1}.debug(/g; s/(.*?)Logger(.*?)=/${1}Log${2}=/; s/(.*?)Logger.getLogger\((.*?)\);/${1}LogFactory.getLog(${2});/;' `find . -name "*.java"`
