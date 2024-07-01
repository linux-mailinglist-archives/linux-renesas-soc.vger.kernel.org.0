Return-Path: <linux-renesas-soc+bounces-6931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09491DFFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 14:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DA701C20BE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 12:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A923C15990C;
	Mon,  1 Jul 2024 12:56:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33310145B09
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jul 2024 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838588; cv=none; b=g3C4sI8nvBKqLo7//QajBORu3ldev0fUeek/hrFzAasVBPoj9996mv2vCVv12B4AhAATPxHa3BV9YRRd2akvc9FJ7VWhwCVJnvmf8l1yezkdyow7FwZFwNhlgiupMOFBHbswclrE6UHB8xf2HFmvzoSdGzdxkEAZ4SgCKNfGy3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838588; c=relaxed/simple;
	bh=u9tlGIeSRwzZNDgK1nl5OqF2ZUz9MWy47tgboAZxohs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ObsiA+69WfvFfq1xcjY5CBw/1KwgtxRPY6ciFc//cDxnaee4zCp4zo4+qzq4++bZIt8Rdg2PXM+GDquxJ48S8qxu0taH8t7x8reKweA6bXaIBSRBKGB6BErNF+QYTXOU+nI0i1POqDJlxa+du6ujxFPJqTWXVGO8rqztevE0iIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1c8a:3990:9784:a231])
	by michel.telenet-ops.be with bizsmtp
	id iCwG2C00C4bcH3806CwGqZ; Mon, 01 Jul 2024 14:56:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOGZk-000oEs-UP;
	Mon, 01 Jul 2024 14:56:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOGZs-001GYn-Eo;
	Mon, 01 Jul 2024 14:56:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL v2] Renesas DTS updates for v6.11 (take two)
Date: Mon,  1 Jul 2024 14:56:15 +0200
Message-Id: <cover.1719837594.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is v2 of my second pull request for the inclusion of Renesas SoC
updates for v6.11.  It replaces "[GIT PULL 0/3] Renesas SoC updates for
v6.11 (take two)", which I sent last Friday.

Changes compared to v1:
  - Back out all R-Car fuse commits.

The following changes since commit 2bb78d9fb7c997f13309838600eead88cc99e96b:

  arm64: dts: renesas: r8a779h0: Add video capture nodes (2024-06-07 14:19:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.11-tag2-v2

for you to fetch changes up to 07e777318911d76fa787fc57f02b595481382291:

  arm64: dts: renesas: r8a779h0: R-Car Sound support (2024-07-01 11:35:08 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.11 (take two)

  - Add sound support for the R-Car V4M SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (10):
      arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0
      arm64: dts: renesas: r8a779a0: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r8a779f0: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r8a779g0: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a07g043u: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a07g044: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a07g054: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a08g045: Add missing hypervisor virtual timer IRQ
      ARM: dts: renesas: Add interrupt-names to arch timer nodes
      arm64: dts: renesas: Add interrupt-names to arch timer nodes

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a779g0: Tidy up sound DT settings
      arm64: dts: renesas: r8a779h0: R-Car Sound support

 arch/arm/boot/dts/renesas/r8a73a4.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7742.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |  1 +
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |  1 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  5 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  5 +-
 .../r8a779g0-white-hawk-ard-audio-da7212.dtso      |  4 --
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 22 +++----
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 71 +++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  5 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  5 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  5 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  5 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  1 +
 34 files changed, 128 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

