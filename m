Return-Path: <linux-renesas-soc+bounces-18888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C3AECA6E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 23:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E03B91897BCF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35356230BE0;
	Sat, 28 Jun 2025 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iI/rxTRJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i+nM00SL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252321CFEF;
	Sat, 28 Jun 2025 21:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751147791; cv=none; b=oXnRTcqg6f2Jkx37/GPACslgiuTyrpkkTpFJMOxFKRkb5Ch/qycH+Ep4YbtW5iyRjFt01WwjRrYlyVCaS6jCCqnQigvnFNMXTw9bB0rToAq6cycDi3ufSmHqYT9J8vPjOPi+oLZKyUCjoaKV9Bn7ZeeWpc/sNpNL8MWZz8Z8KJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751147791; c=relaxed/simple;
	bh=gn8s4QdjnPeaY459qnZp7StF8+kBwVDEQJzBzJCrmEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFxfdg0DKokTWr3Fd1XehXWMbLDkpcfhCVFj8SLIJdT0nxvVijFcnrKxQAfoUX4K7QJ3Cakd9YrjmfbWDW/sHourdIGZT5sRuJmVaAIbaW71hLryXzgB9oplNQmSNUhW06QTQvI8b81PePc2lxbzykxQyPedE57RUnvCSE/XaCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iI/rxTRJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i+nM00SL; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 54F741D0012B;
	Sat, 28 Jun 2025 17:56:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 28 Jun 2025 17:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751147788;
	 x=1751234188; bh=9JRiyetGE8wTufXGw+tqvIv7EWpu9A0jGe5wTzJ2q+Q=; b=
	iI/rxTRJQ/X0rZMcc6rH4COVV8uGw3S1n+suq70VbMH1py29KF3wtEIxwjUNE1ay
	7yI5JPs5sl7+dXXeEmlAux96jj6lWw/LRt3Is2+KVqY/XB95XQ2kkhWyGba1F838
	IuVw9bHmZKpKi4RNj7MBG+AB/199QJsFSZ0r0MYEsUu8/dl7u0YWU9zcQVLXXzAr
	d3AsyoFYrpX2t/VNIZHm1LZ959KHu7iVB4MA4GV88pdZXfJ2+XCh5tKb2h8NR4d+
	hU8A9cbF3Tx2FRZVHZyDa0gzyB9JQeCyn/JH64+z3HFvW09Sz2rQjJzsBa8fM5Lp
	fQYjWZbFLj80F3KdTzf4Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751147788; x=
	1751234188; bh=9JRiyetGE8wTufXGw+tqvIv7EWpu9A0jGe5wTzJ2q+Q=; b=i
	+nM00SLesuAoMjdC/iIVPymvcgc6na5Z8YTBDAYw44FGtWCDeE/1SJBEhfulA5i1
	kgd2ImYfFVwo6shJ93d8bHo5xPXttkJEXqgTXk3/Pfu5jts889Q5+dQ+3tD+57jJ
	puVgG+PKabtCvJCdZjzupQoPMLNEQILVbAU99yv22rheLP/CAbNfxlcqSB+hMWqY
	wWqt9Y27JNXtICQ1Zc3yIT7AuDjYOmftBbB9b1Q2vBA1NjMVLAXXZJRWzJVRsRv1
	v+Pa/aZvwwnn3BlFq/+9weH58LOWqoqbBesSCUGN1OnPUmPRjFHNk6MWnQSrQdfA
	F/GuEmaBbmVbRk169iztg==
X-ME-Sender: <xms:DGVgaMHXnoA6mkLkWqe4iC_etOvimMbVe8hqfK0EEnIahDz0yYtw0g>
    <xme:DGVgaFVfWwUoFnEOVDyolflXSjcKf89dfoKR4ZAf57c-fGDShjZJQ0cm8CHsLmmlg
    kXYsnYqyZXhUCzCGm4>
X-ME-Received: <xmr:DGVgaGJNSu_epBbQIC7JZ8XXrdjNLaBGEWgB8Od937ZpOYPWTpRzNuymvhJc2tEpj3HKGnco8v0MPzyL2gWUTNc9Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefh
    heegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiii
    gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmh
    grihhlsghogidrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgt
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:DGVgaOFqZDvSlaFDchLsgYwYhBi8PnjxJO6MheYRvgOz_FO-ZwwC1w>
    <xmx:DGVgaCVsd2MCx1biFIY4xXTKRXo-XDBf6nNpXMMM1sk_8hY9D7OzSg>
    <xmx:DGVgaBPmBO79rWli3cNlwI-jiCb50fIvF1y8yXMwci4WxcubHpOi-w>
    <xmx:DGVgaJ2Z7MQ4E_l2-tq9MpTMILZ1GKKUNY5nTk7Nlrexp_YuiwMnjQ>
    <xmx:DGVgaF7XJXq7VaaBgCyeacM7nb3TBbHxRyDWsE0kIDLbd5toQadPIblx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 17:56:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
Date: Sat, 28 Jun 2025 23:53:34 +0200
Message-ID: <20250628215337.1688969-3-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX219 camera sensor to the J1 connector.
The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI40 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 120 ++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 47e46ef99d36..73218f7ec9af 100644
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
index 000000000000..b693bc4c6b55
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
@@ -0,0 +1,120 @@
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
+	imx219_j1: imx219@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		status = "okay";
+
+		clocks = <&clk_cam_j1>;
+
+		VANA-supply = <&reg_cam_j1>;
+		VDIG-supply = <&reg_cam_j1_dummy>;
+		VDDL-supply = <&reg_cam_j1_dummy>;
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
+		port {
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
2.50.0


