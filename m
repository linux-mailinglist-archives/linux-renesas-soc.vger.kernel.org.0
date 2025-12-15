Return-Path: <linux-renesas-soc+bounces-25745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 289BBCBC5A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBF6C3007946
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9B429ACF6;
	Mon, 15 Dec 2025 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JXIEbm8c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56940227B95
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770520; cv=none; b=hQpksL7Ltc0tHI8zCEhTj2qc95X5ZX9drZKveXjMdAQTkdAwOH/NetnWFV6tOb1UsHf1B4bCn7EC97vDWTv2XUypUU+R7bIz7esL36+iKEzxKgJ/H7f4SZD7RQIozKKujPqLQfHd1SYf/gV2N2d7BmPY/KbA/B1zSZAUJGjhzJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770520; c=relaxed/simple;
	bh=3BUbEpP8vJHRr5kQhnrDC8zG6DnzRu0EAZYnkyLV1lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDehbt7vt6+RiwzDJXrPvhD+uahMF4ky7bMtK1YwoZ3MN9s8cnNeP0zlJG026x75Z6Las1UjPhmNW9ADz2yUCFZ+CRGzgb8yNM6+xLxTOMY2HHW174caX+3juuWmz63Dv0uvWGY9wQ9+xhDfCed3NvebbFUMYT/5p7Ad9LKDt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JXIEbm8c; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Y2wXeOnIDyOqKDRt6dnhP/14Awu54JR6ZqhMSWEJwwY=; b=JXIEbm
	8cMPIgFA4b3am/3ulGOb7m9jFxuaqrLbqcwaNU4kYyT90d9l7Gbfj31NSVLXXwpZ
	sG+li2pUi3+E9SAsMYGgzT+DJAUtvfXawNDQLY0BA3i2wjBE1IqEv1bjdsSzHIG6
	xBjj1QZmbSBiQjYoxH9L7OKUZ8xSAz0jrUmv3zH7md7f46pjSvW138AFIXIbVoLh
	yxSUPJXNMsv8XhzUebqAKCTOBGOaHXZJzGARf7Io1jV2aO0XnmpcRvG8DiHRamp7
	Ii0qabXjU7yunkcSc6T4qlXOTHvtH1Qe4CWziiFA9r6z81uvXHSnyLadBnypPh8U
	NWSzC0l6291zbRaQ==
Received: (qmail 821616 invoked from network); 15 Dec 2025 04:48:31 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:48:31 +0100
X-UD-Smtp-Session: l3s3148p1@hmVpe/VFuITN3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: renesas: r8a77980: Add WWDT nodes
Date: Mon, 15 Dec 2025 12:47:16 +0900
Message-ID: <20251215034715.3406-10-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 8cd7f68d026b..c2155c114961 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1582,6 +1582,86 @@ port@1 {
 			};
 		};
 
+		wwdt0: watchdog@ffc90000 {
+			compatible = "renesas,r8a77980-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffc90000 0 0x10>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77980_CLK_R>,
+				 <&cpg CPG_CORE R8A77980_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 325>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt1: watchdog@ffca0000 {
+			compatible = "renesas,r8a77980-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffca0000 0 0x10>;
+			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77980_CLK_R>,
+				 <&cpg CPG_CORE R8A77980_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 324>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt2: watchdog@ffcb0000 {
+			compatible = "renesas,r8a77980-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffcb0000 0 0x10>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77980_CLK_R>,
+				 <&cpg CPG_CORE R8A77980_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 321>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt3: watchdog@ffcc0000 {
+			compatible = "renesas,r8a77980-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffcc0000 0 0x10>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77980_CLK_R>,
+				 <&cpg CPG_CORE R8A77980_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 309>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt4: watchdog@ffcf0000 {
+			compatible = "renesas,r8a77980-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffcf0000 0 0x10>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77980_CLK_R>,
+				 <&cpg CPG_CORE R8A77980_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 403>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.47.3


