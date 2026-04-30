Return-Path: <linux-renesas-soc+bounces-31840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AdUCa1082ly4AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:26:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA94A4B7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7AD230000B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A54E2D979C;
	Thu, 30 Apr 2026 15:20:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B052D595B;
	Thu, 30 Apr 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562422; cv=none; b=iL4Kbveu7ewwwP3o0kg2cF8kczAJb/GqNxFAPquX2TDGzgoFCB6GFTQHI6CXJca5kANodwVR+too4+2jTMEdKV5HvixcM4y4K2E977EBSgYjreIP/xZIiVxcSYJse4qzKgfB8J/qZcIEWQa2MCS8zCY3o5udCLnpDyi0FLr3gJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562422; c=relaxed/simple;
	bh=qpK0mizsNpJjfbUHu3dMOFBMrZpjwfoJQfsB1MNKvxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxLDngvE8x2Al6jqfGPbCr+PtsjHvZiW3Lg6b63OU+A+4vvfjpxVZE23i2Ar+0FGuOjiehMP4JUsl3A4QYeKc4XowyQwePKKBvKpbKRdY28rmnc/yFkYevQX0yzrzv78banLTgmXRd6SeiDSgFYBiVLKqR/l9C17pcdkMCILI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336D9C2BCB3;
	Thu, 30 Apr 2026 15:20:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: Miscellaneous fixes and cleanups
Date: Thu, 30 Apr 2026 17:20:15 +0200
Message-ID: <cover.1777562043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C6BA94A4B7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31840-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.153];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

	Hi all,

This boring patch series contains a few fixes and cleanups for Renesas
clock drivers.

I intend to queue these in renesas-clk for v7.2.
Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: cpg-mssr: Add number of clock cells check
  clk: renesas: rzg2l: Consolidate DEF_MUX() and DEF_MUX_FLAGS()
  clk: renesas: rzg2l: Refactor rzg3l_cpg_pll_clk_endisable()

 drivers/clk/renesas/renesas-cpg-mssr.c |  3 +++
 drivers/clk/renesas/rzg2l-cpg.c        | 16 +++++++---------
 drivers/clk/renesas/rzg2l-cpg.h        | 13 +++++--------
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

