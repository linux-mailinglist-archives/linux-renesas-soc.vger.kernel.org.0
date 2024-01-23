Return-Path: <linux-renesas-soc+bounces-1699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FF9838E56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C74A1B223E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 12:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993655DF0C;
	Tue, 23 Jan 2024 12:17:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48FB5EE64;
	Tue, 23 Jan 2024 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706012260; cv=none; b=So8eFi48JtX6YhmIv6Zhs2ebRxT251qkGZgiP1ncuqzMAeRuv84PjG1ERDFxBfO1O5xwigEOR7Glt0L3eOfxLDAuSBGTbRdhfPDK9863Xq9W2uuIsl8ABSbqzOR/loNnJPZCLeN3w9baBN1Q2ZVwBOpvN0wAU7yqvnUX03x2nhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706012260; c=relaxed/simple;
	bh=xy3jJJad4YyCxbceToRDi61rzidx7+RvqKVTFeHDFBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oTtVqq1RwmPz9WimS2fFltTiP8uHBIpd0LJfHMuyEJuxXZv1n1gQ6L5kZ2nsp+fdvi9L8aQHbf/00rQg/og4/x2YMyra2ksQ4PshvFgIDyCrt3isp6+qySDDHecQKDkTAJQihKDz9Zee1FjLHaxSug05MKoFtxT6UTKhWUN1bTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="191434801"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2024 21:17:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6DEF2420E367;
	Tue, 23 Jan 2024 21:17:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r9a07g043u: Add CSI and CRU nodes
Date: Tue, 23 Jan 2024 12:17:18 +0000
Message-Id: <20240123121720.294753-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI and CRU nodes r9a07g043 (RZ/G2UL) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 69 +++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 2ab231572d95..01d08ebb4a78 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -61,6 +61,75 @@ &pinctrl {
 &soc {
 	interrupt-parent = <&gic>;
 
+	cru: video@10830000 {
+		compatible = "renesas,r9a07g043-cru", "renesas,rzg2l-cru";
+		reg = <0 0x10830000 0 0x400>;
+		clocks = <&cpg CPG_MOD R9A07G043_CRU_VCLK>,
+			 <&cpg CPG_MOD R9A07G043_CRU_PCLK>,
+			 <&cpg CPG_MOD R9A07G043_CRU_ACLK>;
+		clock-names = "video", "apb", "axi";
+		interrupts = <SOC_PERIPHERAL_IRQ(167) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(168) IRQ_TYPE_LEVEL_HIGH>,
+			     <SOC_PERIPHERAL_IRQ(169) IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "image_conv", "image_conv_err", "axi_mst_err";
+		resets = <&cpg R9A07G043_CRU_PRESETN>,
+			 <&cpg R9A07G043_CRU_ARESETN>;
+		reset-names = "presetn", "aresetn";
+		power-domains = <&cpg>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				reg = <1>;
+				crucsi2: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&csi2cru>;
+				};
+			};
+		};
+	};
+
+	csi2: csi2@10830400 {
+		compatible = "renesas,r9a07g043-csi2", "renesas,rzg2l-csi2";
+		reg = <0 0x10830400 0 0xfc00>;
+		interrupts = <SOC_PERIPHERAL_IRQ(166) IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD R9A07G043_CRU_SYSCLK>,
+			 <&cpg CPG_MOD R9A07G043_CRU_VCLK>,
+			 <&cpg CPG_MOD R9A07G043_CRU_PCLK>;
+		clock-names = "system", "video", "apb";
+		resets = <&cpg R9A07G043_CRU_PRESETN>,
+			 <&cpg R9A07G043_CRU_CMN_RSTB>;
+		reset-names = "presetn", "cmn-rstb";
+		power-domains = <&cpg>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				csi2cru: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&crucsi2>;
+				};
+			};
+		};
+	};
+
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043u-irqc",
 			     "renesas,rzg2l-irqc";
-- 
2.25.1


