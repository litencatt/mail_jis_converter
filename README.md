Convert from UTF-8 to ISO-2022-JP mail format.

## Usage
```
$ ruby convert.rb ./sample1.txt
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Subject: =?ISO-2022-JP?B?GyRCRnxLXDhsN29MPhsoQg==?=
From: from@example.com
To: to@example.com

test
$F$9$H

test2
$F$9$H#2

$ ruby convert.rb ./sample1.txt > convert.txt
```
