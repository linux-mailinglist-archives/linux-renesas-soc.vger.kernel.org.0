Return-Path: <linux-renesas-soc+bounces-19236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9330AF97C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 18:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3E37588F92
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC48C2DC33A;
	Fri,  4 Jul 2025 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lFf9emJ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBD2D5A0A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645691; cv=none; b=S2efNh664LRfoTr4hGOz77H1x17PkTmMpBYHN3cYNa7vXU0zClUNY5hn1LjSwQ8p/STDttvnZKjyYGmLXm0CuHs/zDlzM+QqdHTZTNpJAWQqTFErQ+JZbMQPMJCQdAsmn1UWjB+pkyo87KttiRUFRSKBzOR9Bk2jrtxCUIwsy4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645691; c=relaxed/simple;
	bh=wBW/wOjcHo+MMprzswfhxNr66n7VXFFJfGGCld0Qef4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tD/TkiHxZh65og/NPOrYe6iC+RSEGuOIRRKcQXKgFauEuDGn3xf10ie/TpIlaum6j/p0k8YKq07BzCaPX+5ZonL/bSKTV8WzKuV5KTUyCD92mtXfpczbbhHtY9YVNTFs/LHmyGYcpmbHe7G8AKNFxjVnq7I6hQSASWXTY6MlKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lFf9emJ9; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade76b8356cso209818466b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645687; x=1752250487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXyzQ3RBFjluU5MFZEnJA0kb3eKu5D4kycElIEXz9OU=;
        b=lFf9emJ9EVEuaif7EKDAg2Rf07PS+0eCYuDwYFqJYK0BcXBc384u/8AVmOhuKa2N1O
         oA6IqTS+ZlSmj2Sz+ux2OdOH8vCHv2djtTBL+dmqEA4T6JvOAArQQ4UqHV+ARqFoB/l4
         AT26tXvvLWgA9eF9io05nzJ8xe2pjuiqHItFnPnHariZs28AcgbvNYshRuyeAoEbA5YH
         6AwygT8np1U4/BodvxyMaLHbXwnPMGNCdBxLhIQ1eIBn9mcDm57Yk18Z/YfTYpFq4iqM
         OCAEeZv/gakf87pHSh0yTMUF8YmdOFB7JgdgnCqkl0oAvILURkOe9ic3IU9YoZ4oVvAg
         Isqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645687; x=1752250487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXyzQ3RBFjluU5MFZEnJA0kb3eKu5D4kycElIEXz9OU=;
        b=WvPGa3nI84t8wcTcB64Dhmliyl1wn+y6u//CF1C3xCJFP4x1oIwhGLs+mr6/YsryiD
         xmtJ8mD/z3A9EK63I5/HygLUPCvr6Af5Hzh8UvCsWBQUcb5cR1NHDDAGvFI3mz+fjGTy
         cciP/M90VWFQUMbOoVT0mzdJPYE3fjHrPVsKP6SvEbjitGaBO3+BM2pyNoEOAC8sX6tx
         x5QhBLdqHzA9zccTE9r8Q59EetgIJVI9tGo/b2Pv4ZrzIFwID23ifvwT/5w65x/MYbYr
         VhhlPkgpag673jYXnt4zds8dH/d3FNnLfqSIcZKUlWgotv7/rgly0oKBL+EL9JCZbm1V
         RLIw==
X-Forwarded-Encrypted: i=1; AJvYcCVFte1wPNTtHKwd0wY5Z+XBrQhM1pYi5nQu+mcRSJRIl6OczoZbSaVuQRIy0d+w6Bspe0RKKLXLW+vt/o2nszpRDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxigXhawaA1ev7Kya//XQjT+2gTojEa/JZeOzW+s2lWzxOzjwG1
	G/iOwrczFjkyEfQG5QYEIUG8T1kyyraYHOHOhCkXvcZvkD3UrVkw+o/sh520lXAZMi8=
X-Gm-Gg: ASbGncvauk6doNXpJu7P5volUisPYx7vgBS87LHdPQMXQu/wV15SLQiAqq/yPInI0hE
	r6gEzFtk/h5rKUPLRkKE1z/avXFWV5mhpdCo709YAH+GjPNhAc0fBxQEn7JdO0nEpEwsbex2wGi
	XEJgmhDU2bRZftctLKUuJz3Cb6BegUIwEgBe5SZgnVfPOfdIzmE8fgkA5amRcapQpKzWsew0gVy
	GZplYlYzRClXYoVKK8zrwcp6NeByTK2TQO5w3bElreWuyANZ+Y1fMbojYl4UXD77ng1VAc2Nf0Y
	AIKtEK+/gzse7EACrEmvCzg5B0weMLJFKTtJPKTzhV7Mn1K9MxPxFsnXGWVfVLLY7TlpnnS+pWb
	V503fKnUyywlTbzk=
X-Google-Smtp-Source: AGHT+IEDflpTvh0P6klOG4RxU2kQw1Fie2pGQFC7OAdZikbSv2DiF4LblPFKqKT3Yf5hJEzuGL5H2A==
X-Received: by 2002:a17:907:9443:b0:ae0:ce59:5952 with SMTP id a640c23a62f3a-ae3fbeaee26mr286313266b.60.1751645687592;
        Fri, 04 Jul 2025 09:14:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:47 -0700 (PDT)
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
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 6/9] arm64: dts: renesas: r9a08g045s33: Add PCIe node
Date: Fri,  4 Jul 2025 19:14:06 +0300
Message-ID: <20250704161410.3931884-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
index 3351f26c7a2a..cff36e873e59 100644
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
+		ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
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


