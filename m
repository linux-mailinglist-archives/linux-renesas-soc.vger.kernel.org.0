Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37EC2E3B79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 14:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406345AbgL1Nub (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 08:50:31 -0500
Received: from www.zeus03.de ([194.117.254.33]:56064 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406339AbgL1Nua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 08:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=6f/McbvImz/4E7rQoIsCp+Rkhnw
        pE6JVfs+Wsicf3Nk=; b=ymaDkTWRA/M8Cf6BIvtwAT3S8ixK1GagPdrdrxKvD0h
        6ZyNb/4wP9pEgbpVtk3/LNm1Tg1INbtGQzJlXjWskSAQO/Sy5KM6hWMYOHyLto+1
        S2F7m+GPgpBk4wGJYgoz+HzQaD0mFM451NQnyL0cCaDLV4npznlMyYUrBciw6dsk
        =
Received: (qmail 1771730 invoked from network); 28 Dec 2020 14:49:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 14:49:47 +0100
X-UD-Smtp-Session: l3s3148p1@WtUSjIa3/pUgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: r8a779a0: enable gpio-ranges
Date:   Mon, 28 Dec 2020 14:49:41 +0100
Message-Id: <20201228134941.70965-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that we have PFC support, we can also enable gpio-ranges. This
enables requesting GPIOs.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is now part of my renesas/v3u/gpio branch. Geert, feel free to
squash it into your GPIO series.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 16c64ec548df..cd2d65c6c865 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -113,7 +113,7 @@ gpio0: gpio@e6058180 {
 			resets =  <&cpg 1331>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 0 28>;
+			gpio-ranges = <&pfc 0 0 28>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -127,7 +127,7 @@ gpio1: gpio@e6050180 {
 			resets =  <&cpg 1330>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 32 31>;
+			gpio-ranges = <&pfc 0 32 31>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -141,7 +141,7 @@ gpio2: gpio@e6050980 {
 			resets =  <&cpg 1330>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 64 25>;
+			gpio-ranges = <&pfc 0 64 25>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -155,7 +155,7 @@ gpio3: gpio@e6058980 {
 			resets =  <&cpg 1331>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 96 17>;
+			gpio-ranges = <&pfc 0 96 17>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -169,7 +169,7 @@ gpio4: gpio@e6060180 {
 			resets =  <&cpg 1400>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 128 27>;
+			gpio-ranges = <&pfc 0 128 27>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -183,7 +183,7 @@ gpio5: gpio@e6060980 {
 			resets =  <&cpg 1400>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 160 21>;
+			gpio-ranges = <&pfc 0 160 21>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -197,7 +197,7 @@ gpio6: gpio@e6068180 {
 			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 192 21>;
+			gpio-ranges = <&pfc 0 192 21>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -211,7 +211,7 @@ gpio7: gpio@e6068980 {
 			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 224 21>;
+			gpio-ranges = <&pfc 0 224 21>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -225,7 +225,7 @@ gpio8: gpio@e6069180 {
 			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 256 21>;
+			gpio-ranges = <&pfc 0 256 21>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -239,7 +239,7 @@ gpio9: gpio@e6069980 {
 			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			// gpio-ranges = <&pfc 0 288 21>;
+			gpio-ranges = <&pfc 0 288 21>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
-- 
2.29.2

