Return-Path: <linux-renesas-soc+bounces-11931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A50A0455C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 17:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20313A2773
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 16:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3BD1F3D2D;
	Tue,  7 Jan 2025 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rMAxstzf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="httOINEM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE571F4264;
	Tue,  7 Jan 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265722; cv=none; b=LaBQZI7EqdHCzNs6+1ueKkg2VAm2BtwNOim2b08hQxBSZrqQYBpkY55jBvWIlFn7y4rEzYlAdCZVihJdoCznZe8x19FjAUflAUu6OeFLnz6OjeNyDXZO4f7oh6AzQgDgc1InqfEV/b0bmD1a874IHac305IUO9zxNnfBwPd2An8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265722; c=relaxed/simple;
	bh=UwPiCS+3mBW10I9zuWvyHYTK0MLznyl98HgESrXhzIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7xRdWhPqkRnt7Tf05Z+5kMdukue0abnbloTo+IrAKB9RJl9x3eU2wfh5gc/rNbamxnln5Hc33khWafuORjD2wycTboxDqD45woocBbRUhxF840ZVEGM2XtTNNBpHGQlnBsv6QL8qruUlB+GsLTBTeXCmxTxxSYohQIWJeYW8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rMAxstzf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=httOINEM; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id F3DA213801D9;
	Tue,  7 Jan 2025 11:01:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 07 Jan 2025 11:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736265715;
	 x=1736352115; bh=3LsGJ7CZy/5RqBjv0Xal+6+LNJtXNzUbpVKfHnhouPg=; b=
	rMAxstzfucsmDr3GsiXaeC/9YZN/hJFQ8M1mo5AHPsQsltkYpnabvD70n9Lth0vd
	VhT8kqa50ObVPNe9KNXikkfqNXVExvk345jcVkKmB/VP9wnQNwHjXIO/3Z8cobtZ
	jg+nnK9cEvrp6aTWJkNdXhL5Q8iQ2f5570u4WHlR7sUD59V14P8Z5LtKMPRNSl3o
	5cCwivmaINWvXxYFJvAhsnxmaRqiPWKAVm/5LM0Gw9WkjDBwuG/V/3Pek2vBh6nk
	CXvDtnNjWP3effP3RlNqKnuEd5DOqA/U/EIQsTBRGI9Vud9ABoZYaYpuWgmdyJaV
	VRz5UylXqZZbt0H5AE9Zvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736265715; x=
	1736352115; bh=3LsGJ7CZy/5RqBjv0Xal+6+LNJtXNzUbpVKfHnhouPg=; b=h
	ttOINEMAgfrc4FZv6TFaV5ng7apN98aeJGZB3uy1xPy0Aw4W0JULn6UjuKw4pcvg
	TmPOSAE2Q7xArJpNni1vzZ6D9RxLHWSFqy7qgL1Fqdxu+moRY61plLQ2evufCu+2
	8gaTpEZGRuwWa7W6pbh6XkMiOXwqavGDg7IYNUB//ls2jQCyahHOiiaRoWO22N0c
	pctJrJL3oi7K8q+FjmwNFPLMUm0twGsmbqYzsJYkMFa+K1FKjz7XY1gV5XoNe1D8
	bAguYqI0lUXCmPJmUc8E3LhlWfNLCZ8lCvpqQpEa8V1w4XZJVrjF3ILZCvTSdCL8
	Lvv+OjYNp0/lGcqMhrtBw==
X-ME-Sender: <xms:8099Z90_dThSuURMz3O4JY8Nfj6f9-MjcAOa6uoljNNoJGvOjdp_5Q>
    <xme:8099Z0Hb_i5JYcLWyvfRlF00p7gm2LFiXbjmzVKMh9LlkmXXvy7RWpiZf5l0zJ4lY
    jaDGWdL51BI8eV6fG4>
X-ME-Received: <xmr:8099Z94YzHDiiMif3szZxQhM48QW7iKsKF-pDlZOibcIsxQcESfMl1vnhyyQyvwzsqMyrm3GlgT8C2zIhaAi1xMr8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgkeduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:8099Z612yRpEwDTQD3CxDSjigZXqouSK5HsNLNzPoZ9vntzQD_mmaA>
    <xmx:8099ZwG6JhIGgzSbEMDbyltPPLP05GPKjL-s5Q7FMwuaztKAm9k67g>
    <xmx:8099Z7-0bF0Xq5lJr4yUHEy3KvWpSSHUDMMy3SmdxA3-p8updo6FxA>
    <xmx:8099Z9kgXiZSad12v23BHWAdiDPxdg5_y4Gjz_kpieedjxVzi6L3Ng>
    <xmx:8099Z8iR10PE1rgSBdzIlSVCfO_I7HRAVyKWVXYbRmyXBdVjkxu7OIGv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 11:01:55 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Describe AVB1 and AVB2
Date: Tue,  7 Jan 2025 17:01:27 +0100
Message-ID: <20250107160127.528933-3-niklas.soderlund+renesas@ragnatech.se>
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

Describe the two Marvell 88Q2110/QFN40 PHYs available on the R-Car V4M
Gray Hawk single-board. The two PHYs are wired up on the board by
default.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index f3a744e17d48..55b187765932 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -46,6 +46,8 @@ aliases {
 		serial0 = &hscif0;
 		serial1 = &hscif2;
 		ethernet0 = &avb0;
+		ethernet1 = &avb1;
+		ethernet2 = &avb2;
 	};
 
 	can_transceiver0: can-phy0 {
@@ -219,6 +221,48 @@ avb0_phy: ethernet-phy@0 {
 	};
 };
 
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
+			interrupts-extended = <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
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
+			interrupts-extended = <&gpio5 4 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
 &can_clk {
 	clock-frequency = <40000000>;
 };
@@ -563,6 +607,56 @@ pins_mii {
 		};
 	};
 
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
 	can_clk_pins: can-clk {
 		groups = "can_clk";
 		function = "can_clk";
-- 
2.47.1


