Return-Path: <linux-renesas-soc+bounces-9048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A398637A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 17:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 281E51C26E35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 15:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D6477107;
	Wed, 25 Sep 2024 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FzrsYF2/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CFC45007
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727277378; cv=none; b=pUndfwFJAw0FCps8467p1N3I8Af7AjUp83E6xSfJTCDYsYmj2lhsg1YdL8xDNQjHktcDXq9VWuBia9/h6qudyWQTEBlm0/Zey1aBgzuirX/5sK9tlsZ+cwGz01y5ovP/q5n4k19pEQxy/JmyE9HPm9BgjypVWD6FP4W95m9Amwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727277378; c=relaxed/simple;
	bh=mvT2c/KSBaiR6s0I+UhsMoSPJQvU4tOCHVmwHizwpLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4hGH9Gp2jfsjl4qtpophIVMwZFJkrQMa2tUxsPZb+y0ky6Qt/TVAonUTkwgE9nnBBNZLRg+em0HA1RzY+njDn274YnTxRSM7wx95yds3Wsl4UlSLvKOtWqJpym3AdUKzBhErqpUkupbbFBNH3LVXlyfxUkK72NdTtoD2rFKkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FzrsYF2/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Tnqus0Kf8iddQn
	KAEcEdEcIfurY0FS60lvmV8in2pSA=; b=FzrsYF2/af6aeV+oxfPEA0+/gFora5
	EgO7ycIGUabWZjzXhA8vF5SMdM6ABt0iobbnVDPDYd0YKXh0LKE7zZuXO2ytOdsY
	gcY5Uq5mqMBHlB+PQbxOIizEm5DzGy+BzNCt4FGIbSDCJf8Z8YgkP9PL2ee7LoVy
	fN0adLm3yI228ZnfD/0JqLZHBot6ThmriavVo2oS5RoftsBLdXeilzXmNnTkz3rw
	sBE1vrfv2u/rKC8xumRcfGI8O+mfqLjExGatEOL5vmSSICP4ot+0YgwYKI+Pg+zG
	XqqoMN9cdxEi+wqPtW/6tZDBhxxSds+5NvBNdcMauaxXu8M5ipmH2Iiw==
