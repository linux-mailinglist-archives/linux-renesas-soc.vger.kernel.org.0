Return-Path: <linux-renesas-soc+bounces-29215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHqcE/CEsWmjCwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:06:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F213826600C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B7F9300D1D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5873CEBAF;
	Wed, 11 Mar 2026 15:06:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43333332629;
	Wed, 11 Mar 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241581; cv=none; b=NKWlO2Q41uHZ1d7QR8rEAkCN64glPjS0rCAILcgvLkZ94wUV8YlBea8rgANUk6sIDVvISekgfdjfMhUUEG8/YF6txlolL7IbDvB2p01EYw1Rg+n+l0mgCLTinpZY7m2Kb+wwMjEhX/xV+d+uJQ54P52QbwhTDOY3NH9b3K++i04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241581; c=relaxed/simple;
	bh=FzNu4vgGuUrtD9XTpj5mbDMz6UOnaXf9tGIx7qaU2qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kC+UuJCjH0tVh2Yudxhp/xbOGq9Hqzd1eJZkeNmGKaOhrXyfzOrjqUbaC7mhahQo3UW8xrn3Xt4Uc4NlKEoOsHVGsRf+nV3LoIhF0VQ/alk3Yv0s2qcafmx8SmcBTKlShbh69otm6xMnJ8Ppx7t+z3Wv9pYCWVldJBWeYk0aRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5847EC4CEF7;
	Wed, 11 Mar 2026 15:06:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 0/2] clk: rs9: Fix and of_clk_hw_onecell_get() conversion
Date: Wed, 11 Mar 2026 16:06:09 +0100
Message-ID: <cover.1773241119.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29215-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: F213826600C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi all,

This patch series contains a fix and further development for the Renesas
9-series PCIe clock generator driver, which were submitted before as
separate patches  As the fix hasn't been picked up yet, and the further
development depends on the fix, I am resending them as a series.

Thanks for your comments!

Geert Uytterhoeven (2):
  clk: rs9: Add clock index range check to rs9_of_clk_get()
  clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()

 drivers/clk/clk-renesas-pcie.c | 39 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

