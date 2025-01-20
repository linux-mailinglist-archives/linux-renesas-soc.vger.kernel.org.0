Return-Path: <linux-renesas-soc+bounces-12265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB097A16C68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 13:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119FD1698DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 12:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F111BBBDD;
	Mon, 20 Jan 2025 12:33:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9211B86F7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737376407; cv=none; b=iaxWSZcfeMmbABGyd5h4zKwh46SaMG9tC0JQJ/puuTHKYGl4bUV6t4KnyvKdjl/bGljX1aiVTWUcG5DMsA+AzZ89v6ttJEdfQkAAdn2A0NTIV9DDZEjQZBPLRGZnBBw/bJF0SFBdC3kB3HNZPK4N56FpJhENyVA5cQjAci/Vq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737376407; c=relaxed/simple;
	bh=FLHGAk5kg6mX9j5nS3NTjLvUImeO43tEKOU6GyrS2VI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlCjRccczk/ArX7wjeTIRh7klL3IBpldxlAVdwM1n7BcjNedp/JMKJsPmxHdOnH8BlK7KADqSrJgn5bDF7urxPB65nK+fQ3XTfd9qUFGWLuBpH1ZbxNfFamFV8Z6g+SdDJRiOWEmFw1raxb2BHrKOUf4uXgmlShoHMAVfzjSJQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:30c9:4dcf:fe21:4b10])
	by laurent.telenet-ops.be with cmsmtp
	id 3QZH2E0060raqVW01QZHyr; Mon, 20 Jan 2025 13:33:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZqxq-0000000DgtV-2XTn;
	Mon, 20 Jan 2025 13:33:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZpef-0000000CU8e-3Zp6;
	Mon, 20 Jan 2025 12:09:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Restore sort order
Date: Mon, 20 Jan 2025 12:09:12 +0100
Message-ID: <ccd215c1146b84c085908e01966f7036be51afa8.1737370801.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Numerical by unit address, but grouped by type.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.15.

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 80 +++++++++++------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 89049e40086c2d41..cbc4680e497734d3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2171,6 +2171,24 @@ fcpvd1: fcp@fea11000 {
 			iommus = <&ipmmu_vi1 7>;
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
+		fcpvx1: fcp@fedb8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1101>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 1101>;
+			iommus = <&ipmmu_vi1 25>;
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x7000>;
@@ -2193,6 +2211,28 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		vspx0: vsp@fedd0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd0000 0 0x8000>;
+			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1028>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 1028>;
+
+			renesas,fcp = <&fcpvx0>;
+		};
+
+		vspx1: vsp@fedd8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd8000 0 0x8000>;
+			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1029>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 1029>;
+
+			renesas,fcp = <&fcpvx1>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a779g0";
 			reg = <0 0xfeb00000 0 0x40000>;
@@ -2453,46 +2493,6 @@ port@1 {
 			};
 		};
 
-		fcpvx0: fcp@fedb0000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfedb0000 0 0x200>;
-			clocks = <&cpg CPG_MOD 1100>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
-			resets = <&cpg 1100>;
-			iommus = <&ipmmu_vi1 24>;
-		};
-
-		fcpvx1: fcp@fedb8000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfedb8000 0 0x200>;
-			clocks = <&cpg CPG_MOD 1101>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
-			resets = <&cpg 1101>;
-			iommus = <&ipmmu_vi1 25>;
-		};
-
-		vspx0: vsp@fedd0000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfedd0000 0 0x8000>;
-			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 1028>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
-			resets = <&cpg 1028>;
-
-			renesas,fcp = <&fcpvx0>;
-		};
-
-		vspx1: vsp@fedd8000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfedd8000 0 0x8000>;
-			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 1029>;
-			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
-			resets = <&cpg 1029>;
-
-			renesas,fcp = <&fcpvx1>;
-		};
-
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.43.0


