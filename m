Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0070326C5DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 19:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgIPRWm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 13:22:42 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:47758 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgIPRVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:21:47 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id CE0F63AD954
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 15:53:47 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D241F4000E;
        Wed, 16 Sep 2020 15:52:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] vin-tests: Add capture script for RDACM21
Date:   Wed, 16 Sep 2020 17:55:46 +0200
Message-Id: <20200916155546.160450-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add script to capture from RDACM21 on Eagle V3-M.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 gmsl-rdacm21-yavta.sh | 104 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100755 gmsl-rdacm21-yavta.sh

diff --git a/gmsl-rdacm21-yavta.sh b/gmsl-rdacm21-yavta.sh
new file mode 100755
index 0000000..36ba024
--- /dev/null
+++ b/gmsl-rdacm21-yavta.sh
@@ -0,0 +1,104 @@
+#!/bin/bash
+
+base=$(dirname $(readlink -f $0))
+
+source $base/scripts/vin-tests.sh
+source $base/scripts/boards.sh
+
+mdev=$(mc_get_mdev)
+
+out=$base/output
+rm -fr $out
+mkdir $out
+
+function conf() {
+    CSI="$1"
+    IDX="$2"
+    VIN="$3"
+
+    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:YUYV8_1X16/1280x1080 field:none]"
+    mc_set_link "$CSI" $IDX "$VIN" 1
+}
+
+function conf_gmsl() {
+	set -x
+	MAX9286="max9286 3-0048"
+
+    for pad in `seq 0 3`; do
+		media-ctl -d $mdev -V "'$MAX9286':$pad [fmt:YUYV8_1X16/1280x1080 field:none colorspace:srgb xfer:none ycbcr:601 quantization:full-range]"
+	done
+
+	set +x
+}
+
+function capture() {
+    VID="$1"
+    vid=$(eval echo \$$VID)
+    echo $vid
+
+    yavta -f YUYV -s 1280x1080 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/$vid &
+}
+
+mc_reset
+
+# Need to configure all formats going through each MAX9286
+conf1234=0
+conf5678=0
+
+for cam in "$@"; do
+	case $cam in
+        1|2|3|4)
+            if [[ $conf1234 -ne 1 ]]; then
+                conf  "$csi40name" 1 "$vinname0"
+                conf  "$csi40name" 2 "$vinname1"
+                conf  "$csi40name" 3 "$vinname2"
+                conf  "$csi40name" 4 "$vinname3"
+                conf1234=1
+            fi
+            ;;
+        5|6|7|8)
+            if [[ $conf5678 -ne 1 ]]; then
+                conf  "$csi41name" 1 "$vinname4"
+                conf  "$csi41name" 2 "$vinname5"
+                conf  "$csi41name" 3 "$vinname6"
+                conf  "$csi41name" 4 "$vinname7"
+                conf5678=1
+            fi
+            ;;
+	    *)
+		echo "Unrecognised camera $cam"
+		;;
+	esac
+done
+
+conf_gmsl
+
+for cam in "$@"
+do
+	echo "Capturing camera $cam"
+	case $cam in
+	    1)	capture vin0 ;;
+	    2)	capture vin1 ;;
+	    3)	capture vin2 ;;
+	    4)	capture vin3 ;;
+
+	    5)	capture vin4 ;;
+	    6)	capture vin5 ;;
+	    7)	capture vin6 ;;
+	    8)	capture vin7 ;;
+
+	    *)
+		echo "Unrecognised camera $cam"
+		;;
+	esac
+done;
+
+wait
+
+for f in $out/*bin; do
+    name=$(basename $f .bin)
+    raw2rgbpnm -f YUYV -s 1280x1080 $out/$name.bin $out/$name.ppm
+    convert $out/$name.ppm $out/$name.png
+done
+
+convert $out/vin*-000007.png -background white -append $out/collage.png
--
2.28.0

