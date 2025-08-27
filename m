Return-Path: <linux-renesas-soc+bounces-20997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8320B38E46
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 00:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976305E1948
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 22:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38593112C1;
	Wed, 27 Aug 2025 22:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WcGWpD3O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iztUtQJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F130F956;
	Wed, 27 Aug 2025 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332904; cv=none; b=j3qFSploW/6U72kw8EP42g4uU5Z6TZt0hRF+UEgiEy2zV1FGh3elkJhL5Jfi/NLeO4DDeiF1sI3GSFS1dpWhm9umPLgVSqrscPXzY3QxE2lhSVWW4cAAq+Q6Gb+2/05JUFcV+HBsJDEW/Tt88EF9Vrb0RjQvt68Yv0ctWnF311Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332904; c=relaxed/simple;
	bh=iHYte9KVbSPJcEpQSSlC/WtVUjz1s1vRex2Y3zltlLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFPpmgoGnQsg0JrFHl3vCXEiBanE9I3TjUJNKrWBA8dqVNO09sdUxM5IuIBdb9VU+thjle9kPojVBvHyM9dy6k3dAn1legpfYWySc+Vwp4JBnyn3c1mjIGTdyWx2qt/9/8Cu1xXXZOV7LxFiysZn9h9oVaOm+RQhFiZYRyy3RBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WcGWpD3O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iztUtQJy; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id AA9BA1D0014C;
	Wed, 27 Aug 2025 18:15:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 27 Aug 2025 18:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756332900;
	 x=1756419300; bh=/Lhiaw6Kk4//psITt6A9cR1pbSIbq8xnpDwvo6pJxfM=; b=
	WcGWpD3OGC0Y7AtOEM9El1Y5kO8WL9O7IDTYUSKGwjAqpxcEn7tY+KfO72f3fqIX
	YhZZ/l5qA0JTzRxfg8wJxRyoPuvRhVU84yrHOCvs27bTbilVMHYDt9RvRvxxdNgd
	mf6yZfZzNNB4Wk4RBXhqXsBF/eabpRzHv/sFn0Wn84ACrDNZLueXmfsRKUeljIXk
	lNCUTgtFWPFo+fWiWmir9GBpDdnQPBh9pJE1r1Iz/y9WlVhwz2GVhfU0vOd1kH85
	3LYbifhtJM8dxC5c2FxIGZAsYTZwJpBFef1ZzDnlc+gMMByoUqTqjP2/R4wln30H
	J4AsktapuORw2L2QWc5fiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756332900; x=
	1756419300; bh=/Lhiaw6Kk4//psITt6A9cR1pbSIbq8xnpDwvo6pJxfM=; b=i
	ztUtQJycf+bNi8yUJQFK55uIww8HmnnxU5mTnUZjkzJFTCdaGCDl31KMf3uxWkGB
	GOVG9hMi/mK5foTA5IdamMI1rQ57zogbMrpXUb7UX19Cb0Ha4gdSn/4WvosrMLSY
	46wABqsUCD2aFSGpl+yfxS7tDHywyFkt59/H73r04qr+5FyCrlmmW3o5CrLgtiJa
	AQeirTug9wlsNYKUZbARGSWt1NqWQswS70s+FFfLSRa4krBqJEqzZNQVUj5kVqOj
	HsElM/oODeTl0Cggmx7o9DXPzRlj4SBEB0d0fcWpHGUQj1bwENimZuU5aTJANVDc
	z3/XIM8OiC3Rugou9TIWA==
X-ME-Sender: <xms:ZIOvaKyjoLIhLKWvSEjZypnssxsqHHNLigLiRaMlGTBGC_YzqHNXCw>
    <xme:ZIOvaA5ogu3JMzXLxIxGfglTzKPu_EHSyuMCf4ttx1XKDsdagZSxrC83n4MKmLbnv
    UsKQt9z1SwUr8jcqng>
X-ME-Received: <xmr:ZIOvaCWYjGyEYuPaSj8XC5SX-o9wRoIiPt7wY5djnsJXvbemTV8K8r7maVWw4UugnpsSnRfF3EzRIqAQuAjqXF83wA>
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
X-ME-Proxy: <xmx:ZIOvaAICsanxll6-9F0_69DFTiijh1C4d40tfIao13Vam2HNljxhxw>
    <xmx:ZIOvaMuNz1WcROy3IqB3kKRIaINhC7AihjeMU1RvdrVeDlkBokNnDQ>
    <xmx:ZIOvaFL6jTcHAE2LEo9j6QgGJgEEks70RaIuzY5l7hOQn94qpBZ7PQ>
    <xmx:ZIOvaENCZkZzUsnpX8SXY7rbVl6pJG096jVtLxwn7RUBqdTG-3buiw>
    <xmx:ZIOvaKb8rahKFYHPqIAsw81GZE49lScen9rFATXVoGiJYe0Pp5pJ5NXt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Aug 2025 18:14:59 -0400 (EDT)
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
Subject: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
Date: Thu, 28 Aug 2025 00:14:21 +0200
Message-ID: <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX219 camera sensor to the J1 connector.
The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI40 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- Use correct port@0 instead of port.

* Changes since v2
- Use the same regulator for all three supplies.
- Drop 'status = "okay"' property for the fixed clock.
- Drop 'status = "okay"' property for the sensor node.
- Drop unused label for sensor node.

* Changes since v1
- Drop 'status = "okay"' property for the fixed regulators.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 116 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d8c923762466..37ed7194e500 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
+r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
new file mode 100644
index 000000000000..cbec7f51f03b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for an IMX219 camera sensor in connector J1 on R-Car V4H
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
+	cam@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_cam_j1>;
+
+		VANA-supply = <&reg_cam_j1>;
+		VDIG-supply = <&reg_cam_j1>;
+		VDDL-supply = <&reg_cam_j1>;
+
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			imx219_j1_out: endpoint {
+				clock-noncontinuous;
+				link-frequencies = /bits/ 64 <456000000>;
+				data-lanes = <1 2>;
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
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx219_j1_out>;
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


