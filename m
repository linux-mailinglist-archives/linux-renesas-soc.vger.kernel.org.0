Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94BE84E2DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfFUJOC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJOC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:02 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CACFE25BE34;
        Fri, 21 Jun 2019 19:13:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 81094941378; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 15/22] ARM: dts: rza2mevb: Add USB Host support
Date:   Fri, 21 Jun 2019 11:13:42 +0200
Message-Id: <003ddc67e62672279134c85dc2609a913b89d64b.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Enable USB Host support for both the Type-C connector on the CPU board
and the Type-A plug on the sub board.

Both boards are also capable of USB Device operation as well after the
appropriate Device Tree modifications.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index fa44e35e0fda..e140168da573 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -107,6 +107,18 @@
 		pinmux = <RZA2_PINMUX(PORT5, 4, 3)>,	/* SD1_CD */
 			 <RZA2_PINMUX(PORT5, 5, 3)>;	/* SD1_WP */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZA2_PINMUX(PORT5, 2, 3)>,	/* VBUSIN0 */
+			 <RZA2_PINMUX(PORTC, 6, 1)>,	/* VBUSEN0 */
+			 <RZA2_PINMUX(PORTC, 7, 1)>;	/* OVRCUR0 */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZA2_PINMUX(PORTC, 0, 1)>,	/* VBUSIN1 */
+			 <RZA2_PINMUX(PORTC, 5, 1)>,	/* VBUSEN1 */
+			 <RZA2_PINMUX(PORT7, 5, 5)>;	/* OVRCUR1 */
+	};
 };
 
 /* High resolution System tick timers */
@@ -161,3 +173,27 @@
 	bus-width = <4>;
 	status = "okay";
 };
+
+/* USB-0 as Host */
+&usb2_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
+	dr_mode = "host";	/* Requires JP3 to be fitted */
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+/* USB-1 as Host */
+&usb2_phy1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
-- 
2.11.0

