Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E032E3662
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 12:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgL1L2B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 06:28:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:37524 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727171AbgL1L2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 06:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=HlfNr1WXDvlBkl
        C7IhNxN50JYdrOHCZaVgQWUkMVSLc=; b=jDuNT4qLlRi6mRYvNVUE1VrHoOo13R
        SEx/ua9du5Zan3+3JYFQe4kGcWOeaIe5PpmH30ioARKIbPGst+gE9P2Q+YpUb3dT
        EfgJcCYH2XUItPFXfbBy/PvaA3EfYwMerllbHNZebITh2WBZ5FVQB58jG2vrczgZ
        VLQdtgqnmHm8I=
Received: (qmail 1739132 invoked from network); 28 Dec 2020 12:27:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 12:27:18 +0100
X-UD-Smtp-Session: l3s3148p1@W2qKjoS3zpQgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Linh Phung <linh.phung.jy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: renesas: r8a779a0: Add HSCIF support
Date:   Mon, 28 Dec 2020 12:27:12 +0100
Message-Id: <20201228112715.14947-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Linh Phung <linh.phung.jy@renesas.com>

Define the generic parts of the HSCIF[0-3] device nodes.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
[wsa: double checked & rebased]
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 583cf2e232a0..4741d167b707 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -313,6 +313,70 @@ i2c2: i2c@e6510000 {
 			status = "disabled";
 		};
 
+		hscif0: serial@e6540000 {
+			compatible = "renesas,hscif-r8a779a0",
+				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+			reg = <0 0xe6540000 0 0x60>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 514>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x31>, <&dmac1 0x30>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 514>;
+			status = "disabled";
+		};
+
+		hscif1: serial@e6550000 {
+			compatible = "renesas,hscif-r8a779a0",
+				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+			reg = <0 0xe6550000 0 0x60>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 515>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x33>, <&dmac1 0x32>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 515>;
+			status = "disabled";
+		};
+
+		hscif2: serial@e6560000 {
+			compatible = "renesas,hscif-r8a779a0",
+				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+			reg = <0 0xe6560000 0 0x60>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 516>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x35>, <&dmac1 0x34>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 516>;
+			status = "disabled";
+		};
+
+		hscif3: serial@e66a0000 {
+			compatible = "renesas,hscif-r8a779a0",
+				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+			reg = <0 0xe66a0000 0 0x60>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 517>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x37>, <&dmac1 0x36>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 517>;
+			status = "disabled";
+		};
+
 		i2c3: i2c@e66d0000 {
 			compatible = "renesas,i2c-r8a779a0",
 				     "renesas,rcar-gen3-i2c";
-- 
2.29.2

