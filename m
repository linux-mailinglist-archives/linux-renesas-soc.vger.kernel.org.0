Return-Path: <linux-renesas-soc+bounces-3102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA785F9B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85FBD1C2270B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 13:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9A6133296;
	Thu, 22 Feb 2024 13:26:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35F913342C;
	Thu, 22 Feb 2024 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608398; cv=none; b=AaYjZ3+sLfXqxrCl/cfs4+FdZ4iPIzCY8xhSIf9PWDVel1VS/oXfH2yj9YrPFwSxaj0eCZyoSDJ9ZteAdgMJCE5OIUswuJn9wamuiVuRi9l6YYfoMoyTKFVBV55G2yZoPDjnwtf4yoHr1LnYAGXd6xLHrLvIzInZ4S2XjRtNj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608398; c=relaxed/simple;
	bh=z4v5/nc9C15Rpwcci5AHw4H8HRdMDaI0hTZnDu8sHW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GlH1JzmS+PcJJClD+tOTeD828Azq2EKBHhySXry3fasGg9lEBlp5+nvRgRtuyuQvElwIQ9gDgIV4ufhogy5u8rsyyoDPggbBKjSKpAIzAchkzDx3qMDdyblNDFIKGR0drdocKiY35aQ9WY9Hz4O62WAGRdcPpgOs+WUUlnI+ios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; 
   d="scan'208";a="194923158"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Feb 2024 22:21:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 70C46400753C;
	Thu, 22 Feb 2024 22:21:24 +0900 (JST)
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
Subject: [PATCH v9 1/3] arm64: dts: renesas: r9a07g044: Add DU node
Date: Thu, 22 Feb 2024 13:21:15 +0000
Message-Id: <20240222132117.137729-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222132117.137729-1-biju.das.jz@bp.renesas.com>
References: <20240222132117.137729-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DU node to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Added ports properties.
 * Dropped Rb tag from Geert.
v7->v8:
 * Added Rb tag from Geert.
v7:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 66f68fc2b241..66b47812da9b 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -820,6 +820,33 @@ fcpvd: fcp@10880000 {
 			resets = <&cpg R9A07G044_LCDC_RESET_N>;
 		};
 
+		du: display@10890000 {
+			compatible = "renesas,r9a07g044-du";
+			reg = <0 0x10890000 0 0x10000>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_LCDC_RESET_N>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g044-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.25.1


