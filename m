Return-Path: <linux-renesas-soc+bounces-11106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99E9E9577
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 14:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE85E2823C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EF21E9B16;
	Mon,  9 Dec 2024 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="e+2aXIz7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cJ8GjBmD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E31E9B0E;
	Mon,  9 Dec 2024 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748949; cv=none; b=KgKyu4nnnIMXNusbUM/0e1ou/G74UVKsZIvaLjMRxoMqq5WUr7lYMBtLVaeAQjx/KMjYnRXBFMYqPWPmJQvzUxikSniR4FoYItXkyLYuXdIVzms3an7bDsnlYKrdjOfeY5E/miktXQ6WIuWEaReuHR4ptSsSQldxCKY2P5gYboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748949; c=relaxed/simple;
	bh=Y/KgiuET6L6wLJa8Ijru5lKHB7sdr7qacBQgIHl3yDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UpX/sJszeeqyr9JzS0uZS7VMegYvWxt9SbESjhYPrCB4vJ92uZEwJHEOctwGe1kjtBjnr9E56CbwQvla/jL7Uj6Ao3SXGwevE1+7MU70CzUo4uFGyq4mr+HIidnYcZ4joGMIwLghjRfNqoeddIkT58rzBCSjYe0WumnG8qtaJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=e+2aXIz7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cJ8GjBmD; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C46D911401EF;
	Mon,  9 Dec 2024 07:55:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 09 Dec 2024 07:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1733748945; x=1733835345; bh=a1
	X31AWrg0Rpsl/F0TCbkQtnCVNs/KiGa0HSpZy41E0=; b=e+2aXIz7IZBkEDxuYW
	VrPbYFQecGg3ehht2Z+lnbu37B+NKVc9Z/aU6x7aEn0F/DQk+a3kxxhwdeUeTAcE
	sXcGUhaRtEYX6JyH7KEwkviP9zlIW3DN1ZUiD9jVZzFfDw/te23CfUIAF4l9geyP
	vckZJya05cdAOZmpp7SWZxieakpGqDSrBfunBHzOUgiGLw8gUNZ3CvvtUFKHlyko
	R0buan/TZTAYQlYyhtIWhHSkT+GPmBcQ3INdD0gdcd+vlS4wnrSETXSlAORas1EK
	UFab6m1Qp0fyRg3MJthk8SNZntg0kzcH01mXWepdyHX6mSYa8IqMz+DoLNvoHtFx
	4pSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1733748945; x=1733835345; bh=a1X31AWrg0Rpsl/F0TCbkQtnCVNs
	/KiGa0HSpZy41E0=; b=cJ8GjBmDDijP6+nz4narh9tA3g7XSFn8sMJ56INgGdwi
	UGCkhwPLtlpX4+PXxot3o0a7RNFrFe+O19Qlxw8Cydd6Y8P/G4hXh8MczlviXd8D
	Y981Q3ktAvQPhBhZwXEVy5EtItWT1ZP4AVFdv4dGViRu+0hgqwXj8yxBU11hQ0po
	irP5K2kMML6llyTODvp/2xtXugJw0uWyAHuT581lwzVou8ewm6msjb+tq/XTuEln
	ZhrhF1ILXaJmAgUpK9ewDMDOxxtYwvsXmnjkvZJy8+Z4CIG1YB43wzazmKGVOsKx
	pwt6QmX+pBGEG/IO1cZCbY1MZYNh6Wxkj2Jz3X2S3w==
X-ME-Sender: <xms:0ehWZ4WkYOdkQHKoGE2I2JWcI1RTIXwKQH2_JJBiHIthkl9pwj-pbQ>
    <xme:0ehWZ8mmh6AJ7WKKUN6y5Fn3jbgT4JeYD0awsYo08s77ych-lpYCB16QNCSJbj99i
    pqPI-elU9sbtbMXu8g>
X-ME-Received: <xmr:0ehWZ8bxRkCf2bcr0cQO62FjyfW1B1YMUiTErFymV6Lq1OgIXbbKcT7I2xpW_WKmF3S5R3NtwoYB4uEXcijjzhtiew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeeigddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfh
    rhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghr
    nhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhl
    rghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtoh
    epjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgr
    shesghhlihguvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvg
    hsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhi
    tggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:0ehWZ3VB2PYvhRrDZStSchuD9sebucBo3PJcB9VIqRYkYIq3B1KJAA>
    <xmx:0ehWZynBAm_pDQhHC0lRJ4YGgKttbxYXwUkjKHepWQ5pKTeJALh-Aw>
    <xmx:0ehWZ8ewad4z0UmGuyd4Ehcx9W1IDVUxMUCoN_mgG7C7kxwWORx2Xw>
    <xmx:0ehWZ0Gg5KMgzt4_1FS4f3f_v-CWgRCVGNkFqvpWMBjdzoPYYnguCw>
    <xmx:0ehWZ0V1PLfJncAWRJqYljU62m3V2a30E7w64nADyJAQvhmm6Tkrf5PH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Dec 2024 07:55:45 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: gray-hawk-single: Add video capture support
Date: Mon,  9 Dec 2024 13:55:04 +0100
Message-ID: <20241209125504.2010984-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Gray-Hawk single board contains two MAX96724 connected to the using
I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
and ISP) that are part of the downstream video capture pipeline.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hi Geert,

Part of this work was part of a series adding this as a separate DTSI
file. Per your suggestion this have been reworked to be directly
recorded in the single DTS file. If we ever add support for the multiple
board setup this can be reworked with the rest of things that would need
to be refactored.

All bindings and driver changes are already upstream and this is the
only missing piece to enable capture on V4M.
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 58eabcc7e0e0..df20f1f6d3c8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -30,6 +30,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 #include "r8a779h0.dtsi"
 
@@ -205,6 +206,46 @@ channel1 {
 	};
 };
 
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
+				remote-endpoint = <&max96724_out0>;
+			};
+		};
+	};
+};
+
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
+				remote-endpoint = <&max96724_out1>;
+			};
+		};
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -255,6 +296,20 @@ io_expander_a: gpio@20 {
 		#interrupt-cells = <2>;
 	};
 
+	io_expander_b: gpio@21 {
+		compatible = "onnn,pca9654";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	io_expander_c: gpio@22 {
+		compatible = "onnn,pca9654";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	eeprom@50 {
 		compatible = "rohm,br24g01", "atmel,24c01";
 		label = "cpu-board";
@@ -284,6 +339,56 @@ eeprom@53 {
 	};
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gmsl0: gmsl-deserializer@4e {
+		compatible = "maxim,max96724";
+		reg = <0x4e>;
+		enable-gpios = <&io_expander_b 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96724_out0: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+	};
+
+	gmsl1: gmsl-deserializer@4f {
+		compatible = "maxim,max96724";
+		reg = <0x4f>;
+		enable-gpios = <&io_expander_c 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96724_out1: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi41_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
@@ -307,6 +412,14 @@ ak4619_endpoint: endpoint {
 	};
 };
 
+&isp0 {
+	status = "okay";
+};
+
+&isp1 {
+	status = "okay";
+};
+
 &mmc0 {
 	pinctrl-0 = <&mmc_pins>;
 	pinctrl-1 = <&mmc_pins>;
@@ -388,6 +501,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	i2c3_pins: i2c3 {
 		groups = "i2c3";
 		function = "i2c3";
@@ -494,3 +612,67 @@ &scif_clk {
 &scif_clk2 {
 	clock-frequency = <24000000>;
 };
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
2.47.1


