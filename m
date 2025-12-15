Return-Path: <linux-renesas-soc+bounces-25747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E3CBC5BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3E42300884F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6431314A77;
	Mon, 15 Dec 2025 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Iwv9OoRJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D72D2387
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770563; cv=none; b=O34YY44IwKwwUYKdUSM9oHC4++yD5H972OX3ZAa3ar7Ldv21pFjALrBYPT6bqZOkGpJ7lF/9179RqqRLmyPQ2eLizlGEaHUA6u8GJwTgNr4/udpMSBizA/RsnrCPlQiEAXOWYIeHJgOMaTTarCrLEv9sIvPQ+8cFW1C4J9SK9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770563; c=relaxed/simple;
	bh=e8NU5NRaq+88yGIMuF7x2rtS5Gbu+rEdtvy9M20Udf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzPnKteqcluJV60p9Q3l/9UoVPySIu+rE85gCS4/FB60x1SayieWPywo6DQ2Mm9pbG71jPV8wTSpBJCG3tnOPB0ruAi3l51dGjFnCmZ1LzPk7PA1igEagjhVP4RR6dqX27zWSJhwISkYK2JcgCBN14H7dN7jW7vQZ4rkKZtBz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Iwv9OoRJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=e7aRdPio401Fyb/lsLdxScS2mBg4SHVYFZ3VtGi3YdU=; b=Iwv9Oo
	RJKk8U5K4chIt5LvRsWd8RsgtHAHT3DKfljsO7zeNNztXRoNsjCwSW3ete5bNn6L
	Sq9+ZIyO2SFa3IPSdthamDJUWven/9lx3cmokRogRDbn2vyrCAbbbnYSKYWImGz4
	OSX76cRjjD/GEeI3UXH2vth09BujUKYc3nbvND9jE8bS/toAH6yp1lDoxcUwsK69
	LZt7np4zgT18fwyVPADPnVRX2UInynel6ZrFCTpgbEX+OJ7cah00Ue+XHoksIlAy
	uvphHJv7K9mwQlla0rEXjdBHsQxrDMmW1it9/ZHxrAWlnSiZXTQqRiMa/iR+E4yv
	6MXbtRyl4zrTX+qg==
Received: (qmail 822038 invoked from network); 15 Dec 2025 04:49:12 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:49:12 +0100
X-UD-Smtp-Session: l3s3148p1@0vDpffVF4+jN3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: renesas: r8a779f0: Add WWDT nodes
Date: Mon, 15 Dec 2025 12:47:18 +0900
Message-ID: <20251215034715.3406-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215034715.3406-8-wsa+renesas@sang-engineering.com>
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 160 ++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 0ebf8e5dd2f9..cbb161c863ac 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -1297,6 +1297,166 @@ gic: interrupt-controller@f1000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		wwdt0: watchdog@ffc90000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffc90000 0 0x10>;
+			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1200>, <&cpg 1318>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt1: watchdog@ffca0000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffca0000 0 0x10>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1201>, <&cpg 1319>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt2: watchdog@ffcb0000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcb0000 0 0x10>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1202>, <&cpg 1320>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt3: watchdog@ffcc0000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcc0000 0 0x10>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1203>, <&cpg 1321>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt4: watchdog@ffcf0000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcf0000 0 0x10>;
+			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1204>, <&cpg 1322>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt5: watchdog@ffef0000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffef0000 0 0x10>;
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1205>, <&cpg 1323>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt6: watchdog@fff10000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff10000 0 0x10>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1206>, <&cpg 1324>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt7: watchdog@fff20000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff20000 0 0x10>;
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1207>, <&cpg 1325>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt8: watchdog@fff30000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff30000 0 0x10>;
+			interrupts = <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1208>, <&cpg 1326>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt9: watchdog@fff40000 {
+			compatible = "renesas,r8a779f0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff40000 0 0x10>;
+			interrupts = <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_R>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1209>, <&cpg 1327>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.47.3


