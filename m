Return-Path: <linux-renesas-soc+bounces-9748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04B99E698
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 455F31F24DE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CAB1D90CD;
	Tue, 15 Oct 2024 11:43:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B5B1E7C35
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992582; cv=none; b=Y1aaLznWVuHdQWFjIdXQkAEUwkNeTe8g1VJKEVLHpZhgrXuE+x4aJJR//d8x93BuCK8c6lOLwXwfts3BvNCCNZdBy9r3GiB2DshIDWMryfwsaIst6f0tnLrsr2WnQMWkzeyu1ogYURs/3VvlngLbROvkzz8gUBPFKlnoqm/Q55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992582; c=relaxed/simple;
	bh=ERGfOBM0VUIJlM2FY4iW27s/sfVwNU/NNrB0+hfq+B0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=pSUgAUtLWlfR493D3chYuxxLDXKfP/Eh1XtxH9Xp4EhdzreeknFJtPOTU92d+jC9luv8qRf9+ojCLoezWo6K5Gnw5mCoKy0p+jmWi4zg38yYykW9jWqFTmXhbhkkvfJg3ao+pdXB+UEcZ272z1m57tcBqBngVOiN0dMdNYNu9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2f01:8211:4b4e:86e2])
	by andre.telenet-ops.be with cmsmtp
	id Qbix2D00F4yGcJj01bixXf; Tue, 15 Oct 2024 13:42:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t0fwp-003oTx-Th
	for linux-renesas-soc@vger.kernel.org;
	Tue, 15 Oct 2024 13:42:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t0fx2-004sKe-Vw
	for linux-renesas-soc@vger.kernel.org;
	Tue, 15 Oct 2024 13:42:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2024-10-15-v6.12-rc3
Date: Tue, 15 Oct 2024 13:42:56 +0200
Message-Id: <20241015114256.1162157-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have pushed renesas-drivers-2024-10-15-v6.12-rc3 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM and RISC-V SoCs.  It is created by merging (a) the
for-next branches of various subsystem trees and (b) branches with
driver code submitted or planned for submission to maintainers into the
master branch of my renesas-devel.git tree.

Today's version is based on renesas-devel-2024-10-14-v6.12-rc3.

Included branches with driver code:
  - renesas-clk-for-v6.13
  - renesas-pinctrl-for-v6.13

Included fixes:
  - [TEST] soc: renesas: rcar-rst: Enable WDT reset on early R-Car V4M
  - ARM: shmobile: defconfig: Update shmobile_defconfig
  - [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Included subsystem trees:
  - git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git#linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#mtd/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git#main
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git#tty-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#i2c/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git#i2c/i2c-host-fixes
  - git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git#i2c/i2c-host
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git#usb-next
  - https://gitlab.freedesktop.org/drm/kernel.git#drm-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git#next
  - git://linuxtv.org/media_tree.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#pwm/for-next
  - https://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/core
  - git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git#for-next
  - git://www.linux-watchdog.org/linux-watchdog-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git#for-next/core
  - https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git#thermal/linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git#driver-core-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git#for-next
  - git://git.pengutronix.de/git/pza/linux#reset/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git#fixes
  - git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git#for-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

