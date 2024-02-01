Return-Path: <linux-renesas-soc+bounces-2206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F34845751
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 13:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35B0B1C227B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 12:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE9F15D5CF;
	Thu,  1 Feb 2024 12:22:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB641C87
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790126; cv=none; b=mBhwUTuxTPhAvduTtGBpa9EcdWN1LYzkt4V//ANXHPx9ys/Avkh8b3NxHDvQYPjqp/tnEI0l8PS8jl2Q4JCaMGWHO4hxhegZOsukjfXSmC3Yw955TQiLpspzooUdkxrNdpoHLTbg8oZxpJJW6uKPdlhLr90jUdTATSCZaYpwdW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790126; c=relaxed/simple;
	bh=E59gvsiaDeWyRIZv9XVTeh3SEuFP6dWv2HYQRTt7UEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KqwUAkPgj0CU7Y0dlYC7zqB4iauQYRS1rzwVeOuWhDlmsiSD+KbMyg+JX2YX8sx12jRUeFRXUlf0ug/Mj46XBRtw2OfQCLO5nN/ypkZDTPVP5tVeyYKQepyblXaHJisxIvaMScWH+Phq2r4vsfB4rC5Cw0XqEdjPvMDwkGP+8Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by michel.telenet-ops.be with bizsmtp
	id hoMw2B00D4efzLr06oMwwP; Thu, 01 Feb 2024 13:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW3z-00Guz3-KW;
	Thu, 01 Feb 2024 13:21:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW4q-00ARtC-Jh;
	Thu, 01 Feb 2024 13:21:56 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add watchdog clock
Date: Thu,  1 Feb 2024 13:21:55 +0100
Message-Id: <f1dbf0f3f484015f2e629d78b746cf377d6f6746.1706790015.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clock used by the RCLK Watchdog Timer on the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 219941047291d34d..322db567d5f889d6 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -177,6 +177,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif3",	517,	R8A779H0_CLK_SASYNCPERD1),
+	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
-- 
2.34.1


