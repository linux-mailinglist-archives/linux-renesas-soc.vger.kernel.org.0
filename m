Return-Path: <linux-renesas-soc+bounces-26245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98260CED583
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAA0930006DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62C32F363E;
	Thu,  1 Jan 2026 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z+Myj7h9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bar7Sw36"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2F2DCF52;
	Thu,  1 Jan 2026 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300035; cv=none; b=ukv6OS6mwGD1hPeNQBqJA5xLIPfVacaTen6OR2aSCTj2CDQlSX2K2upScnw0vWtm4en20ajwaAkhKDA9eMIv1ULmL8Hyi+UTjJnpUYtM97bH/k6KthZM7qFf8c2H/54pPjBLDMSHHxpeNkMOE0gRAdQnKYHPfWZsBgA/Mse30qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300035; c=relaxed/simple;
	bh=LXMwuEIZcpa57ipNFncU9jNrodWT3hc2jEHiOuNfiLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvAZQBzUPRGzKWngxI/h6c9RBeI/A4+z1GgzPTLV1seCFEtuFCPI/aMeJH14Z9sOwTTgSqlDGiOz1FrkURd1bD6BBdEarOQvo4PKlyvhQ2q+f6mzWv1nSZjG2L3E/703UWRxGOLqLkR2EZL2jLQ1QRuBxNul3qLEa9sEVSvbChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z+Myj7h9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bar7Sw36; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dhzH36x2Nz9tB8;
	Thu,  1 Jan 2026 21:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNebvpYzUNK1d9hMY00eovKv3pm6J0VQLBTkOK+0hEw=;
	b=Z+Myj7h94vGM8ycL8oTYtZcre5AwpFFRUaDb3EVFJwbuhE9MEZ8/51o6BEPSyGD9SHNJBV
	TLPMo8SuYa/Szbqi2pynkjcDNSqBRMhBzjvVwxIiqy/gj4M62bfa3L5vDN/+2dtIQ7Xjk9
	fqIy23CRPRvco3qtcW0Vxtd4dq54OibzMR29vnCEjbSTTcTU9lmhXTr9ZWdQPewyff8yk2
	Z9McwUG9SooJnPgbABBUiG7HQ1c8WEZdZQyz/j5uEQFwcthp5G9hYutzHBgTtAdAychSDV
	uirATaa1Bn1uxG9HvN0YQ8YjMDcAxXs+MMWREsSxwm2zZioeHkhyZSBVI8RiPQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bar7Sw36;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNebvpYzUNK1d9hMY00eovKv3pm6J0VQLBTkOK+0hEw=;
	b=bar7Sw36H/mh9Xyi+FP60p1nk7H9Qo3S3rol31O1BHuDfnPlCyn5lXS8+JYxwo3f9J/ZW3
	fxsWOBDvHAgfIMPTlQMUyE/7aLJ/3/HVtSPD8orsWrYtCG7p26n60YtdlkJg6m4GGDnqoy
	XtJFhmc12gEagBBdHyRWpxA+gTL3M5hj699IglVRaZordYYYLRHU03APxVdL9/87RMKTdA
	xqDaUgiQZiInDr9s/b7IBpjhD4VV2oEj3/FSoQHb/lKdCvhXnxBr2mLKcQUzt5ex/ji+5+
	GU7kVzUznIhDyQgO/e8j+fE/hGE7aQgP32XrPgcUBXwjKOUPAVwY9r5t1DobVw==
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
Subject: [PATCH 10/11] arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock generator
Date: Thu,  1 Jan 2026 21:35:57 +0100
Message-ID: <20260101203938.159161-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6a8126c908b296c5ca4
X-MBO-RS-META: bzs6yu93zf5sk7ccf8q3xeguxu86hz16
X-Rspamd-Queue-Id: 4dhzH36x2Nz9tB8

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on ULCB
board. The clock generator supplies 100 MHz differential clock for both
PCIe ports, the USB 3.0 PHY and SATA.

SATA is not yet described in the ULCB DT, therefore the connection to
this clock generator is not described here either.

The H3 ULCB schematic does describe connection from output DIF7 to
USB3S1_CLK_*, but these signals do not exist on the SoC, therefore
this connection is also not described.

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
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi    | 13 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 2a157d1efb3d3..567d0f8467a78 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -352,19 +352,30 @@ &ohci0 {
 
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
 
 	vpcie1v5-supply = <&pcie_1v5>;
 	vpcie3v3-supply = <&pcie_3v3>;
 };
 
+&pciec1_rp {
+	clocks = <&pcie_usb_clk 4>;
+};
+
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_a";
@@ -475,6 +486,16 @@ &usb2_phy0 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
+	status = "okay";
+};
+
+&usb3s0_clk {
+	clock-frequency = <100000000>;
+	status = "disabled";
+};
+
 &xhci0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a9e53b36f1d9c..c1bb80361db74 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -47,6 +47,12 @@ audio_clkout: audio-clkout {
 		clock-frequency = <12288000>;
 	};
 
+	pcie_usb_refclk: clk-x24 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
 	hdmi0-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -232,6 +238,13 @@ &i2c4 {
 
 	clock-frequency = <400000>;
 
+	pcie_usb_clk: clk@68 {
+		compatible = "renesas,9fgv0841";
+		reg = <0x68>;
+		clocks = <&pcie_usb_refclk>;
+		#clock-cells = <1>;
+	};
+
 	versaclock5: clock-generator@6a {
 		compatible = "idt,5p49v5925";
 		reg = <0x6a>;
-- 
2.51.0


