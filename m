Return-Path: <linux-renesas-soc+bounces-16431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22EA9FAE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 22:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C6C1A86D52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0032066DE;
	Mon, 28 Apr 2025 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRK3bIk7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366C1FE468;
	Mon, 28 Apr 2025 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873726; cv=none; b=MPMIT1gOXxNLrfEx2dnsJkGgMsZk8MqRjtqx7ZtF6sDL7aVDTqhBV5dRGgctCutXwbZ9ml70ueX2rDjYPf9rozQyptYRJ5VfZlcUXnJRFRzKYGup4pXJ7095pGvZeox5C+R3Dv/LsIoK0aiWt8beHYO7HeySYhJ2QGQgRNaXRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873726; c=relaxed/simple;
	bh=MMiTyfObOi0mhGJoCJpbicgGLh8idqkuf/Xt+cPSuMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBkqleEAmTZUvZR/3YQOCJQW7ItOB8TR7ASmcDWdZURdCuyf5ALPcvGzefNz9PzQ8Qb3GkRCm8GmzrvZou48RpATv9vzJINrAn1DANPSGo+va5GQvYpS/WsRmDhouEx/nF4fvlLNr3W+cJ3r1mZy5IHSmrOnkaadEN9tvOW3fNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRK3bIk7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso33371245e9.0;
        Mon, 28 Apr 2025 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873723; x=1746478523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmTH9g2hjp7t5U5CbL7v12p+NH5hcl+Sene4OMZYSQs=;
        b=LRK3bIk722FQcq27oc7j9K8ZaNn3IglaDnqJResl/Rg2zdHXqwqxkkw+Phdpkinvlc
         5BSY7Ppm2cqwFh6naWhquJcnFqtXRgXDa3OkAf/IsRQxUv322LA5JPYBsXTLoKMyItqA
         KzCCj6/WN3hsOO6YPjromWJvK7wABLQeC3cZUZXwLIifzFQOuVsE0i07sG4NlKuMa1q/
         FPl5uzuoq8a9OuUyj81+JbgLED6Y8UM53/VNZwFOZ15MewsDnHLBnRn+sg8iTyOxeb2N
         a4Y1M4FO+l2g+mnhCeYXy+somEgqJjRb9gOmMxipsCUX6PgQl0qo18c1B58LtW96oiMw
         KsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873723; x=1746478523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmTH9g2hjp7t5U5CbL7v12p+NH5hcl+Sene4OMZYSQs=;
        b=e+KgLoXalwH1t8CgVXbPtPi8mkadZeHnnRgqYOnkQAQMjhsLELtOvdPH7CQv9i4Ofo
         zvZLRqqjOhA/DajfWanz/JrMVrttK3vjeQ/fYwe5EdfKR6M7guVarwFHm87gqh+Synr7
         kuV4jkW55uSDTzryGGsWJyG9UBo74ZK7HkDBb12+78mJ9mXqP+9DqrMMzKuRx/A8+81z
         dmhZvcv3dhuFvTYXD9O2R74QYvh8IELxSDaLVAE6rA/f+u3lSo0v24170iIQMj6s/RIo
         K/7dN+6wmXmV3/lIK4QHpflIeHYdN4nyL39mVuX8toZbsOdO/nYFcOHZlowmFa5wX8XZ
         n1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV7kz4O3lx2t9VKk5ghsIFXTqiRucXi5ZOnfoTliwPnGNV8bMmn+cAeOhdZkI7/IDrr2/nRrF8qS7Yl@vger.kernel.org, AJvYcCVZBbm1R2LVvi0WczO8rw5TaE5tDAIZnQNfV6a3I2p6scF6r4SXWVwZXroENQUOMfdsosAckAYvs7sdpmIu@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWwN2Q2oOXjyPTy3mAAmv5ugmPPsXVmIYYizJSWbjlQKhfi0L
	PgFHVyBgTu01tDAL2cyG3JvRbQDc9nqjHYSbOCzZLqZ7HspHchNPgtFfOjdh
X-Gm-Gg: ASbGncvqytmzGveBbMvur0l7DsLzvPrMnKokoXaa/3o10OLdnvKuoCLcPGfsMNRD7jm
	zNx9xsRzkBOWzrniph797p9YjTD6Z4F08zo5m3v1b9281Lj0O3pL2SSNNzksiPb0g7QijlhQMLO
	NcQCQIpUrP5NboFe+rNcbMoOEAfcinYmFG2pRHaCeVEnCVXNjtWMsu1PUVul+ykPQocCL2ufCor
	PWHun1Td8CVnkynTOESNHkppgshJebmrVI/KKHlylk++IvSnRBdNFAU0Bj4CB7qXa79JgB5hfIB
	Da2PieW1hQDkhfijZ5Umz0sPon3XRN8O3RjdMu93iQXEvIhoD7u8zjkCJA/uQWVRIfGJZ6StSA=
	=
X-Google-Smtp-Source: AGHT+IEr8YmC+G5tsSYX4vcQSKxRDWcFzJK+Xld+DzAo2nfPMmX4hDElOWzxC1FA153cd2pOeVzq2w==
X-Received: by 2002:a05:600c:b8c:b0:440:6a68:826a with SMTP id 5b1f17b1804b1-441acb54c61mr4317625e9.13.1745873723167;
        Mon, 28 Apr 2025 13:55:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2ac0sm167845705e9.15.2025.04.28.13.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:55:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH
Date: Mon, 28 Apr 2025 21:55:18 +0100
Message-ID: <20250428205518.454960-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the GBETH nodes on the RZ/V2H Evaluation Kit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 063eca0ba3e2..6b12bdc3eff9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -16,6 +16,8 @@ / {
 	compatible = "renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
 
 	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
@@ -78,6 +80,68 @@ &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rxc-skew-psec = <0>;
+			txc-skew-psec = <0>;
+			rxdv-skew-psec = <0>;
+			txdv-skew-psec = <0>;
+			rxd0-skew-psec = <0>;
+			rxd1-skew-psec = <0>;
+			rxd2-skew-psec = <0>;
+			rxd3-skew-psec = <0>;
+			txd0-skew-psec = <0>;
+			txd1-skew-psec = <0>;
+			txd2-skew-psec = <0>;
+			txd3-skew-psec = <0>;
+		};
+	};
+};
+
+&eth1 {
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rxc-skew-psec = <0>;
+			txc-skew-psec = <0>;
+			rxdv-skew-psec = <0>;
+			txdv-skew-psec = <0>;
+			rxd0-skew-psec = <0>;
+			rxd1-skew-psec = <0>;
+			rxd2-skew-psec = <0>;
+			rxd3-skew-psec = <0>;
+			txd0-skew-psec = <0>;
+			txd1-skew-psec = <0>;
+			txd2-skew-psec = <0>;
+			txd3-skew-psec = <0>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_0p8v>;
@@ -172,6 +236,16 @@ &ostm7 {
 };
 
 &pinctrl {
+	eth0_pins: eth0 {
+		pins = "ET0_TXC_TXCLK";
+		output-enable;
+	};
+
+	eth1_pins: eth0 {
+		pins = "ET1_TXC_TXCLK";
+		output-enable;
+	};
+
 	i2c0_pins: i2c0 {
 		pinmux = <RZV2H_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
 			 <RZV2H_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
-- 
2.49.0


