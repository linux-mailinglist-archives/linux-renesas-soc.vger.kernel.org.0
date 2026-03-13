Return-Path: <linux-renesas-soc+bounces-29332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMg9Dqzxs2nYdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:14:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A352820D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5092E31537CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 11:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45E8375F85;
	Fri, 13 Mar 2026 11:12:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0E373BF7;
	Fri, 13 Mar 2026 11:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400368; cv=none; b=LtiRm2693ADlUWBkn2HCpW4p8ebL2UbitLJhaXxD8AO4n5lc/DCQ1YrsnzJgiZRSdyH7jTOOe9+5SggpWxtR046oTG30SZun7MN59AmQxyVjQCJ8a/FoQMeXLH3mCDe5aE8sbOtTpGapBAx3wyhjN3N4BLboANYrj/Ti472hc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400368; c=relaxed/simple;
	bh=NFZpjIAyUab4DYj1/UTJU3PWyaWuKyvwVmQimKfYq78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gw/cbFo861QhlR2TfArjrrdDKzAz4fU7DflJUj00Us4K9IymMXBnj2lFhWX0L75Vff8phrBjPJduAZXl4boGGBQSKrlWmROtbT1J/VAK2vT3IGUwYAC0yIMcgH70iqduRlLwM1wy1+Kt7zRtPNJYt3KGLmQ/AEk6t/dBAYpZxH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4346CC19421;
	Fri, 13 Mar 2026 11:12:47 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v7.0
Date: Fri, 13 Mar 2026 12:12:42 +0100
Message-ID: <cover.1773399246.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29332-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1A352820D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Linus,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v7.0-tag1

for you to fetch changes up to fb22bb9701d48c4b0e81fe204c2f96a37a520568:

  pinctrl: renesas: rza1: Normalize return value of gpio_get() (2026-03-10 10:33:47 +0100)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v7.0

  - Fix device node leaks and invalid wait contexts on RZ/T2H and
    RZ/N2H,
  - Fix GPIO .get() callback on RZ/A1.

Thanks for pulling!

----------------------------------------------------------------
Cosmin Tanislav (1):
      pinctrl: renesas: rzt2h: Fix invalid wait context

Dmitry Torokhov (1):
      pinctrl: renesas: rza1: Normalize return value of gpio_get()

Felix Gu (1):
      pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()

 drivers/pinctrl/renesas/pinctrl-rza1.c  |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

