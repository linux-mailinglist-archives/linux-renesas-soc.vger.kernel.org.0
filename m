Return-Path: <linux-renesas-soc+bounces-6896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D891BF76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25287284E13
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95FD15FCE6;
	Fri, 28 Jun 2024 13:26:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DCC154434
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581169; cv=none; b=JjpEXSTDbAR73P2ox/Gsa+rME0qLPScG5JasiodZq96J/frnpkcTH4NiQwRohWTVLvqvMFJvfU0PVsnZAyZ5A+AEY/V5o/GvKhgvxOdvLzBYcMjYV3HLpKfLx+Wplq2DykxSr7cYrtBWBzL/3gW+5AWtHAj6jMqciM4O7/1rqe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581169; c=relaxed/simple;
	bh=Uq4t2hAArLgT0CNIiu5+SMU74tr1noXIi59UacyVrmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dvhKn9cBJGnqDbEbpR+UDwOwOYwAVR8yt2vA0C/qbxTA2KA8AJY/nirgGFR2t5CbQMp/pYkbHgQFnUVd6zq7yi3gyM99UnhTYK28K3J9egup3fP/5HrCNGN5E8gpOjDsalwkSiVEz/lIaWrLlDCMQ/ZuuDV77T/Ra8rbaPs3B0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4W9bYG3mr8z4wwk8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 15:16:18 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by baptiste.telenet-ops.be with bizsmtp
	id h1GB2C00A5ECAAU011GB6S; Fri, 28 Jun 2024 15:16:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSP-000VGo-E0;
	Fri, 28 Jun 2024 15:16:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSV-00BlSJ-9x;
	Fri, 28 Jun 2024 15:16:11 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.11 (take two)
Date: Fri, 28 Jun 2024 15:16:10 +0200
Message-Id: <cover.1719579513.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 9bd95ac86e700ab8b1a6c225685e0e5afe426b4e:

  pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC (2024-06-11 09:50:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.11-tag2

for you to fetch changes up to fb0024d1d0742b1a1c97cfb05025913daccfd81f:

  pinctrl: renesas: r8a779h0: Remove unneeded separators (2024-06-27 18:14:02 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.11 (take two)

  - Add R-Car Gen3 fuse support,
  - Fix ambiguous and inconsistent pin group names on R-Car V4H,
  - Add MII Ethernet PHY and external interrupt pin groups on R-Car V4H,
  - Miscellaneous fixes and improvements.

Note that the new R-Car Fuse DT bindings, and/or driver and platform
data are shared by multiple driver and DT source files, and thus
included in multiple pull requests:
  - "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take two)",
  - "[GIT PULL 1/3] Renesas driver updates for v6.11" (for soc),
  - "[GIT PULL 2/3] Renesas DT binding updates for v6.11" (for soc),
  - "[GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)" (for soc).

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (17):
      dt-bindings: fuse: Document R-Car E-FUSE / PFC
      dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
      soc: renesas: Add R-Car fuse driver
      Merge tag 'renesas-rcar-fuse-tag' into renesas-pinctrl-for-v6.11
      pinctrl: renesas: Add R-Car Gen3 fuse support
      pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
      pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
      pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
      pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
      pinctrl: renesas: r8a779g0: Fix IRQ suffixes
      pinctrl: renesas: r8a779g0: FIX PWM suffixes
      pinctrl: renesas: r8a779g0: Fix TCLK suffixes
      pinctrl: renesas: r8a779g0: Fix TPU suffixes
      pinctrl: renesas: r8a779h0: Add AVB MII pins and groups
      pinctrl: renesas: r8a779g0: Remove unneeded separators
      pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups, and function
      pinctrl: renesas: r8a779h0: Remove unneeded separators

Lad Prabhakar (4):
      pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro to be 32-bit wide
      pinctrl: renesas: rzg2l: Adjust bit masks for PIN_CFG_VARIABLE to use BIT(62)
      pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN definition to top of the file
      pinctrl: renesas: rzg2l: Reorganize variable configuration macro

Michał Mirosław (1):
      pinctrl: renesas: sh73a0: Use rdev_get_drvdata()

 .../bindings/fuse/renesas,rcar-efuse.yaml          |  55 ++
 .../devicetree/bindings/fuse/renesas,rcar-otp.yaml |  38 +
 drivers/pinctrl/renesas/core.c                     |  18 +
 drivers/pinctrl/renesas/pfc-r8a77951.c             |   2 +
 drivers/pinctrl/renesas/pfc-r8a7796.c              |   4 +
 drivers/pinctrl/renesas/pfc-r8a77965.c             |   2 +
 drivers/pinctrl/renesas/pfc-r8a77970.c             |   2 +
 drivers/pinctrl/renesas/pfc-r8a77980.c             |  14 +-
 drivers/pinctrl/renesas/pfc-r8a77990.c             |   2 +
 drivers/pinctrl/renesas/pfc-r8a77995.c             |   2 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c             | 830 ++++++++++++---------
 drivers/pinctrl/renesas/pfc-r8a779h0.c             |  82 +-
 drivers/pinctrl/renesas/pfc-sh73a0.c               |   4 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  59 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |   4 +-
 drivers/soc/renesas/Kconfig                        |   8 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/rcar-fuse.c                    | 201 +++++
 include/linux/platform_data/rcar_fuse.h            |  11 +
 include/linux/soc/renesas/rcar-fuse.h              |  41 +
 20 files changed, 960 insertions(+), 420 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
 create mode 100644 drivers/soc/renesas/rcar-fuse.c
 create mode 100644 include/linux/platform_data/rcar_fuse.h
 create mode 100644 include/linux/soc/renesas/rcar-fuse.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

