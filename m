Return-Path: <linux-renesas-soc+bounces-21452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B154AB451ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AED125A1A19
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 08:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B5D2FF172;
	Fri,  5 Sep 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lY8qAWqn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ECjP+6qW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A027FB3E;
	Fri,  5 Sep 2025 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061904; cv=none; b=DSRCtep8V+zNBD7LXeHp/v4yk6KaPshEHt/zHcUyPZYO+6DcCqVrloIBPMK2DYRDTRt+t9Z6XBsmwuIQdXAuJJx7iDxSMOnvm7oAyUTPNubVuUEzAueq1pBgrnUjvCqkCIHGdwYNU5FBsje9DwXEOp7c7ZILDo5iOGng6X+cDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061904; c=relaxed/simple;
	bh=7IO9Qz8rcvCzFUUF6oDe/4Pm1Oy6lJyEbhT814suCAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NqHmaonbbx4Xo9OXzdGBYLBNGI7t0hiApldM/Hp4+H/gt3Vkk/QmBsiCqGhhohajEpQZsXgvVBC4oPZx1iY0R1YtZLNK2F+u2LShXPBr4w27EvGMqincnEJiXJKvvrDuvHZe3MXdR33Esv7GxUVdm9L2DGsiKo+lZZr6Q7yRtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lY8qAWqn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ECjP+6qW; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 49926EC0449;
	Fri,  5 Sep 2025 04:45:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 05 Sep 2025 04:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757061902;
	 x=1757148302; bh=6f+SRH3WZBGuGqBHEGDFuNS4gDg7KiwCvrmOuVej9II=; b=
	lY8qAWqnLHGgljJ22PuBlJgcE4Vmk3hmHS/1YEeOZJuFfa3ydaFOrFUnvk9J48F5
	q+fWyYNaQlLHmMSS6oMnOq4T0qgVAh8wi3+jahCXDH/bgpFLr+zaEauLEo9rGWdv
	HwR6BWP8aUZylqShQoTczzlX+xARKDzrhOSqcFT/R/8cEvdfUb+AlFo1HWWqd+2l
	1JXNExpnvZ/nmvaZkAF4ZWYTlylxPHzYfBEP68SJyL/FzZn4QLHtgrUkZTMm1lMm
	DjWzfppNWYd4BZ/4B3Deu14gNTblCCkM+GXeGCsA2sbCfzW0bfOzvLIXfOnUIHpT
	nO2tQgr7SoNls3lw+tsLPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757061902; x=
	1757148302; bh=6f+SRH3WZBGuGqBHEGDFuNS4gDg7KiwCvrmOuVej9II=; b=E
	CjP+6qWNnDIOMh0Df0/yWz5WBAwoW6gAoVFjLOjuvKsY7GaTgeSpewlRYYJlI3cF
	bq60jmCYgcaxb/bJyKWryy7KzyEocb3A9GVe6CB9nBbknCfLbjvwuBkTQ+g6Fi5J
	syXY25qo9RcGf4ab3UIQNUXs8L9y9K6od0C4sMzjHtjtDsgz5xNsIRZOg4Pu6goo
	TMyAbq+G/Hvj6+QqgSbqe0dCsXqi3BqIwS/2hAtlX+k4wuxQnwRGH5tesqueRzYU
	RdZTlcMoqVenv/OZ/bdf7XcNEbRuwDvIILzg9exWLrO6Mo+iL+6AWeoweMZV7I4M
	ddzBj2KV5+7FaFq60dp/g==
X-ME-Sender: <xms:DaO6aLe2PgULQnk8kLtfWqs2tuvimfz7bAV8ZwCgM5uJwUgp_NZPyw>
    <xme:DaO6aL1lEDj4g3Ebydcv9ampX0qYE4uH_T7Aec54t1ejbDwB8r-Vhu_kySOGd4dsj
    RMHd9M4jmH9jBc2f34>
X-ME-Received: <xmr:DaO6aKjVQFysIhBDF-1yoBHQjjSs8d98-f7BHTm0HbgrFCA25QLzkN4STMC_a18vL_UPcv0USlxmuDSvt3Q78O5sLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefh
    heegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
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
X-ME-Proxy: <xmx:DaO6aMnkdvfNY4aAXLS-_jA4Q2BBI9X-bYCKQYN2gp9bz3EbpUK8eQ>
    <xmx:DaO6aIbmQ96jyaqdBKYemGFp4EYBJxqbdxVzpZwzzzvbV6PzULjVsA>
    <xmx:DaO6aPHDM89aXH2sgTAsMjBt5XQF-FeccEmgnlkdHL99gBk86NWvCg>
    <xmx:DaO6aPb0tYs8wphtOVr3SpXnNa-HytFakf7UMda4D-GuHnvrin-I3g>
    <xmx:DqO6aF1b9Ydj1roV7pJOWMQ2MvtT6pEZ2aLw0g7WXeCC8mVZLSIkAoIm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 04:45:01 -0400 (EDT)
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
Subject: [PATCH v5 2/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
Date: Fri,  5 Sep 2025 10:40:48 +0200
Message-ID: <20250905084050.310651-3-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX219 camera sensor to the J2 connector.
The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI41 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- Fix order of entries in Makefile.
- Use - instead of _ in node names.
- Rename regulator from reg_cam_j2 to cam-J2.

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
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 116 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 82656bce02e9..8a5302b0412e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -99,6 +99,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
+r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
new file mode 100644
index 000000000000..0388c27100aa
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for an IMX219 camera sensor in connector J2 on R-Car V4H
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
+		clock-frequency = <24000000>;
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
+	cam@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_cam_j2>;
+
+		VANA-supply = <&reg_cam_j2>;
+		VDIG-supply = <&reg_cam_j2>;
+		VDDL-supply = <&reg_cam_j2>;
+
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			imx219_j2_out: endpoint {
+				clock-noncontinuous;
+				link-frequencies = /bits/ 64 <456000000>;
+				data-lanes = <1 2>;
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
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx219_j2_out>;
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


