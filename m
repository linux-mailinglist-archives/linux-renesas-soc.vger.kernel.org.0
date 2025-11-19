Return-Path: <linux-renesas-soc+bounces-24825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFCC6F6E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 35D103A857B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1173659E0;
	Wed, 19 Nov 2025 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TqqOeqlW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59C364049
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562952; cv=none; b=Gg975AAfiUKUVHQeeoiCOqhOwY0dJaN8gb3rMez84N5b3Ka8Bbx5c/uJ8WC8JWVOfMPZJsCkCUAPQCfXA4Cj+Du9Tar9+GW/azbDG5Znua1yEkdZS0QZrUkAW/M1s0yEDlAgdl/owBe6SvXXLCmM6biufmw4u49BePnBGy3Otio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562952; c=relaxed/simple;
	bh=oLgillCwr3ol7/w9E4u4ksaOb+6NxowwyKm+wJrPQtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RImLRvc/nQhVcexX27TF+XQzN5kfj92/Gqo/2Ll8N65rr69OMx1qcO5cLyTEVu7sftyOaVYQrNCY7g5XKBcpddspRzRBTDtrfKuBS79trdvgQhIOOcpai9oEbMw12Kj+Y82mfKRzdi7gbpJ+uRsayS+nSMSvWck5r22APO+txLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TqqOeqlW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so49539455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763562949; x=1764167749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM2VhAUMoufw5+LLnfeRxVHnf+6zT5XAyOCZf4oWdrc=;
        b=TqqOeqlWMdP9ohoZyILh0bDpE7jYR1vvY64luk+d/tY4PnVO9lseoDeAoQpy4ivcVi
         aaCh4qblPh/0JOOdCbnzZUkC+9tcJx8eUCOxlBpFGW9EbUP8IahvEXXU3hZoSH5OypxR
         5EPh22azZPtSh6yECT00WXZBcinUzt+7DFjS7G34ir3qSU9ewnACex1ZskGewfr2Pp/l
         TB5Kl1TVzqhp+rfHLYrHYaDhB04imgGZ4xeXYlJTT1wyM2SemTkwjp9tgYqAqMsbLMjU
         o4MRp0sE8q7yUS3akAPn8x22SEooRe2+O2OcRjlcsBIpGsgaN2GE4RrVk0F0tlwb4S08
         p63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562949; x=1764167749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IM2VhAUMoufw5+LLnfeRxVHnf+6zT5XAyOCZf4oWdrc=;
        b=YUGqssQ0LXBbBJfEtyjBFMQd584HY1xF/LIwpwsXB2yqGf8U0q+4bNTuARom89ehLc
         nZ4wm+tBH/S2alXKHk9Lb5b4qaL9GZ+PI0Fk8Oeg+8fSiI9cSNijF8KzuMQ/sGbO3XVR
         zXxrDV3oz8m7cagJ5wnrLukwcpBMbNqp8iDI/1thoUhwovyAwuHxPd/JTZfpHJlVF0yD
         kTq+PgP59cFupcGUgQWcYLz0bLJ2Vkmc3ky3A/r+8f29jVAasUehuIUIGakuaJH5RQqW
         wUpOxifTJIH0hOfd1zsvb8cWmhtdH9qZ8viwbrk3gGvFVKJuhAIf8TgvHGRgBjcbchsr
         m2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXGKksAntC2Yr5m87e66IgJALN0gG0U8NRqUMD1Iap9w1AWHnKbJqyxGwRS4huvqmZ2N9YMYRrJa+8pXbXtPTy2pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXShkf+ZEaPefdayrJskWs58OxA3+L1mkzkREZMWxMikl9W7t
	GMBZJj40U8JJVENYoRXB1gEteJKdqC4ROWeoHUnIEhvCTj19Uu52OJTZbxaACaCEY+g=
X-Gm-Gg: ASbGncv8Ve63htLbj1MnaxEbzkkNB0IkAMZHDUFwIpucNkvho3COqYN92zObup42slN
	wjbt4JPwlAdb0HR12ejtkE35l4c6nYJ9QorE+Nb/RD6w09WArkGzh+UtYF6LUKdywfBERV8L/ZA
	GrdxG0EMOVsmZZeWvEqHi6/ifThpnsNJGWdW/yv9tG+D1IIjuSf1BF6Qii/Dk2uOcQf14gesqLS
	22lmj4UtDWJY4451zLCU7oNFFCVqJeU2eJXbiumpPMGrG676iN5SXJPqbwqGCd6J1mWmp6RrUHy
	RNbI7TME43S5LRoCyywTq3RuLGCmqaozO3BuMw2cxkixDM1I2lIlIRDe6YuF2zSovuviwViIaYM
	Yx9W0teaIL7UyUNKBNz2u/YpTQlnoG/Mcwq20sthwGxGutibozz6J7tC1hs3MhtRV3l3aTZPhrZ
	DF9l2+HgT2DqOJVbqc1vdYetmwhcynT2dmmpQgXAARMKhdTs43Luw=
X-Google-Smtp-Source: AGHT+IEGiMJoLIMjx5zyljEp90fL86O4kiqQ25tLXsQTYyIDtzz8qjStVtrHSSOGXCpxDhm4kVf5OA==
X-Received: by 2002:a05:600c:4fd2:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-4778fe62164mr189433135e9.15.1763562948802;
        Wed, 19 Nov 2025 06:35:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm39973399f8f.26.2025.11.19.06.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:35:47 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
Date: Wed, 19 Nov 2025 16:35:20 +0200
Message-ID: <20251119143523.977085-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S SoC has a variant (R9A08G045S33) which supports PCIe. Add the
PCIe node.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- dropped max-link-speed

Changes in v5:
- updated the last part of ranges and dma-ranges
- collected tags

Changes in v4:
- moved the node to r9a08g045.dtsi
- dropped the "s33" from the compatible string
- added port node
- re-ordered properties to have them grouped together

Changes in v3:
- collected tags
- changed the ranges flags

Changes in v2:
- updated the dma-ranges to reflect the SoC capability; added a
  comment about it.
- updated clock-names, interrupt names
- dropped legacy-interrupt-controller node
- added interrupt-controller property
- moved renesas,sysc at the end of the node to comply with
  DT coding style

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 16e6ac614417..8fd3659b70fe 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -717,6 +717,71 @@ eth1: ethernet@11c40000 {
 			status = "disabled";
 		};
 
+		pcie: pcie@11e40000 {
+			compatible = "renesas,r9a08g045-pcie";
+			reg = <0 0x11e40000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
+			/* Map all possible DRAM ranges (4 GB). */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+				 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+			clock-names = "aclk", "pm";
+			resets = <&cpg R9A08G045_PCI_ARESETN>,
+				 <&cpg R9A08G045_PCI_RST_B>,
+				 <&cpg R9A08G045_PCI_RST_GP_B>,
+				 <&cpg R9A08G045_PCI_RST_PS_B>,
+				 <&cpg R9A08G045_PCI_RST_RSM_B>,
+				 <&cpg R9A08G045_PCI_RST_CFG_B>,
+				 <&cpg R9A08G045_PCI_RST_LOAD_B>;
+			reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
+				      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			renesas,sysc = <&sysc>;
+			status = "disabled";
+
+			pcie_port0: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x0033>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+			};
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.43.0


