Return-Path: <linux-renesas-soc+bounces-16508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B66AA48A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 12:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE215189A546
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 10:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC8625D530;
	Wed, 30 Apr 2025 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ck0Yu9BV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29CE25C828
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009198; cv=none; b=hf62WGHpwy7cVIUpRA31mEfDuRHpwPr7KGCXZ7SCJHAzMJ5GYnnk9yj/n59+iKGDF0Dj7ytymZclquM4Mlnb4SrepAHyj0DGpaLxD+w/qFdo/FlGLrwEZ/SrJwPlqwDL8Sr1/KYauEHjpUdytiHC1eHCo2ffKRIDzquNRrhOVkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009198; c=relaxed/simple;
	bh=mq/lfbjEAahbi8v/Yxilo1z7mltq0L7V1rgg9IzAxl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mITju58gaanjDWV0cl/fFZQwYQ2VMkr6CRCQBPtJlzwTDgyRPBp7Yz4qwnF2RrQZLfbq3R/jv6UFbh+xbiLY1lymxd5e4g7HdR3jeBU6vqxfc7ZQLwQ+ZizM+d1iA+uSYWoqNJY7nyT/m1idUibwlyLwZz5NaplhL+zDvhvc7t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ck0Yu9BV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2963dc379so1059629766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009193; x=1746613993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXuUx7wovZ0PAW+LIKC1wW/SlMfBkmpMINNtgC9+O8I=;
        b=ck0Yu9BVnnMdw34p7HSlErxRD1LPCsKyDzBzNdttlnPFn8axfz4T1fGMiOeggXjm8z
         +MELIVUAXEFoEYgDSHGdsRXoaVmcoPauY5C0TTQD95J+EsndSv/khEKRO4j1bLwl+6IL
         QcATaKzHvfWeKSWIWbK3HHlnCFeXjI5AhRyMUTEjC93mhDzp2Xp0/zIHo9GSPkFwE95U
         g+XqsZl1QUx15vjuIxlh16u8hOa/XZehgiwuvkfoOEvbpEAzx4wvWaXhPrWdVR606PTa
         6apMufzFd8Ir05VBJFjwfLfLkvZphRkiOiBQzSyOn2SscSzamXvtGzrzzIYvjL+O2kP2
         kF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009193; x=1746613993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXuUx7wovZ0PAW+LIKC1wW/SlMfBkmpMINNtgC9+O8I=;
        b=vJIo9PapwHjTDH5wZnRx+e3vSTJpqGCs83rBusoFyXnRQou8hgOn1mbbotUJJz7ge+
         dAYsS8zFdmnR9gKsAuJqLJx7P5o1xf/sY1bwDdh1ZTfek3T3MCfzBaQkf5VQh1RpOrNr
         RASLldS70B5wmXWZRNPbR/Fjeg6HMgLfRLT6a00vODLzUxjhq8smSMTzjJsvKdkbXpgT
         xbJFi/ReACkphIvdQAUwnpmPbFBBW6upkBYbXJuajpk1dmso2RExLnRQnHh/U/Hg/cme
         75ppnkn/85QRBPuYYvkgrdAxEzJB9XZfiHPT0B4PNJ9y441+M7QGY9Uc7NoG+6iC/0z6
         +7TA==
X-Forwarded-Encrypted: i=1; AJvYcCXFlLHZCM5IZch65vQGHMD8RQAtvz5A0yyHAgeEVwjpFUZGGFNDAhZtyzNDeagLjd68JcdZCmD7nAO+gBE4zwqlrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxByY2MlybB2Ptkup9ONI8U4SuHrZhWW9WoBJEkqkxU+skfN7m0
	C8FOrgYH4oRBRVypnJ4vrgHFSDPSD29XccnwD710j+TjSJQ+bfGcgB+pvCy0S3g=
X-Gm-Gg: ASbGncsoefe1SyZdGrPlcbBn/9hd3vcT0dva7b6la1znjLabnqbak2KyNNYHYjS78m2
	o7EIW1QwGF8aJLFsTPU57lFValLPjGGL4wrLkVeAT2NKSMP4w6X6PeC/chKfiVuqh+fk8s/UWhh
	yjWUey9ylsAsyvzjEygiM9hyB4FNCRqjvOvfxx1VgSItCPEnAG1CTY6dRfhKCuLg7Kpvtpz4epG
	TNaPK3lXUMSmVuoJSpNVOVz3WQrvADZkVkKhSQk1HWvHLmyxxGS3Hy6u9piCW/xUP89EB3CHx+c
	70JFbCCsGQ8ZOPORNRgwUBYd1pisRUxW5xKK8bLEVpNTqnEdA92xaf6g80nL6G5UucU9/vQ=
X-Google-Smtp-Source: AGHT+IFBnCMqwv/bA5b/iHfecbvBB+Yr4Jy1p1ir0HdMA9k60f2mMrCz9DtJCVKYrl1BbCQtAeT7Qg==
X-Received: by 2002:a17:907:3ea6:b0:ac3:48e4:f8bc with SMTP id a640c23a62f3a-acee25c74a2mr231543466b.48.1746009193099;
        Wed, 30 Apr 2025 03:33:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:12 -0700 (PDT)
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
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/8] arm64: dts: renesas: r9a08g045s33: Add PCIe node
Date: Wed, 30 Apr 2025 13:32:34 +0300
Message-ID: <20250430103236.3511989-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
index 3351f26c7a2a..d8e1dc80e56e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
@@ -12,3 +12,73 @@
 / {
 	compatible = "renesas,r9a08g045s33", "renesas,r9a08g045";
 };
+
+&soc {
+	pcie: pcie@11e40000 {
+		compatible = "renesas,r9a08g045s33-pcie";
+		reg = <0 0x11e40000 0 0x10000>;
+		ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
+		dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
+		bus-range = <0x0 0xff>;
+		clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+			 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+		clock-names = "aclk", "clkl1pm";
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
+		interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
+				  "int_serr_fatal", "axi_err_int", "inta_rc",
+				  "intb_rc", "intc_rc", "intd_rc",
+				  "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
+				  "dma_int", "pcie_evt_int", "msg_int",
+				  "int_all";
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
+				<0 0 0 2 &pcie_intx 1>, /* INT B */
+				<0 0 0 3 &pcie_intx 2>, /* INT C */
+				<0 0 0 4 &pcie_intx 3>; /* INT D */
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		power-domains = <&cpg>;
+		renesas,sysc = <&sysc>;
+		vendor-id = <0x1912>;
+		device-id = <0x0033>;
+		status = "disabled";
+
+		pcie_intx: legacy-interrupt-controller {
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
-- 
2.43.0


