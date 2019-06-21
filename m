Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A111B4E2DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfFUJOE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:04 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJOE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:04 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CB55425BE36;
        Fri, 21 Jun 2019 19:13:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 99B119413DC; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 16/22] ARM: dts: renesas: Use ip=on for bootargs
Date:   Fri, 21 Jun 2019 11:13:43 +0200
Message-Id: <07d2bf96e0e1bd12f78617282380bab62e5c3e38.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Convert bootargs from ip=dhcp to ip=on

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2-kzm9d.dts             | 2 +-
 arch/arm/boot/dts/r7s72100-genmai.dts         | 2 +-
 arch/arm/boot/dts/r8a73a4-ape6evm.dts         | 2 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 2 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts        | 2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts   | 2 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts        | 2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts     | 2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts           | 2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts          | 2 +-
 arch/arm/boot/dts/r8a7790-lager.dts           | 2 +-
 arch/arm/boot/dts/r8a7790-stout.dts           | 2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts         | 2 +-
 arch/arm/boot/dts/r8a7791-porter.dts          | 2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts         | 2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts           | 2 +-
 arch/arm/boot/dts/r8a7793-gose.dts            | 2 +-
 arch/arm/boot/dts/r8a7794-alt.dts             | 2 +-
 arch/arm/boot/dts/r8a7794-silk.dts            | 2 +-
 arch/arm/boot/dts/sh73a0-kzm9g.dts            | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index abfff54d6de5..0a27f034dd6b 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial1:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 474baa0c7cfc..07d611d2b7b5 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index f70f4a3e5c43..a5351ddbf506 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 32757caa2584..758360a2edc3 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=dhcp rw";
+		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=on rw";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
index ca0e0fc9b246..807e7d0d6b62 100644
--- a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
@@ -17,7 +17,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 1db220cfc1a1..ce6603b0994b 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -42,7 +42,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial3:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
index 655b10bb42d5..db72a801abe5 100644
--- a/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
@@ -17,7 +17,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 2840eb0d6fd4..af78e77a4778 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -18,7 +18,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial1:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7778-bockw.dts b/arch/arm/boot/dts/r8a7778-bockw.dts
index 0b49956069fc..6c7b07c4b9d3 100644
--- a/arch/arm/boot/dts/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/r8a7778-bockw.dts
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index d4bee1ec9044..c755f0b8fd0d 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index d637b9727808..83cc619861b2 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -56,7 +56,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index ad68e6034b43..a315ba749aa4 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index a116bfc11f0b..af6bd8fcd5a4 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -56,7 +56,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index e08d257f5d0c..d6cf16aac14d 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -31,7 +31,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index b7af14de7c8e..248eb717eb35 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index f46f4567b3d4..bd2a63bdab3d 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 9984ebf06695..42f3313e6988 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -52,7 +52,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 0ab3d8d57f6d..1d22fcdc5d22 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -22,7 +22,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 60e91ebfa65d..b3177aea45d1 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -34,7 +34,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index daac0c6078c5..1916f31a30ff 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -36,7 +36,7 @@
 	};
 
 	chosen {
-		bootargs = "root=/dev/nfs ip=dhcp ignore_loglevel rw";
+		bootargs = "root=/dev/nfs ip=on ignore_loglevel rw";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
2.11.0

