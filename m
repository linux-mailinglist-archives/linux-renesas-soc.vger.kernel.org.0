Return-Path: <linux-renesas-soc+bounces-5391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68C8C88DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 17:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0542863A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 15:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7F46A03F;
	Fri, 17 May 2024 14:57:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3C6A039
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957856; cv=none; b=FVcrXY/o4doS3VmuNZ/EAKisIn912JsBCsdHxvkY41wQGTS6V9MVdzMkXH+iz03HNXO12XXDs1tnQY7r+UNpFjtLlSDakWgbownyTsA6/8kRy/6xxh+uM1IlY5VuBHNCAJMgv9Rv3DnLMTx/vBkvHLo1Vz/QPoaMlTAosFw1w8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957856; c=relaxed/simple;
	bh=i+eoLY9l1EHK4ty6OVIKVK28ZFe264agnKOjrfX2PD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gxn2PWb0b4QOMB57V3Z7qhOiJ5MIP10kcc7Nt8Nyuhm57uhtrTDMSNBP9ScZc0eoNfOexHb52yvedkxTMKPA0wZps6bYyrbcF7nidRcD94ybVsQjU9O5OxpdYmQ4gspsddHXSsPOAjb2FWpPOVdkC9YRbKqkzOuKPyG4dPJ9ob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4VgqnM3lpCz4x0lm
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 16:57:27 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9706:8977:9494:a7c7])
	by baptiste.telenet-ops.be with bizsmtp
	id QExK2C00F0bc1Xv01ExKSx; Fri, 17 May 2024 16:57:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7z0U-00BDn9-Cj;
	Fri, 17 May 2024 16:57:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7z1L-00C63H-E5;
	Fri, 17 May 2024 16:57:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/4] clk: renesas: r8a779h0: Add CANFD clock
Date: Fri, 17 May 2024 16:57:13 +0200
Message-Id: <f4ab47f0fec40d5352ad8714407ef70f378581ba.1715956819.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715956819.git.geert+renesas@glider.be>
References: <cover.1715956819.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the CANFD module clock on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Change clock name from can-fd to canfd0,
  - Change parent clock from CANFD to SASYNCPERD2.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 079b55b30b23bd50..4b237bb2ca69dc2c 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -176,6 +176,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
-- 
2.34.1


