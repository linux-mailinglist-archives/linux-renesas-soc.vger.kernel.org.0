Return-Path: <linux-renesas-soc+bounces-2479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331684E120
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A6E928D2DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550407EF10;
	Thu,  8 Feb 2024 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fiknCi9A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E57E79F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396263; cv=none; b=PFoPOwWSJGPvbfyxekfuk2U321X/Q6opOO2mIk0UDspvYuyX02lxgMcDQNmgFfQ+JYYsj7bRO3CfJ93XiHS4sjXTQtzZyMqcOx+P61r/+PTfSTUq4Aha979T79B+yx42Rn56OJ76LPqO0YoH5scG7R/nP2mwWBaDU1i9g+uja4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396263; c=relaxed/simple;
	bh=bh8OxNLltqAtice2XaSPcJsXgH8FBZnkqH4Nk5wq9do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XUNtjEsWZaT8wp7URden3nisQIMdld+lEEKdPY2ic+f8BRDU6Fj0UWaIuJjrSvuuNf4GGE8QCo6/WGV+8B8o4NoTmprgTSiDRTa3vurBNK7hNae9svxDAOysrHHWN+KPVTwNLEuqB84jq50WvkAXr49rdDdcDFisAiA7WRxTkYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fiknCi9A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-410504b5cf3so258785e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396259; x=1708001059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpJ+A6WuI8qVYR+ufe285R9BOl0SnuSgZcst9eKsxpE=;
        b=fiknCi9AQzEmA2+ACbwGfwZTziUWgfZU6ZNn5upFfSZZO9TqiDV+v1nzVkpQEDgFaC
         69BNvIyAwdhe1Gssbda34bsM3XWawwuLLZAsd64CsE+khXR2zgBxelQlwZArzurX1qfx
         aBZGlVBnTRxp76iR6dUrRXbj8/W6x1y/58VIWFzLFqRC1wKDVoQhTBmRvQLuMhZByCjI
         e96qGhXq2HEeELoLebvJu44sTmxaTh5o3kuA5rn9QP+uAjswA5Cc2qGAoxBeK41ML3R8
         AOJi4TX+HF05aUEjMDQVRglKt8a2gV75xH6BaRRlMVz76F8pKM9hf8Psg1YVCJuOb8pX
         IpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396259; x=1708001059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpJ+A6WuI8qVYR+ufe285R9BOl0SnuSgZcst9eKsxpE=;
        b=D93uhb6X6m9dk1ydbCMM0EnFqCCy8BZxt3xCR10FaSdaDPfPNoxUFJcafN0Pruh4Oe
         1ENZ3m+qDBBF/ADSXekf9noY6CumMS3T01vdEEVOsAZme8K3smhAxCUaLMIF600YAncc
         0a+6NYfEA6NxV0XuLRqslo/ct6yp9L+gWuM32wVO3uCsiufCnJIBCp5uV3I6/Abpjyh4
         LP9+NMQBnmmqPMMCe+X3fLKDKY8oSb/4RXh1dl8vJoRjwCzxL3yAvJfk4iYjSMnU49ex
         MCbuTdGV4sICzRzmyvE9es7aX8z2gQ6NXsRpUaUdg41Gj5OXq8Fy3NUx9yCgXcIuUt8h
         zZqA==
X-Gm-Message-State: AOJu0YxeD6p+iZh26uSkggZOh8+t80Gwwv1UTFBou6HzIdCtZh3hkcO2
	1hZbva6MLHFKog8FlDKpUtF0iupeMr/qddB82IPfXjWKB4yMHYQ9EtcbEotTV94=
