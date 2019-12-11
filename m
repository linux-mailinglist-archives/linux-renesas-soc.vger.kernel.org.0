Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C1E11AC70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 14:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbfLKNwZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57932 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbfLKNwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id cdsP2100G5USYZQ01dsPb9; Wed, 11 Dec 2019 14:52:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-00014G-NI; Wed, 11 Dec 2019 14:52:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-0006yd-M1; Wed, 11 Dec 2019 14:52:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] ARM: dts: sh73a0: Add device node for ARM global timer
Date:   Wed, 11 Dec 2019 14:52:20 +0100
Message-Id: <20191211135222.26770-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211135222.26770-1-geert+renesas@glider.be>
References: <20191211135222.26770-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the global timer, which is part of the Cortex-A9
MPCore.

The global timer can serve as an accurate (3 ns) clock source for
scheduling and delay loops.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/sh73a0.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 9093b3b9fc0cbd1d..7efe33c4d041a524 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -39,6 +39,13 @@
 		};
 	};
 
+	timer@f0000200 {
+		compatible = "arm,cortex-a9-global-timer";
+		reg = <0xf0000200 0x100>;
+		interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+		clocks = <&periph_clk>;
+	};
+
 	timer@f0000600 {
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0xf0000600 0x20>;
-- 
2.17.1

