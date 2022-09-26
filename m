Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065F85EA925
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 16:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiIZOyt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 10:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbiIZOy2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:54:28 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7016256B87
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 06:21:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,346,1654527600"; 
   d="scan'208";a="133987308"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Sep 2022 22:21:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B09A44005B43;
        Mon, 26 Sep 2022 22:21:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 3/8] mfd: Add RZ/G2L MTU3 driver
Date:   Mon, 26 Sep 2022 14:21:09 +0100
Message-Id: <20220926132114.60396-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add RZ/G2L MTU3 MFD driver. It can support counter, timer and
pwm functionality.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mfd/Kconfig            |   9 +
 drivers/mfd/Makefile           |   1 +
 drivers/mfd/rzg2l-mtu3.c       | 377 +++++++++++++++++++++++++++++++++
 include/linux/mfd/rzg2l-mtu3.h | 124 +++++++++++
 4 files changed, 511 insertions(+)
 create mode 100644 drivers/mfd/rzg2l-mtu3.c
 create mode 100644 include/linux/mfd/rzg2l-mtu3.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index abb58ab1a1a4..a435ade4426b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1974,6 +1974,15 @@ config MFD_ROHM_BD957XMUF
 	  BD9573MUF Power Management ICs. BD9576 and BD9573 are primarily
 	  designed to be used to power R-Car series processors.
 
+config MFD_RZG2L_MTU3
+	tristate "Support for RZ/G2L MTU3 timers"
+	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
+	select MFD_CORE
+	help
+	  Select this option to enable RZ/G2L MTU3 timers driver used
+	  for PWM, Clock Source, Clock event and Counter. This driver allow to
+	  share the registers between the others drivers.
+
 config MFD_STM32_LPTIMER
 	tristate "Support for STM32 Low-Power Timer"
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 858cacf659d6..b52575556e93 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -251,6 +251,7 @@ obj-$(CONFIG_MFD_ALTERA_SYSMGR) += altera-sysmgr.o
 obj-$(CONFIG_MFD_STPMIC1)	+= stpmic1.o
 obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 
+obj-$(CONFIG_MFD_RZG2L_MTU3) 	+= rzg2l-mtu3.o
 obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
