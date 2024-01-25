Return-Path: <linux-renesas-soc+bounces-1837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA283C717
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 16:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3B751F24630
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3314A6E2C9;
	Thu, 25 Jan 2024 15:45:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A773167
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706197518; cv=none; b=k6ZkVwSiC8f18SE87NskaVPvFWn9aFYkPnKhuiJwSjm60+NdWnMW4NIZk2RSk+VZNCjuEx4ZgSexYTvNF39b02R8JDjCJnLyBTUs5ibC1FXGCgZOFfyhLjYT+TNQIK66tuH6fYkDWXBxmDi4CZjKCUXbDGe5B2Dcx4kn/y1blCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706197518; c=relaxed/simple;
	bh=tjx0kB5t1mtSiLuBIHGy52wQSendZTZpOpa1t6YeX+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dd3uoJcgo2O1/4fGH1SWE3E6Ex98T/ETeR1jTutkPVKnmNFyJCInRWKBGR99f+Bn+ybOrIQF93SRhtQDuDHC+SczpLnWUwco32qNwi3D6y2mEM/bio1oRf1/D7GkUQZ9sMoWKlJTIvSmWwz8h+83dPkv7P6tDrVc77SgmI4i1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by xavier.telenet-ops.be with bizsmtp
	id f3lE2B00Q58agq2013lE0N; Thu, 25 Jan 2024 16:45:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1tw-00GUxb-HX;
	Thu, 25 Jan 2024 16:45:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1uk-00Fs8z-FE;
	Thu, 25 Jan 2024 16:45:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] clk: renesas: r8a779f0: Correct PFC/GPIO parent clock
Date: Thu, 25 Jan 2024 16:45:13 +0100
Message-Id: <f88ec4aede0eaf0107c8bb7b28ba719ac6cd418f.1706197415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the R-Car S4 Series Hardware User’s Manual Rev.0.81, the
parent clock of the Pin Function (PFC/GPIO) module clock is the CP
clock.

As this clock is not documented to exist on R-Car S4, use the CPEX clock
instead.

Fixes: 73421f2a48e6bd1d ("clk: renesas: r8a779f0: Add PFC clock")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
CPEX is the clock closest to CP that is actually documented.

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index f721835c7e21248b..cc06127406ab5737 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -161,7 +161,7 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("cmt1",		911,	R8A779F0_CLK_R),
 	DEF_MOD("cmt2",		912,	R8A779F0_CLK_R),
 	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
-	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
+	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CPEX),
 	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
 	DEF_MOD("rswitch2",	1505,	R8A779F0_CLK_RSW2),
 	DEF_MOD("ether-serdes",	1506,	R8A779F0_CLK_S0D2_HSC),
-- 
2.34.1


