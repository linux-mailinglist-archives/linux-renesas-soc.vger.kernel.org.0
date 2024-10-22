Return-Path: <linux-renesas-soc+bounces-9972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7049AB621
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 20:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8C9A281EB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 18:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5721CB30C;
	Tue, 22 Oct 2024 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mjtPG1HX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eK6xKs6F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C701CACDC;
	Tue, 22 Oct 2024 18:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622919; cv=none; b=BeyLQ95vOYydTz5P8udteQ9LnjDR9N5E462Gj/a1lDMaRgSjOjCzdvjSrPSz72eOaOxRRtORbt0Qsli9tZyi+geu9siBCac+p8UXc3FBbYkVMGmIl2VSbSeQAcdenpzoqOQ0o9Pv5zoNA0x0x14hnOEfkEBPQ8TtdB4ky9XyVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622919; c=relaxed/simple;
	bh=iWGvkvwckNv4iL7lDGpOk2gdfRB19NB+MVYJpt9wXRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIOZcVhuvTUu8c3AZMLtYxkgjG83pHS7v5UpjBSIOsBFVTt6TAdwyWM6dUV8vCZ+l6bEG5ejWLDSTl3qG0nY41MMpzlyEoF9IbVP1KeUHQlumrM3oWfYKkvzrhLhkIHSc81S7r3v3pQ5/N6K256Ca9zF9xy9tAJoYmSth46p/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mjtPG1HX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eK6xKs6F; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB5F31140133;
	Tue, 22 Oct 2024 14:48:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 22 Oct 2024 14:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729622916;
	 x=1729709316; bh=sY9wpFcrQ0ME1mJCfcRLz1nr6ZaYLlor9JtT9j/g4LQ=; b=
	mjtPG1HXdlP+lUlYu5YnA8kzBgZf2RG7UA+Ax2QBlZ552r3eccJ8e+HfiCqFULNj
	opHH14Qg6m8IaLs3UFK0rWZK8htCCHLMOO6EbKOGKHTkX+fXUhVydbldMevEenMi
	x+yQ0dAd+ZpsbTSS69qkL8Ef9NJ15xvCa/hTxEN4Zdg9/fLV93kiHrx8IWvIheig
	HQQn88EUxFzsBLlVY6q/NPKzMWHC2Ey6/liC3E7so/IknYiSgEPKZN3AVK5ZQVbS
	3SZT4BmLUyz1qWfLsdG/IVVd5djHOBWDxqvmvy5pg5SsF75e/zpFMpEVuCS6esx1
	xZF/MNs5euQtC5L0me92SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729622916; x=
	1729709316; bh=sY9wpFcrQ0ME1mJCfcRLz1nr6ZaYLlor9JtT9j/g4LQ=; b=e
	K6xKs6FyDuG1lBLRjFs2vgkDt5HTyzjsIldy+YXSxCgom6FHDixN9wBdQ/p1J/Th
	Kk95l/hD36/kX18CoAjnueliAmRSjzdWNPHq8Dy5cJS98cs7GjCSK2KPsNXX+j0l
	xowvbadVjm8vX5eX0/uW9i67xCx10aOlCcQ3YiJt6SYnNULZpRZ/RQWcY4kuw1Ig
	Swr+Z4Z264qBpHlDpww7I/5x3uRBRkfiD5QidpgxmnSkhWFNS4A95/MlJRB1Ua+h
	3ZsfXHyU07MiDTpsFvxwCw6NsjzZ7hk1K5dXpcsGtIVfzxAiuFZa5cumwe0zn/vp
	WERGA0cz0kRnF7Jqugecw==
X-ME-Sender: <xms:hPMXZyGAupFXLUG2HELorIxtJfhcS1xhw0GIo0Vzo4RgdZCllUOiig>
    <xme:hPMXZzVQ6J96RzZO2TdOgv14s_m5gDUGTfhtNfD6nftBdapIJfsPy1gRNGczRHdVk
    qSBUgfZzssn9k-jWOc>
X-ME-Received: <xmr:hPMXZ8IcNqwBp52kWIW2FVOECaMZO681we2Muzs9_OGFxJP7K1kl7IE8rxrgVjWyiHusx4HLX4jGO0op184P6qfCuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeihedguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgv
    nhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    uggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    hikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhs
    vg
X-ME-Proxy: <xmx:hPMXZ8H2m_SquREpS0TUysGWI1DtIGFZ0yTisCxW24TUspw3f9sDVA>
    <xmx:hPMXZ4U6SVqDsZkBIc8beciueJmq7Eq44jWhvrafzUQidsTLDdZ10Q>
    <xmx:hPMXZ_MERAXEgIEf0Z5E1wrp4xvhrnAy5Fa3qozWnh0_L3V9Kqd1-g>
    <xmx:hPMXZ_3-CRcfGSe4H86rzu5TURyNVTST1_nzP100ZvEB_AGqPfLa5g>
    <xmx:hPMXZ7FRCpVQ0zQLiNtWpp5nJIT4xTJrgGOlniv5WTdEB_rluzlh7pu1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 14:48:35 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: falcon: ethernet: Describe PHYs connected on the breakout board
Date: Tue, 22 Oct 2024 20:47:27 +0200
Message-ID: <20241022184727.3206180-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
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
 .../dts/renesas/r8a779a0-falcon-ethernet.dtsi | 248 ++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
index e11bf9ace776..69c3c5589da9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
@@ -5,6 +5,127 @@
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
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c45";
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
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c45";
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
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c45";
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
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c45";
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
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <7>;
+			interrupts-extended = <&gpio9 16 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+
 &i2c0 {
 	eeprom@53 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -13,3 +134,130 @@ eeprom@53 {
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


