Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46ADA40468B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 09:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhIIHxy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 03:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhIIHxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 03:53:54 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B03C061575
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 00:52:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:4412:1e60:3e2:2329])
        by michel.telenet-ops.be with bizsmtp
        id rjsh2500F0RivvZ06jshYA; Thu, 09 Sep 2021 09:52:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOErR-003BvX-2z; Thu, 09 Sep 2021 09:52:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOErQ-0076Hb-Gi; Thu, 09 Sep 2021 09:52:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Fix SMSC Ethernet compatible values
Date:   Thu,  9 Sep 2021 09:52:36 +0200
Message-Id: <59c142176f795b3541c935df43ab11cecd77cc61.1631173813.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to schematics, and confirmed by ID_REV register contents, the
Ethernet controllers on various development board are not SMSC LAN9220,
but different variants:
  - KZM-A9-Dual and KZM-A9-GT: LAN9221,
  - Bock-W and Marzen: LAN89218AQ.

Updates the compatible values accordingly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.16.

 arch/arm/boot/dts/emev2-kzm9d.dts    | 2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts  | 2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts | 2 +-
 arch/arm/boot/dts/sh73a0-kzm9g.dts   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index 0a27f034dd6b51b9..89495dd373585e94 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -80,7 +80,7 @@ reg_3p3v: regulator-3p3v {
 	};
 
 	ethernet@20000000 {
-		compatible = "smsc,lan9220", "smsc,lan9115";
+		compatible = "smsc,lan9221", "smsc,lan9115";
 		reg = <0x20000000 0x10000>;
 		phy-mode = "mii";
 		interrupt-parent = <&gpio0>;
diff --git a/arch/arm/boot/dts/r8a7778-bockw.dts b/arch/arm/boot/dts/r8a7778-bockw.dts
index 6c7b07c4b9d36492..9b65d246e5836a91 100644
--- a/arch/arm/boot/dts/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/r8a7778-bockw.dts
@@ -63,7 +63,7 @@ sndcodec: simple-audio-card,codec {
 
 &bsc {
 	ethernet@18300000 {
-		compatible = "smsc,lan9220", "smsc,lan9115";
+		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18300000 0x1000>;
 
 		phy-mode = "mii";
diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index 46584532349590d1..5f05f2b44a481669 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -52,7 +52,7 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 	};
 
 	ethernet@18000000 {
-		compatible = "smsc,lan9220", "smsc,lan9115";
+		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18000000 0x100>;
 		pinctrl-0 = <&ethernet_pins>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index 5a8d92a061df7bf8..98897f710063a91b 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -169,7 +169,7 @@ simple-audio-card,codec {
 
 &bsc {
 	ethernet@10000000 {
-		compatible = "smsc,lan9220", "smsc,lan9115";
+		compatible = "smsc,lan9221", "smsc,lan9115";
 		reg = <0x10000000 0x100>;
 		phy-mode = "mii";
 		interrupt-parent = <&irqpin0>;
-- 
2.25.1

