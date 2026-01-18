Return-Path: <linux-renesas-soc+bounces-26971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE9D3958A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49890301FA78
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2616331A49;
	Sun, 18 Jan 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K6B5LGm/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NxgyC/EW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D73E331A76;
	Sun, 18 Jan 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744300; cv=none; b=jf6mnyeRLIMHmwt4spMvCm45B3RA2mALQ7puF7+Zd6X3FzXwYXtiiq80XufoXorRaXVxfzGKHdqwnD3xXo5cKnlzIxscSQDR6So0WzfKJ0XziiuJ8X6kHT+Q2l2AgQskVIJ7StIeEVB/1APSow0W9pWzzkD1nthQf2GQSq4bkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744300; c=relaxed/simple;
	bh=eOIUUp/JzC4aWuqsK+ttfirFlz6axpoqayM+b5oL7RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7PMGvx7WZq7cRr04V/fkLHyzqinccdQ+ixQGDd2A0hZ4XA1gTLZFxjlNxCpVoDXxNoo9y/AcjXvu+ZRSK/CSSzxXcvGrAzpLDCUh8gi/Rs0JMKvaaGt+ASwv4FOwat3SftJly0Y9cTKHwUJjz2xxtrwm/EEvCQp/TTROhnSgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K6B5LGm/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NxgyC/EW; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dvFPN3vDHz9tlQ;
	Sun, 18 Jan 2026 14:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rFp++szFwKhe/aS+BdF0LwvGh5g0rpUwtgmKQmOfa8=;
	b=K6B5LGm/eDKBoqubI4IxRBg3qGZxmw6oHq1R8wlyd/xYoSmj/TwcnGucckte1bFbAYjo03
	vktuwe38vZcfO4YVtvpVfAPg2IQ6cL9GsxwzU6ImdGJvZZsKmGYP4iacdaCsjFufpJ9xpf
	XIHMYMIE9xk010cx3SugXvWTqa9G63GtPBPvZnXJGeMnsj6eoTqCQlitJ4LVBFHYx+T3/2
	FQqOdzQsZr8cf8qCXF22Jw0tTHtJYKG8FIg5NIozFwFOjE3pl9WH9jyW7cUYvqTbo5M6fG
	pIsbsDR1cbRslftvEWEUSH64AT7iUQ6QC3XyhoQ3ygBqcbBHA9afS5Unb9AgEA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rFp++szFwKhe/aS+BdF0LwvGh5g0rpUwtgmKQmOfa8=;
	b=NxgyC/EWSbG/scOOVminTK/OSZfYol4fbAO8ShO05ghLYeBhUiah1t4kcrfploCHXUBkpO
	8M2KfrehFASyGwNcSYh2g84YobYkJo+yQ52+AAmS+ei+YoWy+BBbpNT7KW5N2LvWUT98sg
	pGrOtWCP1awSyd1G9hsV5wiS0eCpetG3KAzBWKDSjoUNyiNSbUxWVNnUAsRspcSKl82mBt
	9RvvT2s9WHR+fIrq6qANissRZtQEuoaRUiKnNCPGMCRXCFbU6lnYaDojjeb3+TRo3c2OGw
	6TY8tHbMKwUCtGvLTqMrGqKKSXNpHlHlBFjyUKXI1XMtbUk9bptknDeHrCsZxQ==
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
Subject: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator
Date: Sun, 18 Jan 2026 14:49:57 +0100
Message-ID: <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: uemityo16qautgos11k8sys8sits49b7
X-MBO-RS-ID: 0c1bd4268929741fa1a

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
V2: Combine with USB 3.0 simple PHY enablement and update commit message
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 692a2b12aa035..d8de9568d0605 100644
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
@@ -871,7 +902,19 @@ &usb2_phy0 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	clocks = <&pcie_usb_clk 6>;
+	status = "okay";
+};
+
+&usb3s0_clk {
+	clock-frequency = <100000000>;
+	status = "disabled";
+};
+
 &usb3_peri0 {
+	phys = <&usb3_phy0>;
+	phy-names = "usb";
 	companion = <&xhci0>;
 	status = "okay";
 };
-- 
2.51.0


