#!/bin/sh
rm -rf x*
rm -rf x*.rsc
rm -rf temp-*
rm -rf temp-*.rsc
split -l 5000 blacklist.rsc
mmv "xaa" "xaa.auto.rsc"
mmv "xab" "xab.auto.rsc"
mmv "xac" "xac.auto.rsc"
mmv "xad" "xad.auto.rsc"
mmv "xae" "xae.auto.rsc"
mmv "xaf" "xaf.auto.rsc"
mmv "xag" "xag.auto.rsc"
gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xab.auto.rsc > temp-xab.rsc && mv temp-xab.rsc xab.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xac.auto.rsc > temp-xac.rsc && mv temp-xac.rsc xac.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xad.auto.rsc > temp-xad.rsc && mv temp-xad.rsc xad.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xae.auto.rsc > temp-xae.rsc && mv temp-xae.rsc xae.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xaf.auto.rsc > temp-xaf.rsc && mv temp-xaf.rsc xaf.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xag.auto.rsc > temp-xag.rsc && mv temp-xag.rsc xag.auto.rsc
