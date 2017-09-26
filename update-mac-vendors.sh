#!/bin/bash
# This scripts downloads and optimizes IEEE MAC vendor list

curl 'http://standards-oui.ieee.org/oui.txt' |\
#cat oui.txt |\
fgrep '(base 16)' | sed -r '
	s/\r//g; s/     \(base 16\)\t\t//;
	s/,? ?(Inc)\.?$//I;
	s/(,|, | )(Ltd|Limited|GmbH|LLC|A\/S|AB|AS|SAS|AG|KG|PLC|SRL|OY|Oy|BV|Nederland BV)\.?$//I;
	s/(,|, | )(Co|Corp|Corporation|Company|Incorporated)\.?$//I;
	s/\(.+\)//;
	s/ (Electronics?|Technology|Technologies|Telecommunication|Communications?|Corporation|Systems|Solutions) ?//Ig
	s/ Registration Authority//
' | cut -c -42 | sort \
> resources/mac-vendors.txt

wc -l resources/mac-vendors.txt
