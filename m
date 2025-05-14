Return-Path: <linux-renesas-soc+bounces-17088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F4AB689B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D9A860A85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA2D274FE9;
	Wed, 14 May 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfNNHJr2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F044D25E823;
	Wed, 14 May 2025 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217745; cv=none; b=E70WMRvVHHZjyKdkm1per4nfzuzcYnOi/Qlk9ncPs1LyFdk0UW4S0fT20yE01kwfGf4uaxTGW3w60JBEeHukepdMDIxk3bdZSPax2GKuiBzFGGXW2iPnD7YfnQWc/5NxaiB9MScftOQ30Lbto1oxlK+w/6IdtjXOY5X5Z0b7wGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217745; c=relaxed/simple;
	bh=gMzlFaO2/6LG2a4bPWTfy4O4Wu9thsh9R11WLd+Ss2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CspsgZmlGbuyYH0mxEr7tY61PZq6vo+pT7l56eanViqJAEwsZJMnuOsxwHQ/3xBhSK1k7RNpWy8/xDujEfHEpv+l7CN1LRrmoxCK+ZLKhliLm6Jzf2JMdwaRQ8B+yFpIEJzAizLthn8qnmVtu0S1WFn4wMQfAWgi9ItAs2ebPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfNNHJr2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso60964605e9.1;
        Wed, 14 May 2025 03:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217742; x=1747822542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwEK+m7Yr9FBGheuEEJzwULjttmeOXf1lJpuTzlZg9A=;
        b=AfNNHJr23I+MefP2aODBDkD2/rgflKWWBO270rnMdIOikUGTqbUGQ8RMNjVtUu75L8
         4/cCq95F0A8DHi5vZEo+ghzq/80bMuihCJ+csQHyesRZLAunjRr4xv8951IKn6Wv/rOb
         oCK9yKmJA/cLeXM8MOwDSvCDU8QkQV6GR/tBkjX+UavFWP+9YcdXYCuu0rL3hlE/YsSG
         0Xojc9DTS2epc82z6C3NHq+4LhbJ0qE/6EV9o05dRBEW18HaMkm8ZNeEqDpWUMhxcsQA
         VFKlbgsH2dZrex2wvym/19iy+OldmlIlxOFO/IWiONBViFMDit66kB5d+G2LryRBwzWa
         641A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217742; x=1747822542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwEK+m7Yr9FBGheuEEJzwULjttmeOXf1lJpuTzlZg9A=;
        b=syG2FXFQpjsEzracQK1vtxKidMLRkVlF1FHNhcheB+AoPGnNtxB4IpFFsfLNZN8ACn
         d7GgD9i0N9kCIMiiz7OHXB4mFUh2mvvFbUEgcbYITyHKE19J3U/4Ysdm6TihoOWWWMIi
         8C7KLs07KYY8G11TSddXLKjJjHl/i6gc9sQC2W7ImNnK/K7Ica2nYmi4H9ox3DuwZj1r
         f3x66hCcG8faoF7JWIJTdMK83rvVLWZrQudXXAaohsZWrsEMLKEZK9mts6nG0RZK+2fT
         2BHbSUJSbLd184M7uHuI4MkHkB6XPx7weD/HGHBY+S0K4xbKIRX/7hKOL7qdmyS8AeIa
         5rnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBL2hiesM2uWHhwpJk0Yu+zgSbly7xkMkbKQxJoHG97KFSVK/m5qW0C9VZDMb4aQ8PBaix91WQCknmgIF9M54G1xc=@vger.kernel.org, AJvYcCXXotzzplC0gYXidlR3H4gH1F+Us4x24GzsT4VnsB4bS0U7BNRJfct1W0SpRwCrGqPU/RFGznHcrBueAQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY4C2pOM7KDm0vK/WcY6K+VGBzpfSRT5QAX0Tq9cLPCob/ykh8
	l/M+W2yZGW4BHJCUEiIzUbNEkVq47HbHckZybpn6P+HIAwvbTy2Y
X-Gm-Gg: ASbGnctrqR+gPB7rdl3tD3MOwkd0/ff3xEIm0htBsXr7tKcVXblIoAW9nrB+GauxLzP
	EoD4lCOdCOA8BmCKEmFTjdxs0CoMFpLOVn8Mcv7SThmuPhZeBxhpW9MKCPcK0yEAp+bpSyKU3J9
	TuphVdVfajIL/YqqvbGRkx2G/MwnsQLmGIwb6nf8ufJlKLaVV3+Gf3wns3+3OeRA1CsZjNGu+M8
	ssEDvnVRdic2CThezERq2YsA+/nS20N5sLgPmKyKLNXPYXY/62VPgCiPjsCtv9QoI9OSYwKnfsa
	xg4LRgYusxWw6BStjTEuOWrnv2RbGEd11ME3QoA1exKhfxajKujQ4KR8EpqKMJDIXqM/06d7CjM
	N
X-Google-Smtp-Source: AGHT+IGGV3OTMnR4GryAtEPQGssBDIEAW5tAvvOwj2u1e6tT2cFFE1PYk9ne8Gra+ep/klu5QmtYDg==
X-Received: by 2002:a05:600c:a00a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-442f20b9ca0mr22302065e9.6.1747217741803;
        Wed, 14 May 2025 03:15:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 06/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RIIC controllers
Date: Wed, 14 May 2025 11:15:24 +0100
Message-ID: <20250514101528.41663-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the RIIC controllers 0, 1, 2, 3, 6, 7, and 8 which are populated
on the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 518426dd624c..12de1c21fef5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -17,6 +17,13 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
 		mmc1 = &sdhi1;
 		serial0 = &scif;
 	};
@@ -72,6 +79,55 @@ &eth1 {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
@@ -153,6 +209,45 @@ eth1_pins: eth0 {
 		output-enable;
 	};
 
+	i2c0_pins: i2c0 {
+		pinmux = <RZV2N_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
+			 <RZV2N_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
+	};
+
+	i2c1_pins: i2c1 {
+		pinmux = <RZV2N_PORT_PINMUX(3, 2, 1)>, /* I2C1_SDA */
+			 <RZV2N_PORT_PINMUX(3, 3, 1)>; /* I2C1_SCL */
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZV2N_PORT_PINMUX(2, 0, 4)>, /* I2C2_SDA */
+			 <RZV2N_PORT_PINMUX(2, 1, 4)>; /* I2C2_SCL */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZV2N_PORT_PINMUX(3, 6, 1)>, /* I2C3_SDA */
+			 <RZV2N_PORT_PINMUX(3, 7, 1)>; /* I2C3_SCL */
+	};
+
+	i2c6_pins: i2c6 {
+		pinmux = <RZV2N_PORT_PINMUX(4, 4, 1)>, /* I2C6_SDA */
+			 <RZV2N_PORT_PINMUX(4, 5, 1)>; /* I2C6_SCL */
+		/* There are no pull-up resistors on the EVK, so enable the internal pull-up */
+		bias-pull-up;
+	};
+
+	i2c7_pins: i2c7 {
+		pinmux = <RZV2N_PORT_PINMUX(4, 6, 1)>, /* I2C7_SDA */
+			 <RZV2N_PORT_PINMUX(4, 7, 1)>; /* I2C7_SCL */
+		/* There are no pull-up resistors on the EVK, so enable the internal pull-up */
+		bias-pull-up;
+	};
+
+	i2c8_pins: i2c8 {
+		pinmux = <RZV2N_PORT_PINMUX(0, 6, 1)>, /* I2C8_SDA */
+			 <RZV2N_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.49.0


