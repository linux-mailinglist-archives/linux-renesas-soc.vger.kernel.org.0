Return-Path: <linux-renesas-soc+bounces-26329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8BCF9949
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 18:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B3033007C67
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 17:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF4F340283;
	Tue,  6 Jan 2026 17:09:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A333F394
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719395; cv=none; b=HA06V3Djjj2M1n7KNFGTf+rjg3lonjiqnfnKfVubMZv8GJTqCNSgaCiAZ2gGz8oisX/+xrqkLG9LohgMcvUAD3DamI0FF8dNJfMHrpG/dArAsqMP9X29WS5wmFSoXTsVdePg0KuqlK60pogWFyfkdsBktAuf4mpI1eVBz9CWKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719395; c=relaxed/simple;
	bh=/td8fbKM/axF/RZbCTJiIpgvqSmrTweMVu2Ii5+07sM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CIBJT998g3zvSwJJaNU2aGd8pHCFBm/M1e1UaXaeMNnmjaOO69rqhrUuOw20KEeUsrR4m0nDXCVDJ3rEoFMiTrDNPy0/w6jjUUsWrIpzKlGMCTp84XWmveFN0BQ0vxdDxbNk2xdonIRHQ+4sDl0haCeACdWT+wEMXaLcLBt6msU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E8CC116C6;
	Tue,  6 Jan 2026 17:09:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Khanh Le <khanh.le.xr@renesas.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT] arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
Date: Tue,  6 Jan 2026 18:09:51 +0100
Message-ID: <459d360a8332f92b3766b30814e7e1c76169aaf7.1767719254.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the documentation, the internal clock input for the BRG is
SGASYNCD4_PERW_BUSφ.

Fixes: c13a643e2c491f5b ("arm64: dts: renesas: Add R8A78000 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of access of local hardware.

This is consistent with SCIF on other SOCs, where fck typically runs at
1/4 of the speed of brg_int.

The correctness of the clock rates of the various clock sources can be
tested by forcing the use of  "fck", "brg_int" or "scif_clk", by
commenting out all but one of the four blocks below the "There can be
multiple sources for the sampling clock" in drivers/tty/serial/sh-sci.c.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 4c97298fa76348fc..03639d0e5e339b14 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -699,7 +699,7 @@ scif0: serial@c0700000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0700000 0 0x40>;
 			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -709,7 +709,7 @@ scif1: serial@c0704000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0704000 0 0x40>;
 			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -719,7 +719,7 @@ scif3: serial@c0708000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0708000 0 0x40>;
 			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -729,7 +729,7 @@ scif4: serial@c070c000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc070c000 0 0x40>;
 			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
-- 
2.43.0


