Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75CF3EA762
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 17:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237940AbhHLPSy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 11:18:54 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52582 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237917AbhHLPSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 11:18:50 -0400
X-IronPort-AV: E=Sophos;i="5.84,316,1620658800"; 
   d="scan'208";a="90481442"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Aug 2021 00:18:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E171400F2D3;
        Fri, 13 Aug 2021 00:18:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 3/3] arm64: dts: renesas: r9a07g044: Add USB2.0 device support
Date:   Thu, 12 Aug 2021 16:18:08 +0100
Message-Id: <20210812151808.7916-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB2.0 device support to RZ/G2L SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * Added Rb tag from Geert.
v4->v5:
 * No change.
v3->v4:
 * No change.
 V3:
  * Updated reset entries.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index de78c921af22..2f313c2a81c7 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -391,6 +391,25 @@
 			power-domains = <&cpg>;
 			status = "disabled";
 		};
+
+		hsusb: usb@11c60000 {
+			compatible = "renesas,usbhs-r9a07g044",
+				     "renesas,rza2-usbhs";
+			reg = <0 0x11c60000 0 0x10000>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2P_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A07G044_USB_U2P_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.17.1

