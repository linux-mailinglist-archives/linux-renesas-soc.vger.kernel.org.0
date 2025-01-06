Return-Path: <linux-renesas-soc+bounces-11882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6665A02E16
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 17:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980B61643D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 16:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9BF1DFE38;
	Mon,  6 Jan 2025 16:42:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6836138F9C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181737; cv=none; b=dcWOgdYm32FtZsegYr30b5gM2XlQV/2rhDWoYFuT+21qjQFZ+WSMdtgJNzWEL39oufCkFogYijMco+2GfXkTWDtMmlbPBsoOULApKSRqoPIYphRcDiw6gcT3E9jFVAGrmEr7dlXU8bDomkgUZewAKaT5EBgRAgf9C7AvmeQLQoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181737; c=relaxed/simple;
	bh=AOmk896rBr6SSsGaT1y+NvZGPZyMcfKIj8NYBRQRVkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyFROoIPyeE1JZ5SN8sV2Otw66zPyDrmPSoGaWgVD24DRU07iZRPJcFU1DyiQpUaazNRN0IMvVwzQCATut26EVZeqA7DfOgmmii82oZQSnEfbdGUWL0q7PIWeM3S9ryRtR1NDMXdI8nGgKmeyFSc6eL5gG+mEL1NwwLk5PmqCBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4YRg2F33n6z4x2hq
	for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jan 2025 17:42:13 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by albert.telenet-ops.be with cmsmtp
	id xsi52D00T3AZZFy06si5tj; Mon, 06 Jan 2025 17:42:05 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqB0-00000008NU8-47Cc;
	Mon, 06 Jan 2025 17:42:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqB3-00000004Ya5-2SOW;
	Mon, 06 Jan 2025 17:42:05 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.14 (take two)
Date: Mon,  6 Jan 2025 17:42:04 +0100
Message-ID: <cover.1736181260.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 03fc60cd8e7b7e6f330d0a48c54545740addd9d8:

  pinctrl: renesas: rzg2l: Add audio clock pins on RZ/G3S (2024-12-20 10:58:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.14-tag2

for you to fetch changes up to 829356da700bbe07e13b4403997bf8c5aac64660:

  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC (2025-01-03 21:09:19 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.14 (take two)

  - Add support for alpha-numerical port references on the RZ/V2H SoC,
  - Add support for the RZ/G3E (R9A09G047) Soc.

Note that this includes DT binding and binding definitions for the
RZ/G3E and RZ/V2H SoCs, which are shared by DT source files and drivers.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (7):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      pinctrl: renesas: rzg2l: Update r9a09g057_variable_pin_cfg table
      pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into renesas-pinctrl-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into renesas-pinctrl-for-v6.14

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |  15 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   7 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  17 ++
 drivers/pinctrl/renesas/Kconfig                    |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 186 ++++++++++++++++++++-
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |  21 +++
 .../pinctrl/renesas,r9a09g047-pinctrl.h            |  41 +++++
 .../pinctrl/renesas,r9a09g057-pinctrl.h            |  31 ++++
 8 files changed, 305 insertions(+), 14 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

