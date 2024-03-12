Return-Path: <linux-renesas-soc+bounces-3705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D632C87903A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66D81B2124E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 09:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED09D77A0E;
	Tue, 12 Mar 2024 09:01:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802F77F1C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234100; cv=none; b=cQoMDdYrT9suBt6n43r+Eoxk3NNZ9bLoOyD53ZjNi+6qiOPiOKoojUbBVK7SzqzOFQnEStZG0eYaQvAJrTtIVE1cdlAjslHe/WlNRphRh5PY4e9sdygCqJkcLdBxOlkVRpUkkEYEUMyIvvk6uGDpTZ7k+Gv5KlBrzqZCfhSz1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234100; c=relaxed/simple;
	bh=kCfvEsvpJMxPZ1eGzOqQTqRBz+9aPtlM1Kr4v/GnzVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ffxHZ1FFAlO/Sa5QXQXd8+gvPq3RxzPicSyjH7rJ/169L3VOsPFqjsJTemcpo7YuqSWnNYqPW4tAJoSMr/RzAKP31W1//kagSn0LdDGQoyjtdrAA17a5x5W5BlhP3zo3bixOUWgvFPAti7UBD8Ze+/2a3BwIuqMH4vLFvox/gh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id xl1c2B00X0SSLxL01l1cx9; Tue, 12 Mar 2024 10:01:36 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy0e-003QlB-Bl;
	Tue, 12 Mar 2024 10:01:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy0u-005m5x-IP;
	Tue, 12 Mar 2024 10:01:36 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add SCIF clocks
Date: Tue, 12 Mar 2024 10:01:34 +0100
Message-Id: <82d731edd4ae4a8cd7683368131095777f4fa172.1709741224.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the module clocks used by the Serial Communication Interfaces with
FIFO (SCIF) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 5c48e645f0c3197d..4bc35bc912547f07 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -185,6 +185,10 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("rpc-if",	629,	R8A779H0_CLK_RPCD2),
+	DEF_MOD("scif0",	702,	R8A779H0_CLK_SASYNCPERD4),
+	DEF_MOD("scif1",	703,	R8A779H0_CLK_SASYNCPERD4),
+	DEF_MOD("scif3",	704,	R8A779H0_CLK_SASYNCPERD4),
+	DEF_MOD("scif4",	705,	R8A779H0_CLK_SASYNCPERD4),
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
 	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("sydm2",	710,	R8A779H0_CLK_S0D6_PER),
-- 
2.34.1


