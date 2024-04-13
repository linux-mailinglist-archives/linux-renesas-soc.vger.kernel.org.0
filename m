Return-Path: <linux-renesas-soc+bounces-4563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980D8A3CF7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Apr 2024 16:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74FDE1C20A13
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Apr 2024 14:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70C244C89;
	Sat, 13 Apr 2024 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="N7w1BrMq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dl5KjaOu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow3-smtp.messagingengine.com (wflow3-smtp.messagingengine.com [64.147.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BB44C9C;
	Sat, 13 Apr 2024 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713017989; cv=none; b=IjfvqIK+ZvFYpSHy3Rd4DEAgDkQdwPEeJibZzYICVgislx3dbcLx5XCCttSbF4SDljQsA3Vh1jgvVqtdmmwBE6uJ4I5Ez4GIySAxQ8gegIJOSsSjkHt3OhTG7BTGuoYccVQ15CMZRVjAfv38idMg+bTRhCkk0ZBqz3aNhdLjerQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713017989; c=relaxed/simple;
	bh=pt1BpW16ExNBB5EX86N44ruic4yDDS+Pfy9SZzLclCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlWTzxVk0fqhc7vGyMpq7zxVzCX2gk0DYE5diHYMwiZIaSZxXCJj+Gww8f6DyPwwAQ9Znw5qzB42+rUHAsP+tRtrEGJt3kvZbl9EdP5najWwd8nfeRwCQqflhJC+uJ1hCoFToKOHYI1p5YGRvmcGB7TqPiZlwm62b86/qNyIK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=N7w1BrMq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Dl5KjaOu; arc=none smtp.client-ip=64.147.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailflow.west.internal (Postfix) with ESMTP id 0B1B82CC0578;
	Sat, 13 Apr 2024 10:19:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 13 Apr 2024 10:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1713017985;
	 x=1713021585; bh=gaWs2v5ibh/rpona/EiDiKy+pISai3EBShWxv3Y/nk4=; b=
	N7w1BrMqBlGODt1Tt6srfdpc8pYuB5v6C3Pu3pBVL6R0KrjUOen6L+Z+APsopYlQ
	ofwdc8rs4P7dBbyBqkkqPcRdgbqdehRQvzszT8EvwyhcX04LXVNTy8euTQO8ALaB
	fY2NNk7ZOXvZwcbVeOJA/koY2+Z6Rtt7QKYy4YZ11+y2cFIDB2xtjJQDFeV4e8j9
	Hmnqyt3CmEdJ/wefnbv3FXR8c0JDeAOyyUjLNTAWTT3U//HcjK+zrVy+XQH9IBdS
	ucUVKIf1yytN8GB0UtXfnOOMm7eWQFodD9gf1+R2iyRr+KMvRyjMIajHplPCAtMt
	zrzyQIkD6B/SF2jv03gMTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713017985; x=
	1713021585; bh=gaWs2v5ibh/rpona/EiDiKy+pISai3EBShWxv3Y/nk4=; b=D
	l5KjaOuWsWGJhFIy6o9FzSn2VoFjEjJiJftQ4LGxbyLQhS/88Fu+ma6Ze2DWSTl/
	vDMrRDVCuOrmCB+4xgVJOP/YowyqhjGLAUA8BM3TCMH2rf/Y1ZbrEJSIVnf2kLLs
	7/FLV8xp6rE6I9FHp4B46zyy1yTLYZGlnj8fzovD5gey0BLbIqWlQNyBVfGKeczc
	heyTsKWCYxPCGSRdtOrbisGMJrX21aK0PRSOMLfg38QvHOw8AdtJO7deYiRnUbLD
	b0wxrfyGPqTgbTYskWIUO88fIcRv5+oSkf0KWXFXQ3dtzK/2mMK7N8hmwTG12eAP
	BHBwY6HQNWC3duJXNse+g==
X-ME-Sender: <xms:gZQaZrP2tzccuGlu8F8ZayaCGp20W1Jj8aUZ7x0g9kVvLdbmhLUkRw>
    <xme:gZQaZl_48u8cBUioV7GxBl4az7XtgmKfBBbhb7xh-fqsv7Z3AWR_0PYTuoSX8OS9e
    eDM5E_Owre_-ujL_yo>
X-ME-Received: <xmr:gZQaZqRyjcbYAr67U3Qgs8guBNNzMYUJUcyQYbS-ls72qELTBvB67xjQ-vp49pM2I_ud6Vn_JbGDyjn85L9lZM72TKXH37px1p9m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqne
    cuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffh
    jeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgr
    thgvtghhrdhsvg
X-ME-Proxy: <xmx:gZQaZvuTTMuFfEtqJvNCV5en-Hth7S4jajtw1TCc4ng_1Skv1guW3Q>
    <xmx:gZQaZjdINq4Bc428pIqVNg_Q1h04V5PiTeabTcISyQ1ytR6VSvuepw>
    <xmx:gZQaZr3FmLedeJ6cUE7m3kgM3PKVXO_Pzru_PWBjzwMoH8sAc2iknQ>
    <xmx:gZQaZv-QjRC_izJkAAap0baC9YZ4wOWbhPMjmFINaJwPtGoUM_pCdg>
    <xmx:gZQaZq6gGrpjb_o84MErWg1v0BwD5a5lYsqc1JvndaKOHM98zrAB9dAO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Apr 2024 10:19:44 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/2] arm64: dts: renesas: r8a779g0: Use MDIO node for all AVB devices
Date: Sat, 13 Apr 2024 16:18:05 +0200
Message-ID: <20240413141806.300989-2-niklas.soderlund+renesas@ragnatech.se>
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

Switch from defining the PHY inside the AVB node itself and create a
dedicated MDIO node for AVB0, the only AVB describing a PHY. This is
needed as adding PHYs to AVB1 and AVB2 will require setting MDIO bus
parapets and thus requires a dedicated node.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- New in v2.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  6 -----
 .../dts/renesas/white-hawk-cpu-common.dtsi    | 23 +++++++++++--------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 9bc542bc6169..2ee306305d83 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -815,8 +815,6 @@ avb0: ethernet@e6800000 {
 			phy-mode = "rgmii";
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -862,8 +860,6 @@ avb1: ethernet@e6810000 {
 			phy-mode = "rgmii";
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -909,8 +905,6 @@ avb2: ethernet@e6820000 {
 			phy-mode = "rgmii";
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 8ac17370ff36..b671bfab049b 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -142,18 +142,23 @@ reg_3p3v: regulator-3p3v {
 &avb0 {
 	pinctrl-0 = <&avb0_pins>;
 	pinctrl-names = "default";
-	phy-handle = <&phy0>;
+	phy-handle = <&avb0_phy>;
 	tx-internal-delay-ps = <2000>;
 	status = "okay";
 
-	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio7>;
-		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		avb0_phy: ethernet-phy@0 {
+			compatible = "ethernet-phy-id0022.1622",
+				     "ethernet-phy-ieee802.3-c22";
+			rxc-skew-ps = <1500>;
+			reg = <0>;
+			interrupt-parent = <&gpio7>;
+			interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
-- 
2.44.0


