Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFB9290152
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 11:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405284AbgJPJNU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 05:13:20 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39849 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405501AbgJPJM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 05:12:26 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D28192004D;
        Fri, 16 Oct 2020 09:12:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: dts: renesas: r8a779a0: Add CSI-2 nodes
Date:   Fri, 16 Oct 2020 13:11:55 +0200
Message-Id: <20201016111158.17521-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
References: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CSI-2 nodes to R8A779A0 R-Car V3U SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

v2:
- Add empty 'ports' node to pass dtbs validation

---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6cf77ce9aa93..62ed6ce29cb0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -117,6 +117,58 @@ gic: interrupt-controller@f1000000 {
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 		};

+		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfeaa0000 0 0x10000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			status = "disabled";
+
+			ports {
+			};
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
+
+			ports {
+			};
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
+			ports {
+			};
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
+
+			ports {
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
--
2.28.0