Received: (qmail 670290 invoked from network); 25 Sep 2024 17:09:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2024 17:09:16 +0200
X-UD-Smtp-Session: l3s3148p1@15pgAfMigNpehh9n
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: remove 'reg-io-width' properties from MMCIF nodes
Date: Wed, 25 Sep 2024 17:09:04 +0200
Message-ID: <20240925150904.3582-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not use this property and all upstream SoCs use the same
value anyhow. Remove it and get rid of a lot of dtbs_check warnings.
Tested with a Lager (R-Car H2) board and with the soon to be added
Genmai (RZA1) MMCIF support.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 1 -
 arch/arm/boot/dts/renesas/r8a73a4.dtsi  | 2 --
 arch/arm/boot/dts/renesas/r8a7742.dtsi  | 2 --
 arch/arm/boot/dts/renesas/r8a7743.dtsi  | 1 -
 arch/arm/boot/dts/renesas/r8a7744.dtsi  | 1 -
 arch/arm/boot/dts/renesas/r8a7745.dtsi  | 1 -
 arch/arm/boot/dts/renesas/r8a7790.dtsi  | 2 --
 arch/arm/boot/dts/renesas/r8a7791.dtsi  | 1 -
 arch/arm/boot/dts/renesas/r8a7793.dtsi  | 1 -
 arch/arm/boot/dts/renesas/r8a7794.dtsi  | 1 -
 arch/arm/boot/dts/renesas/sh73a0.dtsi   | 1 -
 11 files changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 08ea4c551ed0..07ffd9ec96cc 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -333,7 +333,6 @@ mmcif: mmc@e804c800 {
 				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
 			power-domains = <&cpg_clocks>;
-			reg-io-width = <4>;
 			bus-width = <8>;
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index 85261684b5d5..2e19ebf9e2ba 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -428,7 +428,6 @@ mmcif0: mmc@ee200000 {
 		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A73A4_CLK_MMCIF0>;
 		power-domains = <&pd_a3sp>;
-		reg-io-width = <4>;
 		status = "disabled";
 	};
 
@@ -438,7 +437,6 @@ mmcif1: mmc@ee220000 {
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A73A4_CLK_MMCIF1>;
 		power-domains = <&pd_a3sp>;
-		reg-io-width = <4>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7742.dtsi b/arch/arm/boot/dts/renesas/r8a7742.dtsi
index 3a5d6b434d09..9083d288cc33 100644
--- a/arch/arm/boot/dts/renesas/r8a7742.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7742.dtsi
@@ -1651,7 +1651,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			status = "disabled";
 			max-frequency = <97500000>;
 		};
@@ -1667,7 +1666,6 @@ mmcif1: mmc@ee220000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
 			resets = <&cpg 305>;
-			reg-io-width = <4>;
 			status = "disabled";
 			max-frequency = <97500000>;
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7743.dtsi b/arch/arm/boot/dts/renesas/r8a7743.dtsi
index 8833898d5557..58a06cf37784 100644
--- a/arch/arm/boot/dts/renesas/r8a7743.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7743.dtsi
@@ -1639,7 +1639,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			max-frequency = <97500000>;
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7744.dtsi b/arch/arm/boot/dts/renesas/r8a7744.dtsi
index c66c1102fb72..034244648d18 100644
--- a/arch/arm/boot/dts/renesas/r8a7744.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7744.dtsi
@@ -1639,7 +1639,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			max-frequency = <97500000>;
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7745.dtsi b/arch/arm/boot/dts/renesas/r8a7745.dtsi
index 6ddde364782b..704fa6f3cbd0 100644
--- a/arch/arm/boot/dts/renesas/r8a7745.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7745.dtsi
@@ -1513,7 +1513,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			max-frequency = <97500000>;
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
index 20e4d4c6e748..f746f0b9e686 100644
--- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
@@ -1686,7 +1686,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			status = "disabled";
 			max-frequency = <97500000>;
 		};
@@ -1702,7 +1701,6 @@ mmcif1: mmc@ee220000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 			resets = <&cpg 305>;
-			reg-io-width = <4>;
 			status = "disabled";
 			max-frequency = <97500000>;
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7791.dtsi b/arch/arm/boot/dts/renesas/r8a7791.dtsi
index f9c9e1d8f669..e57567adff55 100644
--- a/arch/arm/boot/dts/renesas/r8a7791.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7791.dtsi
@@ -1680,7 +1680,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			status = "disabled";
 			max-frequency = <97500000>;
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7793.dtsi b/arch/arm/boot/dts/renesas/r8a7793.dtsi
index 24e66ddf37e0..e48e43cc6b03 100644
--- a/arch/arm/boot/dts/renesas/r8a7793.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7793.dtsi
@@ -1343,7 +1343,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			status = "disabled";
 			max-frequency = <97500000>;
 		};
diff --git a/arch/arm/boot/dts/renesas/r8a7794.dtsi b/arch/arm/boot/dts/renesas/r8a7794.dtsi
index 8e6386a79aea..bc16c896c0f9 100644
--- a/arch/arm/boot/dts/renesas/r8a7794.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7794.dtsi
@@ -1349,7 +1349,6 @@ mmcif0: mmc@ee200000 {
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 			resets = <&cpg 315>;
-			reg-io-width = <4>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/renesas/sh73a0.dtsi b/arch/arm/boot/dts/renesas/sh73a0.dtsi
index 30c67acc4e35..c7cc17e3c3c5 100644
--- a/arch/arm/boot/dts/renesas/sh73a0.dtsi
+++ b/arch/arm/boot/dts/renesas/sh73a0.dtsi
@@ -273,7 +273,6 @@ mmcif: mmc@e6bd0000 {
 			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_MMCIF0>;
 		power-domains = <&pd_a3sp>;
-		reg-io-width = <4>;
 		status = "disabled";
 	};
 
-- 
2.45.2


