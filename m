Return-Path: <linux-renesas-soc+bounces-10305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAED9BCE1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 14:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7B11F22C8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03131D6DA1;
	Tue,  5 Nov 2024 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SYriWj+p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G1dgyLVG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1811D5168;
	Tue,  5 Nov 2024 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813962; cv=none; b=tD+Fx8H5g60bpxEwcinX0DxKYnSseMfloOVxfsXqQsje2pXFdM6ld/WEakbwWGK9BGM7ytWiqh9S6QgPOJd/DC09/DTmOX8VLrlAqtIhhRGf4SLWBmwGhzdFZNRFlCu2YUnnHTUGFrQ1IBd/67MKIFfBj8YCoS7/Ve/VNMW1XOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813962; c=relaxed/simple;
	bh=L7cKhizCQY7urrRu8r4rtd4UkPii3KdSDeepYqGmR3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tohxuN85zThZtcHu5Myhi4zV5DH+9li0UxHVjlTb/8r2UzR6ZvNX3KKubGJMfZVVwjmOxTZEvOVOSchbUO1jGSxlFqeXzejBoM4eEbRi+PV6fLZP0gKy5gyfgcz/REY5SYid6xftAMdu90Eaz1mrkTpGF3IswC/+iOQVsdpGgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SYriWj+p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G1dgyLVG; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 5CCB91380627;
	Tue,  5 Nov 2024 08:39:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 05 Nov 2024 08:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730813959;
	 x=1730900359; bh=EmN6NQQjYQN8EaZ2rxlrXuF08e+mJ6x1EvwPpEhSfyQ=; b=
	SYriWj+pckJfXCieq+qyF1ktEMJwmNhHJ0rw965ibrDjjIBOvTEGmzf1htnBio90
	vM5B46WT6pquIQNOBVhAS4+hyxvm4bzmpeAxr9rJAGYiX7bOfCvSxB0hFGuqQzQT
	Ho970IO4SGRVxUKJKJsd1CTJG3WoElAwirYXyClBUQsV2vzW7kR5SJf4SaW+cPxT
	s7iOMi3J0IlqM6NKhN9d70+3wQt+flNh8oihcYF4KlVWQGFICf2VUWSqez8QGuir
	eVyQJpww1SXt4MgVIvuSehK3r/UKOc816YJ8DfDbiOQBztRZbtzTnE0Ldj3mg33U
	xN9L09ks6vD8m+MbaL7POw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730813959; x=
	1730900359; bh=EmN6NQQjYQN8EaZ2rxlrXuF08e+mJ6x1EvwPpEhSfyQ=; b=G
	1dgyLVGPjXn0AdYWg00B16ig21ai0moEdMNbZnB1WFsNVsXp9zT0+2Uz2Ysd4aLo
	FIqX7V3EqKlxa+0VaKqGMYqNyZbdKhtEZjC6WfveMekQhP73tRCPj4QMWRucr0gt
	xQnYteRaDiNTQohFXw4oa//r4PtEmBA36iDKJbLtbYn8FkpTtRHKj8MjnBdI+WwA
	sezDi2mLJLc0IX02ZcxeQ6yUshZmgBFoSOo6F2PWqtjNk5ItM/P4443tEqjh7Ver
	1cnJXvQbfRtk29BTBx1l8IM2G266nthZXwiCZzwU7b4sd3M8YESaAInZMDILuRFP
	Zq12PseINWfOIzWwnR1yQ==
X-ME-Sender: <xms:ByAqZznYDRBFG6bZFNyk2Ak9e4psBvOKXtOUQgnoZdx15R67v781qw>
    <xme:ByAqZ21iqlCVI4X0MTZ5b_hId6nRxwDtITJhZ6kUDUhcoM9VFWMWxuzqikHrdZuIh
    Fw_gExy5SCjMnUNXdA>
X-ME-Received: <xmr:ByAqZ5ou1qa7zzcHB6oChV8ZHb8j3cTNdjToQxSV4MzWV9O9vQn9nhmtnTIFW1H0RHLTrEn4McsGNpncF678ICziwg>
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
X-ME-Proxy: <xmx:ByAqZ7mf6z3O52ZZcS1ZQgQ5KYwMgoBO-EvXXAXOoeiIr_5g9YeyRw>
    <xmx:ByAqZx38ovfA-sWiMZOoHYHmIFBFEXbEdCnvow7LXUivkG2gYeKmaA>
    <xmx:ByAqZ6sCivBp4io11LJx2tssLtIIsHRnKayO8mvHul4Yg-jNa4j_1Q>
    <xmx:ByAqZ1VWapsK3anQ0Uou33K1aNoHdXPjYz-nn_H6L7tseaYB28PE8A>
    <xmx:ByAqZ-lh1Tvyp9dDq6PlHs5Smc8cKE-_7AHwm6D7uLNJs8imgFnfEdoK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 08:39:18 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] arm64: dts: renesas: gray-hawk: Create separate CSI/DSI sub-board
Date: Tue,  5 Nov 2024 14:38:23 +0100
Message-ID: <20241105133824.788688-2-niklas.soderlund+renesas@ragnatech.se>
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

Before adding the CSI nodes for gray-hawk create a dedicated DTS file
for the CSI/DSI functionality to reflect what is done for white-hawk.

For now its contents are limited to the Board ID EEPROM.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../boot/dts/renesas/gray-hawk-csi-dsi.dtsi      | 16 ++++++++++++++++
 .../dts/renesas/r8a779h0-gray-hawk-single.dts    |  8 +-------
 2 files changed, 17 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
new file mode 100644
index 000000000000..68a37e2077e1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4M Gray Hawk CSI/DSI sub-board
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ * Copyright (C) 2024 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+&i2c0 {
+	eeprom@52 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "csi-dsi-sub-board-id";
+		reg = <0x52>;
+		pagesize = <8>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 58eabcc7e0e0..1bd7eead1429 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -32,6 +32,7 @@
 #include <dt-bindings/leds/common.h>
 
 #include "r8a779h0.dtsi"
+#include "gray-hawk-csi-dsi.dtsi"
 
 / {
 	model = "Renesas Gray Hawk Single board based on r8a779h0";
@@ -269,13 +270,6 @@ eeprom@51 {
 		pagesize = <8>;
 	};
 
-	eeprom@52 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "csi-dsi-sub-board-id";
-		reg = <0x52>;
-		pagesize = <8>;
-	};
-
 	eeprom@53 {
 		compatible = "rohm,br24g01", "atmel,24c01";
 		label = "ethernet-sub-board-id";
-- 
2.47.0


