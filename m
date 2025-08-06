Return-Path: <linux-renesas-soc+bounces-20050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7CB1C82F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 17:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6093AB99E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 15:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739BF28F92E;
	Wed,  6 Aug 2025 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CIzsY2/2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hDiHlE3B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC928C027;
	Wed,  6 Aug 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492709; cv=none; b=czFK0CssLQzxCPG+FX+yTIr4fnvLck7mqD8HsHCP4ebzgprN1qdsLWCmG6vnQfyH2E/YyJyHPj3pvKLLoI2CI05OiymjD7w0kF+pmpAB4pyBjtg94ZqAnZiubCT09InZMe9AqhX5UFworas5Q6c9vb54jNtOUOiBovwmx0PLJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492709; c=relaxed/simple;
	bh=fuYMrpOrJ6nZYYv8eCAIvjIUrE+nnAyZf5ORW7jxh7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ib/i7wPuKipgwDS+ZVg27QMvmth4bJP4aAD3HeCsvFN/4Oocji5SDtdSAbHzuBXKTalg9ruGINeqshdfs6O92pRZ0SmpOQYcwV1RRpbjassl+todsnoC0HAj97ZHUmqqrPtmLaRhrl+za41Ug4bndoKaVfEvVHv25WcQPVvUwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CIzsY2/2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hDiHlE3B; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bxtrK482Rz9sJ3;
	Wed,  6 Aug 2025 17:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Xb1gcwOb+OUSeItxSM+cReVbxFeztwB6ynzPiFVKds=;
	b=CIzsY2/2CjVfo4AAXd6QHgF44FBCTgikJgExkKDsstk8PnzMJOq4vki55L6So+wtMCvmZN
	9eouqSNY3YmR68VG/sUkY3B/BKY1fCWSPFKgJFSu6lnzXMA43F77JHku6DSkyP7vXTAz2l
	X4cYuMOfI7s2LPAq5FV9pZ+kYCloDWO/xEdDVkGnM+n9X7mjFdkZF6asacR0/fT6AzP8oy
	Ig4MB0wl8/o+Y5rFR1iI4oatvd43v7N9HdAX3ar5u90LkSOrZRPWIQs91qk6Aoc4Fjt8eH
	BpvjCtFstsEAv4cQ/sy8eXworv6Vknuf89p4B7xxH0ZMT4tvbxQGw3wvocCiwA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Xb1gcwOb+OUSeItxSM+cReVbxFeztwB6ynzPiFVKds=;
	b=hDiHlE3Bz+3lc6yOmzScT+/c+L9bOngw8Wa6FY6z+fAtNJwqE8ODgiF8agWM7JgX58X99B
	sYNPlidsKTACr1ptiA+tgGnXQeZyhFwuEuKgrP1ZI+AL4l/DlgK1F9ehI9jPSt+/snaS1V
	CuDLZVjVjcVCxQH9NAysCZGu3Xr008YG4jyGyJjRsklWOPcjQ6BUVKBBb+QmevX9G5b53G
	SqrTXhTz5EUcvKT69kCZPL/+rtwlR+9xk8gcaALjfELWPXeKmE+ovwnvKGYrsaxsMaPPX1
	nvleB9dYT6M5RmTcYwO8wuib42T59pJ86m0fSPbjXO6VtrfjBfp+zBVaJo7WFA==
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
Subject: [PATCH v2] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
Date: Wed,  6 Aug 2025 17:04:27 +0200
Message-ID: <20250806150448.9669-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a9ff50ae2e0858919c0
X-MBO-RS-META: gemjm8p8bjmrjzrawdaz3m1u61rf8pm4

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
V2: Drop blank newline arount bootph-all , move ostm bootph-all to board DTs
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts   | 4 +++-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 4 +++-
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts  | 3 +++
 arch/arm/boot/dts/renesas/r7s72100.dtsi         | 3 +++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index c81840dfb7da..3c3756509714 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -203,6 +203,7 @@ &mtu2 {
 };
 
 &ostm0 {
+	bootph-all;
 	status = "okay";
 };
 
@@ -258,6 +259,7 @@ mmcif_pins: mmcif {
 	};
 
 	scif2_pins: serial2 {
+		bootph-all;
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
 	};
@@ -286,7 +288,7 @@ &rtc {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 9d29861f23f1..23ddec217685 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -59,6 +59,7 @@ led1 {
 
 &pinctrl {
 	scif2_pins: serial2 {
+		bootph-all;
 		/* P6_2 as RxD2; P6_3 as TxD2 */
 		pinmux = <RZA1_PINMUX(6, 2, 7)>, <RZA1_PINMUX(6, 3, 7)>;
 	};
@@ -99,6 +100,7 @@ &mtu2 {
 };
 
 &ostm0 {
+	bootph-all;
 	status = "okay";
 };
 
@@ -109,7 +111,7 @@ &ostm1 {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 25c6d0c78828..91178fb9e721 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -199,6 +199,7 @@ keyboard_pins: keyboard {
 
 	/* Serial Console */
 	scif2_pins: serial2 {
+		bootph-all;
 		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
 			 <RZA1_PINMUX(3, 2, 4)>;	/* RxD2 */
 	};
@@ -264,6 +265,7 @@ &sdhi1 {
 };
 
 &ostm0 {
+	bootph-all;
 	status = "okay";
 };
 
@@ -278,6 +280,7 @@ &rtc {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 1a866dbaf5e9..a1e4e9ac8f62 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -41,6 +41,7 @@ bsc: bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0x18000000>;
+		bootph-all;
 	};
 
 	cpus {
@@ -107,6 +108,7 @@ soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
+		bootph-all;
 
 		L2: cache-controller@3ffff000 {
 			compatible = "arm,pl310-cache";
@@ -557,6 +559,7 @@ R7S72100_CLK_SDHI10 R7S72100_CLK_SDHI11
 
 		pinctrl: pinctrl@fcfe3000 {
 			compatible = "renesas,r7s72100-ports";
+			bootph-all;
 
 			reg = <0xfcfe3000 0x4230>;
 
-- 
2.47.2


