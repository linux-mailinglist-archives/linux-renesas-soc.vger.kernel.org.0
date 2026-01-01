Return-Path: <linux-renesas-soc+bounces-26246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5ECED585
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69F3A30006FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A7523A9AD;
	Thu,  1 Jan 2026 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jD2eIHEf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QInb7ctl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B992DCF52;
	Thu,  1 Jan 2026 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300038; cv=none; b=d1eHN/J52ho12FthtdenVHlxv20JlgLQWhgwQfn9SEgikptS3iQjhG3UHamxmOt0P0QHL4/iRwNqW9SwFsJCBazLEIhB5oq33N4SkEYFB91j4hL3nwivgwEoOIkI2Tu51DO9zzNLcIlfxXhrwsRn/zb4XTKkfi7vQ88sHMt1M/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300038; c=relaxed/simple;
	bh=MgAnAeX2xgWCFluCq2Y0f0fyTGdcydH3bh4qYCbpuc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfFlbNDFrOKp4ijkwRGL6usWek6VkAsdJBVvWK+AtckiB9MdwFPGMzpd2sVxcHXdkDwcIztd1Z3/zPLiZnyJ8ev3dhNDRwT8XfuGL1xWPbabUPI2fsIbAGRzwGtXcUM7+n233+RgdEwzvkwaNnnpy0DDHT65Z/wM9ZwsM2rSqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jD2eIHEf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QInb7ctl; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhzH648V9z9sR1;
	Thu,  1 Jan 2026 21:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ry34khQxIU8hAmiXdlhwHv7F2qJFSNh761bs0K2+cus=;
	b=jD2eIHEfnL+6+zR1pG4wexeI/2hSQlNW7+zdI831vTBrgdtgxJ6+EuyizAS9liY/24mdiE
	/i1Fft9ZWQkZ3IJ+DNDxA6BsLoLg2GGzfh4flvU61bdUOyEDoThMroizDyeF8g/j5hcxXm
	0KVbaojhcynPvgqaIgR47JcO3OnlRmlPiIIFPCX3yVUwcqje8ctV5v0zqfWUN11uTPmuSC
	bAaiTjwj5ohzNbaJr0TSGDSTMbNQvlNdM/tNAM1Yi2hNkM5+yjZvMpATwhkJ1Q6Tvgt6MS
	inaNs/8x3BCLflVOAs1/0IOcW5MdgbXmDJWiIXfeerPk+E2zn6dtegr+7aVApg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QInb7ctl;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ry34khQxIU8hAmiXdlhwHv7F2qJFSNh761bs0K2+cus=;
	b=QInb7ctl5rQ64uE8KWgN6WFFPdNEj2JJVdK7MluS9+LEEa+fZcdDpmkqb1RarwSRJzc+cC
	8FZCkXyN46zhjROTgmyMoJfk85mnP5FPwzehwDSh773OR/GXDvpldbQOTEVPwNdH2CP6fi
	VUIBwvGKc8klNoLDCyFkk4beopZiaIo1XoSSDInYsgvHpwEoZ+PEwyQWnYd80ySpKQzoaX
	XiFo1p5fz4Wm20PTKKUOBhudqbeOf9uSpBVGCxhJHj+WgqOO/grcqi+G7a+BISMzzg6ZkV
	Z4xLoewIshOAgfP5+fKOK7a/ZNmrSi8tXMRbozwqUMROlqpnRNzVx8KVp9wqGA==
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
Subject: [PATCH 11/11] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator
Date: Thu,  1 Jan 2026 21:35:58 +0100
Message-ID: <20260101203938.159161-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sq6ed7j5ueauinwqfnokrgiusr13u7pn
X-MBO-RS-ID: ac310e9e446cad3ba5d
X-Rspamd-Queue-Id: 4dhzH648V9z9sR1

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on Ebisu
board. The clock generator supplies 100 MHz differential clock for both
PCIe slot and BT/WLAN expansion port, as well as for the USB 3.0 PHY.

This configuration is valid for SW49 in OFF position, which means the
PCIe signals are routed to the PCIe slot and U11 9FGV0841 PCIe clock
generator output 3 supplies clock to the PCIe slot.

In case the SW49 is set to ON position, which means the PCIe signals
are routed to the EX BT/WLAN expansion port, and U11 9FGV0841 PCIe
clock generator output 4 supplies clock to the port and &pciec0_rp
clocks should be changed to "clocks = <&pcie_usb_clk 4>;". Once the
BT/WLAN port is tested, this can be implemented using a DTO. Until
then, assume SW49 is set to OFF position.

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
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 0b1ada18a4f74..16168cf5e3122 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -53,6 +53,12 @@ backlight: backlight {
 		power-supply = <&reg_12p0v>;
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
@@ -439,6 +445,13 @@ adv7511_out: endpoint {
 		};
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
 		reg = <0x70>;
@@ -578,12 +591,30 @@ &ohci0 {
 
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 319>, <&pcie_usb_clk 1>;
 	status = "okay";
 };
 
+&pciec0_rp {
+	/*
+	 * This configuration is valid for SW49 in OFF position,
+	 * which means the PCIe signals are routed to the PCIe slot
+	 * and U11 9FGV0841 PCIe clock generator output 3 supplies
+	 * clock to the PCIe slot.
+	 *
+	 * In case the SW49 is set to ON position, which means the
+	 * PCIe signals are routed to the EX BT/WLAN expansion port,
+	 * and U11 9FGV0841 PCIe clock generator output 4 supplies
+	 * clock to the port, change clocks below to:
+	 * clocks = <&pcie_usb_clk 4>;
+	 */
+	clocks = <&pcie_usb_clk 3>;
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_link", "avb_mii";
@@ -872,11 +903,13 @@ &usb2_phy0 {
 };
 
 &usb3_phy0 {
+	clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>;
 	status = "okay";
 };
 
 &usb3s0_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &usb3_peri0 {
-- 
2.51.0


