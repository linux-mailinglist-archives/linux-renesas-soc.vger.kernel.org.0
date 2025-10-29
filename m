Return-Path: <linux-renesas-soc+bounces-23845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B1C1B065
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CE40427CDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 13:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AE033F8C5;
	Wed, 29 Oct 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="J1yE8NdV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68334405D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745046; cv=none; b=aJ70TZs34Z9gShOI6WLvCyT4zqYZ3ajVq+9sB8klgaaiwuoyVdhSowwf4Vvuqu+7cIN94UUcFY5ht8EOgPNB0OrwuN3jI1Ab/sIP2aTu1U5cvkcajpRDbTXnpaA0RWubdKYdV2RnV23f8kZ1FkRLdFFr7Psv6Qfg989wqUNNREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745046; c=relaxed/simple;
	bh=y2VZitFnyMAF//3DV85VW65rpuPKMJsAdCQOFBOrAC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNHe9xj15P0HVmHvBDK5PvuK/WI6Z3HARWJQLenf3wqQ/EFWlOLTrKuYvXH+gBtSzuZYNt/CFG+BxCQTV/lCQc50lyuN1rdBlqlqIv7KiA3spSuttth1r6Fr/xu5k99TRx0NYNhGvvOQuLJnGP8GAVihB2+8hyyd9W1z+T/A7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=J1yE8NdV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so72824175e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761745043; x=1762349843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOnem/V6StYdNJ3QFm03HAZO72OKwXmNpP2fQEiuLYs=;
        b=J1yE8NdVVxnSRGckz2Yny1mfGibiEP+oiu2cfizae5Uyp+G/j5XyZNW30A7CxkudKY
         sLPY2YSpA2FAnp9EyF/4beH9IJezyhleOPQkvqFwzafm1Y6qpHlalR+P19LtUNhrM5R6
         n1A4eR0HP4rk6r9y1efIwXn1wPcIWNW4j6StoLY2ZNt4oqBOCncipOkkfLNpBo7Ud++n
         pI05vL3TTq5kxPmAEi8VmTEy2qYKdylY5i/CdqNghiaX/AafimoVeVwBfz0hS8v5ruCS
         1gRJF7mO4A3K05NIsk0SUVHmlbyFCKgAcN1Xy2NjjApKP+dxZVIx2gnD+7AnSnBq6iA4
         4QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745043; x=1762349843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOnem/V6StYdNJ3QFm03HAZO72OKwXmNpP2fQEiuLYs=;
        b=U7fZ1NdND7RaMgTRdFL+cyU3I2TiD7mhnWkxduPu1sLyAcZfiFRPkPD4jvfSfBr5PO
         dIud0BXR8/mJJjUPKGuS/crhQ6cyEBxmZcabhZtnksZpe18gnLqaLk5pWPXtSNuYlHXA
         Zu4qzf44lD0DRchUM8Z5VeLas92cRTIvx25CVEEhWEfw3D1hbV+a9xNiyfOplCE6vwdM
         KeyhgwUOMC7JpggI1YMNPJK3jRHYT63Gx5apvtXLXsSEItTrRbKgRgggYilyN+3wHf2m
         G9A22xgOqJ1HqOZKDDbdwFUvBJRPTzOaO8pK0TevyECpcbV3I7I8AaAyzjZpqgfpIy7U
         Xj+g==
X-Forwarded-Encrypted: i=1; AJvYcCVjip6+mdFaVTADpOEyrKKiUSCOkuJDzWHB9wBmHFOUdFnhx807yS6L9jt7eICzEgZAA+MHRmIPJv1oli8BMNfwmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLCh1HholgZil7AchwakRkCGHIyPXNvpVDiVEHgz5xu49zEn+
	tNOuy52F6kK1nH+QUFLKHf9aTboLPFuTE6w6auNtqoRwtA5cgUxeJKthNXNup5k07xw=
X-Gm-Gg: ASbGncuKRZGpXnsrP5hFdv9RFTSLAWqwrjO4rghGdjDoCUxcW0He5M8IqjVJRWJMSyx
	i3wEv4E8V+Mlnp/txrY6wLLVfTrAQQP6mI6euvSkmgAmcas7ScRg9veCXnsYIJkdae8UnnWp7zp
	PhCAiezWqKxD9MzKG6m19mxDuwcKtHcV5hgS5RgPT0N+eL7ufobL5qLMe+szJL4pruMDXyXL08W
	8LJQQ1eBdy7/lJAolqw8dzmb9UMWsc3uclbHD7AEDCS+L4JmjtNvWU7lQF9eDGorO9FGISorx7i
	kHXxVdNrG02EfpztfQojLc4fgnP7y7s2pvMsc5CHCIarS6KT071BD/sRjSF5HA2gndUS6ZI7IwD
	yfXAcpLD1+tPq7A1BUIlDg6HvPMa+ZphS3nya1Q8Zo91AIazpoZFG+uoCsH99aaWLfPAjB2dphJ
	XGbZQrXedHxYEYS3IU+quolCBcUorBz5G15B2m5+v5XG3EA9R8CtRsyTU+anpo
X-Google-Smtp-Source: AGHT+IEethgYpnTg2jwlRdzgRC4JyZTZPECc8AeE2OGI9lXyIkOPLHAAxhLEM8L7qMUf94wAFDN46A==
X-Received: by 2002:a05:600c:b85:b0:46e:39da:1195 with SMTP id 5b1f17b1804b1-4771e16e3d2mr26860635e9.3.1761745042854;
        Wed, 29 Oct 2025 06:37:22 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e22280fsm49774795e9.14.2025.10.29.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:37:22 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH v6 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
Date: Wed, 29 Oct 2025 15:36:50 +0200
Message-ID: <20251029133653.2437024-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
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
index dd9c9c33d9d6..251335749247 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -727,6 +727,71 @@ eth1: ethernet@11c40000 {
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


