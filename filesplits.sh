#!/bin/sh
rm -rf x*
rm -rf x*.rsc
rm -rf temp-*
rm -rf temp-*.rsc
split -l 5000 blacklist.rsc
mmv "xaa" "xaa.rsc"
mmv "xab" "xab.rsc"
mmv "xac" "xac.rsc"
mmv "xad" "xad.rsc"
mmv "xae" "xae.rsc"
mmv "xaf" "xaf.rsc"
mmv "xag" "xag.rsc"
gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xab.rsc > temp-xab.rsc && mv temp-xab.rsc xab.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xac.rsc > temp-xac.rsc && mv temp-xac.rsc xac.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xad.rsc > temp-xad.rsc && mv temp-xad.rsc xad.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xae.rsc > temp-xae.rsc && mv temp-xae.rsc xae.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xaf.rsc > temp-xaf.rsc && mv temp-xaf.rsc xaf.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xag.rsc > temp-xag.rsc && mv temp-xag.rsc xag.rsc
