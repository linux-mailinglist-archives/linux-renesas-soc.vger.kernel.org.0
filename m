Return-Path: <linux-renesas-soc+bounces-11753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1AE9FF047
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 16:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124B7161F99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 15:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C700513B2B8;
	Tue, 31 Dec 2024 15:43:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163116426
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Dec 2024 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735659793; cv=none; b=QDfgiuPeG2T+XmWqUNTRUQ4iJm0xHAeqQOMltDgEf7Ct9YhBiyF1Ru5ZcpSRMarXBeJ89ANTX6c6TCk5ErSWobaJltZZjtFolfb/UIZCZaFuK3QtV7AugOob8xrfnOVHD91RVSRoCB+WYhjVAThYKxopYlg46HUU9XOC0i+Dmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735659793; c=relaxed/simple;
	bh=TxZKjBpeAGRI0we71dqPziMxlN/ct0xGEFEyW75spqc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KahQ2l2HnUfl4qYo9DnuyTWQ5QV7mdGzHdcwgv7VE0NZGVJxyFJJ+Zpe+MxzWrolb3b+qYK/reFoNGWqoMh1WqWawKLd/1md1ASAi2M22Y7E2w2UZe1G3pNvk/6OtLGTlyZTDzRKT0IValz2nx3FRzRXLMZx/yUAHoXXVJ/QgeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YMxqw0ZQFz4wyL4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Dec 2024 16:35:24 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:24f5:66ad:4b67:631])
	by xavier.telenet-ops.be with cmsmtp
	id vTbG2D0050WTdZR01TbGkX; Tue, 31 Dec 2024 16:35:16 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tSeH6-00000000NbJ-0R0A
	for linux-renesas-soc@vger.kernel.org;
	Tue, 31 Dec 2024 16:35:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tSeH6-0000000C6qV-09v9
	for linux-renesas-soc@vger.kernel.org;
	Tue, 31 Dec 2024 16:35:16 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2024-12-31-v6.13-rc5
Date: Tue, 31 Dec 2024 16:35:15 +0100
Message-ID: <20241231153516.2886244-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have pushed renesas-drivers-2024-12-31-v6.13-rc5 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM and RISC-V SoCs.  It is created by merging (a) the
for-next branches of various subsystem trees and (b) branches with
driver code submitted or planned for submission to maintainers into the
master branch of my renesas-devel.git tree.

Today's version is based on renesas-devel-2024-12-30-v6.13-rc5.

This was the last release of 2024, and coincidentally the 365th
renesas-drivers release.  Let's call it a year, and Best Wishes for a
Healthy and Prosperous 2025!

Included branches with driver code:
  - renesas-clk-for-v6.14
  - renesas-pinctrl-for-v6.14

Included fixes:
  - [TEST] soc: renesas: rcar-rst: Enable WDT reset on early R-Car V4M
  - ARM: shmobile: defconfig: Update shmobile_defconfig
  - [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig
  - [LOCAL] riscv: renesas: defconfig: Update rzfive_defconfig

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
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git#char-misc-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git#togreg

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

