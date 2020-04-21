Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99201B22E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 11:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgDUJgF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 05:36:05 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:2311 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725920AbgDUJgE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 05:36:04 -0400
X-IronPort-AV: E=Sophos;i="5.72,409,1580742000"; 
   d="scan'208";a="45092002"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Apr 2020 18:36:03 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 005584008576;
        Tue, 21 Apr 2020 18:36:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] ARM: dts: renesas: Fix IOMMU device node names
Date:   Tue, 21 Apr 2020 18:35:56 +0900
Message-Id: <1587461756-13317-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix IOMMU device node names as "iommu@".

Fixes: bbb44da0b595 ("ARM: dts: r8a7743: Add IPMMU DT nodes")
Fixes: 0dcba3de5835 ("ARM: dts: r8a7745: Add IPMMU DT nodes")
Fixes: 350ae49b97c4 ("ARM: dts: r8a7744: Add IPMMU DT nodes")
Fixes: 70496727c082 ("ARM: shmobile: r8a7790: Add IPMMU DT nodes")
Fixes: f1951852ed17 ("ARM: shmobile: r8a7791: Add IPMMU DT nodes")
Fixes: 098cb3a601e6 ("ARM: shmobile: r8a7793: Add IPMMU nodes")
Fixes: 1cb2794f6082 ("ARM: shmobile: r8a7794: Add IPMMU DT nodes")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7744.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7745.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7790.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7791.dtsi | 14 +++++++-------
 arch/arm/boot/dts/r8a7793.dtsi | 14 +++++++-------
 arch/arm/boot/dts/r8a7794.dtsi | 12 ++++++------
 7 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 1cd19a5..527a018 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -338,7 +338,7 @@
 			#thermal-sensor-cells = <0>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7743",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -348,7 +348,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7743",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -357,7 +357,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7743",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -367,7 +367,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7743",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -376,7 +376,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7743",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -386,7 +386,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_gp: mmu@e62a0000 {
+		ipmmu_gp: iommu@e62a0000 {
 			compatible = "renesas,ipmmu-r8a7743",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe62a0000 0 0x1000>;
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 1c82dd0..d7480b0 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -338,7 +338,7 @@
 			#thermal-sensor-cells = <0>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7744",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -348,7 +348,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7744",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -357,7 +357,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7744",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -367,7 +367,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7744",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -376,7 +376,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7744",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -386,7 +386,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_gp: mmu@e62a0000 {
+		ipmmu_gp: iommu@e62a0000 {
 			compatible = "renesas,ipmmu-r8a7744",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe62a0000 0 0x1000>;
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 3f88a7e..bd28f9b 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -302,7 +302,7 @@
 			resets = <&cpg 407>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -312,7 +312,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -321,7 +321,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -331,7 +331,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -340,7 +340,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -350,7 +350,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_gp: mmu@e62a0000 {
+		ipmmu_gp: iommu@e62a0000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe62a0000 0 0x1000>;
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 334ba19..836b580 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -427,7 +427,7 @@
 			#thermal-sensor-cells = <0>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7790",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -437,7 +437,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7790",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -446,7 +446,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7790",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -456,7 +456,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7790",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -465,7 +465,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7790",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -475,7 +475,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_rt: mmu@ffc80000 {
+		ipmmu_rt: iommu@ffc80000 {
 			compatible = "renesas,ipmmu-r8a7790",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xffc80000 0 0x1000>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 59a55e8..c1352f1 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -350,7 +350,7 @@
 			#thermal-sensor-cells = <0>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -360,7 +360,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -369,7 +369,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -379,7 +379,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -388,7 +388,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -398,7 +398,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_rt: mmu@ffc80000 {
+		ipmmu_rt: iommu@ffc80000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xffc80000 0 0x1000>;
@@ -407,7 +407,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_gp: mmu@e62a0000 {
+		ipmmu_gp: iommu@e62a0000 {
 			compatible = "renesas,ipmmu-r8a7791",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe62a0000 0 0x1000>;
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index eef035c..ddd2ab7 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -336,7 +336,7 @@
 			#thermal-sensor-cells = <0>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -346,7 +346,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -355,7 +355,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -365,7 +365,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -374,7 +374,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -384,7 +384,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_rt: mmu@ffc80000 {
+		ipmmu_rt: iommu@ffc80000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xffc80000 0 0x1000>;
@@ -393,7 +393,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_gp: mmu@e62a0000 {
+		ipmmu_gp: iommu@e62a0000 {
 			compatible = "renesas,ipmmu-r8a7793",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe62a0000 0 0x1000>;
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 05ef79c..bac6a76 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -290,7 +290,7 @@
 			resets = <&cpg 407>;
 		};
 
-		ipmmu_sy0: mmu@e6280000 {
+		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6280000 0 0x1000>;
@@ -300,7 +300,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_sy1: mmu@e6290000 {
+		ipmmu_sy1: iommu@e6290000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6290000 0 0x1000>;
@@ -309,7 +309,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_ds: mmu@e6740000 {
+		ipmmu_ds: iommu@e6740000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe6740000 0 0x1000>;
@@ -319,7 +319,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mp: mmu@ec680000 {
+		ipmmu_mp: iommu@ec680000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xec680000 0 0x1000>;
@@ -328,7 +328,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_mx: mmu@fe951000 {
+		ipmmu_mx: iommu@fe951000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xfe951000 0 0x1000>;
@@ -338,7 +338,7 @@
 			status = "disabled";
 		};
 
-		ipmmu_gp: mmu@e62a0000 {
+		ipmmu_gp: iommu@e62a0000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
 			reg = <0 0xe62a0000 0 0x1000>;
-- 
2.7.4

