Return-Path: <linux-renesas-soc+bounces-25746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99832CBC5AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AC233005B94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712782BD590;
	Mon, 15 Dec 2025 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T4K0HE7K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67971227B95
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770541; cv=none; b=qkvKoUMVIfRi5xyRRLvpcs88RfoovTNmE2voJjWsh5l6VbPfPW+2KHtJleAJDu+FIWQlcf3nWoJNWMUhj15uoNCqdw7vWOiGCrBGPfn/PVQWGtizHf6FX7HpYyLXOzQDrW2gTWtD/LSpKwHAbeGmtfi1M86a9iVQ1PjTPiI7dLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770541; c=relaxed/simple;
	bh=l++glqNqoKoyMQND3ZPbWf82J0RCWN96P6iP+OfJEy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u74RMAfPNbf2lghnxuEDunW8zJrLIVEuWqp2fsci/uTVyj1K83B3hr7HYp3cnevuD6uhEp8Eecci5VBRvtnAaLiEyT5L0vXPG5aOR+yhF/YTfa7gEhD65qEZ3gcchqnqPrYdDvGfvwRpziTx5BcYcuzK7BHSR5N2QpBb92NONnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T4K0HE7K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=HeItzCKugyNIM5rOmMralkFF4GU
	9Nx9lSgWGcCvuqHs=; b=T4K0HE7KFIcXO8SpMpHR15YrcxBKfC5a8eDH4RQ1EIb
	TNjXhlJ1oTbVp7lcJIitep1OkgXu44hhJGK/9t3PmezoG70rJpF/bepTxmWc31Yd
	9QIZmx0iq7i/dcbhDB+o4xNjER656qidx7QxdCoLdUhxp0rdAUInmpIHyXuV9lgw
	VDlaWo974ZZxuHdmC0Y/FbyL+TyAFrf7sws9vm+mCyCL8WjUBJbL8Nm1P5zCAxky
	y+Qj7uTulvGQxRe7tpBDqWlhzZ1tDP97ftSM1U771ukZjw3URnJn+L7IqQV7TjTR
	E3UP1cHfSzPUvdgzwmZKRf7wmVJ6b5W5TdLaYU5EDPg==
Received: (qmail 821873 invoked from network); 15 Dec 2025 04:48:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:48:53 +0100
X-UD-Smtp-Session: l3s3148p1@4cPFfPVFtd/N3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: renesas: r8a779a0: Add WWDT nodes
Date: Mon, 15 Dec 2025 12:47:17 +0900
Message-ID: <20251215034715.3406-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215034715.3406-8-wsa+renesas@sang-engineering.com>
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 160 ++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 4b101a6dc49d..0483a5d0714a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -3032,6 +3032,166 @@ port@1 {
 			};
 		};
 
+		wwdt0: watchdog@ffc90000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffc90000 0 0x10>;
+			interrupts = <GIC_SPI 480 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1200>, <&cpg 1318>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt1: watchdog@ffca0000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffca0000 0 0x10>;
+			interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1201>, <&cpg 1319>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt2: watchdog@ffcb0000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcb0000 0 0x10>;
+			interrupts = <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1202>, <&cpg 1320>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt3: watchdog@ffcc0000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcc0000 0 0x10>;
+			interrupts = <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1203>, <&cpg 1321>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt4: watchdog@ffcf0000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffcf0000 0 0x10>;
+			interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1204>, <&cpg 1322>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt5: watchdog@ffef0000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xffef0000 0 0x10>;
+			interrupts = <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1205>, <&cpg 1323>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt6: watchdog@fff10000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff10000 0 0x10>;
+			interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1206>, <&cpg 1324>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt7: watchdog@fff20000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff20000 0 0x10>;
+			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1207>, <&cpg 1325>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt8: watchdog@fff30000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff30000 0 0x10>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1208>, <&cpg 1326>;
+			reset-names = "cnt", "bus";
+			status = "disabled";
+		};
+
+		wwdt9: watchdog@fff40000 {
+			compatible = "renesas,r8a779a0-wwdt",
+				     "renesas,rcar-gen4-wwdt";
+			reg = <0 0xfff40000 0 0x10>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_R>,
+				 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
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


