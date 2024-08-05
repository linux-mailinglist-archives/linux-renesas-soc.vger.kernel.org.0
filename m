Return-Path: <linux-renesas-soc+bounces-7733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6C947F30
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 18:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437E91F22E0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 16:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CD515C149;
	Mon,  5 Aug 2024 16:22:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5617515C133;
	Mon,  5 Aug 2024 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722874931; cv=none; b=u6Ua33hcGp9D6pUHn6hJbAbEL2+bZyehVoFdF+4+GBiPr+uU2AUv5s8v86qlHJeM0XVNsctty3fkYe+q60T5+RMIREnX7fU10dxcNJRQTaAAroskSxou0qXEmXSeQT/lf7gLfm3ENS0iZ7I9+5O4GMIuj04OMmr2R9GNr9pkeCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722874931; c=relaxed/simple;
	bh=GlIDRhSQnul6LvCLJ/Z/ivLYh/9VDF0ohCMcEHGlmfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIQgL/go2PvTE//87IdiUjTqWX/q8v0V9nUP5gLK8nDhGJIUiV73E+fLOlX6ELHd81G7GgaacCPHxXGO0KQctEgm1NnvBWa1Pz4e4mPRxubw1BapiiH16yGI+FfgSq8Q5kTmHkEjy5Bm0Ip3Yi1040iy8Yuf4W4XK8PIg3QmkBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,265,1716217200"; 
   d="scan'208";a="218709935"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Aug 2024 01:22:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 401854009408;
	Tue,  6 Aug 2024 00:53:01 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a07g043u: Add DU node
Date: Mon,  5 Aug 2024 16:52:37 +0100
Message-ID: <20240805155242.151661-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DU node to RZ/G2UL SoC DTSI.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped ports->port as it supports only DPI
 * Added Rb tag from Laurent.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index d88bf23b0782..ba88c91c66c8 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -153,6 +153,25 @@ fcpvd: fcp@10880000 {
 		resets = <&cpg R9A07G043_LCDC_RESET_N>;
 	};
 
+	du: display@10890000 {
+		compatible = "renesas,r9a07g043u-du";
+		reg = <0 0x10890000 0 0x10000>;
+		interrupts = <SOC_PERIPHERAL_IRQ(152) IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
+		clock-names = "aclk", "pclk", "vclk";
+		power-domains = <&cpg>;
+		resets = <&cpg R9A07G043_LCDC_RESET_N>;
+		renesas,vsps = <&vspd 0>;
+		status = "disabled";
+
+		port {
+			du_out_rgb: endpoint {
+			};
+		};
+	};
+
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043u-irqc",
 			     "renesas,rzg2l-irqc";
-- 
2.43.0


