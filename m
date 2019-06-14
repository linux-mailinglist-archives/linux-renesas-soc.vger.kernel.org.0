Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31DE45DEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 15:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbfFNNRZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 09:17:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:50451 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727913AbfFNNRZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 09:17:25 -0400
X-IronPort-AV: E=Sophos;i="5.62,373,1554735600"; 
   d="scan'208";a="18469633"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Jun 2019 22:17:22 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F62940065C7;
        Fri, 14 Jun 2019 22:17:20 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Date:   Fri, 14 Jun 2019 14:14:35 +0100
Message-Id: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
common device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch depends on:
https://patchwork.kernel.org/patch/10986913/

Thanks,
Fab

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 18763ca..b0bf510 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -17,6 +17,30 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+			label = "LED0";
+		};
+
+		led1 {
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+			label = "LED1";
+		};
+
+		led2 {
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+			label = "LED2";
+		};
+
+		led3 {
+			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
+			label = "LED3";
+		};
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.7.4

