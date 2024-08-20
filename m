Return-Path: <linux-renesas-soc+bounces-7953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521B958426
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 12:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 109D01F240DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B783E18FC62;
	Tue, 20 Aug 2024 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="feVPIFI9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0957B18F2D2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149186; cv=none; b=aOoSXd/JX35dyn7B/MknHz4MzSGdF+H3cQ0HOKFsgKp6zAIcr8tN4+wFewsRICnyjR79w9b0rUKvjPsbsJ4liCmQld8nU36avrFu3fEqHFIdHKXY18/xw6jJuWmcluNzFlrRuTjTL62qgK5GuGg/1PvMgri4YFGvKprhwAezf7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149186; c=relaxed/simple;
	bh=Q9iIpODth7YYPkTiwObtc/Vu532kq6EUhnlNSzyTv/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bqvEcpaJsuLZp60G8yN8PcXr/Oze29tTVVNZTV68esSVyIC4nbZpxbgZH2iPaSxjxwXh15A1SGz8GK9k3AXY5c3QLYXdIGEer8gZsmEKS4mWucHPpleMUe+DtVUxkzFMP0CUMg+l3Sbg13faC/lQ2FovCSmHmCF74/hGz8MGVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=feVPIFI9; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bef4d9e7f8so2914772a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149183; x=1724753983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgzIRDQoIKmsm3nYnkoWcg4ma4mnXZE//jousy+c5zA=;
        b=feVPIFI9YAqiYHwYJ99Opl3eOSpvcuOU8dJo+j/WoHYkCAL1hlGK6O4szfpqOk4vgr
         xCAm1zgEyJLdxG8NNxj9Zthmpqup2+DaBrrjwNv7ZF2qPcwqQLjE3t3QMWLP6PiY0S2y
         IDXXC0O5GNOEvJ1jeNi0h2LFIrrJoDmVIUdet1VTXChVk65c6oEstovCbTyuBqK1cxOi
         RKc03v5IMLzI1VZmJfXPqXcEvLOHBwdglm8Wck5gddga0E56lI0tvpJ8Yjd55QeoQpP1
         6V9mWHYAby41N8xqTTTw6woblPIE86dVsi2Ya0r/6J0f2bOE0o3GOpSwBfIceAZf11bo
         jOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149183; x=1724753983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgzIRDQoIKmsm3nYnkoWcg4ma4mnXZE//jousy+c5zA=;
        b=U31uqf5JbKMJqtt8BPpSwiYiWAErlVH6hYpm7IhXJ6tJg7N8tpw6aOX6tx0qIOV6eE
         LVfp/Mh+mIGqmdOhOn3u6Dm2SPzL19iIXQ8bjQhoVPERRPIVGLlvXGm1QgddAT3DJRuE
         gGEkZWLuyT86i2fN55DQvYgF7u7v/QoPq7C9Ozk0txvy8KO9+UrJPGZYgEIdwLKb2sSJ
         DsMcg8a4i0QXD4yTLgh+JLDMXX5GFftaKULO7ynUJ4ZF4ouuWAlN3JKuxOMWYGGG+JgT
         +MET1GcsllCarvoz1dUJD/qCyXK6Lobci6jS1qlhVxO+4X8O1Ue8PPwBvdPj7fnLFOJw
         cWRQ==
X-Gm-Message-State: AOJu0Ywf6D91YiiMMEvbWCFHyQSVmBKn0wAMmGFL6BMmdlVPxu+VDcYp
	msBTrED7jtTnMk21sqHD5WAlMNlQ2FKyko5jg7kVsdB/p7M5NZxVcL/vgFUaSyjD6KdnF1+yBZh
	2
X-Google-Smtp-Source: AGHT+IG1y4TM3uPVSYPAZR93QR7zvbIXBij+o8A9mykZFUyFsy5NQkdgN4Kgh2TpdEq+LxI4i44Tjg==
X-Received: by 2002:a17:907:7d8a:b0:a77:eb34:3b4d with SMTP id a640c23a62f3a-a83928a9cddmr940964466b.13.1724149183284;
        Tue, 20 Aug 2024 03:19:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 09/11] arm64: dts: renesas: r9a08g045: Add I2C nodes
Date: Tue, 20 Aug 2024 13:19:16 +0300
Message-Id: <20240820101918.2384635-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S has 4 I2C channels. Add DT nodes for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- dropped renesas,riic-no-fast-mode-plus

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 37885cd24f16..e44e8949e22a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,94 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@10090000 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090000 0 0x400>;
+			interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C0_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@10090400 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090400 0 0x400>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 272 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C1_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10090800 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090800 0 0x400>;
+			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C2_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10090c00 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090c00 0 0x400>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 288 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C3_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.39.2


