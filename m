Return-Path: <linux-renesas-soc+bounces-2743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E327E85424B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 06:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE371C262A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 05:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A37C14F;
	Wed, 14 Feb 2024 05:21:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31506C147
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707888110; cv=none; b=trMm1mjvELB2VmKEbzoyaeRKWax8Z/B4aztBk+uH25ak5SXYGew9Sai1+fuVuqLHLuLyDUIJ8JPeD6aUEfQKPA9JUphhqst6CdHqtz0DhWUO/NBft9ft9qRLeGyXJkHc0tcBu1ZIu3LDi4M8oUQrNnZGbgIyBbJ99LJRbzXMuN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707888110; c=relaxed/simple;
	bh=P3agWdOHR2NKsaaDF26IhEiMpGgUqU2lzO5IchlbFaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pzXEYapCG1PQf8Pfpbdhkyv4c3SbVifu5bE7CQZgiJl9iq9rp+YqyuTX0Ej8uzqpc4NQJ0JVES84S51sHOCp7Z862OnlZoQSTVOLBSZvvsIpO++hmVVYZJTe6KfqMU+PuL4w03uicTsIZx7ImaMNBNU6m7wFrTjMKnrVbx7gbfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.06,159,1705330800"; 
   d="scan'208";a="193876835"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Feb 2024 14:21:45 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 995A94005460;
	Wed, 14 Feb 2024 14:21:45 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Add GICv3 ITS
Date: Wed, 14 Feb 2024 14:21:44 +0900
Message-Id: <20240214052144.1966569-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This SoC has GICv3 ITS and PCIe host mode on this SoC can use it.
So, add GIC ITS node into GIC node and update interrupt-map in PCIe node.

Note that PCIe nodes need msi-parent property to use the ITS for MSI.
However, it requires PCIe driver's update. Especially, vendor-specific
registers' setting is needed. So, this patch doesn't add msi-parent
properties into PCIe nodes.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 26 +++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 72cf30341fc4..63c14ef072b9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -778,10 +778,10 @@ pciec0: pcie@e65d0000 {
 			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
 		};
@@ -815,10 +815,10 @@ pciec1: pcie@e65d8000 {
 			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
 		};
@@ -1262,11 +1262,19 @@ ipmmu_mm: iommu@eefc0000 {
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-			#address-cells = <0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 			interrupt-controller;
 			reg = <0x0 0xf1000000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			gic_its: msi-controller@f1040000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0xf1040000 0 0x20000>;
+				msi-controller;
+			};
 		};
 
 		prr: chipid@fff00044 {
-- 
2.25.1


