Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA0F2403EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 11:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgHJJWS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 05:22:18 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21575 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726304AbgHJJWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 05:22:16 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54286667"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Aug 2020 18:22:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0F8FD41EF40F;
        Mon, 10 Aug 2020 18:22:13 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774e1: Add VSP instances
Date:   Mon, 10 Aug 2020 10:22:08 +0100
Message-Id: <20200810092208.27320-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

The RZ/G2H (R8A774E1) has 6 VSP instances.

Based on the work done for r8a7795 SoC.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 66 +++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 1954a07f3e85..8f762bd2c9aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2374,6 +2374,72 @@
 			status = "disabled";
 		};
 
+		vspbc: vsp@fe920000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe920000 0 0x8000>;
+			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 624>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 624>;
+
+			renesas,fcp = <&fcpvb1>;
+		};
+
+		vspbd: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 626>;
+
+			renesas,fcp = <&fcpvb1>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x5000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x5000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
+		vspi0: vsp@fe9a0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9a0000 0 0x8000>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 631>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 631>;
+
+			renesas,fcp = <&fcpvi0>;
+		};
+
+		vspi1: vsp@fe9b0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9b0000 0 0x8000>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 630>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 630>;
+
+			renesas,fcp = <&fcpvi1>;
+		};
+
 		fcpf0: fcp@fe950000 {
 			compatible = "renesas,fcpf";
 			reg = <0 0xfe950000 0 0x200>;
-- 
2.17.1

