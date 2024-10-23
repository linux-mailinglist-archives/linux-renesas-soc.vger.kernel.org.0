Return-Path: <linux-renesas-soc+bounces-10005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F309ACF4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 17:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DAB01F254C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 15:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E37F1CBE8C;
	Wed, 23 Oct 2024 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cLSdNHSg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cIpqnj2a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811601ABECB;
	Wed, 23 Oct 2024 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698426; cv=none; b=XnqsAGImJ3+NLmxkVVUO57f7Hzj5N0bdp7SdIRap00XiiswWtqQ9O/g0CCOYZrRA0ct2J9KwntN6II8nl0hyTtlHRhjNYmI3xQfp50uQhkdrYuc9/Ada+vNDL+DBUBZq+HKXsJURNsLplocdrNlNIyJxMcq9bdxwsUZuo/3l/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698426; c=relaxed/simple;
	bh=5mBuI4/SAxDzJteY0rv50fBGbSq9OeJY4Demyv0Wym4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=noKPB8AbMZ1wkjwLPi4Rkzl05yN8Yl8DrevJHnqgyCgETqCtAzoU3O29q9UCoOtiCMPc2hI68r7kLhKz64tNrcZX+bjRrOaUQ8Ci/biFT/TiVdmQogLe74/RB6BauAnZoBLoz8gbmXSyqitciYnrcsIlu0UPuwxOREm5+asPjlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cLSdNHSg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cIpqnj2a; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9DA1A11400E7;
	Wed, 23 Oct 2024 11:47:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 23 Oct 2024 11:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729698423;
	 x=1729784823; bh=y82M/Tj6/kv3CjtpYoSMrLiP2EYgVQZWCeprnvT9AZ4=; b=
	cLSdNHSgLFUSIUVycYxvD8Sq+iHhLmxgm5imUI41h4ISsnKKTkmP7q3vbOEeSbWF
	NSfHzkhRlqOKnxH4iPPpOFTS10BMZ/CDhZYYxH+MLhAL3M1i78dweDIq1I++JT//
	GX4CuGa5DA6NpRjHkpRo1jHwbA65TtEmA0fIW5t/vkHYSCASsx23BeihXV201fwF
	JWeB8A7c/S17QvQnHpFu2dM52mdeNX1Ge41lSh+oPSwuqJi72R0prfivB2fGE/cX
	/2o9wRcAP1EKTltVssU9OM1Kz/EcGmTo9RXQ/smgSx3iI39f8SjblkSZsaRgPGfo
	37jnMZKrrpSWtbmc86Wvrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729698423; x=
	1729784823; bh=y82M/Tj6/kv3CjtpYoSMrLiP2EYgVQZWCeprnvT9AZ4=; b=c
	Ipqnj2ain51+X2HdTsrpbWsRaj/QvqtMNkOjpoCEmOQ8SmoGdl6nLKcw60CC4KeU
	Rk6PQxNrIes6G4vO0js1pfi++6xugLRoUsonNlLW00CdryOFE7WJihEBvtSp1Q3R
	yRUZ2lgtLNE3Cllt0qpndzg86SVm5cVr92UxEYafLP+3DaQ8OsN45hDuC1JZGoMY
	RWQnrcZ4oW88BMTWY8i7/N7eJAHEXCvFxWnvw5F1RAwu36SAYvoQGUEE8DHJTRZD
	5fIFV4/UKzBjSqowTSEaDcKL1xNwCiC6fXtGccwOeddaUXFB36xM2aj8bq0sxpQz
	KG43s+0YsLCmIjxI+WLPg==
X-ME-Sender: <xms:dxoZZ0SaU5Q6PAcH4n31EtxlLZdY62ItKXDAXtjPAPtcGiw7zTWBJw>
    <xme:dxoZZxzj17pTM1Tea4ea9wS9EiE--cTZm2fEHtBf6iUg3kgnZok6tcDYJfYiBlDuy
    bvnbHrODBZkzrybHVI>
