Return-Path: <linux-renesas-soc+bounces-18901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05160AED18C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 00:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8F781714F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 22:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B69235042;
	Sun, 29 Jun 2025 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dZLcAFrT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Snk5NeqI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF71DC988;
	Sun, 29 Jun 2025 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751234717; cv=none; b=H1AiahEbcPXClpqjQzuj489ecfVrQcuazOuBXEbuE2uJdF9b6hn9CpERUaZHjPKZup+ywmnlJ/e0UT07B11vBhlFcw2ShIm87k3wnP3WPWvJ1v6iYo1wK9EpvueexQgGPsAXtwcgAwTMwjawg2Hx5GMaHlcZ8MWGjAJxBBRh1EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751234717; c=relaxed/simple;
	bh=FI3QegmqdgygByP3S8dUbw/0GVJZXkqD0oaE0+hUZ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KO9G+PIm7vGitVfNmNHdq3F+YzFzKL3eJ3WagjTPYiLpMPy0mjvjaakhlWbXl99h7z1CxBoPRK5aBApiQE19eCfPthzTnTd+wegbhSXPRdwNAmzcP3Rpbzo2NLk0xdJkxSPTNDVMpgzuSHjspYfl0HjrXICA74clcuBPk9erzww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dZLcAFrT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Snk5NeqI; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bVjyd3WvZz9stg;
	Mon, 30 Jun 2025 00:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751234713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wonIqwqE+gZtcXn2WE6N/pAhGaGx6R/BhYVp+2etRMk=;
	b=dZLcAFrTgcxfCPDqmmzeXnwWZKnWuxBRJphwxQJzOi5js7oJMhshlVu6cFT0bTbdemDgZy
	klyRdP9Ogh1lcQ3A9y9LZ9U/t18I98zipzGoW3GC4hUhd+soTt49Arrq6uHZWersaqE4MD
	nQSPuMu0ElXB9VpWzQ087MQjtBsK7OjilE1uXBT8fNbK8yXGEk06rGiqWmQiCuxEgVtjTu
	/NSrXxT6LzqYod4aEH+Eo82WejKX28Ij0CMyLfBeAXdQSRGvO1UWfWYkc/ewwnr2/drojz
	ltk6VhPF0RUA2w3VPT8TITwvmGgAQJTa5QNAXV82yuKvEvl2AsjotkLgme8PDg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751234711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wonIqwqE+gZtcXn2WE6N/pAhGaGx6R/BhYVp+2etRMk=;
	b=Snk5NeqIxlYLkGoTYhqpTkOw+9tVflrQkjGl/vH4BnTRhwH+lxc0lzrqQN/YaT2+PAlmzq
	15b7ei26HInKT4UZcQY1FPC2w5UpGsNjlFz4R4HJRoYO6RxwGpnFyKYiBkfN6AfUASnZsQ
	f8eABpFDpgcPIy/THhwQ6fsCpqms6tV/min6CmxLEa8YY7s/26yBYtowQl/RnFsrK961wh
	R1Ka4nQGzIWxOBMAHw+ZcwRcb2QFxS+rOBj4bPOMsbvLbwzFvOExxvfUnF8DeKa3RHEzeI
	HGKEGUnDDikNEdFsg16vOZd26UEqq4Hf/FTT8+eIjpNaQ8c7wu+1I/Q5bNcnug==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
Date: Mon, 30 Jun 2025 00:04:24 +0200
Message-ID: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cd501b2cf243314dd24
X-MBO-RS-META: q69wwtg3rufy5stjqdw1npekmohmqoaf
X-Rspamd-Queue-Id: 4bVjyd3WvZz9stg

bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
to describe various node usage during boot phases with DT. Add bootph-all for
all nodes that are used in the bootloader on Renesas RZ/A1 SoC.

All SoC require BSC bus, PFC pin control and OSTM0 timer access during all
stages of the boot process, those are marked using bootph-all property, and
so is the SoC bus node which contains the PFC and OSTM IPs.

Each board console UART is also marked as bootph-all to make it available in
all stages of the boot process.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts   | 3 ++-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 3 ++-
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts  | 2 ++
 arch/arm/boot/dts/renesas/r7s72100.dtsi         | 5 +++++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index c81840dfb7da..13c0324b8def 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -258,6 +258,7 @@ mmcif_pins: mmcif {
 	};
 
 	scif2_pins: serial2 {
+		bootph-all;
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
 	};
@@ -286,7 +287,7 @@ &rtc {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 9d29861f23f1..e4f489522b2b 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -59,6 +59,7 @@ led1 {
 
 &pinctrl {
 	scif2_pins: serial2 {
+		bootph-all;
 		/* P6_2 as RxD2; P6_3 as TxD2 */
 		pinmux = <RZA1_PINMUX(6, 2, 7)>, <RZA1_PINMUX(6, 3, 7)>;
 	};
@@ -109,7 +110,7 @@ &ostm1 {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 25c6d0c78828..0bf106e9827e 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -199,6 +199,7 @@ keyboard_pins: keyboard {
 
 	/* Serial Console */
 	scif2_pins: serial2 {
+		bootph-all;
 		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
 			 <RZA1_PINMUX(3, 2, 4)>;	/* RxD2 */
 	};
@@ -278,6 +279,7 @@ &rtc {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 1a866dbaf5e9..c78131e3cd24 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -41,6 +41,7 @@ bsc: bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0x18000000>;
+		bootph-all;
 	};
 
 	cpus {
@@ -108,6 +109,8 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		bootph-all;
+
 		L2: cache-controller@3ffff000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x3ffff000 0x1000>;
@@ -557,6 +560,7 @@ R7S72100_CLK_SDHI10 R7S72100_CLK_SDHI11
 
 		pinctrl: pinctrl@fcfe3000 {
 			compatible = "renesas,r7s72100-ports";
+			bootph-all;
 
 			reg = <0xfcfe3000 0x4230>;
 
@@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
 			interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
 			power-domains = <&cpg_clocks>;
+			bootph-all;
 			status = "disabled";
 		};
 
-- 
2.47.2


