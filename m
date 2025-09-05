Return-Path: <linux-renesas-soc+bounces-21453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0DB451EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44865A0C8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 08:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B586A3002C4;
	Fri,  5 Sep 2025 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="elHemUUL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T5dPdrw9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D52FFDE6;
	Fri,  5 Sep 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061906; cv=none; b=mNd91EgTkjNpABPGmVoXrFutSYXP9b846nExsW5AZIlVMV2YnjH/DvmhIytiGak3IPxZMccICBceHfO6ckBCKbRhv7hF4sYDafJC6NwuKIlhlBJDdFnbBAZv1pTGQyNNEp8500rLYGdfGCKq2RGFTpS63b9H7y0/rS2kHL+pqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061906; c=relaxed/simple;
	bh=a6KWqJcfhb9MsvYI3TBB6IfrMtZ+nkBfYB2IvDifCGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IRRGMdO1O4OCxZt4JsX1dQBe1Dt1SXKuwWWxHrJAVqvh46xsdTa/G2MuKeo1pBTJGUTXRpKLySxOol9LyR3PUyuaQFVqT1XSy9hzQgXnyB123zQFCRO37d4tQ3vgd2lLTUIODqXAyR9Ulx6agyGlxmh4Ev6hVHIvXYvi4DWWVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=elHemUUL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T5dPdrw9; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 2F0D0EC044C;
	Fri,  5 Sep 2025 04:45:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 05 Sep 2025 04:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757061904;
	 x=1757148304; bh=qmL5fReYPk7ymlxBJM/H0ynnpNfNCOyiBFYbVi22gVg=; b=
	elHemUULV7DhfFoaFLYGLTsCV33+ZsbVLSXd6HrPa/4S31TcitYyPMduUylhZvNe
	O019DpZR5WlyvKHRi5dPCON3182KShyWhX5vfQYnTkQh6sU+DBypENCtpLwOQ0xR
	THbxUuYHnkLY3JeyybEEmyEhSvXX1IS7IvxD4QJBWLUSQim2CS8ks20kteu6KaCM
	7UBrvkIykdN/Cemd/JNOYXvEaPx/T03uOKgh84QNu901LdcZ9Gs0OBjP2WS7VNL7
	/hdhgpUP7QtZGDjuqA048y1mYIFk24sRb1Zz+zqtt8miIAX8crWzeT7Qgva44aR3
	lbk0B/7yGaQcaFFJfv1oWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757061904; x=
	1757148304; bh=qmL5fReYPk7ymlxBJM/H0ynnpNfNCOyiBFYbVi22gVg=; b=T
	5dPdrw9HhRdpmB9KF1498ypHMv8CExRVKoPP/AuDRUiVEz3eaUW4PN+wpxAZmmW7
	eAYGrgAc5R4Mv8/Vfn+jCRsPloriSM3214Q9IfV19ZxvgeXeIW2avqdCFsf9V/CQ
	Fxyvl+shlHIj/moo6jiSM3qzSr0K1HL3/LsaFpbeOdHgY61xmXUBfbZ80YSm2/rA
	5YnTZetU2Jz/J9g6bJBl/ATorzcdlS2ieZU/FZi3oOGzfOZ1EN3Yovs37xESXUWJ
	16vdSxem7nKAXOXVvEyr7ubzGuatDIbXpcYSB7KLy+8m6f4xbFEe/rNyIJ6hE8Op
	vi4J7UIGEJ45Kxx/s+Qxw==
X-ME-Sender: <xms:EKO6aAl6SN6lIlU5dWB-eJ8q996apShVPFjjerZJ4aEATWdLxsdrZg>
    <xme:EKO6aKc7TJLNqhyVE2LUxifFmhRaOvndYl8lm0iyoTvtQaHOeLvLP0Dja7OCV7T0V
    xAZOE1yjHeUlCzIQ3k>
X-ME-Received: <xmr:EKO6aEomo6kgok2BKKantRNCa4TizPFObpO6o3ysG5pzi7H5hqOxqEoX71_iJVI-UT23StfjrH1Tg3hhLRZ_FtHKQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:EKO6aMPFHBB1IAb4xs4lZ__1QhDlfNIduHi6IaTwDmHO8V3dzPyHIw>
    <xmx:EKO6aPhMfZfMl1Zs_pIVNdwL_qUXd4BjQ1EjW4GuBnGH8nU4IuXLhg>
    <xmx:EKO6aHvOxot1Yklbnfo_w382ig6t61qSHFMKbP_kQCWphJfL_pOQBg>
    <xmx:EKO6aLhtAVUexeu1MZnh98XnfKc9FKDoPtUT0jJcB4oklTSKMhJzsw>
    <xmx:EKO6aPeQLYKDvpFir1zsKOFh4Sgw84C5gNM1LxXVXysZGR3LaNVEuI7D>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 04:45:03 -0400 (EDT)
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
Subject: [PATCH v5 3/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
Date: Fri,  5 Sep 2025 10:40:49 +0200
Message-ID: <20250905084050.310651-4-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX462 camera sensor to the J1 connector.
The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI40 Rx to be enabled to process images from the
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
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 117 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8a5302b0412e..0bd225a92b25 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -99,6 +99,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
+r8a779g3-sparrow-hawk-camera-j1-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
new file mode 100644
index 000000000000..f9c51f6b1505
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
+	clk_cam_j1: clk-cam-j1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <37125000>;
+	};
+
+	/* Page 29 / CSI_IF_CN / J1 */
+	reg_cam_j1: reg-cam-j1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-J1";
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


