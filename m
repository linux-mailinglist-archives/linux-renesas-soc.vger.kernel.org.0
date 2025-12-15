Return-Path: <linux-renesas-soc+bounces-25748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B882CBC5C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D78A03007B41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CC92C1593;
	Mon, 15 Dec 2025 03:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CrHLfj4Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB932236FA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770587; cv=none; b=ej4dh3PX5YOH+mDocgpAUXxhR2PQSMReFqMvTtrI1ajKhL++MIfkN7q29Q7yZbd5LpwWilUcWk0YlTSUWuU4PZLvAzDnShzKR03d7nRANskLNBjgjcXCASs1FL66QqwRIiUZNl+405oVciT0rxSp6OL/JY0dOnHy9CuOOHwYCy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770587; c=relaxed/simple;
	bh=oaBkhfh5zSd/ugyMgXr+Wh4Kh5srWHZ6AQZVTgUvS2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IofolbnFI/4CGNkb/jkuM/v5EF7WdrtMzzd2+MEY30fob5J7uzp0bDdUIinhHLnrpl1gBIi2zDukHDo3uVSb2f7EXgJb7wnMZ77yioAEKXCr69V7MAB4YD0gywzI2q9c1bgaSMnkjaNvy25C496DGfhLU9ZHtQu9Ww8Gq98E9js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CrHLfj4Y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7M5CYcNjaUnZIBxdNpdPzJNDBfo6Ex+2eif2HMGnjN4=; b=CrHLfj
	4YGH3usm4gJP834kx1AIwotNWFwlJNwHqghYDWnIg1ORh6Zrk7aVxfIzIr4Rk6aR
	yldwJmGWi/YYs1S8CY5sqp6zxvfuqL2rLi44P8Jvx4mUld2WUi7b0kjvbGJEy6dZ
	Gej6KS650AzKxplM1+hNq1g7HIM42t/t8VSnE3oRLqKzef2oFMjj9hZMnbwYkTwl
	7B5Y6uqH/K+eP9AGTd9Ebhb3I3Dzo/eYIG1POCjcQ39NtWnzKhNXu7Qzfq7VpCsJ
	8b067FmuClworWBq79j/2lZOG32eqM5F5OTzZRAMKG2UMK0DDkgXFNLz7snvMrfD
	AGRp/Xrin77UW9Pw==
Received: (qmail 822355 invoked from network); 15 Dec 2025 04:49:40 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:49:40 +0100
X-UD-Smtp-Session: l3s3148p1@xEFff/VFjanN3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: renesas: r8a779g0: Add WWDT nodes
Date: Mon, 15 Dec 2025 12:47:19 +0900
Message-ID: <20251215034715.3406-13-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 112 ++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ff2bd1908a45..82a7278836e5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2544,6 +2544,118 @@ port@1 {
 			};
 		};
 
+		wwdt0: watchdog@ffc90000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffc90000 0 0x10>;
+			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1200>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt1: watchdog@ffca0000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffca0000 0 0x10>;
+			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1201>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt2: watchdog@ffcb0000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcb0000 0 0x10>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1202>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt3: watchdog@ffcc0000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcc0000 0 0x10>;
+			interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1203>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt4: watchdog@ffcf0000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcf0000 0 0x10>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1204>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt5: watchdog@ffef0000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffef0000 0 0x10>;
+			interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1205>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt6: watchdog@fff10000 {
+			compatible = "renesas,r8a779g0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff10000 0 0x10>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
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


