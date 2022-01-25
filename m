Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6EA49B493
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 14:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356713AbiAYND6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 08:03:58 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:24800 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1574884AbiAYNA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 08:00:28 -0500
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; 
   d="scan'208";a="108236595"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jan 2022 22:00:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 780D14001DDD;
        Tue, 25 Jan 2022 22:00:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Date:   Tue, 25 Jan 2022 22:00:20 +0900
Message-Id: <20220125130021.4144902-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add IPMMU nodes for r8a779f0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 5426532d10e2..3b3d01ba08dd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -164,6 +164,52 @@ dmac1: dma-controller@e7351000 {
 			dma-channels = <16>;
 		};
 
+		ipmmu_rt0: iommu@ee480000 {
+			compatible = "renesas,ipmmu-r8a779f0",
+				     "renesas,rcar-gen4-ipmmu";
+			reg = <0 0xee480000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt1: iommu@ee4c0000 {
+			compatible = "renesas,ipmmu-r8a779f0",
+				     "renesas,rcar-gen4-ipmmu";
+			reg = <0 0xee4c0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 19>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds0: iommu@eed00000 {
+			compatible = "renesas,ipmmu-r8a779f0",
+				     "renesas,rcar-gen4-ipmmu";
+			reg = <0 0xeed00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hsc: iommu@eed40000 {
+			compatible = "renesas,ipmmu-r8a779f0",
+				     "renesas,rcar-gen4-ipmmu";
+			reg = <0 0xeed40000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: iommu@eefc0000 {
+			compatible = "renesas,ipmmu-r8a779f0",
+				     "renesas,rcar-gen4-ipmmu";
+			reg = <0 0xeefc0000 0 0x20000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.25.1

