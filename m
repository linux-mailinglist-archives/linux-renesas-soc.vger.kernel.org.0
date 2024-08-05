Return-Path: <linux-renesas-soc+bounces-7727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BDB947BB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 15:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BAFD1F2384F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F058155730;
	Mon,  5 Aug 2024 13:17:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D7E17C;
	Mon,  5 Aug 2024 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722863846; cv=none; b=EVjL+5Sk9PAxbY60DoqFkb4FwVg/RUtszueT+IRSkYy878XTpHYKb0eZ18MzpqWOY2bezyPMb06M6sBAKcOlCNidhoKfXJu512f+e6tuwCj3POoueVi4+3tBKR5xc93/t0UxHyQehI9bO1OHDlPhqIkzA62FtdrLNMNTkmRXp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722863846; c=relaxed/simple;
	bh=NygtXK6EfwQDMzlViUbnNP7WhtJkQYz8kyQH3YxKu7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNFdPjsr/Tu6EoCJR2pGK6IcfWtC/EOh3qkfGldjEc+xdZFHcsW+XwSWpIP4e2i+5YkDu1ooFqbhk2WmnSNdAxaf49eNVOKttEmxWWtXyo0Eeupq3LUOffnjRPnjffY+jF0Z3gAZ+dFp5ECKfcBr5u0IDG6q7ptWUVLpmgq8PJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,264,1716217200"; 
   d="scan'208";a="218700190"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2024 22:17:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 69958422F825;
	Mon,  5 Aug 2024 22:17:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: renesas: r9a07g043u: Add vspd node
Date: Mon,  5 Aug 2024 14:17:06 +0100
Message-ID: <20240805131709.101679-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805131709.101679-1-biju.das.jz@bp.renesas.com>
References: <20240805131709.101679-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vspd node to RZ/G2UL SoC DTSI.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Reordered the patch as vspd needs fcpvd handle, so added fcpvd node
   first
 * Added Rb tag from Laurent.
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index c4defdf0fefd..d88bf23b0782 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -129,6 +129,19 @@ csi2cru: endpoint@0 {
 		};
 	};
 
+	vspd: vsp@10870000 {
+		compatible = "renesas,r9a07g043u-vsp2", "renesas,r9a07g044-vsp2";
+		reg = <0 0x10870000 0 0x10000>;
+		interrupts = <SOC_PERIPHERAL_IRQ(149) IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
+		clock-names = "aclk", "pclk", "vclk";
+		power-domains = <&cpg>;
+		resets = <&cpg R9A07G043_LCDC_RESET_N>;
+		renesas,fcp = <&fcpvd>;
+	};
+
 	fcpvd: fcp@10880000 {
 		compatible = "renesas,r9a07g043u-fcpvd", "renesas,fcpv";
 		reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0


