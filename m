Return-Path: <linux-renesas-soc+bounces-18890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6FBAECA73
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 23:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BF84174675
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221CA22370F;
	Sat, 28 Jun 2025 21:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XDOCbmgI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AfIPi0lT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75C21CFEF;
	Sat, 28 Jun 2025 21:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751147798; cv=none; b=cD/VsZjfgzNu5EHylwlgp+P/Dp68TC9SL9T4sNlrJk49ps1EOcJdEk7ospk5vXllx00ywRLhyh6R3p9jrDOiqCxjnGe4rSUhU0aP906EHKD3OBsJXDFna9ijIW4/5tCXEPwXlIIoJQP7LgRsqK0nykqH3HTOZbAymonr7JW7asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751147798; c=relaxed/simple;
	bh=U8j3sGTU5IKfHezOfQg0SGbFRbPSyD7pGln4gmzysic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gel6FQh4iDIml4wQJgiE7crKv5pAtoEnbh0btUdkW5KuO1oS7Shh1hT6k7y3uT5txdyuCU/ZvoOfxmFi6e654sCF01CQxk2PU9p/BbMWmTau8+Q7dIHs7Kf575wLnEYjkwUo+XOXXbflJUGKymaFpwNfWTuMxHHs00qNsuTCIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XDOCbmgI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AfIPi0lT; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 558CE1D0000B;
	Sat, 28 Jun 2025 17:56:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 28 Jun 2025 17:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751147795;
	 x=1751234195; bh=s3ywxP6PCA+XZrSqOS+PFT9qVnSFxUZFrPXK+ZHdxQM=; b=
	XDOCbmgIaolpzHMNiI7IzaajpmRe5RwdzgOIgYtilfk78tAdB8ypqXPxaXzIqaNC
	ZiJQ0uj8nNywScGA3HYqha50A0fe+bhzvo0D8mDNgC/LulOvV85zXxV1fsdGJEZC
	CsLDwYN1aWs8p6mDtrQnGt8zBUKEFLQW7wmyfGaeHlQ/Y/DmmsC3Cf0iZs7g/mig
	bfgHOpzTnxFKiQkiVPCHR41UzK9qxPhDHs0mTzlxvXhy2pl57mwk4OK41wqheYlI
	5y/6tyI3rwWtYzcGfpCaSMr+AseASx+dub05bV4GruoBULP4WlkwU7yAzorh12Qw
	6tVwTf2BQekNf5D4NnmZSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751147795; x=
	1751234195; bh=s3ywxP6PCA+XZrSqOS+PFT9qVnSFxUZFrPXK+ZHdxQM=; b=A
	fIPi0lTOVr65FxRvwOoQvlYaivaJD3BcClJ5EqX0AngVW6ksoVf85NbF6i4mJTjM
	ukqGQZHtSz5YEr6ip78fYKseUjlB4fblq2xmSRcqeYE3cignFCxrkRsn7GGcuT5W
	ZlkXx354ixKirKdGXxgZK8Xs2RP28mwiMCyYYmYgHQtZJZfkx4uSSCSSW634+4SH
	ysCVo5j3PICs65bVgkXicDtmiyv1CpAUdsqfVabM/jihIMMKJ55BTYPUTFpf38qB
	euaDAAX+DtJrPQRpGI4HE3VapJMGhs5nnGgGNwGOKl6TQL0iH2YdpAUjxFZpvdUA
	mnq58piSE8rcdFVAo4+lQ==
X-ME-Sender: <xms:EmVgaAMKbYbLnjTr2opo-LM01mE_AXKvlWcnr33M9rnjNL84ounoIw>
    <xme:EmVgaG8RJlDr9VsAtXxIYqgsQxfRLxH_2VHnj0TwXMbNSrRRaVtbkJo3lv26oUuR0
    hkrITKlb1cYfTHUJag>
X-ME-Received: <xmr:EmVgaHR-k5-2BZzu0NZeixk30JI3GtRipGIdQAkWkOxUxc2Kxd-qyrpUXYJp3_d2-a3iLtBTWePt0D1vJwblI6hpAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefh
    heegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmh
    grihhlsghogidrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgt
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:EmVgaIt7POWSWO7KDhBiGY_kVfnXt4mBX887x8-OU55VfyZkHJtInA>
    <xmx:EmVgaIdAJ5zeTin_CEBQz-zGVQPv1EkfAie67C2oZAv2xmyf35wcSQ>
    <xmx:EmVgaM1fCtChPYZQWNQdZHcsDTf9-gx6h-xY9GCn6Jm7ONwudAy6Mw>
    <xmx:EmVgaM-JFnBmWi0flKG286IFn2KdU-ztR4utyuIuKonWTyC8shJUKA>
    <xmx:E2VgaKBkHrEzmXAQmMznI_dv594hHetpPQOcYtHHCCNabGM95As2qtMy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 17:56:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2
Date: Sat, 28 Jun 2025 23:53:37 +0200
Message-ID: <20250628215337.1688969-6-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX462 camera sensor to the J2 connector.
The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI41 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 121 ++++++++++++++++++
 2 files changed, 124 insertions(+)
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
index 000000000000..e281f1086988
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
@@ -0,0 +1,121 @@
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
+		status = "okay";
+	};
+
+	/* Page 29 / CSI_IF_CN / J2 */
+	reg_cam_j2: reg_cam_j2 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j2";
+		enable-active-high;
+		status = "okay";
+		gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_cam_j2_dummy: reg_cam_j2_dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j2_dummy";
+		status = "okay";
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx462_j2: imx462@1a {
+		compatible = "sony,imx462lqr";
+		reg = <0x1a>;
+		status = "okay";
+
+		clocks = <&clk_cam_j2>;
+		clock-names = "xclk";
+		clock-frequency = <37125000>;
+
+		vdddo-supply = <&reg_cam_j2>;
+		vdda-supply = <&reg_cam_j2_dummy>;
+		vddd-supply = <&reg_cam_j2_dummy>;
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


