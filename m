Return-Path: <linux-renesas-soc+bounces-15701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCEA83A97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 09:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EABB4A513F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 07:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A7D20ADFE;
	Thu, 10 Apr 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k4umwnUS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECB5207A35
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269277; cv=none; b=Ewo8h+Rl9QSf51dhC+2Vzad7MogiD0KApcJip/4/bs15bGPTM52DwSDQUMJgrYGaDfMhkXicft29UN74F6GoewxsbG0c9fMLZ4MQj2BIqP3VtcC5oe+2FhLo/Kh+bYtpI1w7zlIrIMip+IvAZBTMAUCzNPOBhI8FMV8cP5YIbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269277; c=relaxed/simple;
	bh=2fUZs8XhGU1PAMG2Yz4QAOvA3tOGwe3xyuklh9/Szjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQpWx3dgKtzjL7ad9EIGATKJvrZIWtNgw7b2jiq+RutoCYCkBpsZkk0mgSDq4/rWMuXZ9MpHv7hewt6WxCNwIxRF9xLWuVU2nNAhLSHH6Q+bunQa+ybAtWpbo0XodQ2Hz6+PN34NOGXsaGdf2w9ZRpLboqB8HGBMgMM+s0kXeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k4umwnUS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=e5rqQuZntBiGKgTpE5PSupKihdnUU3EbZ1xt9vNXeVI=; b=k4umwn
	USD8rUMz1iY+Xz4QVYzGi2VVC6igFZZYwjFbhv+pXhkYFmOjDCkzUAvq3zAY18cN
	I/1m2yrq9xXs4h9pvkxC3VRMS34edUvkfcejl8xvxKQlVM2gRM6NIIAN5TGSUYo7
	C+da+TyjJueOQ2nadu9ixWs1FiBP0Mgn4XaKxb6PNg3+GpGDLNMmofP5ZdPnm0iT
	YUt7saQx8gpqHCoO8nRTzcqz+NYaGa3czd+TrwHXDlyjD4i1WCLBmfjQAD8mSKlH
	m/pr512qZ3ylI1n678u2N67yWsvQ7XprV8xVAqkO3kh4NgaUulpPGxNwHhhgsee+
	pfh/yG2j1ewdum5w==
Received: (qmail 783851 invoked from network); 10 Apr 2025 09:14:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 09:14:26 +0200
X-UD-Smtp-Session: l3s3148p1@hLD6VWcytq0gAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port
Date: Thu, 10 Apr 2025 09:14:09 +0200
Message-ID: <20250410071406.9669-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250410071406.9669-4-wsa+renesas@sang-engineering.com>
References: <20250410071406.9669-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 56da1d5fd5f4..ee875902a75c 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -66,6 +66,28 @@ pins_eth2: pins-eth2 {
 		drive-strength = <6>;
 		bias-disable;
 	};
+
+	pins_sdio1: pins_sdio1 {
+		pinmux = <RZN1_PINMUX(95, RZN1_FUNC_SDIO)>,
+			 <RZN1_PINMUX(97, RZN1_FUNC_SDIO)>,
+			 <RZN1_PINMUX(98, RZN1_FUNC_SDIO)>,
+			 <RZN1_PINMUX(99, RZN1_FUNC_SDIO)>,
+			 <RZN1_PINMUX(100, RZN1_FUNC_SDIO)>,
+			 <RZN1_PINMUX(101, RZN1_FUNC_SDIO_E)>,
+			 <RZN1_PINMUX(102, RZN1_FUNC_SDIO_E)>;
+	};
+
+	pins_sdio1_clk: pins_sdio1_clk {
+		pinmux = <RZN1_PINMUX(96, RZN1_FUNC_SDIO)>;
+		drive-strength = <12>;
+	};
+};
+
+&sdio1 {
+	pinctrl-0 = <&pins_sdio1>, <&pins_sdio1_clk>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
 
 &switch {
-- 
2.47.2


