Return-Path: <linux-renesas-soc+bounces-10306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B39BCE1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 14:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C4D2835D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 13:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61941D6DB1;
	Tue,  5 Nov 2024 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="M2WP6bu6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BQUXf6ss"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133F1D63F7;
	Tue,  5 Nov 2024 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813964; cv=none; b=ogNF39cSiZ7kNsYv4suYDKdfaFIPRJSTgiO4MAKi5ZwtqfW1ZRcJC9cfWbUMIGP2f0flaWuF5VKF+enuPj1ow9+leJYxkI+FxnSooe6+58fhIYt4WRyz2qjn+EFV4qgpDlpZWJx1kSpljMV2KGLfFz/la8GFrDxAmykH1pseqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813964; c=relaxed/simple;
	bh=3EDNQfEYGiJ+smew+RSXO7WpNpDfFwXGm6vKdkDahZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RI8exFfcEoZR3tB53J02D90dxmpNvih1FKqziga3cBH8wVrE0AOkujxUCD8M/mGa93LKtSkX3hR98pKC1l88c33FlGEJe1C8Q4hqtkPz2EaukjtPermJSaUR6BpaIdyYB71rzygJuR7C/DwF5ebDJ2RkA+TST1S3g/owEGPSI1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=M2WP6bu6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BQUXf6ss; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9F42511401CF;
	Tue,  5 Nov 2024 08:39:21 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 05 Nov 2024 08:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730813961;
	 x=1730900361; bh=RQB24ACyk5pksYp9yKhb0KNTNNqV9sn963bCjJTFKfA=; b=
	M2WP6bu6d51dj3wtr/+iRUKSBXCCzfGcA45dSNp+LR78gFaaeS//wmUNFm3Eou5A
	eV/0dV+JWDlKcWl0Prk1nortF6w6NCAXEj+d8lXEqsJw6TLVWa0HDoxyWGKwOZ6z
	xpdN2Tmg+VeTuMp6qzfFq38cPiS8Gq1IouxBOI9PBVHNk7dnaI4YYWi+HVf7sPbn
	uNwCaQRdmJd/v8tEwRfLs76Gcd2NV7bSF4qXAbRyFBZQO6bpHJM31Xha1h5DSiKo
	vrzNU4V+KS3SRDVa874y+2tZEcIltx8DdDL3Z4KR782Pyv37A7p2X+r4Cd0Ecz2V
	1jClO731PTM8Z6iHMBcUyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730813961; x=
	1730900361; bh=RQB24ACyk5pksYp9yKhb0KNTNNqV9sn963bCjJTFKfA=; b=B
	QUXf6ssuEU++ytxDiLNoSq0vZXFgyLg6c9NMsToVtplC22MNvJOdsvqg5Q898xue
	to5ymtGB0R9Y7AIs0UOVvL9I37n995oWU+aCMeo99tMxLuWTLpI4KZftj/jrGkJp
	fqteegaYpDzY0BEPNCICRIUZn5dgCnEung89+ANG02rR8p8xSRDNwyCc6NUpxwaV
	/YeuUdwOJCMr8sGruv1LruNEZFD5HB8rXm8Nth6fRCxDcT7YCXkIdr+3jCtbuCAC
	p3GcDr9GZ9K8zFan1ZY40/S8ML2bvNE1tRUWOo/hgcooXneqKGZjhaCESA8oL7pF
	eOyZjXUkx3FQLH6y8iwBQ==
X-ME-Sender: <xms:CSAqZ7xHgxSs514ooe769K8kWCjYWtbjif1ZoKTVHysBqiQ3EMecvQ>
    <xme:CSAqZzSPnh_6R5_YIsn8ZRugYwWXi00O9zaFaAETI1GhGT29lxl1sNlsMr17vgLYt
    Ir5WqPIa8bLliPAywI>
X-ME-Received: <xmr:CSAqZ1UJfP7U6ALEacOZKD_j62T135Fmgb7Sd-MjuZwidUkg-c4SQnLRoODOsWwal_tPFCGEmpgwlgQ2KzJh3Vo2WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddtgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfe
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    tghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvg
    hnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggv
    vhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikh
    hlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:CSAqZ1jDcWBkdbJ8cMZZs3-pDMhOLsbE3CafqxwLnGChyuR6EON1WA>
    <xmx:CSAqZ9AAVefzyNfV26HTDzcmMYB9TNEodBNom78qypnnXof-7ZglKA>
    <xmx:CSAqZ-LUkn7QyE9eyzMBq153oH_fY_gCoxMug_tzpMuvoIw0kpl_Lg>
    <xmx:CSAqZ8BBvX4wKMsHWoeCMK4fzR3QmrH2CXLyl9XwLyFSPCn_A8iMlA>
    <xmx:CSAqZ3BOWpp8xHEC5sHgn6Fy0UZsox65PpPi1zRSEj8nCRF3jP833x0z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 08:39:21 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: renesas: gray-hawk-csi-dsi: Add and connect MAX96724
Date: Tue,  5 Nov 2024 14:38:24 +0100
Message-ID: <20241105133824.788688-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105133824.788688-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241105133824.788688-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The sub-board contains two MAX96724 connected to the main-board using
I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
and ISP) that are part of the downstream video capture pipeline.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/gray-hawk-csi-dsi.dtsi   | 185 ++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
index 68a37e2077e1..61bea35aebdc 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
@@ -6,7 +6,63 @@
  * Copyright (C) 2024 Niklas Söderlund <niklas.soderlund@ragnatech.se>
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
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
 &i2c0 {
+	pca9654_a: gpio@21 {
+		compatible = "onnn,pca9654";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9654_b: gpio@22 {
+		compatible = "onnn,pca9654";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	eeprom@52 {
 		compatible = "rohm,br24g01", "atmel,24c01";
 		label = "csi-dsi-sub-board-id";
@@ -14,3 +70,132 @@ eeprom@52 {
 		pagesize = <8>;
 	};
 };
+
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
+		enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
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
+		enable-gpios = <&pca9654_b 0 GPIO_ACTIVE_HIGH>;
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
+&isp0 {
+	status = "okay";
+};
+
+&isp1 {
+	status = "okay";
+};
+
+&pfc {
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
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
2.47.0


