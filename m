Return-Path: <linux-renesas-soc+bounces-32800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EpqDqdADGqqawUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:51:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F5657CD9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E47793107C06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2721370AD5;
	Tue, 19 May 2026 10:36:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D978C370AD2;
	Tue, 19 May 2026 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186982; cv=none; b=gf37lcOchZZbGDQqbTP3nZPeb0FcDB7B/eeANSVTx8EAapC6YUMdFp8742hmJKj/nsnHpp5EPqIgA1rL30/A9M1anpieGyfum2xj2e2qzLK2tju9wNJKMT10x9vLvbszyN/zDj+9DfST7okf1LyBxSEI1GAbi0u/Hpm5drs9bBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186982; c=relaxed/simple;
	bh=FSPUfi9gDEuhVckzvwrIxZrRN6HpmokRGTOqQKxY8Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GY78HX6yZZC1H/Vf9WenPO9mPYlwWE3hOkyXVi60bskRudnd9bJlORl7wD2Djt7GuIG/uQ4xANLYdOlhRfVOUznauXGDqqHoIjyaatMmnTBm9GNklT3rt5cfXtYMgZoJ9FU4W4xmpyPrfDlEaxgvVMZpcBAmbh/AuY9MDdBtwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4A8C2BCFB;
	Tue, 19 May 2026 10:36:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.2
Date: Tue, 19 May 2026 12:36:18 +0200
Message-ID: <cover.1779185560.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32800-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: A9F5657CD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Mike, Stephen,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.2-tag1

for you to fetch changes up to 4f42053949324867dc40d67829f18a01539e6322:

  clk: renesas: r8a73a4: Add ZT/ZTR trace clocks (2026-05-15 11:30:51 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v7.2

  - Add Ethernet, GPIO, CPU core, watchdog, serial, I2C, sound, and SPI
    clocks and resets on RZ/G3L,
  - Add the timer (MTU3) clock on RZ/T2H and RZ/N2H,
  - Add Coresight trace clocks on R-Mobile A1 and APE6,
  - Add display clocks and resets on RZ/G3E,
  - Miscellaneous fixes and improvements.

Note that this includes:
  - DT binding definition updates for the R-Mobile A1 and APE6 SoCs,
    which are shared by the clock subsystem and DT source files,
  - RZ/G3E Clock Pulse Generator PLLDSI limits, which are shared by
    clock and MIPI DSI driver source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (13):
      clk: renesas: rzg2l: Drop always-false check in rzg3s_cpg_pll_clk_recalc_rate()
      clk: renesas: rzg2l: Add support for enabling PLLs
      clk: renesas: r8a08g046: Add support for PLL6
      clk: renesas: r9a08g046: Add GBETH clocks and resets
      clk: renesas: r9a08g046: Add GPIO clocks/resets
      clk: renesas: r9a08g046: Add CA55 core clocks
      clk: renesas: r9a08g046: Add WDT clocks and reset
      clk: renesas: r9a08g046: Add SCIF{1..5} clocks and resets
      clk: renesas: r9a08g046: Add I2C clocks and resets
      clk: renesas: r9a08g046: Add IA55_PCLK to critical module clocks
      clk: renesas: r9a08g046: Add RSCI clocks and resets
      clk: renesas: r9a08g046: Add SSIF-2 clocks and resets
      clk: renesas: r9a08g046: Add RSPI clocks and resets

Cosmin Tanislav (1):
      clk: renesas: r9a09g077: Add MTU3 module clock

Geert Uytterhoeven (6):
      Merge tag 'renesas-r8a7740-dt-binding-defs-tag1' into renesas-clk-for-v7.2
      Merge tag 'clk-renesas-rzg3e-plldsi-tag' into renesas-clk-for-v7.2
      clk: renesas: rzg2l: Consolidate DEF_MUX() and DEF_MUX_FLAGS()
      clk: renesas: rzg2l: Refactor rzg3l_cpg_pll_clk_endisable()
      clk: renesas: cpg-mssr: Add number of clock cells check
      Merge tag 'renesas-r8a73a4-dt-binding-defs-tag1' into renesas-clk-for-v7.2

Marek Vasut (4):
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
      clk: renesas: r8a7740: Add ZT/ZTR trace clocks
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6
      clk: renesas: r8a73a4: Add ZT/ZTR trace clocks

Tommaso Merciai (8):
      clk: renesas: rzv2h: Add PLLDSI clk mux support
      clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
      clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
      clk: renesas: r9a09g047: Add support for DSI clocks and resets
      clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

 .../bindings/clock/renesas,cpg-clocks.yaml         |   8 +-
 drivers/clk/renesas/clk-r8a73a4.c                  |   2 +
 drivers/clk/renesas/clk-r8a7740.c                  |   2 +
 drivers/clk/renesas/r9a08g046-cpg.c                | 358 +++++++++++++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c                |  84 +++++
 drivers/clk/renesas/r9a09g077-cpg.c                |   1 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   3 +
 drivers/clk/renesas/rzg2l-cpg.c                    |  68 +++-
 drivers/clk/renesas/rzg2l-cpg.h                    |  11 +-
 drivers/clk/renesas/rzv2h-cpg.c                    | 181 +++++++++++
 drivers/clk/renesas/rzv2h-cpg.h                    |  12 +
 include/dt-bindings/clock/r8a73a4-clock.h          |   2 +
 include/dt-bindings/clock/r8a7740-clock.h          |   2 +
 include/linux/clk/renesas.h                        |  20 ++
 14 files changed, 747 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

