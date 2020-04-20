Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0111B0FB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 17:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgDTPQB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 11:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgDTPQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 11:16:00 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8620CC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2020 08:16:00 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:124:221f:3928:ed52])
        by michel.telenet-ops.be with bizsmtp
        id V3Fu2200b079KS6063FuWm; Mon, 20 Apr 2020 17:15:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jQY9K-0002Dv-Rx; Mon, 20 Apr 2020 17:15:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jQY9K-0005zO-PC; Mon, 20 Apr 2020 17:15:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: shmobile: Update CMT1 compatible values
Date:   Mon, 20 Apr 2020 17:15:53 +0200
Message-Id: <20200420151553.22975-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

New compatible values were introduced for the 48-bit CMT devices on
SH-Mobile AG5 and R-Mobile A1, and the old "cmt-48"-based values were
deprecated.  However, the actual DTS files were never updated.

See also commits:
  - 81b604c39997de91 ("dt-bindings: timer: renesas, cmt: Update CMT1 on
    sh73a0 and r8a7740"),
  - 8c1afba285a86b9d ("clocksource/drivers/sh_cmt: r8a7740 and sh73a0
    SoC-specific match"),
  - 19d608458f4f3bb3 ("clocksource/drivers/sh_cmt: Document "cmt-48" as
    deprecated").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Aforementioned commits are present in v5.4 and later.

To be queued in renesas-devel for v5.8.
---
 arch/arm/boot/dts/r8a7740.dtsi | 2 +-
 arch/arm/boot/dts/sh73a0.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index ebc1ff64f530d42c..014805894ea71f41 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -83,7 +83,7 @@
 	};
 
 	cmt1: timer@e6138000 {
-		compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
+		compatible = "renesas,r8a7740-cmt1";
 		reg = <0xe6138000 0x170>;
 		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7740_CLK_CMT1>;
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index fa5108f142ca974b..99503dd7f55c9cd2 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -104,7 +104,7 @@
 	};
 
 	cmt1: timer@e6138000 {
-		compatible = "renesas,cmt-48-sh73a0", "renesas,cmt-48";
+		compatible = "renesas,sh73a0-cmt1";
 		reg = <0xe6138000 0x200>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_CMT1>;
-- 
2.17.1

