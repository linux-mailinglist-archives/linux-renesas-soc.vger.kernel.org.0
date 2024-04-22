Return-Path: <linux-renesas-soc+bounces-4775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762A8ACB6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21B01F22B32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EC714F9C6;
	Mon, 22 Apr 2024 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M+8oKAWf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7790B14F135
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783258; cv=none; b=sx2BVnAsFUMqk1evpWgwu70wc5G6NlGYugzvvEYe2yVh6DYVOldhJwjzCCwcH4704Dmp5VllZ3KWV/kifitYRU9IAHxmOX7zRc+xA2yqUn2DaYJkAHVwm8vzGj3BpLc1xHD622yCAOxEoREgn21f+FgGd+DZDh06GNoKRuHI90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783258; c=relaxed/simple;
	bh=I2lRI2LTUHkrS++EyWkYEsH9iuZgVVZOFwo9y7A7AfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p/pYnDwiteHAi3qpSK/LY1n6I/E2ST3MSMM9Q/9FD6P0DKuwVeCadEbEcV9fFn2OI1Xi0GfK/Z/jQE3Prtt/u8ZTQIn8xjQwBC7wPpboeoL2xJGCznhHOkbipjp5xF4egLqp6O3RwS+KvMr4/C1v2ofrZRiaZFMNC+vQLDhc8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M+8oKAWf; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ddc2ea2091so3609711fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 03:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713783255; x=1714388055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJr778Ev6Y11o0pQBjtnRdIdmYy85v8EnkZOWn+JYo=;
        b=M+8oKAWfzpO/bdPR1P0ovntK0pIld3DfAR/Un8VCIi6G90bSoKIxdn28Yd4pO6Z0mC
         DP3vcxxgBuOKYaw++R49vwDrVkoRS47YwEJpPs2mb745f7cJVvi5Y5eUlcVVKAL9EmKj
         6BdNLQ14Stsykn3XoXED2gI2h+ROyND2Je5Mn8QLEXo+vuHv6U/swghsNeCQ3/Ram+nD
         LTKJLaqHDEWwZzCrWuVLVM0lp+qXuKjiWClkuGGl5brDYEYyjGm7qeLiLq7ijx3LNvOJ
         5wB6vTa0qHLHc+pLlizCe0BAnXWH5yNT6zkkM5UM5FkfmeHPH0S3Xan6uGoiWPBlER8W
         C1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783255; x=1714388055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPJr778Ev6Y11o0pQBjtnRdIdmYy85v8EnkZOWn+JYo=;
        b=Wpp3S/ZFYbUt17zml7JC9UDHqlYul6zohAXM+dDpTswNpxS2LTRZOxtldsGzb6YbpP
         5ffzGkkQKZvoArz5r4E9TXda5VAZYbaBJC9oyJImWUB3bqSVAd5ieBUB4H0SYCNAlL0V
         z5xohnAf54CgLMSpT2mVQXmPSHHNV/AawSPy4ErBCmUfltD9yx4cmynpTXdbdcNK5U7A
         FjCLO2N/3oxVi2Xx0jOKIc6hQiSMRr0Myf8Jlwq+QZ9a1lvy8Lu3BroppXjvJ7Mal02j
         8piv6NrJIvQC1Zp9KTSP44g8SzjT6Iz6MBW3kphYnSHtMoJntS2/Soe3pXxLpDSrOzqQ
         qRGw==
X-Gm-Message-State: AOJu0YxNuCjK29J2njvqianYgI5mZyrB9rIU2V/U6Pz79lo7fk8XPpTr
	8aYpNzzweyEjN48TEV9GS2u4noWH3oLVIa+xahadLQwqA9Udf0QQ7em7CtjDmfI=
X-Google-Smtp-Source: AGHT+IFCe6+Tw9xCPOXSOhayYTKBLJgcOmhNZgY6qzTYOl+giiT1YCrX3Rjh77W+zlTRx3fD2JUwtw==
X-Received: by 2002:a05:651c:1a06:b0:2d8:34ec:54e6 with SMTP id by6-20020a05651c1a0600b002d834ec54e6mr6649160ljb.33.1713783254631;
        Mon, 22 Apr 2024 03:54:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041a3f700ccesm4321037wmn.40.2024.04.22.03.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:54:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 8/8] arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>
Date: Mon, 22 Apr 2024 13:53:55 +0300
Message-Id: <20240422105355.1622177-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
IP specific power domain as the driver has been modified to support
multiple power domains.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- used proper domain ID for IA55 interrupt controller

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index f5f3f4f4c8d6..bdd4f9376fc0 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -67,7 +67,7 @@ scif0: serial@1004b800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A08G045_SCIF0_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SCIF0>;
 			resets = <&cpg R9A08G045_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -79,7 +79,7 @@ cpg: clock-controller@11010000 {
 			clock-names = "extal";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
-			#power-domain-cells = <0>;
+			#power-domain-cells = <1>;
 		};
 
 		sysc: system-controller@11020000 {
@@ -104,7 +104,7 @@ pinctrl: pinctrl@11030000 {
 			interrupt-parent = <&irqc>;
 			gpio-ranges = <&pinctrl 0 0 152>;
 			clocks = <&cpg CPG_MOD R9A08G045_GPIO_HCLK>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ALWAYS_ON>;
 			resets = <&cpg R9A08G045_GPIO_RSTN>,
 				 <&cpg R9A08G045_GPIO_PORT_RESETN>,
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
@@ -177,7 +177,7 @@ irqc: interrupt-controller@11050000 {
 			clocks = <&cpg CPG_MOD R9A08G045_IA55_CLK>,
 				 <&cpg CPG_MOD R9A08G045_IA55_PCLK>;
 			clock-names = "clk", "pclk";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_IA55>;
 			resets = <&cpg R9A08G045_IA55_RESETN>;
 		};
 
@@ -192,7 +192,7 @@ sdhi0: mmc@11c00000  {
 				 <&cpg CPG_MOD R9A08G045_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI0_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI0>;
 			status = "disabled";
 		};
 
@@ -207,7 +207,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI1_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI1>;
 			status = "disabled";
 		};
 
@@ -222,7 +222,7 @@ sdhi2: mmc@11c20000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI2_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI2_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI2>;
 			status = "disabled";
 		};
 
@@ -239,7 +239,7 @@ eth0: ethernet@11c30000 {
 				 <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -258,7 +258,7 @@ eth1: ethernet@11c40000 {
 				 <&cpg CPG_MOD R9A08G045_ETH1_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH1_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -284,7 +284,7 @@ wdt0: watchdog@12800800 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "wdt", "perrout";
 			resets = <&cpg R9A08G045_WDT0_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_WDT0>;
 			status = "disabled";
 		};
 	};
-- 
2.39.2


