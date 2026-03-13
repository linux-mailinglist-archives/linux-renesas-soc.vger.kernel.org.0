Return-Path: <linux-renesas-soc+bounces-29337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKZJImDxs2nYdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0928207A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672D8305EBA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84937266C;
	Fri, 13 Mar 2026 11:13:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A733FE15;
	Fri, 13 Mar 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400391; cv=none; b=d0wfREtos9vhFse/6W1uYYlQ4H0W4DVD/iuEon7M6ZdY17a5SZ9/Ao4ZJvpH2or51mtC31MbP3/pMrlr0t04z2CjGd4FJ/TzdiOoWQA6WjRPtSzqPLWrk7ZW0AY6mXA6dxKirXFpILcx+6gptKjC0d/29qHj8VSEX6W+3tCgikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400391; c=relaxed/simple;
	bh=XPqDRl53+zluuHkHtmeaGiu6SKOSvHLUNEFuI+HTsc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWI/ncn05/vBjydnzMQgLGG1tUN356IGOyb3uqircfVnz6gpgfr6qSq6qcQHl74epGgMMpN/DodpsYgtVwzQkOIejf7reeHZIZK6eeQlWE8ySM/dutOG0cDqLEG10Fg1CRRCSzFq71s7K27dvwwaofzQCR/k3uA7XQeY+1ftn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BEFC2BC87;
	Fri, 13 Mar 2026 11:13:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v7.1
Date: Fri, 13 Mar 2026 12:13:00 +0100
Message-ID: <cover.1773399675.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29337-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AE0928207A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1

for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:

  ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)

----------------------------------------------------------------
Renesas DTS updates for v7.1

  - Add CPU frequency scaling and QSPI NOR FLASH support on the RZ/N1
    SoC and the RZN1D-DB development board,
  - Add PCIe slot power control on the R-Car H3, M3-W(+), M3-N, and E3
    SoCs,
  - Add USB3.0 PHY support on the R-Car E3 SoC and the Ebisu development
    board,
  - Add PCIe/USB3.0 clock generator support on the Salvator-X(S), ULCB
    King Fisher extension, and Ebisu development boards,
  - Add RTC support on the RZ/V2N SoC and its EVK board,
  - Add SPI DMA support on the RZ/T2H, RZ/N2H, RZ/V2H(P), and RZ/V2N
    SoCs,
  - Add support for the second SDHI channel on the Atmark Techno
    Armadillo-800-EVA board,
  - Miscellaneous fixes and improvements.

Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".

----------------------------------------------------------------
Cosmin Tanislav (2):
      arm64: dts: renesas: r9a09g077: Wire up DMA support for SPI
      arm64: dts: renesas: r9a09g087: Wire up DMA support for SPI

Geert Uytterhoeven (1):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use underscores in node names

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add support for CPU frequency scaling

Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
      arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels

Marek Vasut (10):
      arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0 pins as bootph-all
      arm64: dts: renesas: r8a77951: Describe PCIe root ports
      arm64: dts: renesas: r8a77960: Describe PCIe root ports
      arm64: dts: renesas: r8a77961: Describe PCIe root ports
      arm64: dts: renesas: r8a77965: Describe PCIe root ports
      arm64: dts: renesas: r8a77990: Describe PCIe root port
      arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
      arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock generator
      arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock generator
      arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

Miquel Raynal (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Describe the QSPI controller

Ovidiu Panait (2):
      arm64: dts: renesas: r9a09g056: Add RTC node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC

Wolfram Sang (2):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Add QSPI node including NOR flash
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Use interrupts for Micrel PHYs

bui duc phuc (2):
      ARM: dts: renesas: armadillo800eva: Enable SDHI1
      ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232

 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |  32 ++++++
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 111 +++++++++++++++++++--
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  47 +++++++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  43 +++++++-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  27 +++++
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   5 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  36 +++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   4 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  21 ++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  16 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  16 +++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  28 +++++-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  21 +++-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |  13 +++
 18 files changed, 490 insertions(+), 10 deletions(-)

