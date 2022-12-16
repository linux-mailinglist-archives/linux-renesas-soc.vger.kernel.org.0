Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B6D64F296
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Dec 2022 21:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiLPUuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Dec 2022 15:50:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbiLPUus (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Dec 2022 15:50:48 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF3691789B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Dec 2022 12:50:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,251,1665414000"; 
   d="scan'208";a="143613308"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2022 05:50:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.240])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7D4D740DAABE;
        Sat, 17 Dec 2022 05:50:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v10 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a core driver
Date:   Fri, 16 Dec 2022 20:50:25 +0000
Message-Id: <20221216205028.340795-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216205028.340795-1-biju.das.jz@bp.renesas.com>
References: <20221216205028.340795-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
the Renesas RZ/G2L family SoCs. It consists of eight 16-bit timer
channels and one 32-bit timer channel. It supports the following
functions
 - Counter
 - Timer
 - PWM

The 8/16/32 bit registers are mixed in each channel.

Add MTU3a core driver for RZ/G2L SoC. The core driver shares the
clk and channel register access for the other child devices like
Counter, PWM and Clock event.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222.1047748-2-biju.das.jz@bp.renesas.com/

v9->v10:
 * No change.
v8->v9:
 * No change.
v7->v8:
 * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
 * Replaced enum rz_mtu3_functions with channel busy flag
 * Added API for request and release a channel.
v6->v7:
 * Added channel specific mutex to avoid races between child devices
   (for eg: pwm and counter)
 * Added rz_mtu3_shared_reg_update_bit() to update bit.
v5->v6:
 * Updated commit and KConfig description
 * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
 * Improved error handling in probe().
 * Updated MODULE_DESCRIPTION and title.
v4->v5:
 * Moved core driver from MFD to timer
 * Child devices instatiated using mfd_add_devices()
v3->v4:
 * A single driver that registers both the counter and the pwm functionalities
   that binds against "renesas,rz-mtu3".
 * Moved PM handling from child devices to here.
 * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
 * Removed "remove" callback
v2->v3:
 * removed unwanted header files
 * Added LUT for 32 bit registers as it needed for 32-bit cascade counting.
 * Exported 32 bit read/write functions.
v1->v2:
 * Changed the compatible name
 * Replaced devm_reset_control_get->devm_reset_control_get_exclusive
 * Renamed function names rzg2l_mtu3->rz_mtu3 as this is generic IP
   in RZ family SoC's.
---
 drivers/clocksource/Kconfig   |  11 +
 drivers/clocksource/Makefile  |   1 +
 drivers/clocksource/rz-mtu3.c | 459 ++++++++++++++++++++++++++++++++++
 include/clocksource/rz-mtu3.h | 237 ++++++++++++++++++
 4 files changed, 708 insertions(+)
 create mode 100644 drivers/clocksource/rz-mtu3.c
 create mode 100644 include/clocksource/rz-mtu3.h

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 4469e7f555e9..cd7d549d18f3 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -524,6 +524,17 @@ config SH_TIMER_MTU2
 	  Timer Pulse Unit 2 (MTU2) hardware available on SoCs from Renesas.
 	  This hardware comes with 16-bit timer registers.
 
+config RZ_MTU3
+	bool "Renesas RZ/G2L MTU3a core driver"
+	select MFD_CORE
+	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
+	help
+	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
+	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
+	  on SoCs from Renesas. The core driver shares the clk and channel
+	  register access for the other child devices like Counter, PWM,
+	  Clock Source, and Clock event.
+
 config RENESAS_OSTM
 	bool "Renesas OSTM timer driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 64ab547de97b..9ffb46614d98 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_CS5535_CLOCK_EVENT_SRC)	+= timer-cs5535.o
 obj-$(CONFIG_CLKSRC_JCORE_PIT)		+= jcore-pit.o
 obj-$(CONFIG_SH_TIMER_CMT)	+= sh_cmt.o
 obj-$(CONFIG_SH_TIMER_MTU2)	+= sh_mtu2.o
+obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_RENESAS_OSTM)	+= renesas-ostm.o
 obj-$(CONFIG_SH_TIMER_TMU)	+= sh_tmu.o
 obj-$(CONFIG_EM_TIMER_STI)	+= em_sti.o
