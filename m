Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2D34E2E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfFUJOR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFUJOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4DBAB25BE64;
        Fri, 21 Jun 2019 19:13:55 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B5730942C3C; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 18/22] ARM: dts: r7s9210: Add IRQC device node
Date:   Fri, 21 Jun 2019 11:13:45 +0200
Message-Id: <e23391f36ce14719768ad5395e93a54fec7edf5a.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Enable support for the IRQC on RZ/A2M, which is a small front-end to the
GIC.  This allows to use up to 8 external interrupts with configurable
sense select.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 3d0bbc1f4543..72b79770e336 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -473,6 +473,25 @@
 			reg = <0xfcfe8004 4>;
 		};
 
+		irqc: interrupt-controller@fcfef800 {
+			compatible = "renesas,r7s9210-irqc",
+				     "renesas,rza1-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0xfcfef800 0x6>;
+			interrupt-map =
+				<0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				<2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				<3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				<4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				<5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				<6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				<7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <7 0>;
+		};
+
 		pinctrl: pin-controller@fcffe000 {
 			compatible = "renesas,r7s9210-pinctrl";
 			reg = <0xfcffe000 0x1000>;
-- 
2.11.0

