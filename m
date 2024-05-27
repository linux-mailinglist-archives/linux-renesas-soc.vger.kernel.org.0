Return-Path: <linux-renesas-soc+bounces-5523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B82008D01FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D28E28C649
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0691E15ECC5;
	Mon, 27 May 2024 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fi9hJ4Yw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m2Bw0Ejx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB215EFAA;
	Mon, 27 May 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817311; cv=none; b=eERWYNfvj4jsvBbuvc4m31HehktBRCWbCwPVY+6ahptrCjcBM0OGXa6+XycCh0wgMWdXdEZm6enKj2QoOX5kQV+c2jIoJfPA4lggJBHwml5L7fu3DoICuvXQtTSAi0+Sjb65xah6y9BrVbNQYnjHxCSHvZjhLpGkYKsFhHPQ1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817311; c=relaxed/simple;
	bh=NvgkT0T/8W72+nN9IWa4orD8xVL6qJKpHkchgjIy8rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrX/unwugWcx5E9gUhx2VRqQ5s9YBssSRtlvMq/G5krqXEMmH2PFhoQ5WMt3TcyMERXfSLP0S+cXe2H4WL24jd2PSdPQGlCDIbhoY0NBWFTCCCdIiHSnkqDi1ZZQ6NDVxdM1lqIvNBPgFcr9rI1Bx1W2B4P0lf/5V1Yn5YwVfpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fi9hJ4Yw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m2Bw0Ejx; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 7E4F218000AA;
	Mon, 27 May 2024 09:41:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 09:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716817309;
	 x=1716903709; bh=JXv6iCX2Dm9zBiffMlu8ueFRvQCJG3JgXyNHarwa54M=; b=
	fi9hJ4YwtVWAavoa/+1fQUFmMJVHwGOgypthRUkGbtQ3CKyxOcFzaqvUXSro7Y2u
	gc/hbh8jS43EVWVKT1ucYyAgNrj9yD38zqmQljuKXp1ziQGeLt8/hva1OhAcr9xR
	PK/7+pLMMF6hYu9dmQDq8F4OTwZg0YrSk5CSw3UtT4dPL4LsS882NjD1LEiRhouP
	5RxgQYlR4E4lUd8o8rzARXJtIyLDNGs80GoGSnnn4S2I0eWxfFnJI521TCBm/JeC
	iR5QKoL9hxzxFnPEhNz3+6W6z9ezJOrQNrYQZ5GPZ+yoE/v3CyLwmDonLI07aBZE
	PAyPPM5GujCxx+XgcnLfSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716817309; x=
	1716903709; bh=JXv6iCX2Dm9zBiffMlu8ueFRvQCJG3JgXyNHarwa54M=; b=m
	2Bw0Ejx3aFtylXwxajxOE4l+2zi1GHU3uhPbqQQrCnLPh+AQ03tILyb99NKquqZw
	NYoncwsHvKpmshXrAR0XfEi1yO/v0HDF9fxcFGOaYaQPmT5GlbL3suoRL6rL1k+y
	50+FIcyliOmhUs/73ZQSyMMuhkiEZRjadXUVlsHNK3Mn1QiQJhBftLR2UvRE8N1c
	yxruPmaRQ6C1zyKVwR1OpaTN1UHlu0iFp10dxI81IG6p8rbhT5vb4GtfLRLiPLpx
	v61ZgaP5ZhNBPirn2UfB9yPnqCjWk7LIBpRVtrxlf3djyNA4JteVKFqpWH+Gx48p
	vuMO4y47XLAD3uLYmKyDw==
X-ME-Sender: <xms:nI1UZm5Nhva8RXk9-T0BL-lBzseg63-2PcBwO0m5zWFoCViLLbApmg>
    <xme:nI1UZv7nHa5s0tmRpATP5iSEYQ6kApiwnLLA3-C3QA0-EoOPBP1RovJ8sMhFQ0yVy
    OdiZCEKKQVze27vmY0>
X-ME-Received: <xmr:nI1UZldTshrAXsvJFbF1EQwMPpPL6MnGB5i8AGXq4bdUg1aSbousGBZAYA2m5zgkNQEDK4rfnzqjAhzxRUMY-GO8HTpr164YZINp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:nI1UZjIS5R9-ShJoieN3yssFylrgfkL3pi0ifA7fsZ12ObtL9n_CDA>
    <xmx:nI1UZqJvPcGV1EuOczx43KWSle4aQak5qj0bYfIhY47YUh_0P3-CgQ>
    <xmx:nI1UZkywsl_vYG8-mKMcRjys6a5EA7tb0lXPBofqTHl-_LgKhX40SA>
    <xmx:nI1UZuLpJipevwV8_A1_PM07MbvN96YXcKCFjuEWjA1F98lZBCfaxA>
    <xmx:nY1UZrpt6cLbzxKSUMCYDj_AI8gng9huseHmj7JjO2ZF2BsqFFNanm6O>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:41:47 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] arm64: dts: renesas: gray-hawk: Create separate CSI/DSI sub-board
Date: Mon, 27 May 2024 15:41:28 +0200
Message-ID: <20240527134129.1695450-3-niklas.soderlund+renesas@ragnatech.se>
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
index bc8616a56c03..db144833550a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "r8a779h0.dtsi"
+#include "gray-hawk-csi-dsi.dtsi"
 
 / {
 	model = "Renesas Gray Hawk Single board based on r8a779h0";
@@ -111,13 +112,6 @@ eeprom@51 {
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
2.45.1


