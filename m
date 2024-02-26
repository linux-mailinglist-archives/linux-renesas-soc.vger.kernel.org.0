Return-Path: <linux-renesas-soc+bounces-3214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D1B868164
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 20:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A346D1C215C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 19:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B230F12FF8E;
	Mon, 26 Feb 2024 19:47:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A8F12C53D;
	Mon, 26 Feb 2024 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708976849; cv=none; b=Dl/iCBH9B3HdKmF0cltxfESQXedaHJyIgVhf4McyWdO0c5dwP55+bXc8zcrHKwpSJmpBytZnA+VCgYBbqemgRDsHdV0AC6meExkDF4Jek9zh6gZPUBvOSf0TYb+aJHuYy/xDxGYKrr2+MYeACVc5XN8qxSIF/sX833mcyxLmtgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708976849; c=relaxed/simple;
	bh=taaAJUBxLtwgxzBcSl8ebulwHXL3WqG84T9F/jkuPEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6HNWAdH4YJp8pWPfhQCAZXV1qeTnGIDOeyCTYPrxZ1Xw8sPydooDnWqi2vynfU2c2gsU7y5ZWszFTSAQpYKylwoQdSbpGZgnjJKpFoZ9P/wbqWlhRjNWutwziAGTwy2vEHIRF4pF2jO7qbAqZ6ONu0moLc26LddY5g1JPSLg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,186,1705330800"; 
   d="scan'208";a="195384714"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2024 04:47:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 27F3640065B4;
	Tue, 27 Feb 2024 04:47:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC, GPIO and ONKEY
Date: Mon, 26 Feb 2024 19:47:14 +0000
Message-Id: <20240226194715.427597-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
References: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PMIC DA9062 and the built-in RTC, GPIO and ONKEY modules on the
RZ/{G2UL,Five} SMARC EVK development boards.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped disabled status from gpio and onkey nodes.
 * Added gpio hog nodes.
---
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index de590996e10a..f6f6f8280df6 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "rzg2ul-smarc-pinfunction.dtsi"
 #include "rz-smarc-common.dtsi"
 
@@ -23,6 +24,63 @@ &cpu_dai {
 &i2c0 {
 	clock-frequency = <400000>;
 
+	da9062: pmic@58 {
+		compatible = "dlg,da9062";
+		reg = <0x58>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio {
+			compatible = "dlg,da9062-gpio";
+		};
+
+		onkey {
+			compatible = "dlg,da9062-onkey";
+		};
+
+		pmic-good-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			output-high;
+			line-name = "PMIC_PGOOD";
+		};
+
+		rtc {
+			compatible = "dlg,da9062-rtc";
+		};
+
+		sd0-pwr-sel-hog {
+			gpio-hog;
+			gpios = <1 0>;
+			input;
+			line-name = "SD0_PWR_SEL";
+		};
+
+		sd1-pwr-sel-hog {
+			gpio-hog;
+			gpios = <2 0>;
+			input;
+			line-name = "SD1_PWR_SEL";
+		};
+
+		sw-et0-en-hog {
+			gpio-hog;
+			gpios = <3 0>;
+			input;
+			line-name = "SW_ET0_EN#";
+		};
+
+		thermal {
+			compatible = "dlg,da9062-thermal";
+			status = "disabled";
+		};
+
+		watchdog {
+			compatible = "dlg,da9062-watchdog";
+			status = "disabled";
+		};
+	};
+
 	versa3: clock-generator@68 {
 		compatible = "renesas,5p35023";
 		reg = <0x68>;
-- 
2.25.1


