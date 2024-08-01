Return-Path: <linux-renesas-soc+bounces-7678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9B944D48
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5835E1C2343C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ECA1A255A;
	Thu,  1 Aug 2024 13:39:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12958183CC5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519576; cv=none; b=gpGcuzUXk1ikg47tThMhUWlJoxO5Nifpnj8HYe5ERchXdoCCrriBnlYpF42qOhXVrwVTmen6aNoayYhQ52QNxsXykZPNi211APS+ub3jl4swydz9XbWrEGVm+/MBHqzKIIO/Gr35SXyHskRVfcZE1DUQ7j81vwPmMjnt5ieqG0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519576; c=relaxed/simple;
	bh=hD9NGKKlejKeSt1pJ9c5vgFtPNhg4g13vqr2KB/HHLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kKtHyrdXcVf54SRFE22bRDH4PT9vp6oJI+orLZhFpbbrx1g2xMCw8tCxYRcfaAqLcVd/CjIJwrxIHtPOjoETDtyhBNHUjF2lDsmfnwVcD6UTpX9FE6FLnWBbJp9cvaL8CfP70S1+2nPkCoKtQ3mgdiCRhPKWmLmEqQC0zrLeysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fff7:d11a:41d8:a195])
	by michel.telenet-ops.be with bizsmtp
	id udfQ2C00B5XJrhx06dfQiN; Thu, 01 Aug 2024 15:39:24 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZW1D-004S6P-WB;
	Thu, 01 Aug 2024 15:39:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZW1c-00HO5x-4L;
	Thu, 01 Aug 2024 15:39:24 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: renesas: r8a779h0: Add CANFD clock
Date: Thu,  1 Aug 2024 15:39:19 +0200
Message-Id: <9bf71bfda338ee5411751174b03b9e870cc818e3.1722519424.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
To be queued in renesas-clk-for-v6.12.

v2:
  - Drop RFC state now it works.

Changes compared to the BSP:
  - Change clock name from can-fd to canfd0,
  - Change parent clock from CANFD to SASYNCPERD2.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index ef707dce840090ee..e20c048bfa9be142 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -176,6 +176,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
 	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
-- 
2.34.1


