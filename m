Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DFC506BBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 14:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352081AbiDSMKW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 08:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242089AbiDSMIR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 08:08:17 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1796C38A1;
        Tue, 19 Apr 2022 05:03:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,272,1643641200"; 
   d="scan'208";a="117332765"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Apr 2022 21:03:54 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E8A85427EA6F;
        Tue, 19 Apr 2022 21:03:54 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Date:   Tue, 19 Apr 2022 21:03:15 +0900
Message-Id: <20220419120316.209151-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419120316.209151-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220419120316.209151-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add UFS node for R-Car S4-8 (r8a779f0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index b0241aa29fc8..9639b50fb62b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -40,6 +40,13 @@ extalr_clk: extalr {
 		clock-frequency = <0>;
 	};
 
+	ufs30_clk: ufs30-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	pmu_a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -258,6 +265,18 @@ i2c5: i2c@e66e0000 {
 			status = "disabled";
 		};
 
+		ufs: ufs@e6860000 {
+			compatible = "renesas,r8a779f0-ufs";
+			reg = <0 0xe6860000 0 0x100>;
+			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
+			clock-names = "fck", "ref_clk";
+			freq-table-hz = <200000000 200000000>, <38400000 38400000>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1514>;
+			status = "disabled";
+		};
+
 		scif3: serial@e6c50000 {
 			compatible = "renesas,scif-r8a779f0",
 				     "renesas,rcar-gen4-scif", "renesas,scif";
-- 
2.25.1

