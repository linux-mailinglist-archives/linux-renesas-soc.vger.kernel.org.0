Return-Path: <linux-renesas-soc+bounces-21454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA90B451F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98C45A1FF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 08:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76FC3002B2;
	Fri,  5 Sep 2025 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NXQm03vk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T/UQ6MCv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035FC301009;
	Fri,  5 Sep 2025 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061908; cv=none; b=dtJhsnnfaUp7OMSTlFz3RKSt5rOTQXncY1k4rfaK1UHcDyrr27R1/A20JLV172yBxMtXtjLI3wbI/6YegiRoe0SRw7RrKLltRbfqdC6fBBbwM9kNzWaVBi9jvbp5yrOgm9hZzfEjCjRrBXAJHME0aEtK5Mij2pPodUtE8MwY+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061908; c=relaxed/simple;
	bh=GBYy41rHSXWW6lIeaUTqwDcAWDB/PNAXx1yhe2i37QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckUYyly0fWA9Vj2i+31/WLJ9CcTgrdZlk6mOYgd2M97jCsDEvezTd0ueomYZqTIvGnptcYJgepmxw6PZWtur5Tqyf+zyKz6BwUrzZwLQKhyWjmfzri5IWwtcVgXVOnrdYpMP7zOZTOqgj0cG6gWVnm019MI8PkkM5ipGiyDSFrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NXQm03vk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T/UQ6MCv; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 14773EC0123;
	Fri,  5 Sep 2025 04:45:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 05 Sep 2025 04:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757061906;
	 x=1757148306; bh=K8MjXf43k36eIJeDQbojmV56ihDGDnGTPmM02X45mNY=; b=
	NXQm03vkhIcvYUhTNnA83nEOJa/Aj9wzw7LmPXZv+beDRoPi6m6lvMKgXMz/qo5t
	jAfIwzCVe0+ehc2ca1Cz4aYvSta2Y1Ix1RWYxxMGnjvHMyEPoGyt8JGnaDVWxZDR
	X12weybtHkcfYH6PcLZ0sQEfpTsra+hauqOzGhXkmcNlP8235xZ/as0jJ+b92tbH
	+lhHfaUsvHba6ilyULWA/5XyUiNsrxD3PaBpGMjVwN7qI65c5wSGSfJN97r9P9sP
	U9PN4WSamYWCXtmkpdugCQeIznvh82vsSm++gvCec+xQTfWOLR3xZSc90lTft35o
	Pu+HOjgEb4A85+NhLPQJ0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757061906; x=
	1757148306; bh=K8MjXf43k36eIJeDQbojmV56ihDGDnGTPmM02X45mNY=; b=T
	/UQ6MCvU8J//au52fDizye7k/49+3tsDKDuzLDOt99IgVdd+ZDmhRoJa+J9RdWLD
	TW2f/qfuMbWHm+lmXlenNQj2090461dopa+LdUxNill05Rr9qSIFrglawNe+ucBM
	AwuYKw2nxivu4aNAUmdVAm4wtuoE/DMZiJ73ZC+azxZu4XuI7yEYMtMSkhk9m6u0
	0dwnLFqZ59T/iZ7B5DEodYC1hPu7SLNl6k2ebWSb4v1ugS4Duvs1HuqO08XNrS6D
	fRKx4oXttLy945xEfg6AiVOC5iDg/uCoO4Mv8GdzvH3drIOS9P+AqkIxeTxuyaXj
	fH6Ow6IRfO2wUK4a35uqw==
X-ME-Sender: <xms:EaO6aGAtalH3ZoSfrZ_JkMkG-d169Ff7QLV5vOUXDy0piNSRGIVq-A>
    <xme:EaO6aLLB-aSGUQdDjWxNP4WmgAVCExMbFiyxNBTK7k3OqByKsQ4VWfoyeAh5-K3iE
    nLevkI1UW5--IdPkdk>
X-ME-Received: <xmr:EaO6aPkaF6BnpePbANKkZzhTM-74v3cO3eksi1PBq4ijs8TRkkgVpAohdN15MEVrigar53dWEqJes_JUCrcOJurwrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefh
    heegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiii
    gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmh
    grihhlsghogidrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvsh
    grshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgt
    vghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrsh
    drshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:EaO6aEYupYDE7oUZaUvzVnXjymAurbfVXbC6BtG63Q_4S9gKfvgs3w>
    <xmx:EaO6aL9-OwJI4LhtAINrLzplwOSuL3cDrzBtPCPaEaUmNQUbSF_ldA>
    <xmx:EaO6aDbK7lSuu92ZJjXxsZWXa7r-fpA1vxXpE_uHC_UyX3JwVS5rnA>
    <xmx:EaO6aFeelSF-VEdptyWf7wC-oeWK8HI8d2JUSQuTuakAooE2X-EHXg>
    <xmx:EqO6aCrf4vksi5yoErrQAUATJ1mYNjXEakGXDM51a5-wQ4DxcCizxTWB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 04:45:05 -0400 (EDT)
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
Subject: [PATCH v5 4/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2
Date: Fri,  5 Sep 2025 10:40:50 +0200
Message-ID: <20250905084050.310651-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v4
- Fix order of entries in Makefile.
- Use - instead of _ in node names.
- Rename regulator from reg_cam_j1 to cam-J1.

* Changes since v3
- Use correct port@0 instead of port.
- Fix incorrect clock in clock node.

* Changes since v2
- Use the same regulator for all three supplies.
- Drop 'status = "okay"' property for the fixed clock.
- Drop 'status = "okay"' property for the sensor node.
- Drop unused label for sensor node.

* Changes since v1
- Drop 'status = "okay"' property for the fixed regulators.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 117 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0bd225a92b25..ccdf7aaeca13 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -105,6 +105,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx462.dtbo
+r8a779g3-sparrow-hawk-camera-j2-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx462.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx462.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
new file mode 100644
index 000000000000..6904965f84ef
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
@@ -0,0 +1,117 @@
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
+	clk_cam_j2: clk-cam-j2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <37125000>;
+	};
+
+	/* Page 29 / CSI_IF_CN / J2 */
+	reg_cam_j2: reg-cam-j2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-J2";
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
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
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
2.51.0


