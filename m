Return-Path: <linux-renesas-soc+bounces-11932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE1A04560
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 17:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CECAA1887CEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 16:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5296B1F3D3B;
	Tue,  7 Jan 2025 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="P6yQAQxZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sBFHcZt8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95031EE003;
	Tue,  7 Jan 2025 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265724; cv=none; b=Rs7kY/z668E32pJSYatEhTWeWHGKqOWxVbmNeu4OesndqdVPt0jL3HmsjhLVfKpjFBt92XfZgnrNZWX8ICFVIGrYDqDfPmtXkkALgKS/eJO6B90s7SUnB+lmcasbiUW2NJ6FmwT7/1uBdveqLOrzL+vBuVW2Xhu7/1e/wZwGm2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265724; c=relaxed/simple;
	bh=zoUtrgLgQ0DSydnMjUHFm++4rCoodv0U6jIDzP48aWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbG+rr4uetJfPrpnT7+GhooD8WmyRYJLeQaIJ1NsMSQqV7XzU2SCYgqaBaH9WrsS5SDTOAP08OpTGPtNX/tcQnuT48eg/FSlNjbLkxlJ0g7NukBycEXB81O+buHpsP011e+9X63/ftEcdliZDrY6ty2e1Ok+qi0eLPJKlx5epIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=P6yQAQxZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sBFHcZt8; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7358B1140064;
	Tue,  7 Jan 2025 11:01:53 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 07 Jan 2025 11:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736265713;
	 x=1736352113; bh=SChl9H47PC2uQqBsRa6Cp1jVRQ9ziLg5/glsWf7qM7k=; b=
	P6yQAQxZxNCD2IS2a1YZJvZIMdzfS9Sxh+xcBIhBefAbcLVxYnxfvbK06zgh1ssd
	1faB8gjgnME6E76STnYk8eGOtjcn5Y9h/PTyFa+2vx2pQwTVzRbtImgUoOBGY8WT
	kPxJagGVkLDjajA0vEGYg+IpnBgOyhkKvHGF7ZYyB6KxQ0fu8C0yZMslvozKU4pl
	IWEaMr9yRxyMkQrPDwXXFF5PPswl7/w5ouBKC1a9NuyNcb95oNd7IC6hcqkdNClf
	qUz4/mI1YGFd9x1fcFMA6Ef8x7ptmhTB90HQLQ4hZxScG2Ll5SNXiOSj3neMwPBM
	5g/EYrA2EDNgRyhPkW+I3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736265713; x=
	1736352113; bh=SChl9H47PC2uQqBsRa6Cp1jVRQ9ziLg5/glsWf7qM7k=; b=s
	BFHcZt8p+vHVphFADKLNzr60NvOhNQYFjCBwmg7iMOCazBlD42AL5wDF4Xg8XmCi
	c8NxY/7mjiqLQ5pH01JsKzn+BeqH0c/wdEM2bon2aiBlfqhSLwVahVm9jTl4c8Pn
	yadwMfNkdPAzSnRZDUPENSpzVqe2aZO1GLtG9+u5led5GuaW+NngA1S7Lt9+vKhP
	I3ETgavlsJYF//IpGPGhZnkWnDkksvSR2SHekTyH8uTdkQV58WEAK7nyP86tuwt7
	y5TegKAnbVWZlp8+OT2pwDThhI7PtxkHs8WCnU3g5VDu9D//5JOtfskNMOcProT2
	t4v7poe7vEscg/P1Qrv9A==
X-ME-Sender: <xms:7099Z7w8nlmbU5r1ISRkXsYh6tRxqdZdYE_tOkYMP4yZtIQs7SRn5w>
    <xme:7099ZzTgNqBeQE2rGrM2M-giD3vkiTkqDMSGWwRVD4VmqReep16Jv6hDN4vTuVqlH
    7aqAJ_k73rgCYkvB3k>
X-ME-Received: <xmr:7099Z1WGHEQYm-TkImVRTw72TpfjKFSP1LJxHtlwhPRbK0FL-onqNJ9ZoSaAOiIK551-XVdbZzsrZvw6HhWATV_7Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghr
    lhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedt
    leeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghg
    nhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:7099Z1j8FHIH_2-gqRFcZV0KJRFTJicdhTx22F-F30mmxAOWCI-V5g>
    <xmx:7099Z9BFCpuWL4ZJ4-AEwYdqeLrsO65C6INXRzpp8kMIi2ND-3-8BA>
    <xmx:7099Z-I1v3pJ07HRn47b9-ZHkH3esDTrjW-Lx6y4-Rc-acYrASH5yw>
    <xmx:7099Z8COyCivG_3HZ-jIZBpaMIHtjmK3R4vN2MBHZyooh-phmhzcXg>
    <xmx:8U99Z481NQmD7LrxpsI5cJwThah6pG5hahLnh33TWDfSkPZCduGUzbWI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 11:01:50 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Remove address- and size-cells from AVB[0-2]
Date: Tue,  7 Jan 2025 17:01:26 +0100
Message-ID: <20250107160127.528933-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107160127.528933-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250107160127.528933-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When describing the PHYs connected to AVB1 and AVB2 mdio nodes will be
needed to describe the connections, and each mdio node will need to
contain these two properties instead. This will make the address-cells
and size-cells described in the base SoC include file redundant and they
will produce warnings, remove them.

In an effort to keep all three AVB nodes style consistent add an mdio
node to AVB0 already described and rename the phy node to better
describe the PHY is connected to AVB0 before adding more PHYs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 21 ++++++++++++-------
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |  6 ------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 18fd52f55de5..f3a744e17d48 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -200,17 +200,22 @@ &audio_clkin {
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
-		interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		avb0_phy: ethernet-phy@0 {
+			compatible = "ethernet-phy-id0022.1622",
+				"ethernet-phy-ieee802.3-c22";
+				rxc-skew-ps = <1500>;
+				reg = <0>;
+				interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
+				reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index d0c01c0fdda2..a7f100f2f4f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -793,8 +793,6 @@ avb0: ethernet@e6800000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_hc 0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -842,8 +840,6 @@ avb1: ethernet@e6810000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_hc 1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -891,8 +887,6 @@ avb2: ethernet@e6820000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_hc 2>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.47.1


