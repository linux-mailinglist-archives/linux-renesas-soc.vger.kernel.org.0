Return-Path: <linux-renesas-soc+bounces-34851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b4zNNDMlTmonEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:23:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42D7243CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A9230D403D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80A739281B;
	Wed,  8 Jul 2026 10:15:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE8380FFD;
	Wed,  8 Jul 2026 10:15:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505721; cv=none; b=GaI5fXAudkNQPdfBMdH1GguC9PgpyaEBWqQcIrhSGM+eHIFQP4oLQu8zd6hM1pHOoMYP+cA4jd0Q1mNN+wV1xGtYcvvtqQWiCyF1THoBGabZu/5FM4YxnsgP7PtfTDcNJ2pTEkZ94jl5gc8SWjqt5EPDfFzx10avrcTnayhPQeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505721; c=relaxed/simple;
	bh=5tvlj1Jg/kBw/iZacMOm4SIRGWlDMHmtuDl1+CS763I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sqnf4OZxs5rwXYuLbBYGNyvUhbrMJ/aJ/jqe4CX7H5UETxtsGdyBB7oQ4A5ubRIyboSvWfERbi9JHcozJhAFGIEPkmrFERPC6vH+YN7Kq0Q6ONrM4klLUi7c3NAI0GmABelhHOjljqFn6k1AoYrYWL4U9Dvc2T5RVeKZ4hblwO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89631F000E9;
	Wed,  8 Jul 2026 10:15:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/6] R-Car X5H CPG/MDLC support
Date: Wed,  8 Jul 2026 12:15:05 +0200
Message-ID: <cover.1783505142.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34851-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-m68k.org:email,glider.be:mid,glider.be:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C42D7243CD

	Hi all,

This patch series adds minimal support for the Renesas R-Car X5H Clock
Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacing
the dummy clocks in r8a78000.dtsi with proper hardware description.
These two components are closely related, in the sense that they are
both supposed to be accessed through the ARM System Control and
Management Interface (SCMI) on the Ironhide development board.

This series consists of three parts:
  1. Patches 1-2 add DT bindings and DT binding definitions,
  2. Patches 3-4 add minimal CPG and MDLC drivers,
  3. Patches 5-6 update the DTS.

Some of these patches have been sent before as part of "[PATCH/RFC
00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"[1], hence the v2.
However, this series does not use or rely on SCMI in any way.

Major changes compared to v1[1] (more detail in the individual patches):
  - Add default support not using SCMI,
  - Drop everything related to SCMI.

SCMI remapping support will be added in a subsequent series[2].
Full hardware support without using SCMI could be added, too, if anyone
would care about that use case.

For testing, I have pushed this series plus additional work to[3].

Thanks for your comments!

[1] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/cover.1776793163.git.geert+renesas@glider.be
[2] "[PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support"
    https://lore.kernel.org/cover.1783505329.git.geert+renesas@glider.be
[3] topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2 branch of
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Geert Uytterhoeven (6):
  dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
  dt-bindings: power: Document Renesas R-Car X5H Module Controller
  clk: renesas: Add R-Car X5H CPG driver
  pmdomain: renesas: Add R-Car X5H MDLC driver
  arm64: dts: renesas: r8a78000: Add CPG node
  arm64: dts: renesas: r8a78000: Add MDLC nodes

 .../bindings/clock/renesas,r8a78000-cpg.yaml  |  55 +++
 .../bindings/power/renesas,r8a78000-mdlc.yaml |  61 ++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 300 ++++++++++++++--
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a78000-cpg.c            | 216 ++++++++++++
 drivers/pmdomain/renesas/Kconfig              |   4 +
 drivers/pmdomain/renesas/Makefile             |   1 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c      | 329 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |  14 +
 .../dt-bindings/power/renesas,r8a78000-mdlc.h |  15 +
 12 files changed, 976 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c
 create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

