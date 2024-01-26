Return-Path: <linux-renesas-soc+bounces-1858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433983D95C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 12:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA77B2E93D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 10:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A725F63A;
	Fri, 26 Jan 2024 10:56:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36C12E57
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266611; cv=none; b=nXfOnapaKkoa0WtplLX2cuCzGsuIMe7CiI/T/q9tUkwbS2WkcKKGgFtBHQkVekIIFVArm6hTtrpgKiNQBTifcLlJ9T1foCEJ0hQPNvGgJ/1UQWSv5Ww8onEm6YdTn5Plsltpe6v9Apyy3j8vuEGO6JoIGlIob1lFaZzxNqgIYp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266611; c=relaxed/simple;
	bh=Z1K8XxAr0NS1rz0ikSX+SB4azNcTAf76x+/v/glo0BM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sKhGuwoyVbqhX46byIAq0uhRi2ULeBaPfmucqAFdOIfmHyB8vZcEzyqpjqoKNAx6Z2N0njEh7/j7mAdPu3w1A4CXLEihKAW1cdZUIea/6e0HqIvw6MKHRwZsjeQg/pYIofqWVzPRugLzaMkhJ9QmB+wL4BMsjvnLK+tMC78Qfbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by albert.telenet-ops.be with bizsmtp
	id fNwm2B0091AdMdB06NwmND; Fri, 26 Jan 2024 11:56:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsK-00GWgN-3W;
	Fri, 26 Jan 2024 11:56:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJne-00G5ZK-84;
	Fri, 26 Jan 2024 11:51:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add PFC/GPIO clocks
Date: Fri, 26 Jan 2024 11:50:56 +0100
Message-Id: <a7d8f4111b87decb825db5ed310de8294f90b9f9.1706266196.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the Pin Function Controller (PFC) and
General Purpose Input/Output (GPIO) blocks on the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Change parent clock from CL16M to CP.

To be queued in renesas-clk for v6.9.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 1259b8544980f07a..219941047291d34d 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -177,6 +177,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif3",	517,	R8A779H0_CLK_SASYNCPERD1),
+	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
+	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
+	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
 };
 
 /*
-- 
2.34.1


