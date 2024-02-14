Return-Path: <linux-renesas-soc+bounces-2757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C62948549F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048A91C27BD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FA3524CF;
	Wed, 14 Feb 2024 13:02:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD252F9E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915748; cv=none; b=iCdfiiFXfa1TWh5WSALbkmvPgN1wc2d1ORzFbNcH/uSOMrGT8okXhvVzLdevlCbsvvb15kqb/M+3qYctfCnr+tBqc1/jlAy0HuhB/tlu6/RqfyJkpa9APXfy3D5Kr6sy+0gDL4NRDfBvo9M70dWlJtLDn4O1vWHxjfTaPqz0M6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915748; c=relaxed/simple;
	bh=d9xeI5LNTXjT9kpWeASsdMiGKm8rnK3nzCytDCXPzFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N7ulRwp4oeRXZ0YzFxqO7oyE6K+TqYsjgV9odAQ0K+LrwzCdaHAtUoz9Zy4argFaeWYNaNC+1MUtNDOhL9O5wp25LwBGzM0ZfW6PCU7N9V1s+7uwYNrML1+87Wm6pLmHpOgyHtrFXra2AsZgrVwS8RbaZPed9fYpjvhH2T3DB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by baptiste.telenet-ops.be with bizsmtp
	id n12H2B00J0LVNSS0112HG3; Wed, 14 Feb 2024 14:02:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raEtu-000d4d-IU;
	Wed, 14 Feb 2024 14:02:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raEu1-00Gpad-7G;
	Wed, 14 Feb 2024 14:02:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add SYS-DMAC clocks
Date: Wed, 14 Feb 2024 14:02:16 +0100
Message-Id: <0285ef5d0c0c9d232e196559c9130ab46733d7f7.1707915706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the Direct Memory Access Controllers for
System (SYS-DMAC) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

Changes compared to the BSP:
  - Rename "sydm[01]" to "sydm[12]" to match documentation.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index b95f1e5e6d470a0c..92359306dc0df544 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -185,6 +185,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
+	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("sydm2",	710,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
-- 
2.34.1


