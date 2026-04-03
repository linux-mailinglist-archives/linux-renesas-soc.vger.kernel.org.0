Return-Path: <linux-renesas-soc+bounces-30821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGxPLkCAz2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:54:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0239260D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A2230B4C42
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF5437DEAE;
	Fri,  3 Apr 2026 08:48:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0037B025;
	Fri,  3 Apr 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206110; cv=none; b=JymXnTDrvfgQPcbSOKxLY1mmLfpKg+wU+0LhYqHE4YyRgCAu2fy84dCejYJzqF6y7Toyq4zBasDVIo/SsqouG2WJ83mpiWVDMbkl3KURv810T2lqE3rKM9csuwtE0B3pZsIdeLaj/GGPPhYHYKEamYpk9Pn95lnCCV66/aR4nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206110; c=relaxed/simple;
	bh=re0JBZsd8vFNZr3fr3OKWjBU3vmeAf0fLRgH4Xtylx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6yrfNA5KJnn59zKh58YYBQQtuq22qeIKJ8DFBvy4YHB7n9x3vE5S4F4G91uELqr8KeDZvwEqPPVAguk6jeCe+6vvnBOSbVIfNWUzvDl0Xgw/RVlqT22iaotqe/NZ8LsBYzC/i3giDvaem2Zl9I+yz4tiuZ+XrfYn3lcmQ5J73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67FAC4CEF7;
	Fri,  3 Apr 2026 08:48:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] irqchip/renesas-rzv2h: Cleanups
Date: Fri,  3 Apr 2026 10:48:20 +0200
Message-ID: <cover.1775205874.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30821-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4DA0239260D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi all,

This patch series contains some cleanups for the RZ/V2H interrupt
controller driver.  It has been compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (3):
  irqchip/renesas-rzv2h: Kill swint_idx[]
  irqchip/renesas-rzv2h: Kill swint_names[]
  irqchip/renesas-rzv2h: Kill icu_err string

 drivers/irqchip/irq-renesas-rzv2h.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

