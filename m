Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C7D480B15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 17:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235331AbhL1QKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 11:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhL1QKA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 11:10:00 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C2FC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Dec 2021 08:10:00 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:3d61:6dab:2daa:fb49])
        by andre.telenet-ops.be with bizsmtp
        id bs9x260042UKeJX01s9xlx; Tue, 28 Dec 2021 17:09:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n2F2y-007PyJ-TW
        for linux-renesas-soc@vger.kernel.org; Tue, 28 Dec 2021 17:09:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n2F2y-003awY-ET
        for linux-renesas-soc@vger.kernel.org; Tue, 28 Dec 2021 17:09:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2021-12-28-v5.16-rc7
Date:   Tue, 28 Dec 2021 17:09:56 +0100
Message-Id: <20211228160956.856951-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I have pushed renesas-drivers-2021-12-28-v5.16-rc7 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the master branch of my
renesas-devel.git tree.

Note that there is a known issue[1] on SMP R-Car Gen2 and RZ/G1 SoCs.
If the new option CONFIG_VMAP_STACK=y (which is the default), and
CONFIG_ARM_LPAE=n, the system will fail to resume from s2ram.

Today's version is based on renesas-devel-2021-12-27-v5.16-rc7.

Included branches with driver code:
  - renesas-clk-for-v5.17
  - renesas-pinctrl-for-v5.17

Included fixes:
  - Revert "arm64: perf: Enable PMU counter userspace access for perf event"
  - Revert "arm64: perf: Add userspace counter access disable switch"
  - WIP soc: v3u: allow WDT reset
  - gpio: add sloppy logic analyzer using polling
  - ARM: shmobile: defconfig: Update shmobile_defconfig
  - [LOCAL] arm64: defconfig: Update renesas_defconfig

Included subsystem trees:
  - git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git#linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#mtd/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git#tty-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#i2c/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git#usb-next
  - git://git.freedesktop.org/git/drm/drm.git#drm-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git#next
  - git://linuxtv.org/media_tree.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git#for-next
  - git://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.armlinux.org.uk/~rmk/linux-arm.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/core
  - git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git#for-next
  - git://www.linux-watchdog.org/linux-watchdog-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git#for-next/core
  - git://anongit.freedesktop.org/drm/drm-misc#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git#thermal/linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git#driver-core-next
  - git://git.libc.org/linux-sh#for-next
  - https://git.pengutronix.de/git/pza/linux#reset/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next

[1] https://lore.kernel.org/r/CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com/

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
