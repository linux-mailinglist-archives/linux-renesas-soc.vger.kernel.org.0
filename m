Return-Path: <linux-renesas-soc+bounces-15702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FBCA83ACA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 09:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B6729E025F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 07:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2A920AF78;
	Thu, 10 Apr 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hpkBP2uN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D8207658
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269277; cv=none; b=SMNIscJxWNiCsue8fzqAvmWEBwXAmG14lylnPIo0nsSiPDo80SGo/u0IFtA2Uq1zAwBdaJ3LM8nGBSflWGhym96oMNsZOZ1t2V6Txpy6mVuhsWv9R9k4Jlbxpi0qvZJ43p1Wgq9e7Vudx1ehMRmFejdueByi89hs8ikrIAhJ6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269277; c=relaxed/simple;
	bh=p/7y2y0F0kLOwQx2YFWqytKII4iJqHl9ezK3OtRr/QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kf0IZ2fWnbKjLB39cwK/m6F9CS2BmGFHQhO4PYojIr5fYhQvKs54D9Br7/XY1G1Uh6tebDh5+shXctyJ7nRQvsFJql0KPBGbxw2lD2Etj4lTBYJa1i9Eq2sVgLeeTrLHOBNLvNECVmut99XzlhX1XglHnhDiOmY/uH+ixG0xAhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hpkBP2uN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0QTy2Z3yPpEJBaKJR9iS6PQCJZMCcO/72t6fb+Coyq8=; b=hpkBP2
	uNMDtqQTlqKq2ftv+rnWkDf/jfR4yJuUfNl2GBcxnRazyyCFJezg1ncRHaq2MwSS
	Abx+qqhQtc0Y8bXXjm+wpIFum2ZZHHjbuhfWiSoSLVcjc6NxjvAiLy9RuH5L6B2c
	r9vJcWOEMj0ZuG6k+l7m0fyfoQkjOIIxwoTETQLT7mK4ScduKutMjCDMB9zWjZoq
	y+fw4PNUcTri53sqQWEJbgbwaf6VyO/msAB+ETBy3C0L3TXe9kP+2Xzi4gk7d2g1
	1VgibwS/LEVH2z/XLMxp4hYGjJh270HdGEPdJel3WfHBS8cgt41kkrb9gQCNN93v
	KuyIxeEFIv/m8Yfw==
Received: (qmail 783810 invoked from network); 10 Apr 2025 09:14:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 09:14:25 +0200
X-UD-Smtp-Session: l3s3148p1@1T3tVWcysq0gAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
Date: Thu, 10 Apr 2025 09:14:08 +0200
Message-ID: <20250410071406.9669-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250410071406.9669-4-wsa+renesas@sang-engineering.com>
References: <20250410071406.9669-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 5889d391b653..8435e77c085f 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -298,6 +298,30 @@ pinctrl: pinctrl@40067000 {
 			status = "okay";
 		};
 
+		sdio1: mmc@40100000 {
+			compatible = "renesas,r9a06g032-sdhci", "renesas,rzn1-sdhci", "arasan,sdhci-8.9a";
+			reg = <0x40100000 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int", "wakeup";
+			clocks = <&sysctrl R9A06G032_CLK_SDIO0>, <&sysctrl R9A06G032_HCLK_SDIO0>;
+			clock-names = "clk_xin", "clk_ahb";
+			no-1-8-v;
+			status = "disabled";
+		};
+
+		sdio2: mmc@40101000 {
+			compatible = "renesas,r9a06g032-sdhci", "renesas,rzn1-sdhci", "arasan,sdhci-8.9a";
+			reg = <0x40101000 0x1000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int", "wakeup";
+			clocks = <&sysctrl R9A06G032_CLK_SDIO1>, <&sysctrl R9A06G032_HCLK_SDIO1>;
+			clock-names = "clk_xin", "clk_ahb";
+			no-1-8-v;
+			status = "disabled";
+		};
+
 		nand_controller: nand-controller@40102000 {
 			compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
 			reg = <0x40102000 0x2000>;
-- 
2.47.2


