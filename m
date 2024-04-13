Return-Path: <linux-renesas-soc+bounces-4564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAE8A3CFA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Apr 2024 16:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E63B6B21582
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Apr 2024 14:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F398F44C92;
	Sat, 13 Apr 2024 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iYFh3y4E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pBiCQhlj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow3-smtp.messagingengine.com (wflow3-smtp.messagingengine.com [64.147.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E845034;
	Sat, 13 Apr 2024 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713017991; cv=none; b=ucEQ56G/ysOCtYiSL8jITORP7sjP99QiMP7tZp3qGcY5PQmS07XON9g0uGyc+OIIm4eX/7PhDQoUSITzGSSWZo1biSfR4OgCo+49KlBnvNhmsAiYxNsON8ZNm1ctmfOyemDDbyZV5nfLiYRQE2L+208n2Q2Umabh0oFDESu8JAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713017991; c=relaxed/simple;
	bh=118JCR2yIUjPcy/E7Nd9jiCM8PpDFVPH4XGohHfn10o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L68m3BvQznJRdpi4D5JTV9XJgaRIDzjb09x4irfv0u6wEIWuEAPsKFMGqezr/bTcv5FyI3NGGiaOaOF+e89Ek0stFri1pGnfxHi9t1YKeeq/nS+U4ggA2fiB8klgUHt42IPHao2RwW4M+ErvjPqk5up8QsHMEPhFXMpbZgStsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iYFh3y4E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pBiCQhlj; arc=none smtp.client-ip=64.147.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailflow.west.internal (Postfix) with ESMTP id C84562CC057B;
	Sat, 13 Apr 2024 10:19:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 13 Apr 2024 10:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1713017988;
	 x=1713021588; bh=7ylLb8ACnhfEEP/yrjUZdXmwYSGtEp6/uXQaezr6nPA=; b=
	iYFh3y4EGsGZeA2beL+01wo+49cKVhkTfUjPDzGRa69pcoCzs7Lo55CKATyaMsnG
	461GRgqa8wB7uy2xwDKgy2rhJj4+lQS51oM2/3a8HxpfrdGSoHNm73F1HPoq2BZJ
	ULIHPsnBVC2wQ2pE4yQoQoO25Nq2I7Puv6jNb19/lxfd7SPcn7W17z2kXFBfEXBA
	JP/KzSkVY4EQMRCfp/ep++SGY+UWw/3lL0WyVmNN04zQWLXAe+M+EW3V8Q7/OuqL
	6/vC7aRrIw3tCl+tImq6iThmlSH7QUk8q6/Y0V3b8olPk1sYyYqE3rytX3ovsyGU
	jqKWM+FWHTUcBALzrFv/lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713017988; x=
	1713021588; bh=7ylLb8ACnhfEEP/yrjUZdXmwYSGtEp6/uXQaezr6nPA=; b=p
	BiCQhljCRTyFLAImz/KpDs26QlHzGFR19x13VjNWKF8eo9SMicBEc52sVz0ngQZA
	WbMhAfvqH1AFsVOH7lr51+7QM7Lce1csaDSxWF6MBVgN2luPY0ezM5fsshK3o/+e
	TSumiN3w/z1SQCAID6L3pNuyxxZ3JOVVK34yuJiEGV0NSr8MXTb+MkuSOCDrUIMR
	aDww9OW+lAgLmQYqw+IDwrqRdUwS6irsMqMblc4vYaVdn69c9ZJ653leIQTcOgXX
	dHwV1ArkhK5Qqqj/w8PrEp7vpAXX4ztOroVjTi+/UedUQ7lJ/0u193GDB1LI5zV7
	dTTZr300xNQ8lg9Duhwtg==
X-ME-Sender: <xms:hJQaZoT8ZrOd0ridMvDG6qrBJiqLlsQWswhrJsO7mkFyILyKer2ncg>
    <xme:hJQaZlw4XnMi3isCE6c0YJ5jqTbHWB9GZZvew-VNzsuciiX0E7atXG8dnnU9eXITM
    Dmmb1Nird_Wv7Uyxhc>
X-ME-Received: <xmr:hJQaZl3_8Hny5D0z_ZLJD-n2FYVYIjmNS_DORh797-2LXlfGVNKvWkvUeT_TlmJqba2cVAwb2MRG0VXruUt_bqxvPf-wFWf3fkbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqne
    cuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffh
    jeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgr
    thgvtghhrdhsvg
X-ME-Proxy: <xmx:hJQaZsC0qcUAiVXLMPWF6thtfCZdK88khvxTQfBSotTgwHcO-E-kIw>
    <xmx:hJQaZhg66v4gw1FyI96l1tQcBNOoh8QZ_wKP2Ox_XLVSZ2k3LDClCQ>
    <xmx:hJQaZoro8tgjBIdW8tPlFQfWz6AEyoLORqJL9YnJyVAPC6vmu1zlEQ>
    <xmx:hJQaZkiQLhq6McsLW_tpuyYG2F3lyz9rpHTvDlNfjtS_TInadK6fQg>
    <xmx:hJQaZhfg9jK-CXLy7TSvSo5f1xKYfQq2jJpmyDC5PQ7R9Hb2zfD1xRkP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Apr 2024 10:19:46 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 2/2] arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2
Date: Sat, 13 Apr 2024 16:18:06 +0200
Message-ID: <20240413141806.300989-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the two Marvell 88Q2110/QFN40 PHYs available on the R-Car V4H
White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
up on the board by default, there is no need to move any resistors which
are needed to access other PHYs available on this sub-board.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Fix spelling in commit message.
- Add pinconf for link pin for both AVBs.
- Rename the phy node to make it clear which AVB it relates too.
- Add aliases for ethernet1 and ethernet2 so U-Boot can set MAC
  addresses.
- Rebase to reflect updated of filename for white-hawk-ethernet.dtsi.

* Changes since v1
- Correct typo in commit s/adv1/avb1/.
- Do not use underscores in node names.
- Move the MDIO bus properties into a septate child mdio node. This
  change depends on updates to the driver and bindings posted
  separately.
---
 .../boot/dts/renesas/white-hawk-ethernet.dtsi | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
index a218fda337cf..595ec4ff4cdd 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
@@ -6,6 +6,57 @@
  * Copyright (C) 2022 Glider bv
  */
 
+/ {
+	aliases {
+		ethernet1 = &avb1;
+		ethernet2 = &avb2;
+	};
+};
+
+&avb1 {
+	pinctrl-0 = <&avb1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&avb1_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio6 1 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb1_phy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <0>;
+			interrupt-parent = <&gpio6>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&avb2 {
+	pinctrl-0 = <&avb2_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&avb2_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb2_phy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <0>;
+			interrupt-parent = <&gpio5>;
+			interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
 &i2c0 {
 	eeprom@53 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -14,3 +65,55 @@ eeprom@53 {
 		pagesize = <8>;
 	};
 };
+
+&pfc {
+	avb1_pins: avb1 {
+		mux {
+			groups = "avb1_link", "avb1_mdio", "avb1_rgmii",
+				 "avb1_txcrefclk";
+			function = "avb1";
+		};
+
+		mdio {
+			groups = "avb1_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb1_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		link {
+			groups = "avb1_link";
+			bias-disable;
+		};
+	};
+
+	avb2_pins: avb2 {
+		mux {
+			groups = "avb2_link", "avb2_mdio", "avb2_rgmii",
+				 "avb2_txcrefclk";
+			function = "avb2";
+		};
+
+		mdio {
+			groups = "avb2_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb2_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		link {
+			groups = "avb2_link";
+			bias-disable;
+		};
+	};
+};
-- 
2.44.0


