Return-Path: <linux-renesas-soc+bounces-3624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684A876E97
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 02:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59221C210DB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 01:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD94620B22;
	Sat,  9 Mar 2024 01:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iMqMYP/W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893B208CE
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709947825; cv=none; b=QgLvqpbOgigxmaYO5zEUHvjszBgc/loZkvWLZEdtgvzbB8pcw4z88O4Nofp6OGwau8ymm1xrqaKMUPHlf+l+dOg5/gKERNuvvaRbff09C+eQ1SDrchFmO4wLhDWS4MYuhixtS41NOi1zUnVPexnQQCkEBKE1Gy9B8MO67wQaFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709947825; c=relaxed/simple;
	bh=6JLS9XtJthyZNsVcRvf/J5r98HQISKdE7k9XpX52Tcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FNmtPzJ0eKtCJP7+WivwhXHbMdCNujLGTelFO2UyoMGpL182rLsdkJfeNFbbwJriqpfPnJjOShJkhJkEGYjI7e2KsUZEVy0v3WcvYzg29+1tDYaowybNyVDCQxhenV5RSaO6uFf4yAwrLfbe+3kyxsk/NUiQQ2wzivTVEF3940c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iMqMYP/W; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44665605f3so412231266b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2024 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709947822; x=1710552622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PxJ2SOxGIosGDttkF6GdKdarJ+ynoP7ZVyokSWC6nU=;
        b=iMqMYP/W+mSYCOEQclEsvGzcFSiO7qG/EOmIdCp7KIhH7V0b9FP4PnIMKXfYSMeBJC
         KtbFms09XxXtLiguPTWV4jkieEYNYRMFW+FyijdHLRgxdvEIRBWI9x0QS2dd84PYc/st
         lCAAZxFJ4oVUidAaKjD/sMTP9mVhtwWMHhSxcwMzphieyiEzomB9WQLTHCvuOuVcIrDQ
         clNd7ozLqjLMwHIo22YVm1d/lwwzsLEDdC/gkjdCwVc6w+NcYZSe0Of5K2QzxsuioTJJ
         JDHx4I4iJQqvsZgfi4SbhhXeUwS97G29FFfWoSBqvMyY1I979DQ0tGN1DoCKmYVbI01v
         U+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709947822; x=1710552622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PxJ2SOxGIosGDttkF6GdKdarJ+ynoP7ZVyokSWC6nU=;
        b=r2KVkmKlfFQFUMz5kkaLwEgf64KOPGsBdiRjSYgWRp8qW6OU0yZLCnwejpoeDyIstD
         F7ZBbk4J4T5N3MuOIIu3WxUsB6XRV778WBgqUIjxyYIzYWBho+jdZPNrIoV6l/9aheZ+
         0w8b7bHVT8iZvbX4ENTwV/sU2fM9uFq/JSMXH6Baw9WYJhkvF9llIFCKDbUzf0dHtwVH
         i0x+foZmdERUmgwDO6oEhS2WxO8YJqaeKTVj50FdbpJ06/lO2odX48gS+VR2BdkqyVDC
         XhqelBRmZXv2qmtnm5t0GFakpSqZF3oY/LHUL0apZz0bB8DTRbv2Um5rGU9DxKsQE5qv
         aYAg==
X-Forwarded-Encrypted: i=1; AJvYcCVOnT2B08eDv++skpm35NrtTf14Ecr0kCphnVKQtchkMedxoMQ/t7yXpPdaPQ2u8o6/QBIdtW94mdM6LpjmnWK7U1PXBgCGVwm4Pw+bDCwEZc0=
X-Gm-Message-State: AOJu0YxYV3oBXHiZkXUX4torS/DOv4nzGouh2Ytv8yDmfdRwWhzAK3Qt
	5B1IVKhmJflKBfV062Wi+vVln+zLSMGrl3GEzkTty97lR7ts7+3ohrmLW5QVugE=
X-Google-Smtp-Source: AGHT+IFtxPJgW6WaHDRpF1vi5nPWnMrljAz+xZqh4GRtG6YnWHWdBV6n9WzSmznR2zLjV4SK1ya1Sg==
X-Received: by 2002:a17:906:f294:b0:a45:bea5:b9a1 with SMTP id gu20-20020a170906f29400b00a45bea5b9a1mr183033ejb.57.1709947822295;
        Fri, 08 Mar 2024 17:30:22 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id zh16-20020a170906881000b00a44d01aff81sm345320ejb.97.2024.03.08.17.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 17:30:21 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Describe adv1 and avb2
Date: Sat,  9 Mar 2024 02:30:06 +0100
Message-ID: <20240309013006.723934-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the two Marvel 88Q2110/QFN40 PHYs available on the R-Car V4H
White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
up on the board by default, there is no need to move any resistors which
are needed to access other PHYs available on this sub-board.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hello Geert,

This patch depends on the update to the bindings posted in [1] to not
fail DT validation check's. However with this change I can bind to the
two PHYs without having to touch ether the PHY or RAVB drivers, the MDIO
core handle the reset of the MDIO bus.

1. [PACH] dt-bindings: net: renesas,etheravb: Add MDIO bus reset properties
---
 .../renesas/r8a779g0-white-hawk-ethernet.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
index 4f411f95c674..63e0fdae4ff6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
@@ -6,6 +6,38 @@
  * Copyright (C) 2022 Glider bv
  */
 
+&avb1 {
+	pinctrl-0 = <&avb1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	status = "okay";
+	reset-gpios = <&gpio6 1 GPIO_ACTIVE_LOW>;
+	reset-post-delay-us = <4000>;
+
+	phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c45";
+		reg = <0>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&avb2 {
+	pinctrl-0 = <&avb2_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy2>;
+	status = "okay";
+	reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
+	reset-post-delay-us = <4000>;
+
+	phy2: ethernet-phy@2 {
+		compatible = "ethernet-phy-ieee802.3-c45";
+		reg = <0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c0 {
 	eeprom@53 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -14,3 +46,45 @@ eeprom@53 {
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
+		pins_mdio {
+			groups = "avb1_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		pins_mii {
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
+		pins_mdio {
+			groups = "avb2_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		pins_mii {
+			groups = "avb2_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+	};
+};
-- 
2.44.0


