Return-Path: <linux-renesas-soc+bounces-23670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D48C0F1BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 16:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7DA1888400
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92330322DAF;
	Mon, 27 Oct 2025 15:47:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D2D322A22;
	Mon, 27 Oct 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580053; cv=none; b=R/YFh87vtihfrhcTPpxko2KwFfZlYZpnlerjAZ/lOeLEigGsWwnrHAAIhByviPvpC3LCxdbmRWPy466B59QYgkNHqe8qcwD0H9v6G/JqiWP6/3MYjmisAvl2Vq+FW97KqwVHEYxUTj/64qAyORUyyBFk8j7rC5fd7Wc3+0AgAsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580053; c=relaxed/simple;
	bh=gwadikHIMEu/a9eACG5kf4SybqzEBXdYt/5+ePp3MKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2+B4QQuP6XWssb6lzZ81spq+dV8q7ZbJ351IEeVax+DKrx8Ok17LMOdU52AadxoOLrp4eCuvIaGHtAC9vyk2mE70SKPF0QHsYIXIaMR85I5YIpenJqxPl0C+K+dBH0FgzViVXsct5q9dZYQTSS0MG1R5B71yjzOLGb2jsBiRNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 9cWyhdx2QSKlSfxkwVjJww==
X-CSE-MsgGUID: wjEZ2Go9Q6CKlcioPPDXBw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Oct 2025 00:47:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 489A94003EA1;
	Tue, 28 Oct 2025 00:47:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 17/19] arm64: dts: renesas: r9a09g047: Add RSCI nodes
Date: Mon, 27 Oct 2025 15:46:04 +0000
Message-ID: <20251027154615.115759-18-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RSCI nodes to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 190 +++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a469de3bb62..2cc950d99bd3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -823,6 +823,196 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		rsci0: serial@12800c00 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12800c00 0 0x400>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 116 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 93>, <&cpg CPG_MOD 94>,
+				 <&cpg CPG_MOD 95>, <&cpg CPG_MOD 96>,
+				 <&cpg CPG_MOD 97>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 129>, <&cpg 130>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci1: serial@12801000 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12801000 0 0x400>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 98>, <&cpg CPG_MOD 99>,
+				 <&cpg CPG_MOD 100>, <&cpg CPG_MOD 101>,
+				 <&cpg CPG_MOD 102>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 131>, <&cpg 132>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci2: serial@12801400 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12801400 0 0x400>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 103>, <&cpg CPG_MOD 104>,
+				 <&cpg CPG_MOD 105>, <&cpg CPG_MOD 106>,
+				 <&cpg CPG_MOD 107>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 133>, <&cpg 134>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci3: serial@12801800 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12801800 0 0x400>;
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 108>, <&cpg CPG_MOD 109>,
+				 <&cpg CPG_MOD 110>, <&cpg CPG_MOD 111>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 135>, <&cpg 136>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci4: serial@12801c00 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12801c00 0 0x400>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 113>, <&cpg CPG_MOD 114>,
+				 <&cpg CPG_MOD 115>, <&cpg CPG_MOD 116>,
+				 <&cpg CPG_MOD 117>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 137>, <&cpg 138>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci5: serial@12802000 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12802000 0 0x400>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 118>, <&cpg CPG_MOD 119>,
+				 <&cpg CPG_MOD 120>, <&cpg CPG_MOD 121>,
+				 <&cpg CPG_MOD 122>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 139>, <&cpg 140>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci6: serial@12802400 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12802400 0 0x400>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 123>, <&cpg CPG_MOD 124>,
+				 <&cpg CPG_MOD 125>, <&cpg CPG_MOD 126>,
+				 <&cpg CPG_MOD 127>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 141>, <&cpg 142>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci7: serial@12802800 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12802800 0 0x400>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 128>, <&cpg CPG_MOD 129>,
+				 <&cpg CPG_MOD 130>, <&cpg CPG_MOD 131>,
+				 <&cpg CPG_MOD 132>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 143>, <&cpg 144>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci8: serial@12802c00 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12802c00 0 0x400>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 133>, <&cpg CPG_MOD 134>,
+				 <&cpg CPG_MOD 135>, <&cpg CPG_MOD 136>,
+				 <&cpg CPG_MOD 137>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 145>, <&cpg 146>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci9: serial@12803000 {
+			compatible = "renesas,r9a09g047-rscif";
+			reg = <0 0x12803000 0 0x400>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 138>, <&cpg CPG_MOD 139>,
+				 <&cpg CPG_MOD 140>, <&cpg CPG_MOD 141>,
+				 <&cpg CPG_MOD 142>;
+			clock-names = "bus", "tclk", "tclk_div64",
+				      "tclk_div16", "tclk_div4";
+			power-domains = <&cpg>;
+			resets = <&cpg 147>, <&cpg 148>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
 		gpu: gpu@14850000 {
 			compatible = "renesas,r9a09g047-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0


