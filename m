Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BD11E503E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 23:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgE0VTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 17:19:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5763 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgE0VTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 17:19:32 -0400
X-IronPort-AV: E=Sophos;i="5.73,442,1583161200"; 
   d="scan'208";a="47965372"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 May 2020 06:19:31 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0F1D0400C4CB;
        Thu, 28 May 2020 06:19:29 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] ARM: dts: r8a7742: Add thermal device to DT
Date:   Wed, 27 May 2020 22:18:38 +0100
Message-Id: <1590614320-30160-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch instantiates the thermal sensor module with thermal-zone
support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 3ed05c6..f57db05 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -375,6 +375,17 @@
 			resets = <&cpg 407>;
 		};
 
+		thermal: thermal@e61f0000 {
+			compatible = "renesas,thermal-r8a7742",
+				     "renesas,rcar-gen2-thermal";
+			reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
@@ -1359,6 +1370,25 @@
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&thermal>;
+
+			trips {
+				cpu-crit {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.7.4

