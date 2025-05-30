Return-Path: <linux-renesas-soc+bounces-17675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0CAC8CD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 13:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C43DB7A788C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 11:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8394322D9E2;
	Fri, 30 May 2025 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mJNmTFZ1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC28522D4EF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 May 2025 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603998; cv=none; b=Nv3yCPtvRwzxYpnbGlhBk5p1VMK3Azpf8ssG8NKIbaTokkbWOBUuW0KK+R28pg3q1oklQP6Aca+zqYnHgiNd5ESsTmN6AExnAGaIWfEA3nXr4LqCPVRTJ/AoOs0M+b7+eJgBeI2Od5cu8480eUwL0vgqqh2ItxmdS5MY++tgP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603998; c=relaxed/simple;
	bh=X7hDuCiTVWY384OgAlrGLr/jCTONBQsk3r94ENDyK3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnzApovzMttijluXVgzVfiIS1qHljgii8pQ5jA8+EnTwE513miBVgSQO52Sdn4B/7+1NQffIdJ8eBC0UqxOFWT2mEOTGNoluhSB8LcyMY4xYN5FumWvBIWfNXk0RV7gnmL2Usk6DOsbH3at9xUIzzbJvGvwgYqrrwjdfLxyyWSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mJNmTFZ1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so13274035e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 May 2025 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603994; x=1749208794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpG/I/+BWWmS26h5n6JKq19fnTLhLa0YbFAXx8ak2yk=;
        b=mJNmTFZ1xtp1hPDAQD0Nf/Xqe+nrwHACGsuTYOCBrTmIv2txwv2zwjHZj4UEWyPcSt
         HnhxL2u6Se9pNKSGM20AmliBhJ9xDEdxge+KLGe4RNPT8VZZXVffEfT9ZYbxJg98guTt
         QMto7zY8dtX/DWsV0HndOKu3XrZZffkXnI8VzZs9NGvmrX1DsKf8HTfGY/zbRy/dMALQ
         77bGvR74ctizJM/KUyye7R6Jf+xG/N7XRfWJ+o9zXxxjfNJu4D6ep3uWR+XcPni2tCGR
         wa72+mWiTILq4Z8ueHUivA9hxqxOR8VkTB6pV0sbuTWJuOGMS37OVkvrFp4YoWUc8LtT
         XCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603994; x=1749208794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpG/I/+BWWmS26h5n6JKq19fnTLhLa0YbFAXx8ak2yk=;
        b=CeFeZlPk9jWS89Z3iX74uxfIiL/ygIKleizfvGsZ+IZcRBW3FcX7bbsOrnt4dAwdg+
         pTW14NI7kKPeIYOGW3WO5ni68jREjBt0neSwyior4rRpABB1yCuK1n9h09/XpWUKZeKZ
         rVmS3S6l+1VsyxWj8fAnpX3OEb/UwLnJh3OrXkGRbVunNHp9lAPjFHM1bwpINRLyBKwg
         U6Zmi5A1q5cIR4R+R8VTjVWPI8dSOdeO8rghnGDpbCoDYbCSZmEfNcQHKJTVIvWOM2/e
         yeqADyVJKc2Q/3i+3MWHnUOtxGAE/ZgvtBF5O7igMlv6oMh3iIrrySxh+u6+kHNt2sVV
         5QWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHGwERdkmoFqpcyfpL31knka/nvpXxZnW34UqShDdUdAeJ5wrPGUyL0sQhfc02M94jxMmq9sdCW9dacfv6AW/Llg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzYndOxyXT2bdh/Y0tnI0lCaCJcQ47s+mrYy153glEHKxKGknZ
	2ckCBaFIFZY8X5IOZFEbbY/ACBZmexBGtUiPYw3sdmp+9cmkYNuTwNSlgh4iESvgF6o=
X-Gm-Gg: ASbGncu3oDfSiHO5JvtPdRKoAcN3/N2swPVFtzscTYkvcenhQLhPU2WsGgKksaMqyYB
	gkEmS7lobAw/Dh2lglG/xTqt4hJFQBfzbw2r/0dI88coDTSMQl866m0SFnm+qVI83mt+a5XWWIN
	v+Iu45D5T8JCEymBXDsspcPSpQbdIHhSh/eByI+jwWq3ykf1AzPaiH4S3u5YHcEDY6RKDWGK1qH
	nJ88R2aHf9/SSDRz7RZ7+DkQgES6hcgRUhtTCKxHurerOEJ2lnEi8zl8zVekmNg8xexVFthuy+L
	UYvtPOpD2i+6VdkV+Tl2mol2ykNRAqo3gzrYg23dw4AOrQgWJFfsqqeVhMxD/KSd/FrVrdvSVpG
	8tyv/J4tlM4HQa4hn
X-Google-Smtp-Source: AGHT+IGUJg33COSzG5y9e9bhXP7pOmJUOM67MeQYRzNHWMgUFeu2KrzZLuJQfaLbp9n6mkOJwkwhzA==
X-Received: by 2002:a05:600c:9a3:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-450ce897d17mr44809275e9.16.1748603994306;
        Fri, 30 May 2025 04:19:54 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 5/8] arm64: dts: renesas: r9a08g045s33: Add PCIe node
Date: Fri, 30 May 2025 14:19:14 +0300
Message-ID: <20250530111917.1495023-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S SoC has a variant (R9A08G045S33) which support PCIe. Add the
PCIe node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated the dma-ranges to reflect the SoC capability; added a
  comment about it.
- updated clock-names, interrupt names
- dropped legacy-interrupt-controller node
- added interrupt-controller property
- moved renesas,sysc at the end of the node to comply with
  DT coding style

 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
index 3351f26c7a2a..f1d642c70436 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
@@ -12,3 +12,63 @@
 / {
 	compatible = "renesas,r9a08g045s33", "renesas,r9a08g045";
 };
+
+&soc {
+	pcie: pcie@11e40000 {
+		compatible = "renesas,r9a08g045s33-pcie";
+		reg = <0 0x11e40000 0 0x10000>;
+		ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
+		/* Map all possible DRAM ranges (4 GB). */
+		dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;
+		bus-range = <0x0 0xff>;
+		clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+			 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+		clock-names = "aclk", "pm";
+		resets = <&cpg R9A08G045_PCI_ARESETN>,
+			 <&cpg R9A08G045_PCI_RST_B>,
+			 <&cpg R9A08G045_PCI_RST_GP_B>,
+			 <&cpg R9A08G045_PCI_RST_PS_B>,
+			 <&cpg R9A08G045_PCI_RST_RSM_B>,
+			 <&cpg R9A08G045_PCI_RST_CFG_B>,
+			 <&cpg R9A08G045_PCI_RST_LOAD_B>;
+		reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
+			      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
+		interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+				  "serr_fatal", "axi_err", "inta",
+				  "intb", "intc", "intd", "msi",
+				  "link_bandwidth", "pm_pme", "dma",
+				  "pcie_evt", "msg", "all";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INT A */
+				<0 0 0 2 &pcie 0 0 0 1>, /* INT B */
+				<0 0 0 3 &pcie 0 0 0 2>, /* INT C */
+				<0 0 0 4 &pcie 0 0 0 3>; /* INT D */
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		power-domains = <&cpg>;
+		vendor-id = <0x1912>;
+		device-id = <0x0033>;
+		renesas,sysc = <&sysc>;
+		status = "disabled";
+	};
+};
-- 
2.43.0


