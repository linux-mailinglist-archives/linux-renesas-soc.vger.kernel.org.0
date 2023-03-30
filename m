Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD066D02E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 13:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjC3LS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 07:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjC3LRe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 07:17:34 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 980D89EE3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 04:16:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,303,1673881200"; 
   d="scan'208";a="154322495"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Mar 2023 20:16:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4604B4007F3C;
        Thu, 30 Mar 2023 20:16:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        "William Breathitt Gray" <william.gray@linaro.org>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v15 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Date:   Thu, 30 Mar 2023 12:16:28 +0100
Message-Id: <20230330111632.169434-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330111632.169434-1-biju.das.jz@bp.renesas.com>
References: <20230330111632.169434-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230113161753.1073706-3-biju.das.jz@bp.renesas.com/
v14->v15:
 * Moved PWM register definitions from pwm-rz-mtu3.c to the header file.
v13->v14:
 * Added helper macros for initializing 8/16/32 channel reg offset table in
   "drivers/mfd/rz-mtu3.h"
 * Replaced "off"->offset in read_write()
 * Replaced __LINUX_RZ_MTU3_H__->__MFD_RZ_MTU3_H__
 * Added header file device.h and mutex.h
 * Updated rz_mtu3_request_channel()
 * Replaced channel_index->channel_number in struct rz_mtu3_channel
 * Dropped redundant comments.
 * Renamed channel number macros from RZ_MTU*->RZ_MTU3_CHAN_*
 * Added core driver specific private data in struct rz_mtu3 and updated the
   comments. This replaces mmio from struct rz_mtu3.
 * Started using actual offset in channel reg table and removed ch_reg_offsets table
   Also simplified the code 8/16/32 bits read_write() and removed base from
   struct rz_mtu3_channel.
 * Simplified rz_mtu3_start_stop_ch()/rz_mtu3_is_enabled() by adding helper functions
   rz_mtu3_get_tstr_offset()/rz_mtu3_get_tstr_bit_pos().
v12->v13:
 * Moved RZ_MTU3_TMDR1_* macros from pwm driver to rz-mtu3.h.
v11->v2:
 * Moved the core driver from timer to MFD.
 * Moved header fine from clocksource/rz-mtu3.h->linux/mfd/rz-mtu3.h
 * Removed Select MFD_CORE option from config.
v10->v11:
 * No change.
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
 drivers/mfd/Kconfig         |  10 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/rz-mtu3.c       | 391 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/rz-mtu3.h       | 147 ++++++++++++++
 include/linux/mfd/rz-mtu3.h | 257 ++++++++++++++++++++++++
 5 files changed, 806 insertions(+)
 create mode 100644 drivers/mfd/rz-mtu3.c
 create mode 100644 drivers/mfd/rz-mtu3.h
 create mode 100644 include/linux/mfd/rz-mtu3.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 51d54a1b8673..e90463c4441c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1315,6 +1315,16 @@ config MFD_SC27XX_PMIC
 	  This driver provides common support for accessing the SC27xx PMICs,
 	  and it also adds the irq_chip parts for handling the PMIC chip events.
 
+config RZ_MTU3
+	bool "Renesas RZ/G2L MTU3a core driver"
+	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
+	help
+	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
+	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
+	  on SoCs from Renesas. The core driver shares the clk and channel
+	  register access for the other child devices like Counter, PWM,
+	  Clock Source, and Clock event.
+
 config ABX500_CORE
 	bool "ST-Ericsson ABX500 Mixed Signal Circuit register functions"
 	depends on ARCH_U8500 || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 2f6c89d1e277..1d2392f06f78 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -174,6 +174,7 @@ pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
 obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
 obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
 obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
+obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
 obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
 # ab8500-core need to come after db8500-prcmu (which provides the channel)
diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
new file mode 100644
index 000000000000..04006f4aa702
--- /dev/null
+++ b/drivers/mfd/rz-mtu3.c
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L Multi-Function Timer Pulse Unit 3(MTU3a) Core driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/rz-mtu3.h>
+#include <linux/of_platform.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#include "rz-mtu3.h"
+
+struct rz_mtu3_priv {
+	void __iomem *mmio;
+	struct reset_control *rstc;
+	raw_spinlock_t lock;
+};
+
+/******* MTU3 registers (original offset is +0x1200) *******/
+static const unsigned long rz_mtu3_8bit_ch_reg_offs[][13] = {
+	[RZ_MTU3_CHAN_0] = MTU_8BIT_CH_0(0x104, 0x090, 0x100, 0x128, 0x101, 0x102, 0x103, 0x126),
+	[RZ_MTU3_CHAN_1] = MTU_8BIT_CH_1_2(0x184, 0x091, 0x185, 0x180, 0x194, 0x181, 0x182),
+	[RZ_MTU3_CHAN_2] = MTU_8BIT_CH_1_2(0x204, 0x092, 0x205, 0x200, 0x20c, 0x201, 0x202),
+	[RZ_MTU3_CHAN_3] = MTU_8BIT_CH_3_4_6_7(0x008, 0x093, 0x02c, 0x000, 0x04c, 0x002, 0x004, 0x005, 0x038),
+	[RZ_MTU3_CHAN_4] = MTU_8BIT_CH_3_4_6_7(0x009, 0x094, 0x02d, 0x001, 0x04d, 0x003, 0x006, 0x007, 0x039),
+	[RZ_MTU3_CHAN_5] = MTU_8BIT_CH_5(0xab2, 0x1eb, 0xab4, 0xab6, 0xa84, 0xa85, 0xa86, 0xa94, 0xa95, 0xa96, 0xaa4, 0xaa5, 0xaa6),
+	[RZ_MTU3_CHAN_6] = MTU_8BIT_CH_3_4_6_7(0x808, 0x893, 0x82c, 0x800, 0x84c, 0x802, 0x804, 0x805, 0x838),
+	[RZ_MTU3_CHAN_7] = MTU_8BIT_CH_3_4_6_7(0x809, 0x894, 0x82d, 0x801, 0x84d, 0x803, 0x806, 0x807, 0x839),
+	[RZ_MTU3_CHAN_8] = MTU_8BIT_CH_8(0x404, 0x098, 0x400, 0x406, 0x401, 0x402, 0x403)
+};
+
+static const unsigned long rz_mtu3_16bit_ch_reg_offs[][12] = {
+	[RZ_MTU3_CHAN_0] = MTU_16BIT_CH_0(0x106, 0x108, 0x10a, 0x10c, 0x10e, 0x120, 0x122),
+	[RZ_MTU3_CHAN_1] = MTU_16BIT_CH_1_2(0x186, 0x188, 0x18a),
+	[RZ_MTU3_CHAN_2] = MTU_16BIT_CH_1_2(0x206, 0x208, 0x20a),
+	[RZ_MTU3_CHAN_3] = MTU_16BIT_CH_3_6(0x010, 0x018, 0x01a, 0x024, 0x026, 0x072),
+	[RZ_MTU3_CHAN_4] = MTU_16BIT_CH_4_7(0x012, 0x01c, 0x01e, 0x028, 0x2a, 0x074, 0x076, 0x040, 0x044, 0x046, 0x048, 0x04a),
+	[RZ_MTU3_CHAN_5] = MTU_16BIT_CH_5(0xa80, 0xa82, 0xa90, 0xa92, 0xaa0, 0xaa2),
+	[RZ_MTU3_CHAN_6] = MTU_16BIT_CH_3_6(0x810, 0x818, 0x81a, 0x824, 0x826, 0x872),
+	[RZ_MTU3_CHAN_7] = MTU_16BIT_CH_4_7(0x812, 0x81c, 0x81e, 0x828, 0x82a, 0x874, 0x876, 0x840, 0x844, 0x846, 0x848, 0x84a)
+};
+
+static const unsigned long rz_mtu3_32bit_ch_reg_offs[][5] = {
+	[RZ_MTU3_CHAN_1] = MTU_32BIT_CH_1(0x1a0, 0x1a4, 0x1a8),
+	[RZ_MTU3_CHAN_8] = MTU_32BIT_CH_8(0x408, 0x40c, 0x410, 0x414, 0x418)
+};
+
+static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
+{
+	return (offset == RZ_MTU3_TDDRA || offset == RZ_MTU3_TDDRB ||
+		offset == RZ_MTU3_TCDRA || offset == RZ_MTU3_TCDRB ||
+		offset == RZ_MTU3_TCBRA || offset == RZ_MTU3_TCBRB ||
+		offset == RZ_MTU3_TCNTSA || offset == RZ_MTU3_TCNTSB);
+}
+
+u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 offset)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+
+	if (rz_mtu3_is_16bit_shared_reg(offset))
+		return readw(priv->mmio + offset);
+	else
+		return readb(priv->mmio + offset);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_read);
+
+u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	u16 ch_offs;
+
+	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
+
+	return readb(priv->mmio + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_read);
+
+u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	u16 ch_offs;
+
+	/* MTU8 doesn't have 16-bit registers */
+	if (ch->channel_number == RZ_MTU3_CHAN_8)
+		return 0;
+
+	ch_offs = rz_mtu3_16bit_ch_reg_offs[ch->channel_number][offset];
+
+	return readw(priv->mmio + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_read);
+
+u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	u16 ch_offs;
+
+	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
+		return 0;
+
+	ch_offs = rz_mtu3_32bit_ch_reg_offs[ch->channel_number][offset];
+
+	return readl(priv->mmio + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_read);
+
+void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u8 val)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	u16 ch_offs;
+
+	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
+	writeb(val, priv->mmio + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_write);
+
+void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u16 val)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	u16 ch_offs;
+
+	/* MTU8 doesn't have 16-bit registers */
+	if (ch->channel_number == RZ_MTU3_CHAN_8)
+		return;
+
+	ch_offs = rz_mtu3_16bit_ch_reg_offs[ch->channel_number][offset];
+	writew(val, priv->mmio + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_write);
+
+void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u32 val)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	u16 ch_offs;
+
+	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
+		return;
+
+	ch_offs = rz_mtu3_32bit_ch_reg_offs[ch->channel_number][offset];
+	writel(val, priv->mmio + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_write);
+
+void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 offset, u16 value)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+
+	if (rz_mtu3_is_16bit_shared_reg(offset))
+		writew(value, priv->mmio + offset);
+	else
+		writeb((u8)value, priv->mmio + offset);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_write);
+
+void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
+				   u16 pos, u8 val)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	unsigned long tmdr, flags;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+	tmdr = rz_mtu3_shared_reg_read(ch, offset);
+	__assign_bit(pos, &tmdr, !!val);
+	rz_mtu3_shared_reg_write(ch, offset, tmdr);
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+}
+EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_update_bit);
+
+static u16 rz_mtu3_get_tstr_offset(struct rz_mtu3_channel *ch)
+{
+	u16 offset;
+
+	switch (ch->channel_number) {
+	case RZ_MTU3_CHAN_0:
+	case RZ_MTU3_CHAN_1:
+	case RZ_MTU3_CHAN_2:
+	case RZ_MTU3_CHAN_3:
+	case RZ_MTU3_CHAN_4:
+	case RZ_MTU3_CHAN_8:
+		offset = RZ_MTU3_TSTRA;
+		break;
+	case RZ_MTU3_CHAN_5:
+		offset = RZ_MTU3_TSTR;
+		break;
+	case RZ_MTU3_CHAN_6:
+	case RZ_MTU3_CHAN_7:
+		offset = RZ_MTU3_TSTRB;
+		break;
+	default:
+		offset = 0;
+		break;
+	}
+
+	return offset;
+}
+
+static u8 rz_mtu3_get_tstr_bit_pos(struct rz_mtu3_channel *ch)
+{
+	u8 bitpos;
+
+	switch (ch->channel_number) {
+	case RZ_MTU3_CHAN_0:
+	case RZ_MTU3_CHAN_1:
+	case RZ_MTU3_CHAN_2:
+	case RZ_MTU3_CHAN_6:
+	case RZ_MTU3_CHAN_7:
+		bitpos = ch->channel_number;
+		break;
+	case RZ_MTU3_CHAN_3:
+		bitpos = 6;
+		break;
+	case RZ_MTU3_CHAN_4:
+		bitpos = 7;
+		break;
+	case RZ_MTU3_CHAN_5:
+		bitpos = 2;
+		break;
+	case RZ_MTU3_CHAN_8:
+		bitpos = 3;
+		break;
+	default:
+		bitpos = 0;
+		break;
+	}
+
+	return bitpos;
+}
+
+static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	unsigned long flags, tstr;
+	u16 offset;
+	u8 bitpos;
+
+	/* start stop register shared by multiple timer channels */
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	offset = rz_mtu3_get_tstr_offset(ch);
+	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
+	tstr = rz_mtu3_shared_reg_read(ch, offset);
+	__assign_bit(bitpos, &tstr, start);
+	rz_mtu3_shared_reg_write(ch, offset, tstr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+	unsigned long flags, tstr;
+	bool ret = false;
+	u16 offset;
+	u8 bitpos;
+
+	/* start stop register shared by multiple timer channels */
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	offset = rz_mtu3_get_tstr_offset(ch);
+	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
+	tstr = rz_mtu3_shared_reg_read(ch, offset);
+	ret = tstr & BIT(bitpos);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
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
+static void rz_mtu3_reset_assert(void *data)
+{
+	struct rz_mtu3 *mtu = dev_get_drvdata(data);
+	struct rz_mtu3_priv *priv = mtu->priv_data;
+
+	mfd_remove_devices(data);
+	reset_control_assert(priv->rstc);
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
+	struct rz_mtu3_priv *priv;
+	struct rz_mtu3 *ddata;
+	unsigned int i;
+	int ret;
+
+	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->priv_data = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!ddata->priv_data)
+		return -ENOMEM;
+
+	priv = ddata->priv_data;
+
+	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->mmio))
+		return PTR_ERR(priv->mmio);
+
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return PTR_ERR(priv->rstc);
+
+	ddata->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(ddata->clk))
+		return PTR_ERR(ddata->clk);
+
+	reset_control_deassert(priv->rstc);
+	raw_spin_lock_init(&priv->lock);
+	platform_set_drvdata(pdev, ddata);
+
+	for (i = 0; i < RZ_MTU_NUM_CHANNELS; i++) {
+		ddata->channels[i].channel_number = i;
+		ddata->channels[i].is_busy = false;
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
+	reset_control_assert(priv->rstc);
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
diff --git a/drivers/mfd/rz-mtu3.h b/drivers/mfd/rz-mtu3.h
new file mode 100644
index 000000000000..51a1298b0613
--- /dev/null
+++ b/drivers/mfd/rz-mtu3.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MFD internals for Renesas RZ/G2L MTU3 Core driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ */
+
+#ifndef RZ_MTU3_MFD_H
+#define RZ_MTU3_MFD_H
+
+#define MTU_8BIT_CH_0(_tier, _nfcr, _tcr, _tcr2, _tmdr1, _tiorh, _tiorl, _tbtm) \
+	{ \
+		[RZ_MTU3_TIER] = _tier, \
+		[RZ_MTU3_NFCR] = _nfcr, \
+		[RZ_MTU3_TCR] = _tcr, \
+		[RZ_MTU3_TCR2] = _tcr2, \
+		[RZ_MTU3_TMDR1] = _tmdr1, \
+		[RZ_MTU3_TIORH] = _tiorh, \
+		[RZ_MTU3_TIORL] = _tiorl, \
+		[RZ_MTU3_TBTM] = _tbtm \
+	}
+
+#define MTU_8BIT_CH_1_2(_tier, _nfcr, _tsr, _tcr, _tcr2, _tmdr1, _tior) \
+	{ \
+		[RZ_MTU3_TIER] = _tier, \
+		[RZ_MTU3_NFCR] = _nfcr, \
+		[RZ_MTU3_TSR] = _tsr, \
+		[RZ_MTU3_TCR] = _tcr, \
+		[RZ_MTU3_TCR2] = _tcr2, \
+		[RZ_MTU3_TMDR1] = _tmdr1, \
+		[RZ_MTU3_TIOR] = _tior \
+	} \
+
+#define MTU_8BIT_CH_3_4_6_7(_tier, _nfcr, _tsr, _tcr, _tcr2, _tmdr1, _tiorh, _tiorl, _tbtm) \
+	{ \
+		[RZ_MTU3_TIER] = _tier, \
+		[RZ_MTU3_NFCR] = _nfcr, \
+		[RZ_MTU3_TSR] = _tsr, \
+		[RZ_MTU3_TCR] = _tcr, \
+		[RZ_MTU3_TCR2] = _tcr2, \
+		[RZ_MTU3_TMDR1] = _tmdr1, \
+		[RZ_MTU3_TIORH] = _tiorh, \
+		[RZ_MTU3_TIORL] = _tiorl, \
+		[RZ_MTU3_TBTM] = _tbtm \
+	} \
+
+#define MTU_8BIT_CH_5(_tier, _nfcr, _tstr, _tcntcmpclr, _tcru, _tcr2u, _tioru, \
+		      _tcrv, _tcr2v, _tiorv, _tcrw, _tcr2w, _tiorw) \
+	{ \
+		[RZ_MTU3_TIER] = _tier, \
+		[RZ_MTU3_NFCR] = _nfcr, \
+		[RZ_MTU3_TSTR] = _tstr, \
+		[RZ_MTU3_TCNTCMPCLR] = _tcntcmpclr, \
+		[RZ_MTU3_TCRU] = _tcru, \
+		[RZ_MTU3_TCR2U] = _tcr2u, \
+		[RZ_MTU3_TIORU] = _tioru, \
+		[RZ_MTU3_TCRV] = _tcrv, \
+		[RZ_MTU3_TCR2V] = _tcr2v, \
+		[RZ_MTU3_TIORV] = _tiorv, \
+		[RZ_MTU3_TCRW] = _tcrw, \
+		[RZ_MTU3_TCR2W] = _tcr2w, \
+		[RZ_MTU3_TIORW] = _tiorw \
+	} \
+
+#define MTU_8BIT_CH_8(_tier, _nfcr, _tcr, _tcr2, _tmdr1, _tiorh, _tiorl) \
+	{ \
+		[RZ_MTU3_TIER] = _tier, \
+		[RZ_MTU3_NFCR] = _nfcr, \
+		[RZ_MTU3_TCR] = _tcr, \
+		[RZ_MTU3_TCR2] = _tcr2, \
+		[RZ_MTU3_TMDR1] = _tmdr1, \
+		[RZ_MTU3_TIORH] = _tiorh, \
+		[RZ_MTU3_TIORL] = _tiorl \
+	} \
+
+#define MTU_16BIT_CH_0(_tcnt, _tgra, _tgrb, _tgrc, _tgrd, _tgre, _tgrf) \
+	{ \
+		[RZ_MTU3_TCNT] = _tcnt, \
+		[RZ_MTU3_TGRA] = _tgra, \
+		[RZ_MTU3_TGRB] = _tgrb, \
+		[RZ_MTU3_TGRC] = _tgrc, \
+		[RZ_MTU3_TGRD] = _tgrd, \
+		[RZ_MTU3_TGRE] = _tgre, \
+		[RZ_MTU3_TGRF] = _tgrf \
+	}
+
+#define MTU_16BIT_CH_1_2(_tcnt, _tgra, _tgrb) \
+	{ \
+		[RZ_MTU3_TCNT] = _tcnt, \
+		[RZ_MTU3_TGRA] = _tgra, \
+		[RZ_MTU3_TGRB] = _tgrb \
+	}
+
+#define MTU_16BIT_CH_3_6(_tcnt, _tgra, _tgrb, _tgrc, _tgrd, _tgre) \
+	{ \
+		[RZ_MTU3_TCNT] = _tcnt, \
+		[RZ_MTU3_TGRA] = _tgra, \
+		[RZ_MTU3_TGRB] = _tgrb, \
+		[RZ_MTU3_TGRC] = _tgrc, \
+		[RZ_MTU3_TGRD] = _tgrd, \
+		[RZ_MTU3_TGRE] = _tgre \
+	}
+
+#define MTU_16BIT_CH_4_7(_tcnt, _tgra, _tgrb, _tgrc, _tgrd, _tgre, _tgrf, \
+			  _tadcr, _tadcora, _tadcorb, _tadcobra, _tadcobrb) \
+	{ \
+		[RZ_MTU3_TCNT] = _tcnt, \
+		[RZ_MTU3_TGRA] = _tgra, \
+		[RZ_MTU3_TGRB] = _tgrb, \
+		[RZ_MTU3_TGRC] = _tgrc, \
+		[RZ_MTU3_TGRD] = _tgrd, \
+		[RZ_MTU3_TGRE] = _tgre, \
+		[RZ_MTU3_TGRF] = _tgrf, \
+		[RZ_MTU3_TADCR] = _tadcr, \
+		[RZ_MTU3_TADCORA] = _tadcora, \
+		[RZ_MTU3_TADCORB] = _tadcorb, \
+		[RZ_MTU3_TADCOBRA] = _tadcobra, \
+		[RZ_MTU3_TADCOBRB] = _tadcobrb \
+	}
+
+#define MTU_16BIT_CH_5(_tcntu, _tgru, _tcntv, _tgrv, _tcntw, _tgrw) \
+	{ \
+		[RZ_MTU3_TCNTU] = _tcntu, \
+		[RZ_MTU3_TGRU] = _tgru, \
+		[RZ_MTU3_TCNTV] = _tcntv, \
+		[RZ_MTU3_TGRV] = _tgrv, \
+		[RZ_MTU3_TCNTW] = _tcntw, \
+		[RZ_MTU3_TGRW] = _tgrw \
+	}
+
+#define MTU_32BIT_CH_1(_tcntlw, _tgralw, _tgrblw) \
+	{ \
+	       [RZ_MTU3_TCNTLW] = _tcntlw, \
+	       [RZ_MTU3_TGRALW] = _tgralw, \
+	       [RZ_MTU3_TGRBLW] = _tgrblw \
+	}
+
+#define MTU_32BIT_CH_8(_tcnt, _tgra, _tgrb, _tgrc, _tgrd) \
+	{ \
+	       [RZ_MTU3_TCNT] = _tcnt, \
+	       [RZ_MTU3_TGRA] = _tgra, \
+	       [RZ_MTU3_TGRB] = _tgrb, \
+	       [RZ_MTU3_TGRC] = _tgrc, \
+	       [RZ_MTU3_TGRD] = _tgrd \
+	}
+
+#endif
diff --git a/include/linux/mfd/rz-mtu3.h b/include/linux/mfd/rz-mtu3.h
new file mode 100644
index 000000000000..c5173bc06270
--- /dev/null
+++ b/include/linux/mfd/rz-mtu3.h
@@ -0,0 +1,257 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+#ifndef __MFD_RZ_MTU3_H__
+#define __MFD_RZ_MTU3_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
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
+
+/* Timer mode register 1 */
+#define RZ_MTU3_TMDR1	5
+#define RZ_MTU3_TMDR1_MD		GENMASK(3, 0)
+#define RZ_MTU3_TMDR1_MD_NORMAL		FIELD_PREP(RZ_MTU3_TMDR1_MD, 0)
+#define RZ_MTU3_TMDR1_MD_PWMMODE1	FIELD_PREP(RZ_MTU3_TMDR1_MD, 2)
+
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
+#define RZ_MTU3_TCR_CCLR	GENMASK(7, 5)
+#define RZ_MTU3_TCR_CKEG	GENMASK(4, 3)
+#define RZ_MTU3_TCR_TPCS	GENMASK(2, 0)
+#define RZ_MTU3_TCR_CCLR_TGRA	BIT(5)
+#define RZ_MTU3_TCR_CCLR_TGRC	FIELD_PREP(RZ_MTU3_TCR_CCLR, 5)
+#define RZ_MTU3_TCR_CKEG_RISING	FIELD_PREP(RZ_MTU3_TCR_CKEG, 0)
+
+#define RZ_MTU3_TIOR_IOB			GENMASK(7, 4)
+#define RZ_MTU3_TIOR_IOA			GENMASK(3, 0)
+#define RZ_MTU3_TIOR_OC_RETAIN			0
+#define RZ_MTU3_TIOR_OC_INIT_OUT_LO_HI_OUT	2
+#define RZ_MTU3_TIOR_OC_INIT_OUT_HI_TOGGLE_OUT	7
+
+#define RZ_MTU3_TIOR_OC_IOA_H_COMP_MATCH \
+	FIELD_PREP(RZ_MTU3_TIOR_IOA, RZ_MTU3_TIOR_OC_INIT_OUT_LO_HI_OUT)
+#define RZ_MTU3_TIOR_OC_IOB_TOGGLE \
+	FIELD_PREP(RZ_MTU3_TIOR_IOB, RZ_MTU3_TIOR_OC_INIT_OUT_HI_TOGGLE_OUT)
+
+enum rz_mtu3_channels {
+	RZ_MTU3_CHAN_0,
+	RZ_MTU3_CHAN_1,
+	RZ_MTU3_CHAN_2,
+	RZ_MTU3_CHAN_3,
+	RZ_MTU3_CHAN_4,
+	RZ_MTU3_CHAN_5,
+	RZ_MTU3_CHAN_6,
+	RZ_MTU3_CHAN_7,
+	RZ_MTU3_CHAN_8,
+	RZ_MTU_NUM_CHANNELS
+};
+
+/**
+ * struct rz_mtu3_channel - MTU3 channel private data
+ *
+ * @dev: device handle
+ * @channel_number: channel number
+ * @lock: Lock to protect channel state
+ * @is_busy: channel state
+ */
+struct rz_mtu3_channel {
+	struct device *dev;
+	unsigned int channel_number;
+	struct mutex lock;
+	bool is_busy;
+};
+
+/**
+ * struct rz_mtu3 - MTU3 core private data
+ *
+ * @clk: MTU3 module clock
+ * @rz_mtu3_channel: HW channels
+ * @priv_data: MTU3 core driver private data
+ */
+struct rz_mtu3 {
+	struct clk *clk;
+	struct rz_mtu3_channel channels[RZ_MTU_NUM_CHANNELS];
+
+	void *priv_data;
+};
+
+#if IS_ENABLED(CONFIG_RZ_MTU3)
+static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
+{
+	mutex_lock(&ch->lock);
+	if (ch->is_busy) {
+		mutex_unlock(&ch->lock);
+		return false;
+	}
+
+	ch->is_busy = true;
+	mutex_unlock(&ch->lock);
+
+	return true;
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
+#endif /* __MFD_RZ_MTU3_H__ */
-- 
2.25.1

