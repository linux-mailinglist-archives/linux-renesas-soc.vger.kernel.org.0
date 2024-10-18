Return-Path: <linux-renesas-soc+bounces-9839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164A9A3A46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 11:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 816F3B259B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 09:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EFC1FF5FC;
	Fri, 18 Oct 2024 09:42:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E518CBF1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729244522; cv=none; b=qpv/CcyWWrEpbOUBk1/CACvJZGArc85GkaJUkCt3eLvuzc+vYAsKb6KcBNoOpUm5gA8LyUfGlpAnxRYh6si7UO/PUGGyV3WsDoMLjb67OGI/gOwVbh7HqkG89jQtI7EmxAYje3VkaBT5lLaCaFAO7S8+HPc33T93MtXQ22jjvEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729244522; c=relaxed/simple;
	bh=lyOv1ki7+se3TbFk1LnoQxQWU9C0UdL6b8iT0shbMKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Az+4VlU88lQ5P+50z4CG9iDyjuQI8j2oTL0/PuO1gUtVUagIWfAkUKwsFI5s7MiupbIWSzFCNvacgVNgSXCqvGUZGC5/e4teZIwORpdT2bbjdCmaPhXTFjXuXhHQKAcO5N2WHVs9z4HFouoAIQ5gM59ospxdgMPcV8lMcX4zmmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4XVKJ33cdCz4x4Wh
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 11:33:07 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by xavier.telenet-ops.be with cmsmtp
	id RlYz2D00K1MdCM201lYz4t; Fri, 18 Oct 2024 11:32:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1jLg-003zIK-F5;
	Fri, 18 Oct 2024 11:32:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1jLv-005rrh-Er;
	Fri, 18 Oct 2024 11:32:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/1] arm64: dts: renesas: white-hawk: Add mini-DP output support
Date: Fri, 18 Oct 2024 11:32:50 +0200
Message-Id: <05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729240989.git.geert+renesas@glider.be>
References: <cover.1729240989.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the mini-DisplayPort connector on the White Hawk
BreakOut board.  This port is driven by a TI SN65DSI86 DSI to eDP
bridge, which in turn gets the pixel data from the second DSI channel on
the R-Car V4H SoC.  Note that this port is not present on the White Hawk
Single development board.

Based on the work by Tomi Valkeinen for the mini-DP port on the White
Hawk CPU board, and by a patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This has a hard dependency on "[PATCH] drm/bridge: ti-sn65dsi86: Fix
multiple instances"[1], as the rcar-du driver fails to probe when any of
the encoders failed to initialize:

    platform feb00000.display: deferred probe pending: rcar-du: failed to initialize encoders

Does not work:
  - Display resolution is detected correctly (1920x1080 or 2560x1440),
  - Black screen, displays say no signal detected,
  - "modetest -M rcar-du -s 88:1920x1080@XR24" triggers:

	rcar-mipi-dsi fed90000.dsi-encoder: Failed to disable video transmission
	vsp1 fea20000.vsp: Underrun occurred at WPF0 (total underruns 2)

    Note that fea20000.vsp is vspd0, not vspd1. I do have a few similar
    messages for fea28000.vsp in my logs, so this may be a red herring.

[1] https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be/
---
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index 784d4e8b204ce85a..cb84fe5e9eea1f2f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -12,4 +12,94 @@
 / {
 	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
 	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
+
+	sn65dsi86_refclk2: clk-x16 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+
+	mini-dp-con2 {
+		compatible = "dp-connector";
+		label = "CN15";
+		type = "mini";
+
+		port {
+			mini_dp_con_in2: endpoint {
+				remote-endpoint = <&sn65dsi86_out2>;
+			};
+		};
+	};
+};
+
+&dsi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi1_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in2>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bridge@2c {
+		pinctrl-0 = <&irq1_pins>;
+		pinctrl-names = "default";
+
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clocks = <&sn65dsi86_refclk2>;
+		clock-names = "refclk";
+
+		interrupts-extended = <&intc_ex 1 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+
+		vccio-supply = <&reg_1p8v>;
+		vpll-supply = <&reg_1p8v>;
+		vcca-supply = <&reg_1p2v>;
+		vcc-supply = <&reg_1p2v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in2: endpoint {
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out2: endpoint {
+					remote-endpoint = <&mini_dp_con_in2>;
+				};
+			};
+		};
+	};
+};
+
+&pfc {
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	irq1_pins: irq1 {
+		groups = "intc_ex_irq1_a";
+		function = "intc_ex";
+	};
 };
-- 
2.34.1


