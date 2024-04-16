Return-Path: <linux-renesas-soc+bounces-4655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B894C8A6F23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 16:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76CDDB27508
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 14:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD4D12F59A;
	Tue, 16 Apr 2024 14:57:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64812F598
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279465; cv=none; b=d+i+nEQUJJ2NCjtHUfmZ7N1G1+xLOcKsVl7jknLVFhpW2BZm++dcvQofxBhKxQelaPoy3CzAn4ESvMdXk3l5OxzrTiTgUbbAp+tIo0NSqutabL6glHpK7b4LDKIBgIJWPhvaHaeBorjoRQ0gkChAV3wa5NfpRCK6eR1tqRI8An4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279465; c=relaxed/simple;
	bh=xO0IEeB3/YkUwmVTJq7VUlVcSe1jnpzELVfiFs3L5aw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XncTWrJr07xWPLocKWz9dmOf1xy4la0jRSCzGZ13It+NlKgNw6TInTxWtDdzNoz6Z75Lyhjc8djnDgZ+X2XcfHVBMONQ211LDdLw2kjhFZBP8FonOd3pFDLSJDJTAXhvGbFEzVRdq6iJVCBRnFzF1eUdRygZku5gUpDFt6i0ybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id BqxZ2C00K0SSLxL01qxZob; Tue, 16 Apr 2024 16:57:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkEz-008Ckz-P9;
	Tue, 16 Apr 2024 16:57:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkFZ-00Eb5d-5S;
	Tue, 16 Apr 2024 16:57:33 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add MSIOF clocks
Date: Tue, 16 Apr 2024 16:56:27 +0200
Message-Id: <86ce05ae274d384c5221bd136415a7b0a1579592.1713279332.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the Clock-Synchronized Serial Interfaces
with FIFO (MSIOF) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index a7d272285db04490..b9ecf909120924c5 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -184,6 +184,12 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c1",		519,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("msi0",		618,	R8A779H0_CLK_MSO),
+	DEF_MOD("msi1",		619,	R8A779H0_CLK_MSO),
+	DEF_MOD("msi2",		620,	R8A779H0_CLK_MSO),
+	DEF_MOD("msi3",		621,	R8A779H0_CLK_MSO),
+	DEF_MOD("msi4",		622,	R8A779H0_CLK_MSO),
+	DEF_MOD("msi5",		623,	R8A779H0_CLK_MSO),
 	DEF_MOD("rpc-if",	629,	R8A779H0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779H0_CLK_SASYNCPERD4),
 	DEF_MOD("scif1",	703,	R8A779H0_CLK_SASYNCPERD4),
-- 
2.34.1


