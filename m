Return-Path: <linux-renesas-soc+bounces-29331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDvQOVjxs2nYdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BB282055
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A550D3054652
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B57373BF7;
	Fri, 13 Mar 2026 11:12:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C4372B3B;
	Fri, 13 Mar 2026 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400355; cv=none; b=hnEJwxsJ5p9i/C8C8+X6bfNngjlULya8E1RDncNmBawEfxbRPnxCPdF8IQGGTluQGYQLYmd12GtxkQ0IJLzYxiFRAx2LKtKBLyxcP6zFqQNGsBRBEc9cEj/1buON9Wp5JCdMbalUDYVTiRiHRl2lSH63fc8QAqn+ntODTDYSk0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400355; c=relaxed/simple;
	bh=Lcgjt9aQaSvI2Lg2PSLI0q/UcRiMvHEy3NDrv9AP3K8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cqtuud88kjhWM4M7NFKaKx81t7a7GwBUE87OBnqJrtYuXULgu9mOz0BKVMimUm3NbuPXrPQh7XHXLhnRXIFcabqjl0MbPRRst1sy24YpLlg1OLOwfpg6AWJr5ggJamy+A+Qv3Rdn6sTZjLFvbJHgsAF5ajS1hFXuF2XxLwNOM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA44C19421;
	Fri, 13 Mar 2026 11:12:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Fixes for v7.0
Date: Fri, 13 Mar 2026 12:12:26 +0100
Message-ID: <cover.1773399185.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29331-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid]
X-Rspamd-Queue-Id: 7C0BB282055
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Mike, Stephen,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-fixes-for-v7.0-tag1

for you to fetch changes up to 1b4f047dc4010d51821694cc4ed73b52b3040a5c:

  clk: renesas: r9a09g057: Remove entries for WDT{0,2,3} (2026-03-06 13:33:52 +0100)

----------------------------------------------------------------
clk: renesas: Fixes for v7.0

  - Fix ordering of module clocks arrays on RZ/V2H(P) and RZ/V2N,
  - Remove clocks for watchdogs meant for other CPU cores on the
    RZ/V2H(P) SoC.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (1):
      clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}

Ovidiu Panait (2):
      clk: renesas: r9a09g057: Fix ordering of module clocks array
      clk: renesas: r9a09g056: Fix ordering of module clocks array

 drivers/clk/renesas/r9a09g056-cpg.c | 36 ++++++++++++------------
 drivers/clk/renesas/r9a09g057-cpg.c | 55 ++++++++++++++-----------------------
 2 files changed, 38 insertions(+), 53 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

