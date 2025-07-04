Return-Path: <linux-renesas-soc+bounces-19206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E946AF8F7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 12:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8C916A12C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15C2EE99A;
	Fri,  4 Jul 2025 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pCox1wdl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G7qvNZzn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7D2BEC23;
	Fri,  4 Jul 2025 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623729; cv=none; b=JyieyvTF2QVpzWkT4CT52GkF7WzaGyZATZCBMVmhhvo2TcgJBEvx909NXM2cPuHUcqEumfoq/LsjfO1NOT/Wg25a1YIGaA+Bq6nifhKtu6ONF82MCxyQd8CrHRMITg5pJpoenWWcRlmy0/J4Tpm+4IUviT9SMXK2i3SaHxqSPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623729; c=relaxed/simple;
	bh=/dlE0+qKO+285xukCmc2exTdH8zZUvBvtgHZDhbRRPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQ0jgcaIKkuOYVzDHWZghDELo+zk8DCOFaxOWjNFnLSXYaVm7bS/f1bkLEv4HB044MeJBMIKnC5hynCFa7pbkf4Q+Mpb8I4DhqTpyAsgOjiz97pDfA+w+SPavZQM8G8j6CqiQy4PdsB/nv0o28Kf2sQUlJ3/t+6WWFklEMQy1Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pCox1wdl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G7qvNZzn; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F2D007A01A0;
	Fri,  4 Jul 2025 06:08:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 04 Jul 2025 06:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751623726;
	 x=1751710126; bh=nZ1QJ2BD1dbadGIUywXSpbnRO79FGq6iVUMcZxXgJ0c=; b=
	pCox1wdlq0P6lJIcOOgAaDXn43GZ71V3RKW/wFfAOBrVwGTjcmg9GbsJfxDLJtix
	6N1AaCtgQLmGK8fTkhfi2xvekq7XTizlkkZown6rkNyX2JUuJ7gutcyPHvS6CKCL
	CntfVWtFF8J12SC0s8/WbmcpFMfdxKhQ8vCaWJATJOEMsVn9Ct4JLg/PwjmXYC6W
	5lEbIjrlMv1MyNA/awTHhAHtousuJ4vAQuRUiiepmasNFMzDVe+Sd9gumWzyGWdW
	4LC6diWtCJEpXzcBY924yj58cwR/tRYOn9dSNezmiMh2kBDkhaB31hT0kl98Xc6j
	vnulrQHL2ELs+CMvO0weNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751623726; x=
	1751710126; bh=nZ1QJ2BD1dbadGIUywXSpbnRO79FGq6iVUMcZxXgJ0c=; b=G
	7qvNZznQIlbN3sh9Jc3Y6xYCt1AUNVgp6qPOPZ4sp+iDT1++vNY3Rf1btJYcmfrF
	Lhay4EWa/sm+zf1lASJXRW3HNUfYbsj9+1P1k/g6RswnflcS8LCbM6y95xRXFAbX
	LLQg7zER69YWJRBNVOi9CsjK4F4yrBiaSSrBWrcvosyfA4xwZp2jKEf8qKBBfcqJ
	qI9xq+4nZejZ3Dxilr+blGv4GIA/qfHZIG83UbJznAJFZK6lfKvBAucN0cur0q7b
	a+JDDOEtrF9UovtM9V5qkyN4GUfleYy8eVTo/D1dCq/UGdN0UZgdn4F1/VmYldcp
	vNeN/2rwFXxKz/7JnQomA==
X-ME-Sender: <xms:LqhnaHXjZhIsmricl_Wjy7cQhBdxbz7exhVSgQXapuUb-4jfOLLLlQ>
    <xme:LqhnaPkS_LPJ1KpK9jucU2qprfEILqiukL7nsdXX8QulDkvkgvSz6znubI4Dav7cr
    KZR-wrF4h7bSyIy2l0>
X-ME-Received: <xmr:LqhnaDYiTH4WuH6EhQX_idzwX5VWT2GV9Wc7DtQj4g9ZqVYFU7s2A2g76YqFCt-MqLPrFzhG2DmNPAyat29Nvp7ATw>
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
X-ME-Proxy: <xmx:LqhnaCWB0s8jS-hQge-c8kILSzG157seWLj7RploLQfc-zHBTXUi5A>
    <xmx:LqhnaBn_B_3YHSVv_56BAuSeakazaLTgRWqcZWYFRnSAyuga2AQNYg>
    <xmx:LqhnaPevikUG5cKtFVtsqnXbfL-MdNzBCv8F-8ta09_fnW63qJZ4TA>
    <xmx:LqhnaLFndhKHIvQEla3yLrr_z4K_4x5ZLYsliLNd-YMlBvlrzt_HPw>
    <xmx:LqhnaO9739aPqk6MMh3NpQP_j9b9SzKHN-1FKAuZkYZl074uBYPlDX6f>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 06:08:46 -0400 (EDT)
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
Subject: [PATCH v3 4/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
Date: Fri,  4 Jul 2025 12:07:33 +0200
Message-ID: <20250704100734.3387856-5-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX462 camera sensor to the J1 connector.
The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI40 Rx to be enabled to process images from the
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
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 112 ++++++++++++++++++
 2 files changed, 115 insertions(+)
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
index 000000000000..63813ed216db
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
@@ -0,0 +1,112 @@
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
+	};
+
+	/* Page 29 / CSI_IF_CN / J1 */
+	reg_cam_j1: reg_cam_j1 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j1";
+		enable-active-high;
+		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	cam@1a {
+		compatible = "sony,imx462lqr";
+		reg = <0x1a>;
+
+		clocks = <&clk_cam_j1>;
+		clock-names = "xclk";
+		clock-frequency = <37125000>;
+
+		vdddo-supply = <&reg_cam_j1>;
+		vdda-supply = <&reg_cam_j1>;
+		vddd-supply = <&reg_cam_j1>;
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


