Return-Path: <linux-renesas-soc+bounces-26970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C3D39588
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B7BC301C0B8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DBB3314DD;
	Sun, 18 Jan 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QSv8kLzX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WtM8NSEV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F9331A6E;
	Sun, 18 Jan 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744300; cv=none; b=lH9NJiLqeEjD7uENzHal7VyunU9MprMxGTaakaXAhz5OHbr4gWHYBX6mJUqofP/tuJiR20efZvW/vyrlEtiFzaObwyyirhyA/fz2brk5bItLul1kgu/a4LksCByPekZfXgsVjHFbiKIqTvt0BdLuxoWFapzMcgwtq2XWGmnvfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744300; c=relaxed/simple;
	bh=ACqjgsugS0WFblk0a0KkCltvxS285DYeJXMLANaVv+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBcqcSlHH4nGQ+Rcqhvx178Z9N4ZRLrAycLPV8otb96NS5oGQd5Nxv7gcwiY8zzzoYMlp2BP0qsYvjlenufx9GJvSjdgbt0cE9RXU6DBD8O74hFQIz+/PK+RxhHkdopD1rqHkbBOZwhspR3F7NZP3VVXVsMLhKCkM0KRrHic4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QSv8kLzX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WtM8NSEV; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dvFPG6ys1z9tj6;
	Sun, 18 Jan 2026 14:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0bVHsCY7UsPDUQ9Hr2u2yyp6GJ/5zKUxBjM//vPrbo=;
	b=QSv8kLzXK9KZRHM3j8MfBt8VIdXiBxvF3nwBSi2HCF7FyuDq2ULfNPj+1t4l5eghZ9gB/4
	8ILD8YlAMUBimjUtES6RRoV0fWuOJ+f+IEHV7/aduMN0Kd1Swkrv+PQ0W30KIzg1tW6KXd
	keJnIoZGVEn8ySom3nVaP6V3Avh4r+KC1HGpbdncSbUZr6Xo89Zjx6RLgSGISlwKTaKVt0
	f2XvAoyrVIrMW0KN15bZNeeeP9p4jPYn4roJRyLNcVpQUr/RWdpAvAKpG7ebXT+3mhQ1zq
	2B/QCkb1i6OsclPFuuBLFFePG7lQH2JSDk39soJrWeIdTXYozIskZhrOKqnhDA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0bVHsCY7UsPDUQ9Hr2u2yyp6GJ/5zKUxBjM//vPrbo=;
	b=WtM8NSEVVCbKS6WvOG1bENI1MqfnvIZmhe3KCYOKaahoTP4U/5EGlH4bMPX7V1gV7hgoiN
	cQk34t+EbsbvlPL959vD3t8j30g9A4eoqpzNRMAgNsyKRYRyXMEP9wpX8JWcJrPmTT6xQw
	CO6VazpkXlzMRAWr14f/UxOqXpqWOQaesLEizhWag7b0aJjCuvdw2plwii3InB3yDVcGQy
	kX4hXhBLnXMx3ec1JH+p24YTJWS7y1X9bdVK56duZcABTX463d0UVHcyQGge5P5PXovFo8
	HMQu18nTfD5ltvct9ttKjgaUZhZKwpJovaH8xv89x4pbUblwN2iN+ijCU9x8dQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock generator
Date: Sun, 18 Jan 2026 14:49:55 +0100
Message-ID: <20260118135038.8033-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 802bed468735546f758
X-MBO-RS-META: q1cajjbnhxwxp63mhgpyfhh6eqo8t83j

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on both
Salvator-X and Salvator-XS boards. The clock generator supplies 100 MHz
differential clock for both PCIe ports, as well as for the USB 3.0 PHY.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index d4a921bed4c39..9a8c569484c03 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -75,6 +75,12 @@ backlight: backlight {
 		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 	};
 
+	pcie_usb_refclk: clk-x7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
 	cvbs-in {
 		compatible = "composite-video-connector";
 		label = "CVBS IN";
@@ -523,6 +529,13 @@ pca9654: gpio@20 {
 		#gpio-cells = <2>;
 	};
 
+	pcie_usb_clk: clk@68 {
+		compatible = "renesas,9fgv0841";
+		reg = <0x68>;
+		clocks = <&pcie_usb_refclk>;
+		#clock-cells = <1>;
+	};
+
 	video-receiver@70 {
 		compatible = "adi,adv7482";
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
@@ -641,16 +654,27 @@ &ohci1 {
 
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 319>, <&pcie_usb_clk 1>;
 	status = "okay";
 };
 
+&pciec0_rp {
+	clocks = <&pcie_usb_clk 3>;
+};
+
 &pciec1 {
+	clocks = <&cpg CPG_MOD 318>, <&pcie_usb_clk 2>;
 	status = "okay";
 };
 
+&pciec1_rp {
+	clocks = <&pcie_usb_clk 4>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
@@ -1038,11 +1062,13 @@ &usb3_peri0 {
 };
 
 &usb3_phy0 {
+	clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
 	status = "okay";
 };
 
 &usb3s0_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &vin0 {
-- 
2.51.0


