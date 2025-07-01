Return-Path: <linux-renesas-soc+bounces-18959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D00AEF677
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3FAA1C015F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94291272E53;
	Tue,  1 Jul 2025 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="H9KzjrMW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lQhv2Dfs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62F26FA77;
	Tue,  1 Jul 2025 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369200; cv=none; b=MKAhx76n9le0y1xhp3asTxLXxjidSfapHL2ArR8h2qn2bpq6wGIssx7Zz7+fL0fY0MGRAYrrOX1qQyn4M+cdH1NOCOCT38ivhPzWZYSfScwphAKO5q9v9RiObIX2elRg8crphTGDTwUi7l4o2jYef0Z51nsBlO8+kLL+v8wO2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369200; c=relaxed/simple;
	bh=Q36VxANaU5QSz5O821TVqmLPr0daxiXAK0Fj9EYSe/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOqBYIEnQfNDRICJ+VQrSp/dezkrnzC4HFYygz6OZy01F5xuVfDn6LSQtmnyPjYODroEZFUVJzCq4I/TsnwrMBr70wTOoRwSK79mCueUEk7Ul/rEWtBiwrjWohxSjYCRLmrJWYGTeuTllp7zcfDbHVAIs6QjCmScRbLBkA6Wpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=H9KzjrMW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lQhv2Dfs; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B527C140039A;
	Tue,  1 Jul 2025 07:26:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 01 Jul 2025 07:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751369195;
	 x=1751455595; bh=hJSlopwSr2JiOPwykQKvRfaPPAWz5IwRziky/F6F8pE=; b=
	H9KzjrMWPM7sihEc11reIMx8sW2ZIhNOrxxxelA/88ybpApTGmdC/7dgoygajqNz
	jOPuXWLoOQ4LI4oiPwj462ZHstN5MivA7cXkl8mr6a1IOfWMuDn6uTzr/ZM/kMg3
	Nk0X8psPiurEIFPwyAbo9PwmHEtvDceYq9rc+nOk+INQAAYl0XDaGNZhJwEFNMB8
	FsCFNFxqnPZaA4rH3DTMqBSHSqxcUm7uL/HnK8NXDkugqVHy93NrOoYkhirBlbeM
	ZHVm7qtHpfBkWw5pnDpwc9hsfrZGiRFLozNNON1MoeH5oQ7W2GHSTGz2FgqCtBqg
	SBf/WBmLP8AYkEe+OPjUPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751369195; x=
	1751455595; bh=hJSlopwSr2JiOPwykQKvRfaPPAWz5IwRziky/F6F8pE=; b=l
	Qhv2DfsW/umdjkR58Pb5Rc6KJn2owreEU9xH3r13RRH9DOCdQcKhtpNKwUBx44xL
	+Cut2dHP1G+LIdQadW+OdpKMlJs+K7Un08N3g/ZEub8msHTFILaXfMHY5XshW4Ma
	rPYH8sMdsTqAMGzaVwz9159tiJ4wO8EXTWYeknYqNbXDjBLCkNutds6/yQr8EqOX
	5cY3xERgvq6s49fWjzvOM0ONBA8fTQG0Mb3GqPJRMpURUgS6nt7ekliCCt09QDLX
	/M+7LdANNYULtr/44oeYKs2mm36xUCqiej5zh7Q+/Ba0/TxrNzv2dYG+sl4YWDkE
	HXuD0ZHAgtG20QSJa9e1Q==
X-ME-Sender: <xms:68VjaGwiNldT09hYQPgE0AnzEH4aAsSPGX2WSxuYkposZ8br9xS-9A>
    <xme:68VjaCTMf3D6GfUFsBPTfJLETYkIqEu8xcYcI_8ir--sARpEY304jENdwFKMw35No
    ujHrCbFViyW5ml0PrI>
X-ME-Received: <xmr:68VjaIWbYhgHo1fAp1Gn9-JfdpXN75IV9lSfesRTB3F6Xb9CrTOqB7ThvL36dfOU51S7YG-33ho9Vtptnv3_3dEsIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghsse
    hmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:68VjaMghNfPPL-z7YVzftZoQuzNV-CQSxF-Xg4MroEy8XplYerFeYg>
    <xmx:68VjaIDWnBpVFeo1sGqsjhyiJL6fTsRRS_tJjJ5pHUMFq5NwSR8GqA>
    <xmx:68VjaNLwZHwoWDU3aRF-UXSldsWx6BcapUxnRfXvA2KEGBsvPJ2lmQ>
    <xmx:68VjaPDGjDd_fAOiil5WD64uYCb7K6HGfyO078tPk5_urxS0TQLc4A>
    <xmx:68VjaIl2HuVJBhS2tK1WS8ZAuTcGOLclBuhGsJt1PWUmGbZZQx3rg66A>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 07:26:35 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
Date: Tue,  1 Jul 2025 13:26:09 +0200
Message-ID: <20250701112612.3957799-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v1
- Drop 'status = "okay"' property for the fixed regulators.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 118 ++++++++++++++++++
 2 files changed, 121 insertions(+)
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
index 000000000000..a9089d3a4b29
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
@@ -0,0 +1,118 @@
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
+		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_cam_j1_dummy: reg_cam_j1_dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j1_dummy";
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


