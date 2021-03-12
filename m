Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906A333893D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 10:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhCLJvK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 04:51:10 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:33307 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233219AbhCLJui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 04:50:38 -0500
X-IronPort-AV: E=Sophos;i="5.81,243,1610377200"; 
   d="scan'208";a="74972789"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Mar 2021 18:50:36 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26845400E9F2;
        Fri, 12 Mar 2021 18:50:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77961: Add CAN nodes
Date:   Fri, 12 Mar 2021 18:50:30 +0900
Message-Id: <20210312095030.534957-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the device nodes for all CAN nodes on R-Car M3-W+.

Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 26 +++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index e8c31ebec097..d44b7fef1e8e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1155,13 +1155,35 @@ avb: ethernet@e6800000 {
 		};
 
 		can0: can@e6c30000 {
+			compatible = "renesas,can-r8a77961",
+				     "renesas,rcar-gen3-can";
 			reg = <0 0xe6c30000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>,
+			       <&cpg CPG_CORE R8A77961_CLK_CANFD>,
+			       <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A77961_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+			status = "disabled";
 		};
 
 		can1: can@e6c38000 {
+			compatible = "renesas,can-r8a77961",
+				     "renesas,rcar-gen3-can";
 			reg = <0 0xe6c38000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>,
+			       <&cpg CPG_CORE R8A77961_CLK_CANFD>,
+			       <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A77961_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			status = "disabled";
 		};
 
 		pwm0: pwm@e6e30000 {
-- 
2.25.1

