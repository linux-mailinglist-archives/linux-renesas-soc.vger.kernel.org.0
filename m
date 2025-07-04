Return-Path: <linux-renesas-soc+bounces-19207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1BAF8F81
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 12:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B4F516A1B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186102EF9A4;
	Fri,  4 Jul 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KkdOYp6v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ccEbp5Ze"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430892BEC23;
	Fri,  4 Jul 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623732; cv=none; b=cdzd7dhVK7R842+dm6jSwfNfxC5ehyzierLaAkTGI1SBCg1b8BpWhtE1zCp/Yslbf+MemNtdduCrYecA5Gx9Obxut/TighaVuD5Q4dT94kVNPbRe6XfleV2mqZXskYn1CXiPX8fmvGudOzJqVM2QjPFXEMYZU098h7ySGql5x70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623732; c=relaxed/simple;
	bh=pKBpmtaW76kwgusGVjqcjZ0OR7RI9OM36GO/tCC5JZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGs7MIgtmDzTBYuVi6Ifkr6hKb0Wh4o3UjjvqVu8I2QgPGUkFgj3PGXqSi+BnUlvfPum5C1QQGDMkZEce+GBOQNt8xr+zwr6a7d3FFmJwXDLld4//yhpfaGHSun37HDQQFjCknaGxGsZnip+WxqUYZ/gqpB4UjKgZ1F0aC57guw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KkdOYp6v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ccEbp5Ze; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3D6F97A01A9;
	Fri,  4 Jul 2025 06:08:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 06:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751623729;
	 x=1751710129; bh=obUtzfT8eqScUq0GRm+J3acyNYMiBOvywLRebdxDRLg=; b=
	KkdOYp6vdGcOOEzmYRsUz/azH0aget76EAotKOC/4QDVtPeEw9wBJ914J/Zgx/+o
	6x84mwv+E+EA6BwDuy40xjZV8PQPUA1Iqdjf0OSDL1aVe5hSmn9buwGTyI1yfsjv
	8bLeKrAENM5n9/qBeZwI3RqYn2fzBtjFydF2h1w6Owd6FjKQvSSfXIlgrmsXZbsW
	fRkV1nG1twAfBlHYfYTDXl2ol0h69zcXAlHUrCrsJyx01HPwcaXrYv+jisPcpfS2
	DYY7VArm/pApLt/rFESn1PRoESmF335KyTNXE2epfpVPZ13M5iMHB11rBfZRbaJj
	LMehIE54bexHyu6bZPUIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751623729; x=
	1751710129; bh=obUtzfT8eqScUq0GRm+J3acyNYMiBOvywLRebdxDRLg=; b=c
	cEbp5Zejo/4etAUK/T07c6N7vQg8lWyQzQ1wtZFXlo9LSCq2lX35yEtC7ToppuFo
	MlIgJAh3PYttRknY4kIGOImYGfLt8CLO7fCidjbbkmIIi7pzzSY50onWPnQuwOOk
	mhOWjGdGXftF1G63Cg3tn1Zzsh/hCqAozTp1/dFmOuEa1glgjA/Hxf6zYXRt4It0
	UMmX3MK/v8TkywirRJApUtry31YsYIwsscaoWMUXhnRuphLhHUN8M/4gXxUzoJTn
	PnlF9qbTyxmMQHWziBkdngp6TmhXyCHQFkqQrcRC8RAulcnhqQkoS+vbRgAN4GCQ
	xj9uCSRl6FKH/r5t9nyag==
X-ME-Sender: <xms:MKhnaKuxwFBt2_9ijHrd5eCQmDLDaOH9tDGayQLLDmSb7G4pNzpSHA>
    <xme:MKhnaPdjRd0aZbs4XZMJ6yxx1_pWVWT7XB1gkqBcckkLfRcSvOUR7Bs5Vf99onUoM
    i2twvOAAe8D9JyeolQ>
X-ME-Received: <xmr:MKhnaFzSb99597rcly7T1aL0gRt0xH5gZ1VCsLYZO34hGT3Czh26gwQF9A18JP3QZO286_EdwJQ4Y7Q4qmFlonuNPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghsse
    hmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvg
    hsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhi
    tggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:MahnaFOlTpMZHtbYb9Z1chclqB8XzjC2_Z1albG6UtTPC7M0PH-3bg>
    <xmx:MahnaK-6zP_wpiTBC5spSSPe5RpuZkQp5d22dq3EGB_qSa1IIFR7eQ>
    <xmx:MahnaNVSHzaZ6aJ3cFkvK2eFGzp8S3VdtMt4JcJDCmUor_YX02aOVQ>
    <xmx:MahnaDc0u7S-8SAAhff-hhUubAj2yvhrfhJml-9x5KcRYqu3pGU6Pg>
    <xmx:MahnaAnMHlpNT9-l4bw0Fy2cArnSMeZEStE299xYX31kIjFrE2reeE1R>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 06:08:48 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 5/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2
Date: Fri,  4 Jul 2025 12:07:34 +0200
Message-ID: <20250704100734.3387856-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an overlay to connect an IMX462 camera sensor to the J2 connector.
The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI41 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Use the same regulator for all three supplies.
- Drop 'status = "okay"' property for the fixed clock.
- Drop 'status = "okay"' property for the sensor node.
- Drop unused label for sensor node.

* Changes since v1
- Drop 'status = "okay"' property for the fixed regulators.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 112 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 79d174077ddc..837e084cc07c 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -99,6 +99,7 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx462.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
@@ -106,6 +107,8 @@ r8a779g3-sparrow-hawk-camera-j1-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtb
 r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
+r8a779g3-sparrow-hawk-camera-j2-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx462.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx462.dtb
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
new file mode 100644
index 000000000000..d8d36a505fb9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for an IMX462 camera sensor in connector J2 on R-Car V4H
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
+	clk_cam_j2: clk_cam_j2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	/* Page 29 / CSI_IF_CN / J2 */
+	reg_cam_j2: reg_cam_j2 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j2";
+		enable-active-high;
+		gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	cam@1a {
+		compatible = "sony,imx462lqr";
+		reg = <0x1a>;
+
+		clocks = <&clk_cam_j2>;
+		clock-names = "xclk";
+		clock-frequency = <37125000>;
+
+		vdddo-supply = <&reg_cam_j2>;
+		vdda-supply = <&reg_cam_j2>;
+		vddd-supply = <&reg_cam_j2>;
+
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			imx462_j2_out: endpoint {
+				link-frequencies = /bits/ 64 <222750000 148500000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csi41_in>;
+			};
+		};
+	};
+};
+
+/* Page 29 / CSI_IF_CN */
+&csi41 {
+	status = "okay";
+
+	ports {
+		port {
+			csi41_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&imx462_j2_out>;
+			};
+		};
+	};
+};
+
+&isp1 {
+	status = "okay";
+};
+
+&vin08 {
+	status = "okay";
+};
+
+&vin09 {
+	status = "okay";
+};
+
+&vin10 {
+	status = "okay";
+};
+
+&vin11 {
+	status = "okay";
+};
+
+&vin12 {
+	status = "okay";
+};
+
+&vin13 {
+	status = "okay";
+};
+
+&vin14 {
+	status = "okay";
+};
+
+&vin15 {
+	status = "okay";
+};
-- 
2.50.0


