Return-Path: <linux-renesas-soc+bounces-9070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173598712D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDB6F1F21E49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156EE1AC883;
	Thu, 26 Sep 2024 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SJizzV2K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111241AC895
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346024; cv=none; b=lmrxEnG9n+i2SFiX5bnwWc3j9MlRf/QmnXHvBYmAegszQ3hjzwF9/mwfNsEMusSRUTtKuUTH7iHrt0sEKOIP9bQX4Kg08tVIciaAMGbMZh6tMxvQpSistppq4MjwQD4bmLWsXLJ4fQmorwbVjDFgsN4xKgQ2SxIk9Hn7XsCwagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346024; c=relaxed/simple;
	bh=ECrYGmRV1GxtJF5TkxsaZawhiGOpMXSOAEji9zPozvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV0XrKp/5tCtH/5kAs7oPvlIcgPp+prHtsnwUvWtb24RhO+ivv9CLJp2LDot8Cb1jZJHQJuAKu31Nrcr/TqxLZimXl8JeXcVyl3jFktq/Co6JqrojW7tET2F9BoKyyRGBtUO7deq+FYITc0WT6dBEP7UsjQVIXxeajYkue+iucg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SJizzV2K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mw0ZBmYkud91LpELGHv6PYztlihbUqky9EPbTqU91QE=; b=SJizzV
	2K4ZxJ+1b+9rlLOYy5ruVJg881RY6XoJRwCaQ2K+ukL3wF9LNz/zZBFD+WoM4Cn5
	2dfQXYDGqLluIjSGvE1TZqPLd3bxaxTB1JUwLgPKHG2AM8uPq2THNuuNkDqmLBTC
	ybMjHACFMJng2A2I7eeCEe5S0se++1EPu4YGu8hKjVmfg6qo+8YSdq63DZuqCs7S
	L1rXL829VMhNc+XN8bYAasrl0Q9VSx/OBa3TpagSwv370d+MWYaXMmoinqpiM4yf
	5crYg3XKtszTbnXN6pphnlRgHGMsrJxgbyHTSjkvy6ldHkH5YW8p2Bx5Qd5EEv5B
	kl0RuufjZo5PT4LA==
Received: (qmail 946932 invoked from network); 26 Sep 2024 12:20:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:20:19 +0200
X-UD-Smtp-Session: l3s3148p1@6GjoFQMjttQgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: renesas: genmai: enable MMCIF
Date: Thu, 26 Sep 2024 12:20:08 +0200
Message-ID: <20240926102005.15475-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
References: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luckily, I still had an MMC card lying around. Works fine.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index e93f444b2442..d0b2b4ea1734 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -88,6 +88,14 @@ led2 {
 			gpios = <&port4 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	vcc_mmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "MMC Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &bsc {
@@ -179,6 +187,16 @@ eeprom@50 {
 	};
 };
 
+&mmcif {
+	pinctrl-0 = <&mmcif_pins>;
+	pinctrl-names = "default";
+	cd-gpios = <&port3 8 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vcc_mmc>;
+	bus-width = <8>;
+	status = "okay";
+};
+
 &mtu2 {
 	status = "okay";
 };
@@ -224,6 +242,20 @@ keyboard_pins: keyboard {
 		pinmux = <RZA1_PINMUX(3, 1, 3)>;
 	};
 
+	mmcif_pins: mmcif {
+		/* MMCIF: P3_8 is CD_GPIO, P3_10 up to P3_15, P4_0 up to P4_3 */
+		pinmux = <RZA1_PINMUX(3, 10, 8)>,	/* MMC_D1 */
+			 <RZA1_PINMUX(3, 11, 8)>,	/* MMC_D0 */
+			 <RZA1_PINMUX(3, 12, 8)>,	/* MMC_CLK */
+			 <RZA1_PINMUX(3, 13, 8)>,	/* MMC_CMD */
+			 <RZA1_PINMUX(3, 14, 8)>,	/* MMC_D3 */
+			 <RZA1_PINMUX(3, 15, 8)>,	/* MMC_D2 */
+			 <RZA1_PINMUX(4, 0, 8)>,	/* MMC_D4 */
+			 <RZA1_PINMUX(4, 1, 8)>,	/* MMC_D5 */
+			 <RZA1_PINMUX(4, 2, 8)>,	/* MMC_D6 */
+			 <RZA1_PINMUX(4, 3, 8)>;	/* MMC_D7 */
+	};
+
 	scif2_pins: serial2 {
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
-- 
2.45.2


