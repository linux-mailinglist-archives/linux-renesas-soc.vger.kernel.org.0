Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9305533A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jun 2022 15:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiFUNe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jun 2022 09:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiFUNdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jun 2022 09:33:23 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1179584
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2022 06:33:16 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id lpZC2700i4C55Sk06pZCno; Tue, 21 Jun 2022 15:33:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o3e0G-000BZl-Cv; Tue, 21 Jun 2022 15:33:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o3e0F-006Keb-3V; Tue, 21 Jun 2022 15:33:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Fix DA9063 watchdog sub node names
Date:   Tue, 21 Jun 2022 15:33:10 +0200
Message-Id: <1dafdce285f7d14bec9e2033ac87fb30135895db.1655818230.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/r8a7791-koelsch-single-memory-node.dtb: pmic@58: 'wdt' does not match any of the regexes: 'pinctrl-[0-9]+'
	    From schema: Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
    ...

Change the watchdog child node names to match the DA9063 DT bindings and
the Generic Names Recommendation in the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen after commit 441613662db7bbf5 ("dt-bindings: mfd: Convert da9063 to
yaml") in mfd/for-mfd-next.

To be queued in renesas-devel for v5.20.

 arch/arm/boot/dts/r8a7790-lager.dts   | 2 +-
 arch/arm/boot/dts/r8a7790-stout.dts   | 2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 arch/arm/boot/dts/r8a7791-porter.dts  | 2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts | 2 +-
 arch/arm/boot/dts/r8a7793-gose.dts    | 2 +-
 arch/arm/boot/dts/r8a7794-alt.dts     | 2 +-
 arch/arm/boot/dts/r8a7794-silk.dts    | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 55181690032f870f..dc1b58e1cf1a01eb 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -442,7 +442,7 @@ rtc {
 				compatible = "dlg,da9063-rtc";
 			};
 
-			wdt {
+			watchdog {
 				compatible = "dlg,da9063-watchdog";
 			};
 		};
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index 2bbc05502d400ba7..f9213927a1094649 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -342,7 +342,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index ae373e6f7b371f13..062415e33458378d 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -803,7 +803,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index 41135e3ec4a321f3..c44755c75fbd277e 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -391,7 +391,7 @@ pmic@5a {
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index b00a2e430b2ab513..aafd16fb324e08a8 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -336,7 +336,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 84bd3468cd2baf96..84794358157eac29 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -738,7 +738,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 1c4446dea275c907..28b2bd7e5f898e4c 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -464,7 +464,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 3c1394d4acbff447..3ba96e7c7a1dd85a 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -434,7 +434,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 	};
-- 
2.25.1

