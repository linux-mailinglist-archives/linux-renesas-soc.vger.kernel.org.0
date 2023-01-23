Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432956773D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 02:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjAWBfK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 22 Jan 2023 20:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjAWBfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Jan 2023 20:35:09 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7CFC18A94
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Jan 2023 17:35:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,238,1669042800"; 
   d="scan'208";a="147138395"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2023 10:35:06 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 328784000C7C;
        Mon, 23 Jan 2023 10:35:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
Date:   Mon, 23 Jan 2023 10:34:46 +0900
Message-Id: <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add IPMMU nodes for r8a779g0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 109 ++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 83d1666a2ea1..631192dec514 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1162,6 +1162,115 @@ dmac1: dma-controller@e7351000 {
 			dma-channels = <16>;
 		};
 
+		ipmmu_rt0: iommu@ee480000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xee480000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt1: iommu@ee4c0000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xee4c0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds0: iommu@eed00000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeed00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hsc: iommu@eed40000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeed40000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 7>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ir: iommu@eed80000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeed80000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: iommu@eedc0000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeedc0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_3dg: iommu@eee00000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeee00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: iommu@eee80000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeee80000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi1: iommu@eeec0000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeeec0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip0: iommu@eef00000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeef00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip1: iommu@eef40000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeef40000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: iommu@eefc0000 {
+			compatible = "renesas,ipmmu-r8a779g0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeefc0000 0 0x20000>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a779g0",
 				     "renesas,rcar-gen4-sdhi";
-- 
2.25.1

