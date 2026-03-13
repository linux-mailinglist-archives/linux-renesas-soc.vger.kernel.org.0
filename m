Return-Path: <linux-renesas-soc+bounces-29338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKBLCGHxs2nYdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4829282081
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B20C3005AF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 11:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5D037B002;
	Fri, 13 Mar 2026 11:13:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D6331215;
	Fri, 13 Mar 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400400; cv=none; b=gMgRmZZn931XtVhUrxAUjv6hUfAy3EHHcs5QYFO5ZfsL7f18Ip9mQncLjZustzI3UPvRn5rPzOpLEkMqUCIf2lzhqSDVKFa0KjA4yjKZpH/XxYOThC+weoGAU/87w0v9NeQt1kRsL4grmShUr8s/wTYQQ+bCRrAlyTk3FTmZm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400400; c=relaxed/simple;
	bh=7DzwFuH9mt0HQpYqoW2W8Yk6M8W4P/ovORgLmKkXir0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTiFJfcw1aUae5M9e2428PGsBJccNMXR63y4oeXLyG8Bxr3H//3fP5zteaq+1xUJc/MP3w6amiPflHZo62/r1ygA43jus1YOS7D9D2MICEC1SIJTBSMg39gWoG36p5wdt6MlZ4UB48qgSKDXumMDXrWgQY3ZJDAoTiToZvNEBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709C9C2BC9E;
	Fri, 13 Mar 2026 11:13:18 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.1
Date: Fri, 13 Mar 2026 12:13:15 +0100
Message-ID: <cover.1773399986.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-29338-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4829282081
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Mike, Stephen,

The following changes since commit 1b4f047dc4010d51821694cc4ed73b52b3040a5c:

  clk: renesas: r9a09g057: Remove entries for WDT{0,2,3} (2026-03-06 13:33:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.1-tag1

for you to fetch changes up to c8d5972a25408b1daf73653ccd5207fdfc80c964:

  clk: renesas: r9a09g056: Add clock and reset entries for RTC (2026-03-06 13:33:56 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v7.1

  - Add RTC clocks and resets on RZ/V2N.

Note that this PR is based on "[GIT PULL] clk: renesas: Fixes for v7.0".

Thanks for pulling!

----------------------------------------------------------------
Ovidiu Panait (1):
      clk: renesas: r9a09g056: Add clock and reset entries for RTC

 drivers/clk/renesas/r9a09g056-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