X-ME-Received: <xmr:dxoZZx0zJyFYGHJ5B4aYdp9GUE-Iyiz4SuccqgN2fgvnIBy5yUIFQBw4koJjmaCsDY4cMEyru8U4YNTi0oJNmFToCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghn
    vghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrh
    gvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegu
    vghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnih
    hklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:dxoZZ4A9PN-sulmZ_GfKQXqtngd1oxVatmvECLnBRRPceIreYb7s3Q>
    <xmx:dxoZZ9jzKhq4J4AjeESi5Zo5eYWfvtmPLlEOp3ivpktc900Bg_LjTQ>
    <xmx:dxoZZ0p_ZFc_YXrEKbbl-3btsQZX_etd1qgOnem__qyPPbzvsB8GlA>
    <xmx:dxoZZwhA_HYVDuXgTPIYxpeHkWwU9IKN2ZWEoJVEptPSoUzfXEN0rA>
    <xmx:dxoZZ1hssHtnhgClhRPPA6cerO8-MWXRWMI0So0IIIJ71tXVjnSScGGC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 11:47:02 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: renesas: falcon: ethernet: Describe PHYs connected on the breakout board
Date: Wed, 23 Oct 2024 17:46:43 +0200
Message-ID: <20241023154643.4025941-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe and connect the five Marvell 88Q2110 PHYs present on the Falcon
Ethernet breakout board.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Remove the specific "ethernet-phy-id002b.0980" compatible value and
  depend on the MDIO bus properly probing the PHY.
---
 .../dts/renesas/r8a779a0-falcon-ethernet.dtsi | 242 ++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
index e11bf9ace776..2a8537e13873 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
@@ -5,6 +5,121 @@
  * Copyright (C) 2021 Glider bv
  */
 
+/ {
+	aliases {
+		ethernet1 = &avb1;
+		ethernet2 = &avb2;
+		ethernet3 = &avb3;
+		ethernet4 = &avb4;
+		ethernet5 = &avb5;
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
+		reset-gpios = <&gpio5 15 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb1_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <7>;
+			interrupts-extended = <&gpio5 16 IRQ_TYPE_LEVEL_LOW>;
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
+		reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb2_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <7>;
+			interrupts-extended = <&gpio6 16 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&avb3 {
+	pinctrl-0 = <&avb3_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&avb3_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb3_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <7>;
+			interrupts-extended = <&gpio7 16 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&avb4 {
+	pinctrl-0 = <&avb4_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&avb4_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio8 15 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb4_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <7>;
+			interrupts-extended = <&gpio8 16 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&avb5 {
+	pinctrl-0 = <&avb5_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&avb5_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio9 15 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		avb5_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <7>;
+			interrupts-extended = <&gpio9 16 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
 &i2c0 {
 	eeprom@53 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -13,3 +128,130 @@ eeprom@53 {
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
+		link {
+			groups = "avb1_link";
+			bias-disable;
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
+	};
+
+	avb2_pins: avb2 {
+		mux {
+			groups = "avb2_link", "avb2_mdio", "avb2_rgmii",
+				 "avb2_txcrefclk";
+			function = "avb2";
+		};
+
+		link {
+			groups = "avb2_link";
+			bias-disable;
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
+	};
+
+	avb3_pins: avb3 {
+		mux {
+			groups = "avb3_link", "avb3_mdio", "avb3_rgmii",
+				 "avb3_txcrefclk";
+			function = "avb3";
+		};
+
+		link {
+			groups = "avb3_link";
+			bias-disable;
+		};
+
+		mdio {
+			groups = "avb3_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb3_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+	};
+
+	avb4_pins: avb4 {
+		mux {
+			groups = "avb4_link", "avb4_mdio", "avb4_rgmii",
+				 "avb4_txcrefclk";
+			function = "avb4";
+		};
+
+		link {
+			groups = "avb4_link";
+			bias-disable;
+		};
+
+		mdio {
+			groups = "avb4_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb4_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+	};
+
+	avb5_pins: avb5 {
+		mux {
+			groups = "avb5_link", "avb5_mdio", "avb5_rgmii",
+				 "avb5_txcrefclk";
+			function = "avb5";
+		};
+
+		link {
+			groups = "avb5_link";
+			bias-disable;
+		};
+
+		mdio {
+			groups = "avb5_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb5_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+	};
+};
-- 
2.46.2