X-Google-Smtp-Source: AGHT+IEVOZm0VWUSOovYKJ223+YVNHrjrhAtzw+X1sDs9e2FCOdjTVtfM5cCpJ3hh1HB26NEgjjpkA==
X-Received: by 2002:a05:600c:1e1a:b0:40f:f069:8d13 with SMTP id ay26-20020a05600c1e1a00b0040ff0698d13mr5499134wmb.9.1707396259681;
        Thu, 08 Feb 2024 04:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9bngb2X5GISbv/yy4j9mBBKnrhZrZe/gI/sdxeOnyMsmZ2gSqgLXZyHsX3ZlpZxGigWkWe6GSwDnD4tO+f8wqHead8T2e8iNOMHdV5b639DFoeDoZZIg+IAVvhvJdbPXv0SzGz5XkIKQg9XFqSfWCT0HgB6EbbrIx5T3QEwDngGV/hg2FqFGLMO4PL2rZZDJSYNdNfDUX6Ml6dMEBeMaV+gpd2wJCcnD/3xEH7W/6HsOkMUH/34CX68J7zMfusaioZyzGycnwzfXdjc90Sz2Uwv2cJvWbbIE3Id3ziAgggEXuhKA63/s5c4rg1ZU4U1gp3TRCObPRvyYJzSuyl/v9isF3DDEqWjmMVFLesJ9Moj4cxOZ8Uk5rQV12scBuS7gdF4VOFcaKS1QuErd7owZXZnKwF+36SAam3c22tRApNCKCJuAkY2Ruxuw2tWt1OV4yQ9Ts86qdbfv5VfzLq70hrZcxDuZkV2/LyzMDo9xuGSHC0yS2h0CJCPcZaNcqq+lRqLnfTgXAmCgYFhdiQt2ZNZFqPALsdIXX1AVQsVjLiF2SHSP4cE06KE6TRh3FvwY=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:19 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 16/17] arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>
Date: Thu,  8 Feb 2024 14:42:59 +0200
Message-Id: <20240208124300.2740313-17-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
IP specific power domain as the driver has been modified to support multiple
power domains.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index dfee878c0f49..11be621aaa82 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -62,7 +62,7 @@ scif0: serial@1004b800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A08G045_SCIF0_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SCIF0>;
 			resets = <&cpg R9A08G045_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -74,7 +74,7 @@ cpg: clock-controller@11010000 {
 			clock-names = "extal";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
-			#power-domain-cells = <0>;
+			#power-domain-cells = <1>;
 		};
 
 		sysc: system-controller@11020000 {
@@ -99,7 +99,7 @@ pinctrl: pinctrl@11030000 {
 			interrupt-parent = <&irqc>;
 			gpio-ranges = <&pinctrl 0 0 152>;
 			clocks = <&cpg CPG_MOD R9A08G045_GPIO_HCLK>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ALWAYS_ON>;
 			resets = <&cpg R9A08G045_GPIO_RSTN>,
 				 <&cpg R9A08G045_GPIO_PORT_RESETN>,
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
@@ -168,7 +168,7 @@ irqc: interrupt-controller@11050000 {
 			clocks = <&cpg CPG_MOD R9A08G045_IA55_CLK>,
 				 <&cpg CPG_MOD R9A08G045_IA55_PCLK>;
 			clock-names = "clk", "pclk";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ALWAYS_ON>;
 			resets = <&cpg R9A08G045_IA55_RESETN>;
 		};
 
@@ -183,7 +183,7 @@ sdhi0: mmc@11c00000  {
 				 <&cpg CPG_MOD R9A08G045_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI0_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI0>;
 			status = "disabled";
 		};
 
@@ -198,7 +198,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI1_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI1>;
 			status = "disabled";
 		};
 
@@ -213,7 +213,7 @@ sdhi2: mmc@11c20000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI2_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI2_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI2>;
 			status = "disabled";
 		};
 
@@ -230,7 +230,7 @@ eth0: ethernet@11c30000 {
 				 <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -249,7 +249,7 @@ eth1: ethernet@11c40000 {
 				 <&cpg CPG_MOD R9A08G045_ETH1_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH1_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -275,7 +275,7 @@ wdt0: watchdog@12800800 {
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


