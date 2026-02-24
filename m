Return-Path: <linux-renesas-soc+bounces-28432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGbrCDO8nWklRgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 15:56:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06268188BB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 15:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC004300463B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1CA3A0B3F;
	Tue, 24 Feb 2026 14:56:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B793A0B3E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945005; cv=none; b=Ryq3h9gDZThLzldEUG2foE7ZKVWc6fDPfIcFiLNw9kJKjdwUvOj9auITj8quRxJaGwb62VDx72+EApiMbDwvQEHSXKWoY24wAuabafw/BmJpvChZBhndSfgfjmdpycgt0u8yInojdz5SFzyZ+7FmSUlVuHE3LvW+ZfinzXSji6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945005; c=relaxed/simple;
	bh=05JfQpVJx2qR1ROdubSxWVckCNwznYoRtjs/BZ8v8sY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qhIG8fqW2LxJQKWzfjm8kJt2iMd9D2Hshl0uyGjJLr+m5w4AjxYlhXzxPfPqs86/rXPOOPorEJUaYiSj85zQi1ULbfUDb/yoKRH+Jb1JtgaQ+MGdrd63yoERnthoSg69Lg3KKOHez6cG9Gq+t+mtz9Ch1XCF6b1M6uhjy6Gk4rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF5AC116D0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 14:56:44 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2026-02-24-v7.0-rc1
Date: Tue, 24 Feb 2026 15:56:42 +0100
Message-ID: <20260224145642.3514020-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-28432-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:mid]
X-Rspamd-Queue-Id: 06268188BB1
X-Rspamd-Action: no action

I have pushed renesas-drivers-2026-02-24-v7.0-rc1 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM and RISC-V SoCs.  It is created by merging (a) the
for-next branches of various subsystem trees and (b) branches with
driver code submitted or planned for submission to maintainers into the
master branch of my renesas-devel.git tree.

Today's version is based on renesas-devel-2026-02-23-v7.0-rc1.

Included branches with driver code:
  - renesas-clk-for-v7.1
  - renesas-pinctrl-for-v7.1

Included fixes:
  - [TEST] soc: renesas: rcar-rst: Enable WDT reset on early R-Car V4M
  - ARM: shmobile: defconfig: Update for renesas-drivers
  - [LOCAL] arm64: renesas: defconfig: Update for renesas-drivers
  - [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

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
  - git://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#timers/drivers/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/core
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/drivers
  - git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git#for-next
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
  - git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git#driver-core-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git#for-next
  - https://git.pengutronix.de/git/pza/linux#reset/next
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

