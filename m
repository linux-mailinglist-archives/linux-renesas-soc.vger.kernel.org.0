Return-Path: <linux-renesas-soc+bounces-26969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A2CD39587
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4821301412D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9119332C92D;
	Sun, 18 Jan 2026 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iRbwKDPk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ud4vDz+s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C49932B9A9;
	Sun, 18 Jan 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744299; cv=none; b=U+axtWP75qa3vXw0/aa0YOw3lUvsgejsLoD6Gmc3I2um18Ifh0EPBE6x1SHoPmeTDz9sVDRPedCoqJRNZu2ASPoXxlRY5ShILr1Eb3ivsf5s9EAeqjdgNVCyZOIZSA0XqV5Lhht5NpqtDFWqLgyOf9rscV2lF2nQ0uRxPvr0Fmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744299; c=relaxed/simple;
	bh=fP4rUzY9xzujHMJV5s/M8CKAU+sjW4hkMCRJoZ/f990=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbPVDdfdSuqc+TVma+fkbwW5Yf1UGeb/Y2/lUVr/oUckf4xPxcJ7phT7Qopx5cjSyBsgb8tkw5goYtsish6yB1AiehXfQ7WoPd5n4C8KqTgrBgx1AqwKWW8fYy7H68UZ5uJ6QdCsZEfF+6Me4ORk7HwNicVG837pJctRd5u0vqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iRbwKDPk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ud4vDz+s; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dvFPL0BlWz9thH;
	Sun, 18 Jan 2026 14:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhbR1WADSVCuQv5fABKfHNzM+PMnHqTEmcnMo63/rwE=;
	b=iRbwKDPkjH/NcV3SZycY0UpXQHg8kKRQopbPB84JFRdG11EOyNZ4sSu9LchjNSbjThynjm
	uJIG0irjIh6rPOjbeUtHLmC/lCtEoN6x4WoAUZyuWuSiNYZuAuTSUGjHV+jdQGKt2IKNmY
	PR3XQEwsT6sWF9TS1G7hSWRNmJfPEAfFsNNNQAJ6Q4mYq9soBKbi/8Q9crMy0EY/qpeodB
	ABMX0n7dSVGw35dZefS/TDdseOJYmN1vI10rlLVaQqtSSgmDFAUNndSQttT2Po+LBVFMwX
	bQYXEHZmXbOOargAowGqIgNf8wtva6gl+itaiKspu7pq4uoQ4wWMRuw+ixAUmA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ud4vDz+s;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhbR1WADSVCuQv5fABKfHNzM+PMnHqTEmcnMo63/rwE=;
	b=ud4vDz+sOe8qsiHvXrVh49V7g4rhYNtXptRNeRablKguRvJq//h4dfkIpS78SaJ5aeSmPA
	boKVROk6bdsOst6cfZHvGM4QNUi6ionGNmQXNAqQB6P0Lg4MVrekKNqocUaKHkGCdQ4X/a
	Mw6PI2Z2jzH8SrzLH8F1rtsJnIqO1p7A6S74fP9dZWBBH8bU5gjazrYHIRPOIUqm9pkGAr
	FV8hcIcj3TfN9l7AiKynVE0xMsORDOqYNE15cOipLC9BBPTW3vAEm4dAkVeTgmxlqUsmfL
	6axe9N4XW6AzXc4EDXEMQrDS7pW0hRYzlpDL8z7eyEdU2xIB/duxkQbmoL5nfw==
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
Subject: [PATCH v2 8/9] arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock generator
Date: Sun, 18 Jan 2026 14:49:56 +0100
Message-ID: <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s8pejcun7fxj9i8xi9acqzcb4gdctei3
X-MBO-RS-ID: aa07feda8c1c508eac3
X-Rspamd-Queue-Id: 4dvFPL0BlWz9thH

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
V2: No change
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi    | 13 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 2a157d1efb3d3..84d8e4acf51be 100644
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
index 241caf737abbd..67fd6a65db897 100644
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


