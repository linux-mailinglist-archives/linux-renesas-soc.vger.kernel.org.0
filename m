Return-Path: <linux-renesas-soc+bounces-10340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA819BE0CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30A68B23859
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C311DFE0E;
	Wed,  6 Nov 2024 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lpYJSIL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200261DFD90
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881218; cv=none; b=nk/w0oWiXQ9yqmWlfSNpsPFofeIV1CSuT4HiMiW/lIG2G9XlGWJw+JMpKh+9bVM1Og0LyNw8peyMWUSeuth8Efr7cwAuuBYv8DApYJfYPJa/9TaQ7d24eaVZIDQ2nlQtpQN9tOCqa9M1aa4N5L+RPZb1HwJdXvClyAboIHbttZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881218; c=relaxed/simple;
	bh=LpIbzPFjwsAuKikvHGjeyiUJeiUOA++o8NTMXkHmCp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkZ5dzrudBJy0v6LjQXebADy8hNeD0v7q9r9OgSCHYEzV719mwLLg83fVvmZGNeR/ucqMbSyYaBUbCFvWRnyQPXURNGimU5+GBnhW23buhFuqlqeIbAQuXmB7CEjETgKH+Bmk0OV0OTaCcT9m4/zHfUeIKNnwnc1PdSqbKA1aC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lpYJSIL5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9e8522c10bso97364366b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881214; x=1731486014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k96qqoiSoAJXSyNkvAC1mj0FJdsWESn2VXmJGjv0jRM=;
        b=lpYJSIL5ULoVKQoBTye+7k3hrMwOuGiQQMWxgJLqMfl6JsiVEkc2Uy2ASSV3YrwaIc
         6i9SInFyWAOGc1SYipW0ugDeFdHqG/G45YG9AjJouJGGMHFBRv11+QlPDhQ8nxb5TNvj
         NVwHiAo2YO/959bEKbX1Gga6p9vCo/PRO6LtiGJZBUxyoAVw9RCNJPt3TCAt+PBbWC5N
         TU1pKsOJyWANp2+xY3g52o2YHACGnI/ZjXR1qIYjtuLcz0JZIzQPfbEVMHosyIpzg+8B
         DYbBAVW7sw0q9PdapCP7qzPOnMoQ0ZFpfc/kLNo9hGIg/qG7xkBhuVX7Wr8cWrwp0pyi
         0kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881214; x=1731486014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k96qqoiSoAJXSyNkvAC1mj0FJdsWESn2VXmJGjv0jRM=;
        b=R/Z8mqiXa+L+z4bWJxCGlUrlSZoyU/6JR+bNIx2nExWfWaCym/wrKvcoyCimiyaihQ
         w86zr0yfsreWLJV4Yv6Rm/M+REvTI3OJjbjz2dh35Mw6GMqde2V4WcGO2C5yUsZirsi7
         rTQ4MQ18soBtqGwQ241cwD2YRVK46C0v5hJ+UQYuEtcmqEwddMF3FhdfqpnBw+s/UIz/
         yPbZ3oSkEXXYjrT0wR8TQsB3qCxBPpKt4+k7Nz6jjS8AH0TEir3XQyRs7652d3S30Qc/
         tGi+bywkk+cUVQdkwMk+cm2RMqQc0zx5S3dHwy3u8h3aH8u55th3hTiIpZ6+mSw+cb19
         uQaA==
X-Gm-Message-State: AOJu0YyP0OuYgNkjady1LQSDiCAOQh2Tv8c5ZTkliTt3BVxGjEHzOnxM
	I4jEo5ri5JZ+k4BW+GvxitdZvrckcxTf5ZvA3UEHKsL3cuSSOUTD6fjo6B6Xz9o=
X-Google-Smtp-Source: AGHT+IFejo83GtgXEStBFHu6ymQkjBmABkbjKG9E9Yg9klCKSbOtKr0rxTFD4KQNYRvY76euAWDCxQ==
X-Received: by 2002:a17:906:eec3:b0:a9e:c266:4e82 with SMTP id a640c23a62f3a-a9ec65d07b0mr182988666b.6.1730881214452;
        Wed, 06 Nov 2024 00:20:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 27/31] arm64: dts: renesas: r9a08g045: Add SSI nodes
Date: Wed,  6 Nov 2024 10:18:22 +0200
Message-Id: <20241106081826.1211088-28-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add DT nodes for the SSI IPs available on the Renesas RZ/G3S SoC. Along
with it external audio clocks were added. Board device tree could use it
and update the frequencies.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index be8a0a768c65..24c6388cd0d5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -14,6 +14,22 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	audio_clk1: audio-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+		status = "disabled";
+	};
+
+	audio_clk2: audio-clk2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -187,6 +203,86 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		ssi0: ssi@100a8000 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8000 0 0x400>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 241 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 242 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI0_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI0_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x2665>, <&dmac 0x2666>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi1: ssi@100a8400 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8400 0 0x400>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 244 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 245 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI1_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI1_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x2669>, <&dmac 0x266a>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi2: ssi@100a8800 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8800 0 0x400>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 248 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI2_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI2_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x266d>, <&dmac 0x266e>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi3: ssi@100a8c00 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8c00 0 0x400>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 251 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x2671>, <&dmac 0x2672>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.39.2


