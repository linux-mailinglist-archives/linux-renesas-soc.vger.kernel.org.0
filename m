Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D5563569
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 14:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfGIMOm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 08:14:42 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:41700 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfGIMOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 08:14:42 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id acEf2000D05gfCL06cEfW9; Tue, 09 Jul 2019 14:14:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hkp15-0000TA-GL
        for linux-renesas-soc@vger.kernel.org; Tue, 09 Jul 2019 14:14:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hkp15-0006f5-EL
        for linux-renesas-soc@vger.kernel.org; Tue, 09 Jul 2019 14:14:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2019-07-09-v5.2
Date:   Tue,  9 Jul 2019 14:14:39 +0200
Message-Id: <20190709121439.25565-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I have pushed renesas-drivers-2019-07-09-v5.2 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
my renesas-devel.git tree.

Today's version is based on renesas-devel-2019-07-08-v5.2.

Included branches with driver code:
  - clk-renesas
  - sh-pfc
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/sdhi-manual-calib~1
  - git://git.ragnatech.se/linux#for-renesas-drivers

Included fixes:
  - rcar-vin: Clean up correct notifier in error path
  - v4l2-subdev: fix regression in check_pad()
  - ARM: shmobile: defconfig: Update shmobile_defconfig
  - [LOCAL] arm64: defconfig: Update renesas_defconfig

Included subsystem trees:
  - git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git#linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#mtd/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git#master
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
  - git://git.linaro.org/people/daniel.lezcano/linux.git#clockevents/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git#testing/next
  - git://git.infradead.org/users/vkoul/slave-dma.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.armlinux.org.uk/~rmk/linux-arm.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/core
  - git://github.com/bzolnier/linux.git#fbdev-for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git#for-next
  - git://www.linux-watchdog.org/linux-watchdog-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git#for-next/core
  - git://anongit.freedesktop.org/drm/drm-misc#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git#for-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
