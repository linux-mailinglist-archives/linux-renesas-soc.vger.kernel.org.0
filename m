Return-Path: <linux-renesas-soc+bounces-7682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D0944D84
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42A161C23FC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 13:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398F4184549;
	Thu,  1 Aug 2024 13:54:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9591A3BBF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722520492; cv=none; b=EIOL+W3E+1CG/exlmMASI3I9Vx50uCGOkCousGMaIFcTvHHH+UECmNH0pg3YgDrz/K3ju1+4jg6T4xRDyh7HL42A/fGG2u/mELmoWofuVeEeDqkZEwtuuZkl+fFL7FPjn9EhJLXxaDD40yDbRu9Kj44EYty/I+Xq2jX8cqgzfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722520492; c=relaxed/simple;
	bh=bVlsDp3q8Lsz/ulyawet4QT8Hb75VzOJY8/9Ucfu/gA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l1AXpvPGyfjgMeaztDEszXWrUS7vukfEJylWnuKZbaLCTvP2/qAcWp61KXKtdYO5I8Qd46GtAlgZtxVI522W1HONJb9xEyTC/l49wDJVii2MwZxU2E5sTCZphOE2xYeCFHxZuO7PCO3Yv0iPQpyqm5Lw+8LdB3MkM6qqUeONhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fff7:d11a:41d8:a195])
	by albert.telenet-ops.be with bizsmtp
	id uduh2C00J5XJrhx06duhEc; Thu, 01 Aug 2024 15:54:41 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWG0-004S9v-Uc;
	Thu, 01 Aug 2024 15:54:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWGP-00HOE3-4d;
	Thu, 01 Aug 2024 15:54:41 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a779h0: Add CAN-FD node
Date: Thu,  1 Aug 2024 15:54:35 +0200
Message-Id: <43b786db932f5c53103d34fd530365c445c0425e.1722519717.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722519717.git.geert+renesas@glider.be>
References: <cover.1722519717.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add device nodes for the CAN-FD interface and the related external CAN
clock on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

Changes compared to the BSP:
  - Add can_clk comment,
  - Add "-clk" suffix to clock node name.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 7147f88401893d3d..c18a70b5552fef93 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -21,6 +21,13 @@ audio_clkin: audio_clkin {
 		clock-frequency = <0>;
 	};
 
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 
@@ -641,6 +648,40 @@ hscif3: serial@e66a0000 {
 			status = "disabled";
 		};
 
+		canfd: can@e6660000 {
+			compatible = "renesas,r8a779h0-canfd",
+				     "renesas,rcar-gen4-canfd";
+			reg = <0 0xe6660000 0 0x8500>;
+			interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch_int", "g_int";
+			clocks = <&cpg CPG_MOD 328>,
+				 <&cpg CPG_CORE R8A779H0_CLK_CANFD>,
+				 <&can_clk>;
+			clock-names = "fck", "canfd", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A779H0_CLK_CANFD>;
+			assigned-clock-rates = <80000000>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+
+			channel1 {
+				status = "disabled";
+			};
+
+			channel2 {
+				status = "disabled";
+			};
+
+			channel3 {
+				status = "disabled";
+			};
+		};
+
 		avb0: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a779h0",
 				     "renesas,etheravb-rcar-gen4";
-- 
2.34.1


