Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAB03FD882
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 13:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238988AbhIALOK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 07:14:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1937 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S241833AbhIALOJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 07:14:09 -0400
X-IronPort-AV: E=Sophos;i="5.84,369,1620658800"; 
   d="scan'208";a="92654945"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2021 20:13:11 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B903B44258EC;
        Wed,  1 Sep 2021 20:13:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add IPMMU nodes
Date:   Wed,  1 Sep 2021 20:13:04 +0900
Message-Id: <20210901111305.570206-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add IPMMU nodes for r8a779a0. Note that this patch sets the power
domain of IPMMU-VC0 is Always-On tentatively because the SoC doesn't
have A3VC power domain.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 97 +++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 78ca75f619f6..4f15661f7317 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1093,6 +1093,103 @@ mmc0: mmc@ee140000 {
 			status = "disabled";
 		};
 
+		ipmmu_rt0: iommu@ee480000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xee480000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt1: iommu@ee4c0000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xee4c0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 19>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds0: iommu@eed00000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeed00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds1: iommu@eed40000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeed40000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ir: iommu@eed80000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeed80000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			power-domains = <&sysc R8A779A0_PD_A3IR>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: iommu@eedc0000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeedc0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: iommu@eee80000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeee80000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi1: iommu@eeec0000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeeec0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 15>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_3dg: iommu@eee00000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeee00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip0: iommu@eef00000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeef00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip1: iommu@eef40000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeef40000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 11>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: iommu@eefc0000 {
+			compatible = "renesas,ipmmu-r8a779a0";
+			reg = <0 0xeefc0000 0 0x20000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.25.1

