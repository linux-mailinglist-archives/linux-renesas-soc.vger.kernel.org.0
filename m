Return-Path: <linux-renesas-soc+bounces-28786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGKvIPFiqGlauQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 17:50:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4020498E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 17:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B200330A87E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 16:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52235DA56;
	Wed,  4 Mar 2026 16:29:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374135AC2D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641747; cv=none; b=IWUtoAiQcIwayiHV8ZiKaS6kNMidRFi1Wx4cNJ7mtv2rDcbmljjpO+bdEucqbA760WWvrdnoMXF6y3RgY3DMUvHRA9dGr6bN0lkCBjfnRquWIYJg5gZ2N0qFfC7MclYq5yAukJV8QozwJmXRxYv/ut1S25LcMSP273Fx3YXui1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641747; c=relaxed/simple;
	bh=4A1PAvCusZdQTAZFIitZEMeV9ZZ1H3pp2IolGN6EZ9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syfUn2VOBDbzjjuqWu8gIrC8tGvttodSkUfLH4qPLC1FbXQUKVC324ZEdrkUjrPX3Lf5SL3kVa4Ve6UPt5UAfCh23KYZL9VWf6jWFmUqmEX1BH0TcrzKVmYhsykcXgjjMAmII00xM2q8n7j7tPHB38bvwnbhLV9nk5BifTVDbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69933C4CEF7;
	Wed,  4 Mar 2026 16:29:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Huy Bui <huy.bui.wm@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers
Date: Wed,  4 Mar 2026 17:29:01 +0100
Message-ID: <1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E5F4020498E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28786-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	DMARC_NA(0.00)[glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.891];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,c0708000:email,c0718000:email,c0710000:email,c071c000:email]
X-Rspamd-Action: no action

SPI interrupts are in the range 0-987.  Extended SPI interrupts should
use GIC_ESPI, instead of abusing GIC_SPI with a manual offset of 4064.

Fixes: 63500d12cf76d003 ("arm64: dts: renesas: Add R8A78000 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-fixes for v7.0.

 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 03639d0e5e339b14..3ec1b53d27828296 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -698,7 +698,7 @@ scif0: serial@c0700000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0700000 0 0x40>;
-			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -708,7 +708,7 @@ scif1: serial@c0704000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0704000 0 0x40>;
-			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -718,7 +718,7 @@ scif3: serial@c0708000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0708000 0 0x40>;
-			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -728,7 +728,7 @@ scif4: serial@c070c000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc070c000 0 0x40>;
-			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 13 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -738,7 +738,7 @@ hscif0: serial@c0710000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0710000 0 0x60>;
-			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 14 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -748,7 +748,7 @@ hscif1: serial@c0714000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0714000 0 0x60>;
-			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -758,7 +758,7 @@ hscif2: serial@c0718000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0718000 0 0x60>;
-			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -768,7 +768,7 @@ hscif3: serial@c071c000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc071c000 0 0x60>;
-			interrupts = <GIC_SPI 4081 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
-- 
2.43.0


