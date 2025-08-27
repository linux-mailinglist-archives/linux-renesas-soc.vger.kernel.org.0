Return-Path: <linux-renesas-soc+bounces-21000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2027B38E30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 00:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 986567B8EF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 22:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDBC3128AD;
	Wed, 27 Aug 2025 22:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="F6AGq3rc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b1jQz3Ae"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5B72594B4;
	Wed, 27 Aug 2025 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332911; cv=none; b=cZdXHaGbyaSjmWd8VQbhDykHSbLWzlkdCzs3MWl2rESpEoAaQX5JQZVpJDJ1poM3JC2Scnw2whs7nO/vtoMPaxtTA5IaIt+bB3pYaI/DXeE3wjotLVaGEviAfdK4+sfBK1CvGOsLwcS7eSQPo3pqRroFbMN7pvPXNzRpmRGOmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332911; c=relaxed/simple;
	bh=zZ277nk+Lt5Au25bhyAxpR3ravlnhuZZU7jmUvg0/wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMWUrxr8Xvlh0oSSVIAwBfXWZphwKVFPTk5/VQZjsI/S6WeS+vNWYI6pFA8Kw+EF7GcBvnZNC47wdKolRNPuc8BJwNiUxUtTaNBfQMbcOL9VHCymVfWQa2vgYbSpgEGSjBDhtVSwXX9OEVRGlJqVjB6mHpGtuiXQ58hngCpv7RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=F6AGq3rc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b1jQz3Ae; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 806F97A01BC;
	Wed, 27 Aug 2025 18:15:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 27 Aug 2025 18:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756332908;
	 x=1756419308; bh=NbK/n3WxdMYceq6/hWsdCg/Vy3y32J14TJLLz7KNP2Y=; b=
	F6AGq3rchnsq8qMepzLOfWPKJ8Jlal95iuI5TPqDy7htMk34ZyGGBEX0yJe9E4cq
	rLBow1SMvPzMjYqsY3dp6NjEKVtyNRu2qaczytFyiNPkc4bnX6vU7JEIMORXfg1d
	JVTayW4jdnO7DwwhgpVMESqEAymIp4yul9ZBE3VaUSb9oUoVT12n5rjLtGFLRsAc
	yRJf/0jaAuAMGrjYaDAtersiC48HrKdKNg8mbeNjzQuH8YL/A/XkRL1bMCorPtWA
	aPuc/Sfgj/qnj8PNe1AdI6arW8gHmZeu0DJlvLa9GtWJxCktu2BAlpgRm/W11cLr
	VGp1Lyjajk1lp4urXdnvnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756332908; x=
	1756419308; bh=NbK/n3WxdMYceq6/hWsdCg/Vy3y32J14TJLLz7KNP2Y=; b=b
	1jQz3AeyyWSpxRIl8/dWUpDY9n3JB4esObAiaC21dgurdQMbsPyxEK/q2jRf1BPv
	PnSfwo0fqFVYbHkLAHA42/EbFKUhvv5uTv5O6kEMrQ/8IvVWAn8EJnVLKbRpsFzp
	+1QcpXCLiOEeNpAqB+eOkfCfQ7PO3IaAJ1aJdMB8MEyDundC+orplt4i+Niz+CrH
	1swviqppNPmQFE4OQKC0uj1KdJrcXAnmMYdG+jENMAyi+3nhOhq7+IakwTHoE9TT
	CA5G/MHd3p7us+AkhcoTgk9R4oNXTG0ggL9WTRUFATLexouPVq9z4DSDefCSNfa+
	eJJJGaKnRTUIHfaMuc52A==
X-ME-Sender: <xms:bIOvaDP8f3w5s-tidOouc2soPTQass_geZzPV4qD_gUPzhErH3iLzg>
    <xme:bIOvaIljmDlHanXYu2unINfyq4U4cbVZWZ2jJEcUDqeRbzB5_L_Urn7z4v0Eij_2I
    yhw_IP_Pc61Z_YUtKE>
X-ME-Received: <xmr:bIOvaIQtPRFVKvLdfj_p8GCyURGhIcb22AASYDIhIx9dHuVZontSpWE2Uh8kLnn12DkDyruT_iFZ649ioes0mBKWOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeelfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
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
X-ME-Proxy: <xmx:bIOvaHX1p4Ra3cajBGpDOolbDnaFiu4j7F6EQFgBqjhn8eU2KxAD-A>
    <xmx:bIOvaMKHspdj2jG8L64hfHj_-vvwvWM4ooNOPBWZFwIoWMM8TpSNYg>
    <xmx:bIOvaH1SetOBW12SCzQaSfzWQ3PINEmWXVhGhceO-Uy_jIWS4I2uAw>
    <xmx:bIOvaJJu4pLziPfIke8Y1IBy2DmE_a7P_KdWHEJ4gJcJii2dN7gkVg>
    <xmx:bIOvaE7t985RhRgU2qqjU4BW23Lt6lf-fAaSJK4CC9bqAOCrz6LE1_KD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Aug 2025 18:15:07 -0400 (EDT)
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
Subject: [PATCH v4 4/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2
Date: Thu, 28 Aug 2025 00:14:24 +0200
Message-ID: <20250827221424.640770-5-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX462 camera sensor to the J2 connector.
The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI41 Rx to be enabled to process images from the
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
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 117 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 30a57e904d0a..44c752d2f5f4 100644
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
index 000000000000..41e254fdba67
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
+	clk_cam_j2: clk_cam_j2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <37125000>;
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