diff --git a/drivers/mfd/rzg2l-mtu3.c b/drivers/mfd/rzg2l-mtu3.c
new file mode 100644
index 000000000000..16bf05218d91
--- /dev/null
+++ b/drivers/mfd/rzg2l-mtu3.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L Multi-Function Timer Pulse Unit 3 - MTU3a
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/mfd/rzg2l-mtu3.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+static const unsigned long rzg2l_mtu3_8bit_ch_reg_offs[][13] = {
+	{
+		[RZG2L_MTU3_TIER] = 0x4, [RZG2L_MTU3_NFCR] = 0x70,
+		[RZG2L_MTU3_TCR] = 0x0, [RZG2L_MTU3_TCR2] = 0x28,
+		[RZG2L_MTU3_TMDR1] = 0x1, [RZG2L_MTU3_TIORH] = 0x2,
+		[RZG2L_MTU3_TIORL] = 0x3
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x4, [RZG2L_MTU3_NFCR] = 0xef,
+		[RZG2L_MTU3_TSR] = 0x5, [RZG2L_MTU3_TCR] = 0x0,
+		[RZG2L_MTU3_TCR2] = 0x14, [RZG2L_MTU3_TMDR1] = 0x1,
+		[RZG2L_MTU3_TIOR] = 0x2
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x4, [RZG2L_MTU3_NFCR] = 0x16e,
+		[RZG2L_MTU3_TSR] = 0x5, [RZG2L_MTU3_TCR] = 0x0,
+		[RZG2L_MTU3_TCR2] = 0xc, [RZG2L_MTU3_TMDR1] = 0x1,
+		[RZG2L_MTU3_TIOR] = 0x2
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x8, [RZG2L_MTU3_NFCR] = 0x93,
+		[RZG2L_MTU3_TSR] = 0x2c, [RZG2L_MTU3_TCR] = 0x0,
+		[RZG2L_MTU3_TCR2] = 0x4c, [RZG2L_MTU3_TMDR1] = 0x2,
+		[RZG2L_MTU3_TIORH] = 0x4, [RZG2L_MTU3_TIORL] = 0x5,
+		[RZG2L_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x8, [RZG2L_MTU3_NFCR] = 0x93,
+		[RZG2L_MTU3_TSR] = 0x2c, [RZG2L_MTU3_TCR] = 0x0,
+		[RZG2L_MTU3_TCR2] = 0x4c, [RZG2L_MTU3_TMDR1] = 0x2,
+		[RZG2L_MTU3_TIORH] = 0x5, [RZG2L_MTU3_TIORL] = 0x6,
+		[RZG2L_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x32, [RZG2L_MTU3_NFCR] = 0x1eb,
+		[RZG2L_MTU3_TSTR] = 0x34, [RZG2L_MTU3_TCNTCMPCLR] = 0x36,
+		[RZG2L_MTU3_TCRU] = 0x4, [RZG2L_MTU3_TCR2U] = 0x5,
+		[RZG2L_MTU3_TIORU] = 0x6, [RZG2L_MTU3_TCRV] = 0x14,
+		[RZG2L_MTU3_TCR2V] = 0x15, [RZG2L_MTU3_TIORV] = 0x16,
+		[RZG2L_MTU3_TCRW] = 0x24, [RZG2L_MTU3_TCR2W] = 0x25,
+		[RZG2L_MTU3_TIORW] = 0x26
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x8, [RZG2L_MTU3_NFCR] = 0x93,
+		[RZG2L_MTU3_TSR] = 0x2c, [RZG2L_MTU3_TCR] = 0x0,
+		[RZG2L_MTU3_TCR2] = 0x4c, [RZG2L_MTU3_TMDR1] = 0x2,
+		[RZG2L_MTU3_TIORH] = 0x4, [RZG2L_MTU3_TIORL] = 0x5,
+		[RZG2L_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x8, [RZG2L_MTU3_NFCR] = 0x93,
+		[RZG2L_MTU3_TSR] = 0x2c, [RZG2L_MTU3_TCR] = 0x0,
+		[RZG2L_MTU3_TCR2] = 0x4c, [RZG2L_MTU3_TMDR1] = 0x2,
+		[RZG2L_MTU3_TIORH] = 0x5, [RZG2L_MTU3_TIORL] = 0x6,
+		[RZG2L_MTU3_TBTM] = 0x38
+	},
+	{
+		[RZG2L_MTU3_TIER] = 0x4, [RZG2L_MTU3_NFCR] = 0x368,
+		[RZG2L_MTU3_TCR] = 0x0, [RZG2L_MTU3_TCR2] = 0x6,
+		[RZG2L_MTU3_TMDR1] = 0x1, [RZG2L_MTU3_TIORH] = 0x2,
+		[RZG2L_MTU3_TIORL] = 0x3
+	}
+};
+
+static const unsigned long rzg2l_mtu3_16bit_ch_reg_offs[][12] = {
+	{
+		[RZG2L_MTU3_TCNT] = 0x6, [RZG2L_MTU3_TGRA] = 0x8,
+		[RZG2L_MTU3_TGRB] = 0xa, [RZG2L_MTU3_TGRC] = 0xc,
+		[RZG2L_MTU3_TGRD] = 0xe, [RZG2L_MTU3_TGRE] = 0x20,
+		[RZG2L_MTU3_TGRF] = 0x22
+	},
+	{
+		[RZG2L_MTU3_TCNT] = 0x6, [RZG2L_MTU3_TGRA] = 0x8,
+		[RZG2L_MTU3_TGRB] = 0xa
+	},
+	{
+		[RZG2L_MTU3_TCNT] = 0x6, [RZG2L_MTU3_TGRA] = 0x8,
+		[RZG2L_MTU3_TGRB] = 0xa
+	},
+	{
+		[RZG2L_MTU3_TCNT] = 0x10, [RZG2L_MTU3_TGRA] = 0x18,
+		[RZG2L_MTU3_TGRB] = 0x1a, [RZG2L_MTU3_TGRC] = 0x24,
+		[RZG2L_MTU3_TGRD] = 0x26, [RZG2L_MTU3_TGRE] = 0x72
+	},
+	{
+		[RZG2L_MTU3_TCNT] = 0x11, [RZG2L_MTU3_TGRA] = 0x1b,
+		[RZG2L_MTU3_TGRB] = 0x1d, [RZG2L_MTU3_TGRC] = 0x27,
+		[RZG2L_MTU3_TGRD] = 0x29, [RZG2L_MTU3_TGRE] = 0x73,
+		[RZG2L_MTU3_TGRF] = 0x75, [RZG2L_MTU3_TADCR] = 0x3f,
+		[RZG2L_MTU3_TADCORA] = 0x43, [RZG2L_MTU3_TADCORB] = 0x45,
+		[RZG2L_MTU3_TADCOBRA] = 0x47,
+		[RZG2L_MTU3_TADCOBRB] = 0x49
+	},
+	{
+		[RZG2L_MTU3_TCNTU] = 0x0, [RZG2L_MTU3_TGRU] = 0x2,
+		[RZG2L_MTU3_TCNTV] = 0x10, [RZG2L_MTU3_TGRV] = 0x12,
+		[RZG2L_MTU3_TCNTW] = 0x20, [RZG2L_MTU3_TGRW] = 0x22
+	},
+	{
+		[RZG2L_MTU3_TCNT] = 0x10, [RZG2L_MTU3_TGRA] = 0x18,
+		[RZG2L_MTU3_TGRB] = 0x1a, [RZG2L_MTU3_TGRC] = 0x24,
+		[RZG2L_MTU3_TGRD] = 0x26, [RZG2L_MTU3_TGRE] = 0x72
+	},
+	{
+		[RZG2L_MTU3_TCNT] = 0x11, [RZG2L_MTU3_TGRA] = 0x1b,
+		[RZG2L_MTU3_TGRB] = 0x1d, [RZG2L_MTU3_TGRC] = 0x27,
+		[RZG2L_MTU3_TGRD] = 0x29, [RZG2L_MTU3_TGRE] = 0x73,
+		[RZG2L_MTU3_TGRF] = 0x75, [RZG2L_MTU3_TADCR] = 0x3f,
+		[RZG2L_MTU3_TADCORA] = 0x43, [RZG2L_MTU3_TADCORB] = 0x45,
+		[RZG2L_MTU3_TADCOBRA] = 0x47,
+		[RZG2L_MTU3_TADCOBRB] = 0x49
+	},
+};
+
+static bool rzg2l_mtu3_is_16bit_shared_reg(u16 off)
+{
+	return (off == RZG2L_MTU3_TDDRA || off == RZG2L_MTU3_TDDRB ||
+		off == RZG2L_MTU3_TCDRA || off == RZG2L_MTU3_TCDRB ||
+		off == RZG2L_MTU3_TCBRA || off == RZG2L_MTU3_TCBRB ||
+		off == RZG2L_MTU3_TCNTSA || off == RZG2L_MTU3_TCNTSB);
+}
+
+u16 rzg2l_mtu3_shared_reg_read(struct rzg2l_mtu3_channel *ch, u16 off)
+{
+	struct rzg2l_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+
+	if (rzg2l_mtu3_is_16bit_shared_reg(off))
+		return ioread16(mtu->mmio + off);
+	else
+		return ioread8(mtu->mmio + off);
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_shared_reg_read);
+
+u8 rzg2l_mtu3_8bit_ch_read(struct rzg2l_mtu3_channel *ch, u16 off)
+{
+	u16 ch_offs;
+
+	ch_offs = rzg2l_mtu3_8bit_ch_reg_offs[ch->index][off];
+	if (off != RZG2L_MTU3_TCR && ch_offs == 0)
+		return -EINVAL;
+
+	/*
+	 * NFCR register addresses on MTU{0,1,2,5,8} channels are smaller than
+	 * channel's base address.
+	 */
+	if (off == RZG2L_MTU3_NFCR && (ch->index <= RZG2L_MTU2 ||
+				       ch->index == RZG2L_MTU5 ||
+				       ch->index == RZG2L_MTU8))
+		return ioread8(ch->base - ch_offs);
+	else
+		return ioread8(ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_8bit_ch_read);
+
+u16 rzg2l_mtu3_16bit_ch_read(struct rzg2l_mtu3_channel *ch, u16 off)
+{
+	u16 ch_offs;
+
+	/* MTU8 doesn't have 16-bit registers */
+	if (ch->index == RZG2L_MTU8)
+		return 0;
+
+	ch_offs = rzg2l_mtu3_16bit_ch_reg_offs[ch->index][off];
+	if (ch->index != RZG2L_MTU5 && off != RZG2L_MTU3_TCNTU && ch_offs == 0)
+		return 0;
+
+	return ioread16(ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_16bit_ch_read);
+
+void rzg2l_mtu3_8bit_ch_write(struct rzg2l_mtu3_channel *ch, u16 off, u8 val)
+{
+	u16 ch_offs;
+
+	ch_offs = rzg2l_mtu3_8bit_ch_reg_offs[ch->index][off];
+	if (ch->index != RZG2L_MTU5 && off != RZG2L_MTU3_TCR && ch_offs == 0)
+		return;
+
+	/*
+	 * NFCR register addresses on MTU{0,1,2,5,8} channels are smaller than
+	 * channel's base address.
+	 */
+	if (off == RZG2L_MTU3_NFCR && (ch->index <= RZG2L_MTU2 ||
+				       ch->index == RZG2L_MTU5 ||
+				       ch->index == RZG2L_MTU8))
+		iowrite8(val, ch->base - ch_offs);
+	else
+		iowrite8(val, ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_8bit_ch_write);
+
+void rzg2l_mtu3_16bit_ch_write(struct rzg2l_mtu3_channel *ch, u16 off, u16 val)
+{
+	u16 ch_offs;
+
+	/* MTU8 doesn't have 16-bit registers */
+	if (ch->index == RZG2L_MTU8)
+		return;
+
+	ch_offs = rzg2l_mtu3_16bit_ch_reg_offs[ch->index][off];
+	if (ch->index != RZG2L_MTU5 && off != RZG2L_MTU3_TCNTU && ch_offs == 0)
+		return;
+
+	iowrite16(val, ch->base + ch_offs);
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_16bit_ch_write);
+
+static inline void rzg2l_mtu3_shared_reg_write(struct rzg2l_mtu3_channel *ch,
+					       u16 off, u16 value)
+{
+	struct rzg2l_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+
+	if (rzg2l_mtu3_is_16bit_shared_reg(off))
+		iowrite16(value, mtu->mmio + off);
+	else
+		iowrite8((u8)value, mtu->mmio + off);
+}
+
+static void rzg2l_mtu3_start_stop_ch(struct rzg2l_mtu3_channel *ch, bool start)
+{
+	struct rzg2l_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	unsigned long flags, value;
+	u8 offs;
+
+	/* start stop register shared by multiple timer channels */
+	raw_spin_lock_irqsave(&mtu->lock, flags);
+
+	if (ch->index == RZG2L_MTU6 || ch->index == RZG2L_MTU7) {
+		value = rzg2l_mtu3_shared_reg_read(ch, RZG2L_MTU3_TSTRB);
+		if (start)
+			value |= 1 << ch->index;
+		else
+			value &= ~(1 << ch->index);
+		rzg2l_mtu3_shared_reg_write(ch, RZG2L_MTU3_TSTRB, value);
+	} else if (ch->index != RZG2L_MTU5) {
+		value = rzg2l_mtu3_shared_reg_read(ch, RZG2L_MTU3_TSTRA);
+		if (ch->index == RZG2L_MTU8)
+			offs = 0x08;
+		else if (ch->index < RZG2L_MTU3)
+			offs = 1 << ch->index;
+		else
+			offs = 1 << (ch->index + 3);
+		if (start)
+			value |= offs;
+		else
+			value &= ~offs;
+		rzg2l_mtu3_shared_reg_write(ch, RZG2L_MTU3_TSTRA, value);
+	}
+
+	raw_spin_unlock_irqrestore(&mtu->lock, flags);
+}
+
+int rzg2l_mtu3_enable(struct rzg2l_mtu3_channel *ch)
+{
+	struct rzg2l_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+	int ret;
+
+	ret = clk_enable(mtu->clk);
+	if (ret) {
+		dev_err(ch->dev, "ch%u: cannot enable clock\n",
+			ch->index);
+		return ret;
+	}
+
+	/* enable channel */
+	rzg2l_mtu3_start_stop_ch(ch, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_enable);
+
+void rzg2l_mtu3_disable(struct rzg2l_mtu3_channel *ch)
+{
+	struct rzg2l_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
+
+	/* disable channel */
+	rzg2l_mtu3_start_stop_ch(ch, false);
+	clk_disable(mtu->clk);
+}
+EXPORT_SYMBOL_GPL(rzg2l_mtu3_disable);
+
+static const unsigned int ch_reg_offsets[] = {
+	0x100, 0x180, 0x200, 0x000, 0x001, 0xa80, 0x800, 0x801, 0x400
+};
+
+static void rzg2l_mtu3_reset_assert(void *data)
+{
+	struct reset_control *rstc = data;
+
+	reset_control_assert(rstc);
+}
+
+static int rzg2l_mtu3_probe(struct platform_device *pdev)
+{
+	struct reset_control *rstc;
+	struct rzg2l_mtu3 *ddata;
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
+	rstc = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
+
+	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_mtu3_reset_assert,
+				       rstc);
+	if (ret < 0)
+		return ret;
+
+	ddata->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(ddata->clk))
+		return PTR_ERR(ddata->clk);
+
+	raw_spin_lock_init(&ddata->lock);
+	reset_control_deassert(rstc);
+
+	for (i = 0; i < RZG2L_MTU_NUM_CHANNELS; i++) {
+		ddata->channels[i].index = i;
+		ddata->channels[i].base = ddata->mmio + ch_reg_offsets[i];
+	}
+
+	platform_set_drvdata(pdev, ddata);
+
+	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+}
+
+static int rzg2l_mtu3_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id rzg2l_mtu3_of_match[] = {
+	{ .compatible = "renesas,rzg2l-mtu3", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg2l_mtu3_of_match);
+
+static struct platform_driver rzg2l_mtu3_driver = {
+	.probe = rzg2l_mtu3_probe,
+	.remove = rzg2l_mtu3_remove,
+	.driver	= {
+		.name = "rzg2l-mtu3",
+		.of_match_table = rzg2l_mtu3_of_match,
+	},
+};
+module_platform_driver(rzg2l_mtu3_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L MTU3 Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rzg2l-mtu3.h b/include/linux/mfd/rzg2l-mtu3.h
new file mode 100644
index 000000000000..69d4323d1126
--- /dev/null
+++ b/include/linux/mfd/rzg2l-mtu3.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#ifndef __LINUX_RZG2L_MTU3_H__
+#define __LINUX_RZG2L_MTU3_H__
+
+#include <linux/clk.h>
+
+/* 8-bit shared register offsets macros */
+#define RZG2L_MTU3_TSTRA	0x080 /* Timer start register A */
+#define RZG2L_MTU3_TSTRB	0x880 /* Timer start register B */
+
+/* 16-bit shared register offset macros */
+#define RZG2L_MTU3_TDDRA	0x016 /* Timer dead time data register A */
+#define RZG2L_MTU3_TDDRB	0x816 /* Timer dead time data register B */
+#define RZG2L_MTU3_TCDRA	0x014 /* Timer cycle data register A */
+#define RZG2L_MTU3_TCDRB	0x814 /* Timer cycle data register B */
+#define RZG2L_MTU3_TCBRA	0x022 /* Timer cycle buffer register A */
+#define RZG2L_MTU3_TCBRB	0x822 /* Timer cycle buffer register B */
+#define RZG2L_MTU3_TCNTSA	0x020 /* Timer subcounter A */
+#define RZG2L_MTU3_TCNTSB	0x820 /* Timer subcounter B */
+
+/*
+ * MTU5 contains 3 timer counter registers and is totaly different
+ * from other channels, so we must separate its offset
+ */
+
+/* 8-bit register offset macros of MTU3 channels except MTU5 */
+#define RZG2L_MTU3_TIER		0 /* Timer interrupt register */
+#define RZG2L_MTU3_NFCR		1 /* Noise filter control register */
+#define RZG2L_MTU3_TSR		2 /* Timer status register */
+#define RZG2L_MTU3_TCR		3 /* Timer control register */
+#define RZG2L_MTU3_TCR2		4 /* Timer control register 2 */
+#define RZG2L_MTU3_TMDR1	5 /* Timer mode register 1 */
+#define RZG2L_MTU3_TIOR		6 /* Timer I/O control register */
+#define RZG2L_MTU3_TIORH	6 /* Timer I/O control register H */
+#define RZG2L_MTU3_TIORL	7 /* Timer I/O control register L */
+/* Only MTU3/4/6/7 have TBTM registers */
+#define RZG2L_MTU3_TBTM		8 /* Timer buffer operation transfer mode register */
+
+/* 8-bit MTU5 register offset macros */
+#define RZG2L_MTU3_TSTR		2 /* MTU5 Timer start register */
+#define RZG2L_MTU3_TCNTCMPCLR	3 /* MTU5 Timer compare match clear register */
+#define RZG2L_MTU3_TCRU		4 /* Timer control register U */
+#define RZG2L_MTU3_TCR2U	5 /* Timer control register 2U */
+#define RZG2L_MTU3_TIORU	6 /* Timer I/O control register U */
+#define RZG2L_MTU3_TCRV		7 /* Timer control register V */
+#define RZG2L_MTU3_TCR2V	8 /* Timer control register 2V */
+#define RZG2L_MTU3_TIORV	9 /* Timer I/O control register V */
+#define RZG2L_MTU3_TCRW		10 /* Timer control register W */
+#define RZG2L_MTU3_TCR2W	11 /* Timer control register 2W */
+#define RZG2L_MTU3_TIORW	12 /* Timer I/O control register W */
+
+/* 16-bit register offset macros of MTU3 channels except MTU5 */
+#define RZG2L_MTU3_TCNT		0 /* Timer counter */
+#define RZG2L_MTU3_TGRA		1 /* Timer general register A */
+#define RZG2L_MTU3_TGRB		2 /* Timer general register B */
+#define RZG2L_MTU3_TGRC		3 /* Timer general register C */
+#define RZG2L_MTU3_TGRD		4 /* Timer general register D */
+#define RZG2L_MTU3_TGRE		5 /* Timer general register E */
+#define RZG2L_MTU3_TGRF		6 /* Timer general register F */
+/* Timer A/D converter start request registers */
+#define RZG2L_MTU3_TADCR	7 /* control register */
+#define RZG2L_MTU3_TADCORA	8 /* cycle set register A */
+#define RZG2L_MTU3_TADCORB	9 /* cycle set register B */
+#define RZG2L_MTU3_TADCOBRA	10 /* cycle set buffer register A */
+#define RZG2L_MTU3_TADCOBRB	11 /* cycle set buffer register B */
+
+/* 16-bit MTU5 register offset macros */
+#define RZG2L_MTU3_TCNTU	0 /* MTU5 Timer counter U */
+#define RZG2L_MTU3_TGRU		1 /* MTU5 Timer general register U */
+#define RZG2L_MTU3_TCNTV	2 /* MTU5 Timer counter V */
+#define RZG2L_MTU3_TGRV		3 /* MTU5 Timer general register V */
+#define RZG2L_MTU3_TCNTW	4 /* MTU5 Timer counter W */
+#define RZG2L_MTU3_TGRW		5 /* MTU5 Timer general register W */
+
+/* Macros for setting registers */
+#define RZG2L_MTU3_TCR_CCLR_TGRA	BIT(5)
+
+enum rzg2l_mtu3_channels {
+	RZG2L_MTU0,
+	RZG2L_MTU1,
+	RZG2L_MTU2,
+	RZG2L_MTU3,
+	RZG2L_MTU4,
+	RZG2L_MTU5,
+	RZG2L_MTU6,
+	RZG2L_MTU7,
+	RZG2L_MTU8,
+	RZG2L_MTU_NUM_CHANNELS
+};
+
+enum rzg2l_mtu3_functions {
+	RZG2L_MTU3_NORMAL,
+	RZG2L_MTU3_16BIT_PHASE_COUNTING,
+};
+
+struct rzg2l_mtu3_channel {
+	struct device *dev;
+	unsigned int index;
+	void __iomem *base;
+	enum rzg2l_mtu3_functions function;
+};
+
+struct rzg2l_mtu3 {
+	struct clk *clk;
+	void __iomem *mmio;
+	raw_spinlock_t lock; /* Protect the shared registers */
+	struct rzg2l_mtu3_channel channels[RZG2L_MTU_NUM_CHANNELS];
+};
+
+void rzg2l_mtu3_disable(struct rzg2l_mtu3_channel *ch);
+int rzg2l_mtu3_enable(struct rzg2l_mtu3_channel *ch);
+
+u16 rzg2l_mtu3_shared_reg_read(struct rzg2l_mtu3_channel *ch, u16 off);
+u8 rzg2l_mtu3_8bit_ch_read(struct rzg2l_mtu3_channel *ch, u16 off);
+u16 rzg2l_mtu3_16bit_ch_read(struct rzg2l_mtu3_channel *ch, u16 off);
+
+void rzg2l_mtu3_8bit_ch_write(struct rzg2l_mtu3_channel *ch, u16 off, u8 val);
+void rzg2l_mtu3_16bit_ch_write(struct rzg2l_mtu3_channel *ch, u16 off, u16 val);
+
+#endif /* __LINUX_RZG2L_MTU3_H__ */
-- 
2.25.1

