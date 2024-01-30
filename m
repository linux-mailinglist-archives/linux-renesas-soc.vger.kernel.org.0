Return-Path: <linux-renesas-soc+bounces-1979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC80842012
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A164A1C2529F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815D356448;
	Tue, 30 Jan 2024 09:48:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910F605D5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706608083; cv=none; b=rsuDlVfcov2Ufx+D0LIUS2bzYLvh3O2kBZbFliQWr6LvwK6zN5m4lL109EArPPpA56WcKHwDa/4h1d8PC9ZH5sFQ+nrWD1VciFzaNu1U3FZGZzQWtt/ypNQMuPiJR5OAWBm7r4YR3yElg9JjZruxdjuTgA7v+cKPwUoM10M4m3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706608083; c=relaxed/simple;
	bh=O0/CNmJZu9q7yjVHGZm34xHy2fNGzbA46xCEL1HgCkk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RnOP0pm4arkoqyRWz1gh8b4XgIknEQbYCU9EcvIvLuzMe3iZw+4YKALFEEs4PTAYnocKaM0H5nBILzEdC+MGu1QnA4RX1sirvBSVk6Az0q5VoGo6A6soyIfKG738OzKRkX2KTklH7ygGNPm9A91Jm9m98A3bw7CP4ZjckTCFoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f750:330f:8670:f608])
	by albert.telenet-ops.be with bizsmtp
	id gxnr2B0090wcXdf06xnrgu; Tue, 30 Jan 2024 10:47:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rUkhn-00Glvw-80;
	Tue, 30 Jan 2024 10:47:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rUkic-007vrE-S6;
	Tue, 30 Jan 2024 10:47:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779g0: Fix PCIe clock name
Date: Tue, 30 Jan 2024 10:47:49 +0100
Message-Id: <f582067564f357e2183d3db67b217084ecb51888.1706608032.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the name of the module clock for the second PCIe channel.

Fixes: 5ab16198b431ca48 ("clk: renesas: r8a779g0: Add PCIe clocks")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 0acc301221e552f7..c4b1938db76b35f4 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -194,7 +194,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("msi4",		622,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779G0_CLK_MSO),
 	DEF_MOD("pciec0",	624,	R8A779G0_CLK_S0D2_HSC),
-	DEF_MOD("pscie1",	625,	R8A779G0_CLK_S0D2_HSC),
+	DEF_MOD("pciec1",	625,	R8A779G0_CLK_S0D2_HSC),
 	DEF_MOD("pwm",		628,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("rpc-if",	629,	R8A779G0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779G0_CLK_SASYNCPERD4),
-- 
2.34.1


