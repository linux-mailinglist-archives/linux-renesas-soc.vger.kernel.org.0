Return-Path: <linux-renesas-soc+bounces-18891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947BAECA74
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 23:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B6FC174922
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6AD23507B;
	Sat, 28 Jun 2025 21:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MghOPmzW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cy+bqt/W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDAD2206BF;
	Sat, 28 Jun 2025 21:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751147798; cv=none; b=KucLJH/ZTn6lPsjcMw1EqgY1nmJKac1tjs21aKBX1R4NYXsHPRkxqVCIAETARI14opdHAFdOrUTn7twBf4EW/VqMHDCeOA4RhntCYcey0bRQxkQOUIAWDFPQzup0fc4sNsscviXITe+e65igkrqjl3TYrpHwbD5f5tf05xKmqYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751147798; c=relaxed/simple;
	bh=r4qOBogmawJELjFatCDXTFO1lLHlRLk7SAURqzT8jWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/2w8rzUGZs1TrxuC91eE5fwYLrDYdtBDsOsm/Kx05iPUiH7CBetreiwxprYUTNbNR9CIpIU0SqeoE9wJMhrDboh6W0G77qFI7n8vh0NPhXneBfH9sSiqSgH49WRjtB6XMuyqG/gfBv3Asyg8RXs6e71bewqIV2IjijVIwEMaz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MghOPmzW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cy+bqt/W; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E504D7A0054;
	Sat, 28 Jun 2025 17:56:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 28 Jun 2025 17:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751147792;
	 x=1751234192; bh=hDVZjtGmTVbcdyo5HN5k0x2bM1UCthi+yjGKKErpa9U=; b=
	MghOPmzWWTWVQThs7oHvzI2isTToRjGDHCfBY4J5UVdbtZjUk4NDIt81ZecoeeS5
	nTmnvtwmTnZjI8JyAJWIbTYTawic+0+xdAfyq213cyszBM80XvtSuauSaQXXk8KA
	VpnR1cpHR090I+LWAvp0LScRUgYTMXZcXtVX3bPVY85am0kxb4+BruZ6o0xL/Abw
	wuWSIXzFH5yBlYnfBV9AQJ3xZKUVytAu0YrNJv7/KTQ6C49kezx/L2AF4/ZHKu5R
	/ApQjO8BLkN0RgT65y7+tb8qVRb8cfhYRwMwGSR5sS1EQnCLpUkBKVSlYm1m2u7t
	n++DDYozAyEo/NxXc60Z0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751147792; x=
	1751234192; bh=hDVZjtGmTVbcdyo5HN5k0x2bM1UCthi+yjGKKErpa9U=; b=c
	y+bqt/Wmiq7mPaxcj5p5TISh6n08V4AuqLFXKUcjqYEv9NKMd3vr+fDrYRdMnjMj
	QYxV+Th81rFDeLC8zucQIssFDqV6PpZvOE3kPl0dOQdjBnN4D6AamW7EgAFls5IR
	VRlgPZzWdSsc4a7WmNxTwStn9PlH/rrbF6TVEN2QE6VJoMKwM9y/WXKp+F6P/O9b
	zUgiNJofa0zFUAMwsQxvwhHTmLKSDP0chWbBb+NCpuhjp601yJwAaRU+klhE12JV
	4gSIctlECKa9IXfDGO1stAIgfgmVSbsvxuaDFl4PlscUEHth3/2/mrxDz/gpuwZS
	gaImxSutnFKZotnsH9QVQ==
X-ME-Sender: <xms:EGVgaM4sCyFeOb0n33tqwt0fCB4BKmNJdoyoheqkMfM9oCyBb86Hjg>
    <xme:EGVgaN5D4VXHNPaN0WMEzKNNGimiQXeX_Acs1IBPN38iC4ldEYRi8H_k5Aoh0SJVQ
    W6bHYBEyd7x8r7zZis>
X-ME-Received: <xmr:EGVgaLex6_8xtFrAU2arsh-3UyVlyc6NiYhbh9_0COk5xpOly7qsMI8nZwW9t5N8W12t0jCf40MkzGVyqC6Tp05XnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefh
    heegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiii
    gvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmh
    grihhlsghogidrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgt
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:EGVgaBKBnIQJZXfO_4Ab3H_yVYLyQNUXEwvwDW99WG5TmOeoLWWulw>
    <xmx:EGVgaALldOc_GWsMBYxX7Ygwhgmjq7V5k_H2z57lgr6E54WHc3E15A>
    <xmx:EGVgaCzqQ-3oOO7oo-g_MLO0Fm6gcSlKLMtfpa30UY2HFfJFJU4Cyg>
    <xmx:EGVgaELOe4WrbKIRimmE6rKqOo6fDH038VOlQRhferf2IKi4yHJJNQ>
    <xmx:EGVgaOuLgSmvvd_efRCgTvHt3RGSoqxzDOJkWL-DGLmr99d3xd2Orxps>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 17:56:32 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
Date: Sat, 28 Jun 2025 23:53:36 +0200
Message-ID: <20250628215337.1688969-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an overlay to connect an IMX462 camera sensor to the J1 connector.
The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI40 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 121 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 12803c4fbc80..79d174077ddc 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -97,10 +97,13 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
+r8a779g3-sparrow-hawk-camera-j1-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtb
 r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
new file mode 100644
index 000000000000..a1efb0ca48d8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for an IMX462 camera sensor in connector J1 on R-Car V4H
+ * ES3.0 Sparrow Hawk board.
+ *
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&{/} {
+	clk_cam_j1: clk_cam_j1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		status = "okay";
+	};
+
+	/* Page 29 / CSI_IF_CN / J1 */
+	reg_cam_j1: reg_cam_j1 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j1";
+		enable-active-high;
+		status = "okay";
+		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_cam_j1_dummy: reg_cam_j1_dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j1_dummy";
+		status = "okay";
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx462_j1: imx462@1a {
+		compatible = "sony,imx462lqr";
+		reg = <0x1a>;
+		status = "okay";
+
+		clocks = <&clk_cam_j1>;
+		clock-names = "xclk";
+		clock-frequency = <37125000>;
+
+		vdddo-supply = <&reg_cam_j1>;
+		vdda-supply = <&reg_cam_j1_dummy>;
+		vddd-supply = <&reg_cam_j1_dummy>;
+
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			imx462_j1_out: endpoint {
+				link-frequencies = /bits/ 64 <222750000 148500000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csi40_in>;
+			};
+		};
+	};
+};
+
+/* Page 29 / CSI_IF_CN */
+&csi40 {
+	status = "okay";
+
+	ports {
+		port {
+			csi40_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&imx462_j1_out>;
+			};
+		};
+	};
+};
+
+&isp0 {
+	status = "okay";
+};
+
+&vin00 {
+	status = "okay";
+};
+
+&vin01 {
+	status = "okay";
+};
+
+&vin02 {
+	status = "okay";
+};
+
+&vin03 {
+	status = "okay";
+};
+
+&vin04 {
+	status = "okay";
+};
+
+&vin05 {
+	status = "okay";
+};
+
+&vin06 {
+	status = "okay";
+};
+
+&vin07 {
+	status = "okay";
+};
-- 
2.50.0