diff --git a/drivers/clocksource/rz-mtu3.c b/drivers/clocksource/rz-mtu3.c
new file mode 100644
index 000000000000..b7d3bb9f3dc3
--- /dev/null
+++ b/drivers/clocksource/rz-mtu3.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L Multi-Function Timer Pulse Unit 3(MTU3a) Core driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
+#include <linux/of_platform.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#include <clocksource/rz-mtu3.h>
+
+static const unsigned long rz_mtu3_8bit_ch_reg_offs[][13] = {
+	{
+		[RZ_MTU3_TIER] = 0x4, [RZ_MTU3_NFCR] = 0x70,
+		[RZ_MTU3_TCR] = 0x0, [RZ_MTU3_TCR2] = 0x28,
+		[RZ_MTU3_TMDR1] = 0x1, [RZ_MTU3_TIORH] = 0x2,
+		[RZ_MTU3_TIORL] = 0x3
+	},
+	{
+		[RZ_MTU3_TIER] = 0x4, [RZ_MTU3_NFCR] = 0xef,
+		[RZ_MTU3_TSR] = 0x5, [RZ_MTU3_TCR] = 0x0,
+		[RZ_MTU3_TCR2] = 0x14, [RZ_MTU3_TMDR1] = 0x1,
+		[RZ_MTU3_TIOR] = 0x2
+	},
+	{
+		[RZ_MTU3_TIER] = 0x4, [RZ_MTU3_NFCR] = 0x16e,
+		[RZ_MTU3_TSR] = 0x5, [RZ_MTU3_TCR] = 0x0,
+		[RZ_MTU3_TCR2] = 0xc, [RZ_MTU3_TMDR1] = 0x1,
+		[RZ_MTU3_TIOR] = 0x2
+	},
+	{
+		[RZ_MTU3_TIER] = 0x8, [RZ_MTU3_NFCR] = 0x93,
+		[RZ_MTU3_TSR] = 0x2c, [RZ_MTU3_TCR] = 0x0,
+		[RZ_MTU3_TCR2] = 0x4c, [RZ_MTU3_TMDR1] = 0x2,
+		[RZ_MTU3_TIORH] = 0x4, [RZ_MTU3_TIORL] = 0x5,
+		[RZ_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZ_MTU3_TIER] = 0x8, [RZ_MTU3_NFCR] = 0x93,
+		[RZ_MTU3_TSR] = 0x2c, [RZ_MTU3_TCR] = 0x0,
+		[RZ_MTU3_TCR2] = 0x4c, [RZ_MTU3_TMDR1] = 0x2,
+		[RZ_MTU3_TIORH] = 0x5, [RZ_MTU3_TIORL] = 0x6,
+		[RZ_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZ_MTU3_TIER] = 0x32, [RZ_MTU3_NFCR] = 0x1eb,
+		[RZ_MTU3_TSTR] = 0x34, [RZ_MTU3_TCNTCMPCLR] = 0x36,
+		[RZ_MTU3_TCRU] = 0x4, [RZ_MTU3_TCR2U] = 0x5,
+		[RZ_MTU3_TIORU] = 0x6, [RZ_MTU3_TCRV] = 0x14,
+		[RZ_MTU3_TCR2V] = 0x15, [RZ_MTU3_TIORV] = 0x16,
+		[RZ_MTU3_TCRW] = 0x24, [RZ_MTU3_TCR2W] = 0x25,
+		[RZ_MTU3_TIORW] = 0x26
+	},
+	{
+		[RZ_MTU3_TIER] = 0x8, [RZ_MTU3_NFCR] = 0x93,
+		[RZ_MTU3_TSR] = 0x2c, [RZ_MTU3_TCR] = 0x0,
+		[RZ_MTU3_TCR2] = 0x4c, [RZ_MTU3_TMDR1] = 0x2,
+		[RZ_MTU3_TIORH] = 0x4, [RZ_MTU3_TIORL] = 0x5,
+		[RZ_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZ_MTU3_TIER] = 0x8, [RZ_MTU3_NFCR] = 0x93,
+		[RZ_MTU3_TSR] = 0x2c, [RZ_MTU3_TCR] = 0x0,
+		[RZ_MTU3_TCR2] = 0x4c, [RZ_MTU3_TMDR1] = 0x2,
+		[RZ_MTU3_TIORH] = 0x5, [RZ_MTU3_TIORL] = 0x6,
+		[RZ_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZ_MTU3_TIER] = 0x4, [RZ_MTU3_NFCR] = 0x368,
+		[RZ_MTU3_TCR] = 0x0, [RZ_MTU3_TCR2] = 0x6,
+		[RZ_MTU3_TMDR1] = 0x1, [RZ_MTU3_TIORH] = 0x2,
+		[RZ_MTU3_TIORL] = 0x3
+	}
+};
+
+static const unsigned long rz_mtu3_16bit_ch_reg_offs[][12] = {
+	{
+		[RZ_MTU3_TCNT] = 0x6, [RZ_MTU3_TGRA] = 0x8,
+		[RZ_MTU3_TGRB] = 0xa, [RZ_MTU3_TGRC] = 0xc,
+		[RZ_MTU3_TGRD] = 0xe, [RZ_MTU3_TGRE] = 0x20,
+		[RZ_MTU3_TGRF] = 0x22
+	},
+	{
+		[RZ_MTU3_TCNT] = 0x6, [RZ_MTU3_TGRA] = 0x8,
+		[RZ_MTU3_TGRB] = 0xa
+	},
+	{
+		[RZ_MTU3_TCNT] = 0x6, [RZ_MTU3_TGRA] = 0x8,
+		[RZ_MTU3_TGRB] = 0xa
+	},
+	{
+		[RZ_MTU3_TCNT] = 0x10, [RZ_MTU3_TGRA] = 0x18,
+		[RZ_MTU3_TGRB] = 0x1a, [RZ_MTU3_TGRC] = 0x24,
+		[RZ_MTU3_TGRD] = 0x26, [RZ_MTU3_TGRE] = 0x72
+	},
+	{
+		[RZ_MTU3_TCNT] = 0x11, [RZ_MTU3_TGRA] = 0x1b,
+		[RZ_MTU3_TGRB] = 0x1d, [RZ_MTU3_TGRC] = 0x27,
+		[RZ_MTU3_TGRD] = 0x29, [RZ_MTU3_TGRE] = 0x73,
+		[RZ_MTU3_TGRF] = 0x75, [RZ_MTU3_TADCR] = 0x3f,
+		[RZ_MTU3_TADCORA] = 0x43, [RZ_MTU3_TADCORB] = 0x45,
+		[RZ_MTU3_TADCOBRA] = 0x47,
+		[RZ_MTU3_TADCOBRB] = 0x49
+	},
+	{
+		[RZ_MTU3_TCNTU] = 0x0, [RZ_MTU3_TGRU] = 0x2,
+		[RZ_MTU3_TCNTV] = 0x10, [RZ_MTU3_TGRV] = 0x12,
+		[RZ_MTU3_TCNTW] = 0x20, [RZ_MTU3_TGRW] = 0x22
+	},
+	{
+		[RZ_MTU3_TCNT] = 0x10, [RZ_MTU3_TGRA] = 0x18,
+		[RZ_MTU3_TGRB] = 0x1a, [RZ_MTU3_TGRC] = 0x24,
+		[RZ_MTU3_TGRD] = 0x26, [RZ_MTU3_TGRE] = 0x72
+	},
+	{
+		[RZ_MTU3_TCNT] = 0x11, [RZ_MTU3_TGRA] = 0x1b,
+		[RZ_MTU3_TGRB] = 0x1d, [RZ_MTU3_TGRC] = 0x27,
+		[RZ_MTU3_TGRD] = 0x29, [RZ_MTU3_TGRE] = 0x73,
+		[RZ_MTU3_TGRF] = 0x75, [RZ_MTU3_TADCR] = 0x3f,
+		[RZ_MTU3_TADCORA] = 0x43, [RZ_MTU3_TADCORB] = 0x45,
+		[RZ_MTU3_TADCOBRA] = 0x47,
+		[RZ_MTU3_TADCOBRB] = 0x49
+	},
+};
+
+static const unsigned long rz_mtu3_32bit_ch_reg_offs[][5] = {
+	{
+		[RZ_MTU3_TCNTLW] = 0x20, [RZ_MTU3_TGRALW] = 0x24,
+		[RZ_MTU3_TGRBLW] = 0x28
+	},
+	{	[RZ_MTU3_TCNT] = 0x8, [RZ_MTU3_TGRA] = 0xc,
+		[RZ_MTU3_TGRB] = 0x10, [RZ_MTU3_TGRC] = 0x14,
+		[RZ_MTU3_TGRD] = 0x18
+	}
+};
+
+static bool rz_mtu3_is_16bit_shared_reg(u16 off)
+{
+	return (off == RZ_MTU3_TDDRA || off == RZ_MTU3_TDDRB ||
+		off == RZ_MTU3_TCDRA || off == RZ_MTU3_TCDRB ||
+		off == RZ_MTU3_TCBRA || off == RZ_MTU3_TCBRB ||
+		off == RZ_MTU3_TCNTSA || off == RZ_MTU3_TCNTSB);
+}
+
+u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+
+	if (rz_mtu3_is_16bit_shared_reg(off))
+		return readw(mtu->mmio + off);
+	else
+		return readb(mtu->mmio + off);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_read);
+
+u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	u16 ch_offs;
+
+	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->index][off];
+	if (off != RZ_MTU3_TCR && ch_offs == 0)
+		return -EINVAL;
+
+	/*
+	 * NFCR register addresses on MTU{0,1,2,5,8} channels are smaller than
+	 * channel's base address.
+	 */
+	if (off == RZ_MTU3_NFCR && (ch->index <= RZ_MTU2 ||
+				    ch->index == RZ_MTU5 ||
+				    ch->index == RZ_MTU8))
+		return readb(ch->base - ch_offs);
+	else
+		return readb(ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_read);
+
+u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	u16 ch_offs;
+
+	/* MTU8 doesn't have 16-bit registers */
+	if (ch->index == RZ_MTU8)
+		return 0;
+
+	ch_offs = rz_mtu3_16bit_ch_reg_offs[ch->index][off];
+	if (ch->index != RZ_MTU5 && off != RZ_MTU3_TCNTU && ch_offs == 0)
+		return 0;
+
+	return readw(ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_read);
+
+u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	u16 ch_offs;
+
+	if (ch->index == RZ_MTU1)
+		ch_offs = rz_mtu3_32bit_ch_reg_offs[0][off];
+	else if (ch->index == RZ_MTU8)
+		ch_offs = rz_mtu3_32bit_ch_reg_offs[1][off];
+
+	if (!ch_offs)
+		return -EINVAL;
+
+	return readl(ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_read);
+
+void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u8 val)
+{
+	u16 ch_offs;
+
+	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->index][off];
+	if (ch->index != RZ_MTU5 && off != RZ_MTU3_TCR && ch_offs == 0)
+		return;
+
+	/*
+	 * NFCR register addresses on MTU{0,1,2,5,8} channels are smaller than
+	 * channel's base address.
+	 */
+	if (off == RZ_MTU3_NFCR && (ch->index <= RZ_MTU2 ||
+				    ch->index == RZ_MTU5 ||
+				    ch->index == RZ_MTU8))
+		writeb(val, ch->base - ch_offs);
+	else
+		writeb(val, ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_write);
+
+void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u16 val)
+{
+	u16 ch_offs;
+
+	/* MTU8 doesn't have 16-bit registers */
+	if (ch->index == RZ_MTU8)
+		return;
+
+	ch_offs = rz_mtu3_16bit_ch_reg_offs[ch->index][off];
+	if (ch->index != RZ_MTU5 && off != RZ_MTU3_TCNTU && ch_offs == 0)
+		return;
+
+	writew(val, ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_write);
+
+void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u32 val)
+{
+	u16 ch_offs;
+
+	if (ch->index == RZ_MTU1)
+		ch_offs = rz_mtu3_32bit_ch_reg_offs[0][off];
+	else if (ch->index == RZ_MTU8)
+		ch_offs = rz_mtu3_32bit_ch_reg_offs[1][off];
+
+	if (!ch_offs)
+		return;
+
+	writel(val, ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_write);
+
+void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 off, u16 value)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+
+	if (rz_mtu3_is_16bit_shared_reg(off))
+		writew(value, mtu->mmio + off);
+	else
+		writeb((u8)value, mtu->mmio + off);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_write);
+
+void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 off,
+				   u16 pos, u8 val)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	unsigned long tmdr, flags;
+
+	raw_spin_lock_irqsave(&mtu->lock, flags);
+	tmdr = rz_mtu3_shared_reg_read(ch, off);
+	__assign_bit(pos, &tmdr, !!val);
+	rz_mtu3_shared_reg_write(ch, off, tmdr);
+	raw_spin_unlock_irqrestore(&mtu->lock, flags);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_update_bit);
+
+static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	unsigned long flags, value;
+	u8 offs;
+
+	/* start stop register shared by multiple timer channels */
+	raw_spin_lock_irqsave(&mtu->lock, flags);
+
+	if (ch->index == RZ_MTU6 || ch->index == RZ_MTU7) {
+		value = rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRB);
+		if (start)
+			value |= 1 << ch->index;
+		else
+			value &= ~(1 << ch->index);
+		rz_mtu3_shared_reg_write(ch, RZ_MTU3_TSTRB, value);
+	} else if (ch->index != RZ_MTU5) {
+		value = rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRA);
+		if (ch->index == RZ_MTU8)
+			offs = 0x08;
+		else if (ch->index < RZ_MTU3)
+			offs = 1 << ch->index;
+		else
+			offs = 1 << (ch->index + 3);
+		if (start)
+			value |= offs;
+		else
+			value &= ~offs;
+		rz_mtu3_shared_reg_write(ch, RZ_MTU3_TSTRA, value);
+	}
+
+	raw_spin_unlock_irqrestore(&mtu->lock, flags);
+}
+
+bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	unsigned long flags, value;
+	bool ret = false;
+	u8 offs;
+
+	/* start stop register shared by multiple timer channels */
+	raw_spin_lock_irqsave(&mtu->lock, flags);
+
+	if (ch->index == RZ_MTU6 || ch->index == RZ_MTU7) {
+		value = rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRB);
+		ret = value & (1 << ch->index);
+	} else if (ch->index != RZ_MTU5) {
+		value = rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRA);
+		if (ch->index == RZ_MTU8)
+			offs = 0x08;
+		else if (ch->index < RZ_MTU3)
+			offs = 1 << ch->index;
+		else
+			offs = 1 << (ch->index + 3);
+
+		ret = value & offs;
+	}
+
+	raw_spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_is_enabled);
+
+int rz_mtu3_enable(struct rz_mtu3_channel *ch)
+{
+	/* enable channel */
+	rz_mtu3_start_stop_ch(ch, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_enable);
+
+void rz_mtu3_disable(struct rz_mtu3_channel *ch)
+{
+	/* disable channel */
+	rz_mtu3_start_stop_ch(ch, false);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_disable);
+
+static const unsigned int ch_reg_offsets[] = {
+	0x100, 0x180, 0x200, 0x000, 0x001, 0xa80, 0x800, 0x801, 0x400
+};
+
+static void rz_mtu3_reset_assert(void *data)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(data);
+
+	mfd_remove_devices(data);
+	reset_control_assert(mtu->rstc);
+}
+
+static const struct mfd_cell rz_mtu3_devs[] = {
+	{
+		.name = "rz-mtu3-counter",
+	},
+	{
+		.name = "pwm-rz-mtu3",
+	},
+};
+
+static int rz_mtu3_probe(struct platform_device *pdev)
+{
+	struct rz_mtu3 *ddata;
+	unsigned int i;
+	int ret;
+
+	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ddata->mmio))
+		return PTR_ERR(ddata->mmio);
+
+	ddata->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(ddata->rstc))
+		return PTR_ERR(ddata->rstc);
+
+	ddata->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(ddata->clk))
+		return PTR_ERR(ddata->clk);
+
+	reset_control_deassert(ddata->rstc);
+	raw_spin_lock_init(&ddata->lock);
+	platform_set_drvdata(pdev, ddata);
+
+	for (i = 0; i < RZ_MTU_NUM_CHANNELS; i++) {
+		ddata->channels[i].index = i;
+		ddata->channels[i].is_busy = false;
+		ddata->channels[i].base = ddata->mmio + ch_reg_offsets[i];
+		mutex_init(&ddata->channels[i].lock);
+	}
+
+	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
+			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
+	if (ret < 0)
+		goto err_assert;
+
+	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
+					&pdev->dev);
+
+err_assert:
+	reset_control_assert(ddata->rstc);
+	return ret;
+}
+
+static const struct of_device_id rz_mtu3_of_match[] = {
+	{ .compatible = "renesas,rz-mtu3", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rz_mtu3_of_match);
+
+static struct platform_driver rz_mtu3_driver = {
+	.probe = rz_mtu3_probe,
+	.driver	= {
+		.name = "rz-mtu3",
+		.of_match_table = rz_mtu3_of_match,
+	},
+};
+module_platform_driver(rz_mtu3_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L MTU3a Core Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/clocksource/rz-mtu3.h b/include/clocksource/rz-mtu3.h
new file mode 100644
index 000000000000..43b87186348b
--- /dev/null
+++ b/include/clocksource/rz-mtu3.h
@@ -0,0 +1,237 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+#ifndef __LINUX_RZ_MTU3_H__
+#define __LINUX_RZ_MTU3_H__
+
+#include <linux/clk.h>
+
+/* 8-bit shared register offsets macros */
+#define RZ_MTU3_TSTRA	0x080 /* Timer start register A */
+#define RZ_MTU3_TSTRB	0x880 /* Timer start register B */
+
+/* 16-bit shared register offset macros */
+#define RZ_MTU3_TDDRA	0x016 /* Timer dead time data register A */
+#define RZ_MTU3_TDDRB	0x816 /* Timer dead time data register B */
+#define RZ_MTU3_TCDRA	0x014 /* Timer cycle data register A */
+#define RZ_MTU3_TCDRB	0x814 /* Timer cycle data register B */
+#define RZ_MTU3_TCBRA	0x022 /* Timer cycle buffer register A */
+#define RZ_MTU3_TCBRB	0x822 /* Timer cycle buffer register B */
+#define RZ_MTU3_TCNTSA	0x020 /* Timer subcounter A */
+#define RZ_MTU3_TCNTSB	0x820 /* Timer subcounter B */
+
+/*
+ * MTU5 contains 3 timer counter registers and is totaly different
+ * from other channels, so we must separate its offset
+ */
+
+/* 8-bit register offset macros of MTU3 channels except MTU5 */
+#define RZ_MTU3_TIER	0 /* Timer interrupt register */
+#define RZ_MTU3_NFCR	1 /* Noise filter control register */
+#define RZ_MTU3_TSR	2 /* Timer status register */
+#define RZ_MTU3_TCR	3 /* Timer control register */
+#define RZ_MTU3_TCR2	4 /* Timer control register 2 */
+#define RZ_MTU3_TMDR1	5 /* Timer mode register 1 */
+#define RZ_MTU3_TIOR	6 /* Timer I/O control register */
+#define RZ_MTU3_TIORH	6 /* Timer I/O control register H */
+#define RZ_MTU3_TIORL	7 /* Timer I/O control register L */
+/* Only MTU3/4/6/7 have TBTM registers */
+#define RZ_MTU3_TBTM	8 /* Timer buffer operation transfer mode register */
+
+/* 8-bit MTU5 register offset macros */
+#define RZ_MTU3_TSTR		2 /* MTU5 Timer start register */
+#define RZ_MTU3_TCNTCMPCLR	3 /* MTU5 Timer compare match clear register */
+#define RZ_MTU3_TCRU		4 /* Timer control register U */
+#define RZ_MTU3_TCR2U		5 /* Timer control register 2U */
+#define RZ_MTU3_TIORU		6 /* Timer I/O control register U */
+#define RZ_MTU3_TCRV		7 /* Timer control register V */
+#define RZ_MTU3_TCR2V		8 /* Timer control register 2V */
+#define RZ_MTU3_TIORV		9 /* Timer I/O control register V */
+#define RZ_MTU3_TCRW		10 /* Timer control register W */
+#define RZ_MTU3_TCR2W		11 /* Timer control register 2W */
+#define RZ_MTU3_TIORW		12 /* Timer I/O control register W */
+
+/* 16-bit register offset macros of MTU3 channels except MTU5 */
+#define RZ_MTU3_TCNT		0 /* Timer counter */
+#define RZ_MTU3_TGRA		1 /* Timer general register A */
+#define RZ_MTU3_TGRB		2 /* Timer general register B */
+#define RZ_MTU3_TGRC		3 /* Timer general register C */
+#define RZ_MTU3_TGRD		4 /* Timer general register D */
+#define RZ_MTU3_TGRE		5 /* Timer general register E */
+#define RZ_MTU3_TGRF		6 /* Timer general register F */
+/* Timer A/D converter start request registers */
+#define RZ_MTU3_TADCR		7 /* control register */
+#define RZ_MTU3_TADCORA		8 /* cycle set register A */
+#define RZ_MTU3_TADCORB		9 /* cycle set register B */
+#define RZ_MTU3_TADCOBRA	10 /* cycle set buffer register A */
+#define RZ_MTU3_TADCOBRB	11 /* cycle set buffer register B */
+
+/* 16-bit MTU5 register offset macros */
+#define RZ_MTU3_TCNTU		0 /* MTU5 Timer counter U */
+#define RZ_MTU3_TGRU		1 /* MTU5 Timer general register U */
+#define RZ_MTU3_TCNTV		2 /* MTU5 Timer counter V */
+#define RZ_MTU3_TGRV		3 /* MTU5 Timer general register V */
+#define RZ_MTU3_TCNTW		4 /* MTU5 Timer counter W */
+#define RZ_MTU3_TGRW		5 /* MTU5 Timer general register W */
+
+/* 32-bit register offset */
+#define RZ_MTU3_TCNTLW		0 /* Timer longword counter */
+#define RZ_MTU3_TGRALW		1 /* Timer longword general register A */
+#define RZ_MTU3_TGRBLW		2 /* Timer longowrd general register B */
+
+#define RZ_MTU3_TMDR3		0x191 /* MTU1 Timer Mode Register 3 */
+
+/* Macros for setting registers */
+#define RZ_MTU3_TCR_CCLR_TGRA	BIT(5)
+
+enum rz_mtu3_channels {
+	RZ_MTU0,
+	RZ_MTU1,
+	RZ_MTU2,
+	RZ_MTU3,
+	RZ_MTU4,
+	RZ_MTU5,
+	RZ_MTU6,
+	RZ_MTU7,
+	RZ_MTU8,
+	RZ_MTU_NUM_CHANNELS
+};
+
+/**
+ * struct rz_mtu3_channel - MTU3 channel private data
+ *
+ * @dev: device handle
+ * @index: channel index
+ * @base: channel base address
+ * @lock: Lock to protect channel state
+ * @is_busy: channel state
+ */
+struct rz_mtu3_channel {
+	struct device *dev;
+	unsigned int index;
+	void __iomem *base;
+	struct mutex lock; /* Protect channel state */
+	bool is_busy;
+};
+
+/**
+ * struct rz_mtu3 - MTU3 core private data
+ *
+ * @clk: MTU3 module clock
+ * @mmio: MTU3 module clock
+ * @lock: Lock to protect shared register access
+ * @rz_mtu3_channel: HW channels
+ */
+struct rz_mtu3 {
+	void *priv_rz_mtu3;
+	void __iomem *mmio;
+	struct clk *clk;
+	struct reset_control *rstc;
+	raw_spinlock_t lock; /* Protect the shared registers */
+	struct rz_mtu3_channel channels[RZ_MTU_NUM_CHANNELS];
+};
+
+#if IS_ENABLED(CONFIG_RZ_MTU3)
+static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
+{
+	bool is_idle;
+
+	mutex_lock(&ch->lock);
+	is_idle = !ch->is_busy;
+	if (is_idle)
+		ch->is_busy = true;
+	mutex_unlock(&ch->lock);
+
+	return is_idle;
+}
+
+static inline void rz_mtu3_release_channel(struct rz_mtu3_channel *ch)
+{
+	mutex_lock(&ch->lock);
+	ch->is_busy = false;
+	mutex_unlock(&ch->lock);
+}
+
+bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch);
+void rz_mtu3_disable(struct rz_mtu3_channel *ch);
+int rz_mtu3_enable(struct rz_mtu3_channel *ch);
+
+u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 off);
+u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 off);
+u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 off);
+u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 off);
+
+void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u8 val);
+void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u16 val);
+void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u32 val);
+void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 off, u16 val);
+void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 off,
+				   u16 pos, u8 val);
+#else
+static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
+{
+	return false;
+}
+
+static inline void rz_mtu3_release_channel(struct rz_mtu3_channel *ch)
+{
+}
+
+static inline bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
+{
+	return false;
+}
+
+static inline void rz_mtu3_disable(struct rz_mtu3_channel *ch)
+{
+}
+
+static inline int rz_mtu3_enable(struct rz_mtu3_channel *ch)
+{
+	return 0;
+}
+
+static inline u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	return 0;
+}
+
+static inline u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	return 0;
+}
+
+static inline u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	return 0;
+}
+
+static inline u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 off)
+{
+	return 0;
+}
+
+static inline void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u8 val)
+{
+}
+
+static inline void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u16 val)
+{
+}
+
+static inline void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u32 val)
+{
+}
+
+static inline void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 off, u16 val)
+{
+}
+
+static inline void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch,
+						 u16 off, u16 pos, u8 val)
+{
+}
+#endif
+
+#endif /* __LINUX_RZ_MTU3_H__ */
-- 
2.25.1

