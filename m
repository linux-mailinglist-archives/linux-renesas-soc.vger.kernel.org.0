Return-Path: <linux-renesas-soc+bounces-18961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC3AEF67C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40001C01CE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C15272E5C;
	Tue,  1 Jul 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xIQSnn29";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LF0OTRLo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0326B96E;
	Tue,  1 Jul 2025 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369202; cv=none; b=hwXdGmjOf6KIRo7G7LG6bFzD/hWt0CGJq4BvqjJv45jRm/WGWFYrn31wOSB9Y52VSxFA4H5Zj9pB0Q2QNxg39lqYC0msr5+rbZH3IrcR5AFg3LBQ+JmE3wUhO29paEJJ2+Krt/LcJ+Wk7Wqb2poUKUP2V7AOyLDpCyOJr81+AeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369202; c=relaxed/simple;
	bh=uHQ0QGkBJ5TeAYPx/4zofW6etkJTbiN3rZQbTPnKgQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Enk3pVIq0WMy8GZrj09w8SKnT4I3ZVqx8+aBX/iZOJJZmO8DQ+3dtDAgKE1S24b6kAEHt7udUIeLuy5YKN1FJNy5nLHcz5MaumR75jTyxMS+g/fsDBQljDGtL686uc9jhsSxqAS3dDmgNo35bmHSZokPWqrNcIBzF7XPK8f7qeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xIQSnn29; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LF0OTRLo; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 83DEB14003B7;
	Tue,  1 Jul 2025 07:26:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 01 Jul 2025 07:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751369199;
	 x=1751455599; bh=XLzk9L7ARM31BrjdoSKY3Enj8NKZn3Z+OZi2/H8R0OE=; b=
	xIQSnn29djKqX1//8i5wscj/VAOk9ij4BPXZnAky7bgJWP6fxZIG01mxdaBd+YXr
	Llakc2FeOhMWprf36U2sF69pjiX8Yq60HyL1kChf/ro4MOtdQVprWoW5VDVGF7EM
	20bXzgO2mnfZ/eeMu6WPq4MI86DSOme6RD6ckY1eZ4dDsf+yO9hi1WaM/ivgaWUm
	vrsi0Uki7VortuCBolHYi3fNu2Xi4ygsoxmLU4byj5xxDvVpjE8o3hTcivpTZGeq
	G/QQihd+E00uV/gpmV2+vEba5pLFVIXK0/+MIXuew7QbOKZ4sxcthoyZOqu240fC
	SiqkgVNRe1hezaX+rWdF1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751369199; x=
	1751455599; bh=XLzk9L7ARM31BrjdoSKY3Enj8NKZn3Z+OZi2/H8R0OE=; b=L
	F0OTRLo5rXsPNduwtHHyjN/Pma9PBRI7aOkIFkpzkoHtGZSXwagX/BdRewnTvYXT
	KpXI5Q5Vokt9UuKWvtTyLCFch9hY7Pp0juZSLu+kbl6y0ySrQylDst6XUO0LnMpw
	vIrpDAOxNRcqJd05njQVaJAQ9d15GihTgpwfI35ayPmAlhEoxar3JMmdrCjyVBTg
	wE5MTmLG01byQ7LBUJli6sW0B2CJJMoj/HHpuK24nT7Nc5qELjMKx+bfwQ9OEo+D
	5vq3xyPJDtG3lbksPEuE1io8WSidQwU105ma5xYvQqH/gS6hjENmv+o4tIL5/M+h
	bfcxFWmgTdBK4raOTKCoQ==
X-ME-Sender: <xms:78VjaH1uW50d8eutKWFTpxzao8DZiwIR1pJ_qj44SnMwFLPUiyR-Jg>
    <xme:78VjaGF1ZK6WZfQA70RGUYSdI-ObOjqJw1uIIxovSGo5mKtPbL2SpcaRLJkhX3T5y
    WnGpitUr3j4JkmjTx4>
X-ME-Received: <xmr:78VjaH54B82WS97hIKtpXOsyBv4QK3A3MqCgAR9gNjC7P5-zPyt19mnVbyQ599JvbjGrnqWNXfPiSYE5q6ftSjK2Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghsse
    hmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:78VjaM3tep954HgykpsFMGhs7lh3VHIEeGvRi21qpNPxlPJ55tbr5w>
    <xmx:78VjaKEyPZQ5AvYGv2Lq0XGNHjOtDk5B2LzQB2aPtLN1-A1H_M5rvg>
    <xmx:78VjaN_Q3eRgeJu0d-k-aC1A_ZhoLEa1I7xefeVoPMOXUxR8a6a9Sw>
    <xmx:78VjaHnaSx4skgAtXRJanPa5EELn8tjDXXQt5Nv2swZwa1HebRSV0A>
    <xmx:78VjaBqYGSffNbZF4J0MnmWgpv84F3Yn76FCwDZ5jeHs5mmMNorbxl-3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 07:26:38 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
Date: Tue,  1 Jul 2025 13:26:11 +0200
Message-ID: <20250701112612.3957799-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v1
- Drop 'status = "okay"' property for the fixed regulators.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 119 ++++++++++++++++++
 2 files changed, 122 insertions(+)
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
index 000000000000..066e9f8f0add
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
@@ -0,0 +1,119 @@
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
+		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_cam_j1_dummy: reg_cam_j1_dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j1_dummy";
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


