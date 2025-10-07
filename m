Return-Path: <linux-renesas-soc+bounces-22752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A4BC1854
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 15:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D70BB19A328C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16142E0B58;
	Tue,  7 Oct 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qy9+iF6r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51872E175F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844243; cv=none; b=W2/JXExcvZjQ4Zq/aTp0hKpYP8bsFkQxcvHxHy5gYizAMwN9X+L4O+9u04VkW05xQ07BPoI5SMWCDTkEhAP6UPg64GIZrplz2OklaRedp5vik28vz5zTRASPM1Rn2H+0ZIy7RgpEz7g0kBSrOLhz3LPj9f/7RRXkv0o7Ld6tkfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844243; c=relaxed/simple;
	bh=RpdnNbrVn0b7dBlRv383Ehwxmz1LT5B4dkZCILAk05c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKIb9MrpX5Mvm5+f/uamfTR1d0jZAJwF6EZX1s0q234b9Ph7w0vDJACXTP32AeN2gprVTzU/8Ez/qEW8ucAAqASAF5YagNrWOkHYoCEYz2Hf9o93fV2EzccsWpPNzzTXru/nZub0Vn3DDQLs27V+x/EED5QVmnJch9gy5CxNrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qy9+iF6r; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so4637707f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759844240; x=1760449040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT0gXBq+U1AMvRGkpBaatl/Xv/PMYwxUcE4kDcPfFVA=;
        b=Qy9+iF6rnVeqfl3IFQz6rz88zeGFtPezdp/pd/4EDoar2sDhSwueLOcFmfGtFwzzOd
         trkkZgqT6frfaqnLQmyq/BoAUkvzrHWWjZgrS8uV77WtBdemPwqZOM52ECiilZpOejJ/
         uLKJR1mG7CGdh7k07Q0uzG4ZJwoj5q3oMrSE7W7gbq1dv+u9i8xiEHP4A+HcEaYWGfW+
         Q2MVZ4szWzWX67eDasP1zYBvIOwtm/nNuOH9M16vFebYpb5/fhBVGKMGBh4rfNq/kIXV
         KJrFWE8XeJiD3Wu2myEnmE21mMkehsL6OLq9bNhCx8n05Nln9Ar6dp46f4oEJU15rHxB
         BN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844240; x=1760449040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LT0gXBq+U1AMvRGkpBaatl/Xv/PMYwxUcE4kDcPfFVA=;
        b=Ita4r354OT8E6OvgAsPhcQh7BMzdsFdTSikVMDTehDWvTc7gHeTLv26NMRKAhiY4hP
         0AliG6Z8lwC7KVtdxjpR2fPcuoYixVKJgOHhYj9QDHtEuW9s7iQqwPM5d+SzU4HNRsAO
         AB6be52eio/RLXfeP5NU4e8rLinpyvqEReLC0onp8j5LTcUAYWpo6ljYbUhUeqHIMGb4
         dmwGyLW4OdeK3sOTzGvCyIioLPmZeg/YJIpTh03zbrEoYbEVgTw0uenj7SB9LjFik6+Y
         S7chqukqwvbvrWm1olfBWvQITsyacBURoZUFscdnSeiniJOsC7oLEhHcfG0kKfNYrZ0f
         euWg==
X-Forwarded-Encrypted: i=1; AJvYcCXAYs60DFYtZRa36vCILp2IIWu11w928pABiWefDjhYLF3JOiqKOHgKKRCcxwrGj7sih3w3io/YJwroe+gr4oUJfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkviiBuPd/eExFcQttsiYZcTgcNJCJSvDDhatBPQpRn6UUxbsP
	Ej2iXV5u6NS+5rQuOJtLN6PUhzrQiK+KxAHPHBSNZEWoSljwFpdly23McfKFWO29nfc=
X-Gm-Gg: ASbGnctmwAGv2JcH4lpEs3T/MEnaZTbMh22fT/07SG6KAga5zQVSVpONcqHjVKiVRzd
	dEHvrXIzRkc/jU86qRrZ/tQ6KBUjgksflfnGFfBfXzxAC/gmoCDxxGOgz2yXOhP/s583u4koSAD
	YIyBNhV+6t84R8zr6Ho5YOj8Ketd/KkSoWwLiWkcyDfAeto1h1lwbxZKwZS7ZO+XiSYY2v/abTT
	9cDi1aTn8vyhxMVpUyhwDiEX/JLXz9p3wY5R0EidrOBIAsgR9ZVUyk1+s1mGGJ07q1n58dgLFdC
	rLKh1YVQIIdeHqa6LTptQYV5kdBySVWaa3zMvYepZRm+IWIjeYbPpslAC6rpEsujsp3ZcpqVreJ
	htozWOLi/i9fN++TprN4woCMYmX7KDPl0
X-Google-Smtp-Source: AGHT+IEQEdqQV8aA6QCI1nIzRLsSitkSoMJ7gvZgt6Ow3HrwfSSg4Zlv8zHbr6vw3Ds4kAb+8sCGkw==
X-Received: by 2002:a05:6000:4029:b0:3e4:b44d:c586 with SMTP id ffacd0b85a97d-4256719e10dmr9134482f8f.34.1759844240083;
        Tue, 07 Oct 2025 06:37:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e674b6591sm272189625e9.4.2025.10.07.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:37:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com
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
Subject: [PATCH v5 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
Date: Tue,  7 Oct 2025 16:36:54 +0300
Message-ID: <20251007133657.390523-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
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

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 16e6ac614417..00b43377877e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -717,6 +717,72 @@ eth1: ethernet@11c40000 {
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
+			max-link-speed = <2>;
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


