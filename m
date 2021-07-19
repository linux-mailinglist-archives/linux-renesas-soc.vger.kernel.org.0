Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944793CD4A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 14:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236667AbhGSLjb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 07:39:31 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:41338 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236758AbhGSLjb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 07:39:31 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88077970"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2021 21:20:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5749E40061A1;
        Mon, 19 Jul 2021 21:20:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 10/10] arm64: dts: renesas: r9a07g044: Add USB2.0 device support
Date:   Mon, 19 Jul 2021 13:19:38 +0100
Message-Id: <20210719121938.6532-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB2.0 device support to RZ/G2L SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 * No change.
 V3:
  * Updated reset entries.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 24910ecc683c..d846469ded7f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -330,6 +330,25 @@
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

