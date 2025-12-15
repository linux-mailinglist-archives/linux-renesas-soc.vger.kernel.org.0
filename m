Return-Path: <linux-renesas-soc+bounces-25749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DAECBC5C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBCA13005EA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D08D2D2387;
	Mon, 15 Dec 2025 03:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R2YxZMIW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685342C1593
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770605; cv=none; b=rvYBB26bobq+8ZCAuCw47/20UvYzeKhTwQCEEKqJA+J+5anbEF2Y+cG4NksQxRrdcEeOBkzb2M6doFnUQZ+qas8oCFLsNwUEiYzk2HqgSCws1xueVwa2TARUq+iieBOwaznNVagP1GTTFc/Uj+qddbgpfs6Eq9t1JEObjDnKO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770605; c=relaxed/simple;
	bh=VJE3I2Xk+qKCxSRwgm0lK8W4DsoLUu1HydnnnFe502s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjm8VAN8b6AqTdZvkYpl9oQWzzjMxnuX2El525YD69/uEJu5mgUmDXvNp68A5sU4ceeEeH5c7N/R5KIYrYfpWNB8PVR+PORAXkvqH8J7wFkXZu6WNOkcIYwN22TEqOXHzyMMfeol5gni3dYFYt08nXB1y4JdoKkM5LPh/x22WkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R2YxZMIW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9D4UmkpUbWsbGBW/E/iIIqxeFM2OTeNpEaYs4nESBhg=; b=R2YxZM
	IWzxUwUnrvxk2oH3LVlN79A4Q16Dka/MjGeHyOEyfVKX0prLspo2/DUdTp1fC+5c
	FVUYG9rnFKBttY+R996vQe0wtrd6PDFYxfOKCAaVCOY0ZNB3ieqaJ0jcrlWU5DzV
	fu1e4QTFVkVcSlUYc82ksHq/2ycdo+bCV64sF4AbXJipnScZ3n1oxrP59fMGCDI7
	Y8oOuCB1gyJRhTHBygkP3q7Bd+jlQ8LshN25Y1+fFQNCvlOR/nEQsbZ9Xlb8CD4d
	Kstu0DW3Dalf8s6/FEcsAZvizZmgFeofX0nu6YyUGVVQpszOQoaCyMoq9fviFaFg
	0Fw5oS//WbLrYAzw==
Received: (qmail 822558 invoked from network); 15 Dec 2025 04:49:57 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:49:57 +0100
X-UD-Smtp-Session: l3s3148p1@8pOngPVFiJfN3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: renesas: r8a779h0: Add WWDT nodes
Date: Mon, 15 Dec 2025 12:47:20 +0900
Message-ID: <20251215034715.3406-14-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 112 ++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 4dc0e5304f72..74bc4c4854ec 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -2183,6 +2183,118 @@ port@1 {
 			};
 		};
 
+		wwdt0: watchdog@ffc90000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffc90000 0 0x10>;
+			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1200>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt1: watchdog@ffca0000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffca0000 0 0x10>;
+			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1201>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt2: watchdog@ffcb0000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcb0000 0 0x10>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1202>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt3: watchdog@ffcc0000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcc0000 0 0x10>;
+			interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1203>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt4: watchdog@ffcf0000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcf0000 0 0x10>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1204>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt5: watchdog@ffef0000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffef0000 0 0x10>;
+			interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1205>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt6: watchdog@fff10000 {
+			compatible = "renesas,r8a779h0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff10000 0 0x10>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779H0_CLK_R>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 1206>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.47.3


