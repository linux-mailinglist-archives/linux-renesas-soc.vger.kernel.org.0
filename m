Return-Path: <linux-renesas-soc+bounces-20999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD54B38E47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 00:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E003A26D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 22:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DEE30F92D;
	Wed, 27 Aug 2025 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J48xI5VY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wig5osrg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416F73128AF;
	Wed, 27 Aug 2025 22:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332909; cv=none; b=kE93ht5SBr1PYrcluZAJQ9VP65pV6R3dP6mnPxz9tb+Pue/ShRo+RjbD/+yvpuGW6VZZk/mFu5zmFvOMitRF7PsEG4k9yAHT8bb5b/Hs9DSBLSpW2ksJ0ckHBotSIxZ5OPzJuWxprqKuFpzQcITTCTk+Qb3Rp1zg+4oPt+u+pZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332909; c=relaxed/simple;
	bh=7R9b3FtivWF2XS11UU6X7ESv7JN1s77AzbAnFuzZKS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jnmxt3sDdvMuY5ni8tsMRd+4EHCA++QBz5peDAQ6EKVQg86LQjL9lS0FsmV4xPx+vT7iVuInxXolt6YzNfGclPEP3E1pszkTmDBwwoEXUWWwcKFW1JYupk7dprfyzAs9rQxUE8uxq2NvuxQe8vCmWUV1fXyagK1NeXk57sYMF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J48xI5VY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wig5osrg; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2F64F7A01A9;
	Wed, 27 Aug 2025 18:15:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 27 Aug 2025 18:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756332906;
	 x=1756419306; bh=i/oN/KG49ykNSUq6qGiaLpOoD6vFD0O9MjLpcRovb98=; b=
	J48xI5VYHkY6mwc/uZp2PaslHP/vZ0XRIJOORbnSQen5PkhZlRmYCLRegx67igOP
	qQtsEQOuozyTRGktozF2xyUAd1YGUhIDAm973QZdovmcqOR3k8uZrFCLuBkTWaGd
	ggGqUYZW8G5yEOyf1hb1FP/HXleekzpT68KfbKhaFYvx8nBXNWC2JEMb9D2kvVcP
	BZnHgiY3zcy4b4RID2rz/zS+Kmx8RXj6BwdLvcwSF0i5YLYG5V2podczUDZeuQxw
	yYJLdPD5n49Y4UcCVqUUNCV7yTRSRN3lipXj+Q/SqWCkRSMsxoc5b/sGZRr5Pspp
	q6qflx7SpNpxsTaCrWDZGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756332906; x=
	1756419306; bh=i/oN/KG49ykNSUq6qGiaLpOoD6vFD0O9MjLpcRovb98=; b=W
	ig5osrgdyaMlyHYt1B9MbT3DoHWAL5rfG4lg86Mcd5eVB61xP1LAanqxKOiMJXO+
	XJXT4LTgicF83NwfkYXoeVEjZDyh0UGucSq1TcsMmGZ6QwlQjtZq9qOuExjdGTTl
	eMfiE0MAQKSv80jEYNKwM79QXC52T5DrWbZfJyXZIMCrT43xMSZsn0w7SG1iiP+S
	usT468Mws9kgiey/1y5dyyMd3Muv1e6/K2eWDwKjn6ljOYtxw4AeyxXuqW/aDVq4
	/chWBm776jouxMVz+cNbnK2BieFDjfkuby7pfdHXxF1zc2NTI9N538FyJntZlFGZ
	rNtZvSpm3y6W2hJRGWnwA==
X-ME-Sender: <xms:aYOvaG_gxiNc-wqOddgVlW2gCiJKrxRPLxDPwRP0r3h4zOfIBPdnrg>
    <xme:aYOvaBV5JZNtzY6K1WvqlJSDYEoC-m71zyyWW4BTSefOUaS-6QvcAr2IS-pUUdmtz
    X-ev6a2Oc7fy-SKPUc>
X-ME-Received: <xmr:aYOvaCAiuzhLsqRYlNhGPwpiTbO-GbBgrcrubOqNNDKd8RIw4xrzm7quY7DT6DzpDbmU-YhCdr6mQXt-IzDQ1Jb7mQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeelfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdr
    sggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrsh
    esmhgrihhlsghogidrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnh
    gvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghv
    ihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:aYOvaOFD3UZiACu86ObrLPSol9_jEE-YXBNkH6qODv8j8Ka46aqLgg>
    <xmx:aYOvaL7zaSD5naHCG8_Ehm2Qgj8Y8oTklXkyZQ0MaEVvS9jiFKaQfQ>
    <xmx:aYOvaMm05-iUYlZl4QJUUrgjfKJX7tB3fX-yZmaQdyC39V2HCN7OlQ>
    <xmx:aYOvaO6Q1X76u6WO2bGuBpeXV9p9yjTXiHHmxaoRi4iiCUBRIPG9Gg>
    <xmx:aoOvaPUXfql_qRSTy0V7kW0lwu6T6E16WNbUK_039mUb4mh23sVR-qjF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Aug 2025 18:15:05 -0400 (EDT)
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
Subject: [PATCH v4 3/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
Date: Thu, 28 Aug 2025 00:14:23 +0200
Message-ID: <20250827221424.640770-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
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
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 117 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 914f8ae8381d..30a57e904d0a 100644
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
index 000000000000..c710dc0c10b9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
@@ -0,0 +1,117 @@
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
+		clock-frequency = <37125000>;
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
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
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
2.51.0


