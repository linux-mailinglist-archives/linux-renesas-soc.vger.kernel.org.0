Return-Path: <linux-renesas-soc+bounces-5524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184E8D01FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555E11C22643
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C6F15EFB3;
	Mon, 27 May 2024 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VGZBxWfj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TGAy4jHM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC61E893;
	Mon, 27 May 2024 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817314; cv=none; b=G5sAXIDp1WUf8gcgzyXdAf9XX2Pk6QLeKt/LXwSuquvM62XoEOmWKXH98AappeuYi3+VD5gVcEZs7LJoR9jTpvkACzNmxp8VnSK/D8Kqhu1HtGEH3o8IfoGTElLp4abJzS4pGj/abEQhnHktpWYnVqCXt2VbOSrcAtpnr7P+IRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817314; c=relaxed/simple;
	bh=umDXuss0viKzSxaUzowQbZCecGCZfXISyOzAp7yUsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MagmCt7liWueUGgWMdtskIvOLTO9B5XS+vJFiSStUQo7HzbMOVHTDNfNia/ot8fzfqNZi//fvwZvuUd1THZA8E6JTa7/DcYPF8xez6aV0UfTKSg8KZvfcytDT1S1FRM4Umd0LtEARqLzWzv6accJGej0ZK5dOMZZ/yo92opeMK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VGZBxWfj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TGAy4jHM; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 019F318000C3;
	Mon, 27 May 2024 09:41:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 09:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716817311;
	 x=1716903711; bh=xkUY2Kp6Ka0gad/vLh+iQ8tX9s4EKs1yZxISjfJw0zM=; b=
	VGZBxWfjIpML9HeFQcAlXidDuYpbw86tchtr9If/DDwehAc2aIqiRw3HlqSV3SM4
	o96mRWmniBt8lAL34GqicihLt26MKEjvtDmNMerbCNSbiCm59foye2lo8Kot6UM9
	qNpg9pVZ/nZFQUe28YtHN7ArhqoDQ7I4PZd0TehkM1h9fADRlRDrQxFhliyYnw8F
	Cw4oJZiskV1ytiejw5IR1OYF4HYXos6sVy5CADtuRuVjH5ApyrAgIT3RTvn1YDbK
	enawtOO3pGBAZmprqqjWnGvL8rZU7E+xDGT0iyz6quvJUG4kct1DqaQYo7FrGQrW
	76Zq4KMRkuNa9pWPtshwnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716817311; x=
	1716903711; bh=xkUY2Kp6Ka0gad/vLh+iQ8tX9s4EKs1yZxISjfJw0zM=; b=T
	GAy4jHM+B2JMDirMxlWgfnrjP78JTS/xaNJdRcz4bJxkTVmUy5Ewq1l0A5TIlqUr
	v8FBNrlxZE5FjoFfwSP6MitC67XTib25A5PQsh6ru66ckRby+mePVvKVu0erX+EN
	ESK5PivTNsQdznalazNrW0iYyH2Sty5Frn4k9q2XSVSDDiCIvDa29pYoig0c71nT
	ITeWKV45jwIihmKAqgg4QojZqZkt3uh6+y8qZYUMgxosvebp7laK01U2b8dju9rf
	L3ZrekptOsTX1wJqm8vOb+QhU2VW95A4wOp/los2W9pHYbfVfgOzvNv+etzNwMXX
	3tx79Ese7bpXEiz6uxM6g==
X-ME-Sender: <xms:n41UZr9mO13DSvM5mKxlT0JEU6qI0HkTIc5MsfRmbqcJcarnjNjhwg>
    <xme:n41UZnt1pLLdOIZmaHtSU6bxIoIEbVMqYG9hA0bKlf7ByorFflG_xawVfEw-Wt1FQ
    GXow4DuTlQVTDSkg4A>
X-ME-Received: <xmr:n41UZpDfVsAT8jmhKazV0kw7Ezfu57lH2pUbvQ4d1BzIg10GyIBRlTS_UjOcNyU_tUVW-d89AGUSgpvITZZ_NXObX7M59Fgg8q5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:n41UZnf8ey-zmklycEZOCxM1XaflZfS9_mJ-QH4WSbOKFyz2oCf7Ag>
    <xmx:n41UZgMtlcjWY7fyYdaNSyS8_2_0HUnF2UQsanybbqW_JEPej65Avg>
    <xmx:n41UZpl4nwd-K4ZY3si2LKXTo_iYIMo78LkIiBU36I1WwoIkTB9QmQ>
    <xmx:n41UZqtg6dIeeCQfetGO_YtrgP5U8R0RVCwQQ27UteJiNh8i7uCQmw>
    <xmx:n41UZndU0vJVmYxrs3953gAWllD_rX3m9KQ8Zee0t2_k7SaZxuXlhjym>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:41:50 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] arm64: dts: renesas: gray-hawk-csi-dsi: Add and connect MAX96724
Date: Mon, 27 May 2024 15:41:29 +0200
Message-ID: <20240527134129.1695450-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
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
2.45.1


