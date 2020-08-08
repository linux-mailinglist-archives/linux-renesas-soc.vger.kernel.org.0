Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F07C23F9CD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 01:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgHHXiO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 19:38:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728092AbgHHXiJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 19:38:09 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D192B22BF5;
        Sat,  8 Aug 2020 23:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596929888;
        bh=FayhK48XD6LCySWNLP0EHUcGUO9hym0PaArFbF+l6/A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2Foool0165NR3TER5sdvTNrSvIXLRuKfATeUdv0v3ubgdEoo53QAf2OO6Sqf6kxpN
         WM5u+oO++J6SvNg5PvLwfihkrPdxnRLvcQ1AEGdKNqxvM4q/JjK4kJtWdHGLoPGQ6u
         eFKlR5fpUl0aVfw+74tE8UbnHnhL+8BQLWcnqt6c=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 30/58] arm64: dts: renesas: Fix SD Card/eMMC interface device node names
Date:   Sat,  8 Aug 2020 19:36:56 -0400
Message-Id: <20200808233724.3618168-30-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200808233724.3618168-1-sashal@kernel.org>
References: <20200808233724.3618168-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[ Upstream commit a6cb262af1e1adfa6287cb43f09021ee42beb21c ]

Fix the device node names as "mmc@".

Fixes: 663386c3e1aa ("arm64: dts: renesas: r8a774a1: Add SDHI nodes")
Fixes: 9b33e3001b67 ("arm64: dts: renesas: Initial r8a774b1 SoC device tree")
Fixes: 77223211f44d ("arm64: dts: renesas: r8a774c0: Add SDHI nodes")
Fixes: d9d67010e0c6 ("arm64: dts: r8a7795: Add SDHI support to dtsi")
Fixes: a513cf1e6457 ("arm64: dts: r8a7796: add SDHI nodes")
Fixes: 111cc9ace2b5 ("arm64: dts: renesas: r8a77961: Add SDHI nodes")
Fixes: f51746ad7d1f ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")
Fixes: df863d6f95f5 ("arm64: dts: renesas: initial R8A77965 SoC device tree")
Fixes: 9aa3558a02f0 ("arm64: dts: renesas: ebisu: Add and enable SDHI device nodes")
Fixes: 83f18749c2f6 ("arm64: dts: renesas: r8a77995: Add SDHI (MMC) support")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Link: https://lore.kernel.org/r/1594382634-13714-1-git-send-email-yoshihiro.shimoda.uh@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 6 +++---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 6 +++---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 9 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index a603d947970ec..16b059d7fd015 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2250,7 +2250,7 @@ usb2_phy1: usb-phy@ee0a0200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2262,7 +2262,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2274,7 +2274,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2286,7 +2286,7 @@ sdhi2: sd@ee140000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a774a1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 1e51855c7cd38..6db8b6a4d191b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2108,7 +2108,7 @@ usb2_phy1: usb-phy@ee0a0200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2120,7 +2120,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2132,7 +2132,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2144,7 +2144,7 @@ sdhi2: sd@ee140000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a774b1",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 5c72a7efbb035..42171190cce46 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1618,7 +1618,7 @@ usb2_phy0: usb-phy@ee080200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a774c0",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -1630,7 +1630,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a774c0",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -1642,7 +1642,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a774c0",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 61d67d9714ab9..9beb8e76d9235 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2590,7 +2590,7 @@ usb2_phy3: usb-phy@ee0e0200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2603,7 +2603,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2616,7 +2616,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2629,7 +2629,7 @@ sdhi2: sd@ee140000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7795",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 33bf62acffbb7..4dfb7f0767871 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2394,7 +2394,7 @@ usb2_phy1: usb-phy@ee0a0200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2407,7 +2407,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2420,7 +2420,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2433,7 +2433,7 @@ sdhi2: sd@ee140000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a7796",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 0d96f2d3492b6..8227b68b5646a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -928,7 +928,7 @@ usb2_phy1: usb-phy@ee0a0200 {
 			/* placeholder */
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -940,7 +940,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -952,7 +952,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -964,7 +964,7 @@ sdhi2: sd@ee140000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77961",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6f7ab39fd2824..fe4dc12e2bdfa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2120,7 +2120,7 @@ usb2_phy1: usb-phy@ee0a0200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -2133,7 +2133,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -2146,7 +2146,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
@@ -2159,7 +2159,7 @@ sdhi2: sd@ee140000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77965",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index cd11f24744d4a..1991bdc36792f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1595,7 +1595,7 @@ usb2_phy0: usb-phy@ee080200 {
 			status = "disabled";
 		};
 
-		sdhi0: sd@ee100000 {
+		sdhi0: mmc@ee100000 {
 			compatible = "renesas,sdhi-r8a77990",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
@@ -1608,7 +1608,7 @@ sdhi0: sd@ee100000 {
 			status = "disabled";
 		};
 
-		sdhi1: sd@ee120000 {
+		sdhi1: mmc@ee120000 {
 			compatible = "renesas,sdhi-r8a77990",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
@@ -1621,7 +1621,7 @@ sdhi1: sd@ee120000 {
 			status = "disabled";
 		};
 
-		sdhi3: sd@ee160000 {
+		sdhi3: mmc@ee160000 {
 			compatible = "renesas,sdhi-r8a77990",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index e5617ec0f49cb..2c2272f5f5b52 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -916,7 +916,7 @@ usb2_phy0: usb-phy@ee080200 {
 			status = "disabled";
 		};
 
-		sdhi2: sd@ee140000 {
+		sdhi2: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77995",
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
-- 
2.25.1

