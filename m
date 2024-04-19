Return-Path: <linux-renesas-soc+bounces-4735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0568AAE21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 14:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3D791C20BC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 12:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC11482D99;
	Fri, 19 Apr 2024 12:11:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC783A06
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713528663; cv=none; b=YOvVvjULL5q28OCODZEnhXBwKqaZG07jEMUvsOGY4aPAa7Bibb6lXQwnlNhnL8ablnq2nlajBqmLFb01lS+EKgPXOKufYuiSfaGfkPwyEoaZV/Gru6W7DI568la5WFRMj5POlovnOEdC/kWdHaSTNgsZYfZlcJgBbPTqxtBkV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713528663; c=relaxed/simple;
	bh=/A1/FMTD8fiNXIfWFFCVjkdhvZVOyNCsCp2y3Z+CFSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CDcBIq6/GW1VfXdbAgHVdJhip5yMQo2iLqJL/UVpjG8QrQgsQkA2V+UQuJ6t1QvOjIoxh2GzU039xpVMAAW1dZ772t1tIY758ATBAEPwkhN7nSKBiD4lGzAD6Cd+eaQqJLmJoesO9IHif1WbRGbG1VjbU05npqyh9Uownt8S3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by albert.telenet-ops.be with bizsmtp
	id D0At2C0060SSLxL060At73; Fri, 19 Apr 2024 14:10:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxn4J-00DJLv-Mp;
	Fri, 19 Apr 2024 14:10:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxn4v-00GI7y-7o;
	Fri, 19 Apr 2024 14:10:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thanh Le <thanh.le.xv@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add IPMMU nodes
Date: Fri, 19 Apr 2024 14:10:51 +0200
Message-Id: <b4701548e199ee2a72434bf73990557a63e13bd9.1713526951.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713526951.git.geert+renesas@glider.be>
References: <cover.1713526951.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thanh Le <thanh.le.xv@renesas.com>

Add device nodes for the main and cache I/O Memory Management Unit
(IPMMU) instances on the R-Car V4M (R8A779H0) SoC.

Add IPMMU main and cache nodes for R-Car R8A779H0 SoC.

Signed-off-by: Thanh Le <thanh.le.xv@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Add missing "renesas,rcar-gen4-ipmmu-vmsa" compatible fallbacks,
  - Drop second cell from renesas,ipmmu-main properties, as the bindings
    for R-Car Gen4 devices state there should be a single cell.
    Interestingly, the IMSSTR register is documented again for R-Car
    V4M, but let's keep it simple, and ignore it.
  - Drop status = "disabled",
  - Folded in a later sort order fix.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 100 ++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index bd3955316a88c8f2..f4a97e72fcde8fb3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1028,6 +1028,106 @@ rpc: spi@ee200000 {
 			status = "disabled";
 		};
 
+		ipmmu_rt0: iommu@ee480000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xee480000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt1: iommu@ee4c0000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xee4c0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds0: iommu@eed00000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeed00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hc: iommu@eed40000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeed40000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ir: iommu@eed80000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeed80000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc: iommu@eedc0000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeedc0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_3dg: iommu@eee00000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeee00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: iommu@eee80000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeee80000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi1: iommu@eeec0000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeeec0000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip0: iommu@eef00000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeef00000 0 0x20000>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: iommu@eefc0000 {
+			compatible = "renesas,ipmmu-r8a779h0",
+				     "renesas,rcar-gen4-ipmmu-vmsa";
+			reg = <0 0xeefc0000 0 0x20000>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


