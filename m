Return-Path: <linux-renesas-soc+bounces-2216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB18459BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C228A1C214F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434725D475;
	Thu,  1 Feb 2024 14:14:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6D75D465
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796896; cv=none; b=P+J/4pM5CzBLBE9xsXl5iVZGPEcRv7J5Z6JytvF8cOo/uk8NXxwqrVs0xaDke7GwTL9zpDssP7bcz+ZGd0fpj2E+C294JhAYRhvDMpHrOMcABvAyHKgA5yrd8qrQnKczxZ7P+Q2yaEPP4/X2prj2/thXSmSeAF/Ki/2FHfh0byc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796896; c=relaxed/simple;
	bh=3ycJl2V6ChLuEDG69ckziIRWe+ze4+NrREHj7oZq7mU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jO+qg+9fUff6kHvgIBAAKiU1xAZzgP1QmcOx+0zKVHNMtym0j6uO1/Dv8TsOWlezGAHWLpKyQbjNs3D35127+/+I9zrTR0lZZ0ADjpFYFc45yTN2Sugl96IgQwoNPuJUj6KPNPi+ZCD43CGQYKA6nKG3F38cdh0zMJRo/MLwe4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TQgs23mTwz4x0Zv
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 15:14:46 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by baptiste.telenet-ops.be with bizsmtp
	id hqEd2B0064efzLr01qEdSS; Thu, 01 Feb 2024 15:14:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXp2-00Gv45-AR;
	Thu, 01 Feb 2024 15:14:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXpt-00AXZM-AB;
	Thu, 01 Feb 2024 15:14:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Hai Pham <hai.pham.ud@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add I2C nodes
Date: Thu,  1 Feb 2024 15:14:33 +0100
Message-Id: <7dbbe13428273c5786ddff6ea7af6724fcdd4de8.1706796660.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706796660.git.geert+renesas@glider.be>
References: <cover.1706796660.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hai Pham <hai.pham.ud@renesas.com>

Add device nodes for the I2C Bus Interfaces on the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Incorporate i2c2 fix from "arm64: dts: renesas: r8a779h0: Sort IPMMU driver nodes".
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 56 +++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index f5a688e300d29a73..8121aadaf6999429 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -99,6 +99,62 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		i2c0: i2c@e6500000 {
+			compatible = "renesas,i2c-r8a779h0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 518>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 518>;
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6508000 {
+			compatible = "renesas,i2c-r8a779h0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 519>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 519>;
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6510000 {
+			compatible = "renesas,i2c-r8a779h0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe6510000 0 0x40>;
+			interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 520>;
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e66d0000 {
+			compatible = "renesas,i2c-r8a779h0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe66d0000 0 0x40>;
+			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 521>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 521>;
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		hscif0: serial@e6540000 {
 			compatible = "renesas,hscif-r8a779h0",
 				     "renesas,rcar-gen4-hscif", "renesas,hscif";
-- 
2.34.1


