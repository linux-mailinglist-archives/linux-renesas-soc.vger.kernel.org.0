Return-Path: <linux-renesas-soc+bounces-33398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN5PKByHHWrObQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 15:20:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7E61FEE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 15:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00ACE3039898
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 13:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9573A4F3E;
	Mon,  1 Jun 2026 13:18:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBFD342519;
	Mon,  1 Jun 2026 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319919; cv=none; b=crqr3jv6fYpJQag8Rmsdg4QdHjc11GQZxf091eiybRgpQ+7IIz/BKozNxVivddeepr1N9tnXcVZYe1SV3lcFe4/1OjDS7lFQFFt9e7ZrTEDpIRvr8iTDYPdHsIZ5BSxRDk/F0NRMLstNNhX1mKDiSqoHBI8PnJBadDqdIikLrEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319919; c=relaxed/simple;
	bh=5WW1bwN/yfr3zTfea2XM9J3I5aHzpZV+6l/6ZZ9QjJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drF/NSV1s4piiBr1eqe6xSuJaWpEo/0shvR5l8wCONBIStW44Msw33av25TCFhcOBHChVtkgKa7h+EVjvjiu/CtvbBvRK1gn/+vpMqV8zp2S6TGWNllhrn2Rq6RwX49IXAtr9JUJxTP7iyHTGNbaMEROjw+g7RwPHJwPItEinCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECC21F00893;
	Mon,  1 Jun 2026 13:18:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:33 +0200
Message-ID: <cover.1780319315.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33398-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.985];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: 47C7E61FEE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Mike, Stephen,

The following changes since commit 4f42053949324867dc40d67829f18a01539e6322:

  clk: renesas: r8a73a4: Add ZT/ZTR trace clocks (2026-05-15 11:30:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.2-tag2

for you to fetch changes up to f5e45196023dd454dcf5dd8add1cf99d77336271:

  clk: renesas: r9a08g045: Drop unused pm_domain header file (2026-05-28 15:09:54 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v7.2 (take two)

  - Add the Display Stream Compression (DSC) clock on R-Car V4H,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (4):
      clk: renesas: rzg2l: Simplify SAM PLL configuration macro
      clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
      clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
      clk: renesas: r9a08g045: Drop unused pm_domain header file

Lad Prabhakar (2):
      clk: renesas: r9a08g045: Drop unused DEF_G3S_MUX macro
      clk: renesas: rzg2l: Rename iterator in for_each_mod_clock() to avoid shadowing

Marek Vasut (1):
      clk: renesas: r8a779g0: Add DSC clock

 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  1 +
 drivers/clk/renesas/r9a07g043-cpg.c     |  2 +-
 drivers/clk/renesas/r9a07g044-cpg.c     |  2 +-
 drivers/clk/renesas/r9a08g045-cpg.c     | 13 +---------
 drivers/clk/renesas/r9a08g046-cpg.c     |  7 ++---
 drivers/clk/renesas/r9a09g011-cpg.c     |  7 +----
 drivers/clk/renesas/rzg2l-cpg.c         | 46 ++++++++++++++++-----------------
 drivers/clk/renesas/rzg2l-cpg.h         |  7 ++---
 8 files changed, 32 insertions(+), 53 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

