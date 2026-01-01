Return-Path: <linux-renesas-soc+bounces-26243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B6BCED574
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2002D3005FE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC82D23A9AD;
	Thu,  1 Jan 2026 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ELMMdxLd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fmkC7kck"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F6A224FA;
	Thu,  1 Jan 2026 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300032; cv=none; b=mkS7s2WLnm7zHY48gXKLhpkMFEdwj8rH6+3sF7ctAEHye8Un4GWKxlafwc4trI5yq/+5DfdcbSmfnk5CCqAycJJI8/ZpZwK+AuZPxxer1jOHz/rYDmVZvmh4CLzRrmOQ7NfPf2V4aCU4y3UGaUS66Wx51Eh5EIxPg8rbLGP+4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300032; c=relaxed/simple;
	bh=WohHC5kuM7hWj2iC01TbrDAP18U/fjMjcsTsBT7WcKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcLs5fRStvTCGb68L1UBs+cTDDQ1Vd9Zr4ISLG4UsG+6sNnwDhu0HjAYvpffXJ9PfjHKOtAS3mMy1SjKv8tEPCtMVgwqIWmTdIxgsp8iKfjSQm+GlSkzBsFp5230nAf8r+0eJzRlzgqYxi6/YPqFhf5QbeQqW8O/rhTUW2GP2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ELMMdxLd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fmkC7kck; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhzH13L0Vz9slB;
	Thu,  1 Jan 2026 21:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlKZeo0XgHiA07/N2G8KpiyowaP0TZxF7sE3OuoOMSo=;
	b=ELMMdxLd22a9PfBUDenJf8szJo/rnj+njYVFkMO3MqTBYmJEuwJ6mnBAyYuehampEApy/U
	A5ZGnH/k31BUVsKaO7JHEa+vokaYLlTyT05kBjP5juGAZMCeUrxJOumPS7XBH1wi/Zyys7
	FeFOlZeWeXK7FHWlTKnt1r2X4j3YRSOh5/RuIlLLDwDRFepV7IUVxMSZBOya0G6qSNfu33
	463mewtoN9YOTwFLZpNOPLYxrm2E8WZE2/QAfKDkIiX06ZbTUPJsN6pBJttjCzrJ195Ene
	gpsbqogZ/EHVr4ENffiagTBm6Mz42AQzhIDY1UNLzPaXOqjDGx05qweNgRF1GQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlKZeo0XgHiA07/N2G8KpiyowaP0TZxF7sE3OuoOMSo=;
	b=fmkC7kckUHH1ucvSZ6+HSyZj/9HbCQbYVrkJYYYoGLhgCoaHyQM3ATXuWMWWhMNBWAp3Cb
	yMgcFvG5MbBmvaVcpGoF2/qMSWaRzy32oWXU2Ch0STxenGNzr2VMcjNwZFLodiCBx28pvf
	F1ig0DyfpwtTc0zB9PHcCOM459VHkGEXt+eA3dsxtPHcdvhpjGlKFZW1XH5NQesm+Gvcvk
	sz/1tliZ62hP7kNp31BYdBOBqzIwHFnIhUuy2gaPU5A9ykDrvJdK7V4ZJ0gOiHeMsAOXXC
	l00x++inNQWgeezCWWZlRSeC4OqMgG4XrhptjjR0jcfTjimUSNHDQjxt4eJQYQ==
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
Subject: [PATCH 09/11] arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock generator
Date: Thu,  1 Jan 2026 21:35:56 +0100
Message-ID: <20260101203938.159161-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 95943db91b541fb9950
X-MBO-RS-META: wmuca9chgsqj9g5n1ep581ptrjn8egy9

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
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index fa8bfee07b3c8..4e2322d2a90be 100644
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


