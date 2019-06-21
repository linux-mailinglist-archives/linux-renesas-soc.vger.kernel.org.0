Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9024E2D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfFUJOA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E169825BE05;
        Fri, 21 Jun 2019 19:13:52 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D5FF6940B38; Fri, 21 Jun 2019 11:13:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/22] ARM: dts: rza2mevb: Add SDHI support
Date:   Fri, 21 Jun 2019 11:13:33 +0200
Message-Id: <c2fad09c28ace81f149afe74a8c378c4824b2b27.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

The RZ/A2M EVB supports 2 SD card slots. A micro SD slot on the CPU
board, and a full SD card slot on the sub board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 1544f3bab3f8..a328426a0409 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -90,6 +90,16 @@
 			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
+
+	sdhi0_pins: sdhi0 {
+		pinmux = <RZA2_PINMUX(PORT5, 0, 3)>,	/* SD0_CD */
+			 <RZA2_PINMUX(PORT5, 1, 3)>;	/* SD0_WP */
+	};
+
+	sdhi1_pins: sdhi1 {
+		pinmux = <RZA2_PINMUX(PORT5, 4, 3)>,	/* SD1_CD */
+			 <RZA2_PINMUX(PORT5, 5, 3)>;	/* SD1_WP */
+	};
 };
 
 /* High resolution System tick timers */
@@ -130,3 +140,17 @@
 		reg = <0>;
 	};
 };
+
+&sdhi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi0_pins>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&sdhi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi1_pins>;
+	bus-width = <4>;
+	status = "okay";
+};
-- 
2.11.0

