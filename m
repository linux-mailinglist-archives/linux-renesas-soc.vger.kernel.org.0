Return-Path: <linux-renesas-soc+bounces-18889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87848AECA6F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 23:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9BD1897EDC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A136220F32;
	Sat, 28 Jun 2025 21:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qs8dD67X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kjSjj5fS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508F21CFEF;
	Sat, 28 Jun 2025 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751147794; cv=none; b=E+cYYvX1+lTko2NPzeY89J/evrjAdH9Qk3S24tJT0WERCNze1xdKS7YFFkIgx7j8uwPuqxT8x5cEAiTR14xS/tQLC79q9eMTZj+diGfscnxDrBBN9Y6H0bOucquWowwZZXpH+zdPza3jYLB5b+KKIN1jXs2rZ/sBTS8mRaYs7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751147794; c=relaxed/simple;
	bh=BebtlX6pqrxrC/svPDKvcpyUs2sLe9w7dhnY0NSsp/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cwDB9lTNbX6E4kGHXHGF/Pjt1dt37SxrV2T2Y+m4SD1Q/TSmlzZu576pBsJW/CHlxXiK/bs8jiQbb/2NaEIvmsGreZEzmkbIVWKHoaJaHXTo2qb3Rms9yx4fMk045jqoSKg1SsuX2ydd+8jS8Vds/5YOEj+VJ9vZIZ8uM6mKz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qs8dD67X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kjSjj5fS; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 9B3711D00126;
	Sat, 28 Jun 2025 17:56:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sat, 28 Jun 2025 17:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751147790;
	 x=1751234190; bh=5CiarZ6ocepapQ6+yznzLiianj//bnE4yp7NIAJW5+M=; b=
	Qs8dD67XpCf0/mJbIrq43ZcLU17YrtP2zIL/8Wx6UMXr40f+peiVhaH13FKAJGdM
	JgF0CHyyVfZ5H5znEFH0IX08/kiQOOWWjJ6KA5xh7mlMW0IrkX4BcEoTY1FzPlzL
	8zSRrtZjJN51ukLpoE1sO8oncuTAQtOSD68mRu82idrWsR/Yrcjh6xEVw3LF1R7N
	7T5xncvn9JKxNjNEvf8zwE5pwiK0iILyKtWQemvUyOW32oi6goKbCdMYOOLp8mQ2
	lwjU1/g6WHFiFF68+d61mJyP2yNJcveDUk1G9T6dbtQxZpUsEDXJTagxtYkUrjaL
	7jQxrcp/uVVWfSeNy6bY4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751147790; x=
	1751234190; bh=5CiarZ6ocepapQ6+yznzLiianj//bnE4yp7NIAJW5+M=; b=k
	jSjj5fSUdhIGcjyiGxrBZjxXyrDeMadL1BfZFyg2YKjx8jU9DjyR0WIHd5HI0aD0
	M41KswBqeMeeiGiYqK4uVr0NpcU3epCDNVVFv3SzLXrng6J2W+735+ULvYWGq22j
	VxJMKUOro1S418VMGUfbNFuiyj/DXAM5+FlLgak47R2bRcYezpHUF8oDx11KzDep
	ql0M8clYl2EnpBvsmMyK3K+CiEnUtxPTh3HPA/wuq51hi1N5lhPAnJUfMFIphXFj
	RW2ZyUIWIBBr+x4dNxMbCsBNzMFjtYkXYVcle24w7lJpE8ux0+EAV87TPZ4S5lVV
	A82uaYXanXVoTnZjBqikQ==
X-ME-Sender: <xms:DmVgaN-unXlqW2XNOI0NjPl32YRldMkGWWAtRtuWkwwyxE0uTU_rcQ>
    <xme:DmVgaBvryVK_3zsGFhmv_7MU1uBx2uOvWIasXqMGT7TFHe7GUiZAUCYlPxYjLcUTA
    4CZio8Y2M3ALWYXW8s>
X-ME-Received: <xmr:DmVgaLC0d8euu2n96ii2FVWTM3CV6EOEZ8VHpeMiDA8p_Ox5GF-JKLCRUSTLS-e9vvO05S3S8b93TIVOhYzV1nlYSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:DmVgaBd7cfGSnUtHVY7dduH134k5bclHzdmaSwCWp9Yw6CDMpMFdnA>
    <xmx:DmVgaCPXX2k9kHmcJJZU-wblw9WNRn9FvW2ezB6pCbtrbNPMUZcwrw>
    <xmx:DmVgaDmoQihc6HJQ5WdiVUna_iAn6H2-j3ItOIr8JDCenK2K2rBdLA>
    <xmx:DmVgaMtnrvyGwcQOlX0bUi7UNPWyLa_uBmC9z11TpV_AgmlMDVE81A>
    <xmx:DmVgaONId1-IYt8BF1FlpFwmiQVQ9EBqfcj8_8bo4KdY0ql6cqpVsNb1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 17:56:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
Date: Sat, 28 Jun 2025 23:53:35 +0200
Message-ID: <20250628215337.1688969-4-niklas.soderlund+renesas@ragnatech.se>
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

Add an overlay to connect an IMX219 camera sensor to the J2 connector.
The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI41 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 120 ++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 73218f7ec9af..12803c4fbc80 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -97,9 +97,12 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
+r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
new file mode 100644
index 000000000000..8df2e1f74ade
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
@@ -0,0 +1,120 @@
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
+	imx219_j2: imx219@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		status = "okay";
+
+		clocks = <&clk_cam_j2>;
+
+		VANA-supply = <&reg_cam_j2>;
+		VDIG-supply = <&reg_cam_j2_dummy>;
+		VDDL-supply = <&reg_cam_j2_dummy>;
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
+		port {
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
2.50.0


