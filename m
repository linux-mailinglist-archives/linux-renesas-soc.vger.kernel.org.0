Return-Path: <linux-renesas-soc+bounces-4657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3E8A6F34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 17:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA2F0284C89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20AD12FF64;
	Tue, 16 Apr 2024 15:01:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3836A130498
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279660; cv=none; b=B9aE7b5HHk/WFSFdcm7Xc26Z9MYEg0VSVDDuPBLXX7ZrMUP1mFSVG/TGDV3OXfcorqM+zCb1LU06hue60UC/R9zEriShQ4SqvN4fxUWxduQ1KBuYnH/WPWfiCLXck0hkVua1iPZs1q+3e/MZ3azjdgJWSlZZoPy+1NSVZQq5ICo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279660; c=relaxed/simple;
	bh=rC4TZ+Yu2Hn9H86guASuDbkqI7ZUFC6k6DwHVL+T+Lc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eUqyyfjp7p2A3gpd/SZfMEQHLrM7YYNDsRPzW/at+SzvNRWKrdG6ni913tGj4bW9zy7pDGJncEEpkR20xXhHVXLHqOawp1szMGYZY0i11DDn3c4OkjKzZenl7qv7PVhQ2WzgY5eK8yn2AfCboYhL4HXADbIYYz7/8ZN9sr549aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id Br0t2C00K0SSLxL01r0tPs; Tue, 16 Apr 2024 17:00:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkID-008DAo-Nj;
	Tue, 16 Apr 2024 17:00:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkIn-00Eb7v-3V;
	Tue, 16 Apr 2024 17:00:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779a0: Fix CANFD parent clock
Date: Tue, 16 Apr 2024 17:00:51 +0200
Message-Id: <aef9300f44c9141b1465343f91c5cc7303249b6e.1713279523.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to Figure 52A.1 ("RS-CANFD Module Block Diagram (in classical
CAN mode)") in the R-Car V3U Series User’s Manual Rev. 0.5, the parent
clock for the CANFD peripheral module clock is the S3D2 clock.

Fixes: 9b621b6adff53346 ("clk: renesas: r8a779a0: Add CANFD module clock")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested, but the rcar_canfd driver does not use the clock rate of this
clock.

To be queued in renesas-clk for v6.10.

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 4c2872f45387ff91..ff3f85e906fe17e1 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -139,7 +139,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("avb3",		214,	R8A779A0_CLK_S3D2),
 	DEF_MOD("avb4",		215,	R8A779A0_CLK_S3D2),
 	DEF_MOD("avb5",		216,	R8A779A0_CLK_S3D2),
-	DEF_MOD("canfd0",	328,	R8A779A0_CLK_CANFD),
+	DEF_MOD("canfd0",	328,	R8A779A0_CLK_S3D2),
 	DEF_MOD("csi40",	331,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
-- 
2.34.1


