Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C9428DE15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 11:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgJNJ5u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 05:57:50 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38010 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbgJNJ5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:57:25 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 529FD3B7108
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 09:41:16 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E4FA91C0013;
        Wed, 14 Oct 2020 09:40:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: renesas: r8a779a0: Add CSI-2 nodes
Date:   Wed, 14 Oct 2020 11:44:40 +0200
Message-Id: <20201014094443.11070-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CSI-2 nodes to R8A779A0 R-Car V3U SoC.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
The chip manual reports that the CSI-2 units are fed with S1D1 and S1D2
clocks. The same applies to other SoCs, but none lists the two
additional clocks in the DTS node. So I left them out here as well.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6cf77ce9aa93..83962ad30a1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -105,6 +105,47 @@ scif0: serial@e6e60000 {
 			status = "disabled";
 		};
 
+		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfeaa0000 0 0x10000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			status = "disabled";
+		};
+
+		csi41: csi2@feab0000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfeab0000 0 0x10000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 400>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 400>;
+			status = "disabled";
+		};
+
+		csi42: csi2@fed60000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfed60000 0 0x10000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 401>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+
+		};
+
+		csi43: csi2@fed70000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfed70000 0 0x10000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.28.0

