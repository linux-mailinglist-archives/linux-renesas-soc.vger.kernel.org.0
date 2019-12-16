Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 024FB12062E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 13:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfLPMrr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 07:47:47 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:60450 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfLPMrr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 07:47:47 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id ecni2100e5USYZQ01cnjmf; Mon, 16 Dec 2019 13:47:45 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1igpmo-0004EM-TZ; Mon, 16 Dec 2019 13:47:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1igpmo-0004LN-SR; Mon, 16 Dec 2019 13:47:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/6] arm64: dts: renesas: r8a77961: Add RWDT node
Date:   Mon, 16 Dec 2019 13:47:35 +0100
Message-Id: <20191216124740.16647-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216124740.16647-1-geert+renesas@glider.be>
References: <20191216124740.16647-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the RCLK Watchdog Timer (RWDT) on the Renesas
R-Car M3-W+ (r8a77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

Test procedure:
  1. "cat > /dev/watchdog",
  2. Wait 60s for reboot.
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 64466c86b698826d..ea2c6445977f3d99 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -319,8 +319,13 @@
 		ranges;
 
 		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a77961-wdt",
+				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
 		};
 
 		gpio2: gpio@e6052000 {
-- 
2.17.1

