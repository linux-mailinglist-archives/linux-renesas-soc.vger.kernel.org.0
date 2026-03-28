Return-Path: <linux-renesas-soc+bounces-30532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SILoBnXFx2mTcAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:11:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B434E590
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70559300A74D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 12:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8763F389E1D;
	Sat, 28 Mar 2026 12:11:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885132D0DE;
	Sat, 28 Mar 2026 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699890; cv=none; b=YP/VIivsy54O6HqswNEcjJIOJbKwuyaDtkU1ISEbmTkcnFJvkV4zxkqzJFRbVzNXk/+fQJm6wK7BpQKUQ3keh2HFSblY4itIqSjhdr1jznoUo2xs3wFBBj/E3pIkFJsEQY/mqhkmydCCho0dihUCK8cyvkRjOTuwi/cLcZ1ocWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699890; c=relaxed/simple;
	bh=3iLPKXWCoIdp2Rx75lW7jVHshQNuHmuryVfqHKccmmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcK+XbnEh6Ki7iULHcVAMwGtT3GGg1s66tsF2Owf2zNcf7Pept/1vN/YEpXoahjz6wfWnq5Yd04LZ3UJge6ZVwF89TIiwrVjX/IgKuYpW4ehrPbbU0Cc3PANlkZtlX/XmACesQt1qdK15nLVXDwUW5BzrJQaTWCD+QGBgWnWsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4A1C4CEF7;
	Sat, 28 Mar 2026 12:11:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:25 +0100
Message-ID: <cover.1774606649.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30532-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF5B434E590
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Mike, Stephen,

The following changes since commit c8d5972a25408b1daf73653ccd5207fdfc80c964:

  clk: renesas: r9a09g056: Add clock and reset entries for RTC (2026-03-06 13:33:56 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.1-tag2

for you to fetch changes up to 77894661c00ab99053c9606f0f7ec673065f86ac:

  clk: renesas: Add support for RZ/G3L SoC (2026-03-26 19:45:48 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v7.1 (take two)

  - Add SPI clocks and resets on RZ/G3E,
  - Add PCIe clocks and resets on RZ/V2N, RZ/V2H(P), and RZ/G3E,
  - Enable watchdog reset on RZ/N1D,
  - Remove clocks for watchdogs meant for other CPU cores on RZ/V2N,
  - Handle critical clock during system resume on RZ/G2L, RZ/G2UL, and
    RZ/G3S,
  - Add initial support for the RZ/G3L (R9A08G046) SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (7):
      clk: renesas: rzg2l: Add support for critical resets
      clk: renesas: r9a0{7g04[34],8g045}: Add critical reset entries
      clk: renesas: rzg2l: Add helper for mod clock enable/disable
      clk: renesas: rzg2l: Add rzg2l_mod_clock_init_mstop_helper()
      clk: renesas: rzg2l: Re-enable critical module clocks during resume
      dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3L SoC
      clk: renesas: Add support for RZ/G3L SoC

Fabrizio Castro (1):
      clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag1' into renesas-clk-for-v7.1

Herve Codina (Schneider Electric) (1):
      clk: renesas: r9a06g032: Enable watchdog reset sources

John Madieu (1):
      clk: renesas: r9a09g047: Add PCIe clocks and reset

Lad Prabhakar (2):
      clk: renesas: r9a09g056: Add PCIe clocks and reset
      clk: renesas: r9a09g057: Add PCIe clocks and reset

Rosen Penev (1):
      clk: renesas: cpg-mssr: Use struct_size() helper

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add entries for the RSPIs

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  40 ++-
 drivers/clk/renesas/Kconfig                        |   7 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r9a06g032-clocks.c             |   5 +-
 drivers/clk/renesas/r9a07g043-cpg.c                |   9 +
 drivers/clk/renesas/r9a07g044-cpg.c                |  13 +
 drivers/clk/renesas/r9a08g045-cpg.c                |   9 +
 drivers/clk/renesas/r9a08g046-cpg.c                | 153 +++++++++
 drivers/clk/renesas/r9a09g047-cpg.c                |  29 ++
 drivers/clk/renesas/r9a09g056-cpg.c                |  20 +-
 drivers/clk/renesas/r9a09g057-cpg.c                |   5 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   4 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |  91 +++++-
 drivers/clk/renesas/rzg2l-cpg.h                    |   8 +
 include/dt-bindings/clock/renesas,r9a08g046-cpg.h  | 342 +++++++++++++++++++++
 15 files changed, 698 insertions(+), 38 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g046-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

