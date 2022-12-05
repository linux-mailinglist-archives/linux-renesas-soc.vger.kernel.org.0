Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D80642ADB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 16:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbiLEPAO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 10:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbiLEPAN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 10:00:13 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4533DFCE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 07:00:11 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,219,1665414000"; 
   d="scan'208";a="142271719"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Dec 2022 00:00:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.127])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6DDFC4009BCB;
        Tue,  6 Dec 2022 00:00:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] clocksource/drivers/rzv2m-tim: Add Renesas RZ/V2M compare match timer(TIM) driver
Date:   Mon,  5 Dec 2022 14:59:52 +0000
Message-Id: <20221205145955.391526-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205145955.391526-1-biju.das.jz@bp.renesas.com>
References: <20221205145955.391526-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a TIM driver for the Renesas architecture.
The compare match Timer (TIM) Generates an interrupt request
signal every cycle set in the TIM counter.

This driver uses the first probed device as a clocksource
and then any additional devices as clock events.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clocksource/Kconfig     |   7 +
 drivers/clocksource/Makefile    |   1 +
 drivers/clocksource/rzv2m-tim.c | 330 ++++++++++++++++++++++++++++++++
 3 files changed, 338 insertions(+)
 create mode 100644 drivers/clocksource/rzv2m-tim.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 4469e7f555e9..127a65cd44f6 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -532,6 +532,13 @@ config RENESAS_OSTM
 	help
 	  Enables the support for the Renesas OSTM.
 
+config RZV2M_TIM
+	bool "Renesas RZ/V2M Compare-Match Timer driver"
+	depends on ARCH_R9A09G011 || COMPILE_TEST
+	select CLKSRC_MMIO
+	help
+	  Enables the support for the Renesas RZ/V2M Compare-Match Timer (TIM).
+
 config SH_TIMER_TMU
 	bool "Renesas TMU timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 64ab547de97b..c6d33fbeb889 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_CLKSRC_JCORE_PIT)		+= jcore-pit.o
 obj-$(CONFIG_SH_TIMER_CMT)	+= sh_cmt.o
 obj-$(CONFIG_SH_TIMER_MTU2)	+= sh_mtu2.o
 obj-$(CONFIG_RENESAS_OSTM)	+= renesas-ostm.o
+obj-$(CONFIG_RZV2M_TIM)	+= rzv2m-tim.o
 obj-$(CONFIG_SH_TIMER_TMU)	+= sh_tmu.o
 obj-$(CONFIG_EM_TIMER_STI)	+= em_sti.o
 obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
diff --git a/drivers/clocksource/rzv2m-tim.c b/drivers/clocksource/rzv2m-tim.c
new file mode 100644
index 000000000000..15fd3bde63c6
--- /dev/null
+++ b/drivers/clocksource/rzv2m-tim.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2M Compare Match Timer (TIM) driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+/* TIM REGISTERS */
+#define RZV2M_TIM_TMD			0x0
+#define RZV2M_TIM_CMD			0x4
+#define RZV2M_TIM_TMCD			0x8
+#define RZV2M_TIM_INTCLR		0xc
+
+#define RZV2M_TIM_TMCD_CS		GENMASK(6, 4)
+#define RZV2M_TIM_TMCD_INTMODE		BIT(2)
+#define RZV2M_TIM_TMCD_CE		BIT(1)
+#define RZV2M_TIM_TMCD_CAE		BIT(0)
+
+#define RZV2M_TIM_INTCLR_INTCLR		BIT(0)
+
+#define RZV2M_TIM_TMCD_CH_EN	(RZV2M_TIM_TMCD_CE | RZV2M_TIM_TMCD_CAE)
+#define RZV2M_TIM_TMCD_START	(RZV2M_TIM_TMCD_CH_EN | RZV2M_TIM_TMCD_INTMODE)
+
+#define F2CYCLE_NSEC(f)		(1000000000 / (f))
+
+struct rzv2m_tim_channel {
+	struct device *dev;
+	void __iomem *base;
+	struct reset_control *rstc;
+	struct clock_event_device ced;
+	struct clocksource cs;
+	unsigned long period;
+	unsigned long delay;
+};
+
+static atomic_t clock_src_cnt = ATOMIC_INIT(-1);
+
+static inline struct
+rzv2m_tim_channel *ced_to_rzv2m_tim_channel(struct clock_event_device *ced)
+{
+	return container_of(ced, struct rzv2m_tim_channel, ced);
+}
+
+static inline struct
+rzv2m_tim_channel *cs_to_rzv2m_tim_channel(struct clocksource *cs)
+{
+	return container_of(cs, struct rzv2m_tim_channel, cs);
+}
+
+static void rzv2m_tim_wait_delay(struct rzv2m_tim_channel *ch)
+{
+	/* delay required when changing the register settings */
+	ndelay(ch->delay);
+}
+
+static void rzv2m_tim_timer_stop(struct rzv2m_tim_channel *ch)
+{
+	unsigned long tmcd;
+
+	tmcd = readl(ch->base + RZV2M_TIM_TMCD);
+	if (FIELD_GET(RZV2M_TIM_TMCD_CH_EN, tmcd)) {
+		writel(FIELD_GET(RZV2M_TIM_TMCD_CS, tmcd),
+		       ch->base + RZV2M_TIM_TMCD);
+		rzv2m_tim_wait_delay(ch);
+	}
+}
+
+static void rzv2m_tim_timer_start(struct rzv2m_tim_channel *ch)
+{
+	unsigned long tmcd;
+
+	tmcd = readl(ch->base + RZV2M_TIM_TMCD);
+	writel(tmcd | RZV2M_TIM_TMCD_START, ch->base + RZV2M_TIM_TMCD);
+	rzv2m_tim_wait_delay(ch);
+}
+
+static u64 rzv2m_tim_read_clock_source(struct clocksource *cs)
+{
+	struct rzv2m_tim_channel *ch = cs_to_rzv2m_tim_channel(cs);
+
+	return readl(ch->base + RZV2M_TIM_TMD);
+}
+
+static int rzv2m_tim_clock_event_next(unsigned long delta,
+				      struct clock_event_device *ced)
+{
+	struct rzv2m_tim_channel *ch = ced_to_rzv2m_tim_channel(ced);
+
+	rzv2m_tim_timer_stop(ch);
+	writel(delta, ch->base + RZV2M_TIM_CMD);
+	rzv2m_tim_timer_start(ch);
+
+	return 0;
+}
+
+static int rzv2m_tim_shutdown(struct clock_event_device *ced)
+{
+	struct rzv2m_tim_channel *ch = ced_to_rzv2m_tim_channel(ced);
+
+	rzv2m_tim_timer_stop(ch);
+
+	return 0;
+}
+
+static int rzv2m_tim_set_periodic(struct clock_event_device *ced)
+{
+	struct rzv2m_tim_channel *ch = ced_to_rzv2m_tim_channel(ced);
+
+	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
+		rzv2m_tim_timer_stop(ch);
+
+	writel(ch->period, ch->base + RZV2M_TIM_CMD);
+	rzv2m_tim_timer_start(ch);
+
+	return 0;
+}
+
+static int rzv2m_tim_set_oneshot(struct clock_event_device *ced)
+{
+	rzv2m_tim_timer_stop(ced_to_rzv2m_tim_channel(ced));
+
+	return 0;
+}
+
+static irqreturn_t rzv2m_tim_timer_interrupt(int irq, void *dev_id)
+{
+	struct rzv2m_tim_channel *ch = dev_id;
+	struct clock_event_device *ced = &ch->ced;
+
+	if (clockevent_state_oneshot(ced))
+		rzv2m_tim_timer_stop(ch);
+
+	writel(RZV2M_TIM_INTCLR_INTCLR, ch->base + RZV2M_TIM_INTCLR);
+
+	/* notify clockevent layer */
+	if (ced->event_handler)
+		ced->event_handler(ced);
+
+	return IRQ_HANDLED;
+}
+
+static int rzv2m_tim_clocksource_enable(struct clocksource *cs)
+{
+	struct rzv2m_tim_channel *ch = cs_to_rzv2m_tim_channel(cs);
+
+	pm_runtime_get_sync(ch->dev);
+	rzv2m_tim_timer_start(ch);
+
+	return 0;
+}
+
+static void rzv2m_tim_clocksource_disable(struct clocksource *cs)
+{
+	struct rzv2m_tim_channel *ch = cs_to_rzv2m_tim_channel(cs);
+
+	rzv2m_tim_timer_stop(ch);
+	pm_runtime_put(ch->dev);
+}
+
+static int rzv2m_tim_init_clksrc(struct rzv2m_tim_channel *ch, unsigned long rate)
+{
+	struct clocksource *cs = &ch->cs;
+
+	rzv2m_tim_timer_stop(ch);
+
+	writel(U32_MAX, ch->base + RZV2M_TIM_CMD);
+	writel(FIELD_PREP(RZV2M_TIM_TMCD_CS, 0) | RZV2M_TIM_TMCD_START,
+	       ch->base  + RZV2M_TIM_TMCD);
+
+	cs->name = dev_name(ch->dev);
+	cs->rating = 300;
+	cs->read = rzv2m_tim_read_clock_source;
+	cs->enable = rzv2m_tim_clocksource_enable;
+	cs->disable = rzv2m_tim_clocksource_disable;
+	cs->mask = CLOCKSOURCE_MASK(32);
+	cs->flags = CLOCK_SOURCE_IS_CONTINUOUS;
+
+	return clocksource_register_hz(cs, rate);
+}
+
+static void rzv2m_tim_init_clkevt(struct rzv2m_tim_channel *ch,
+				  unsigned long rate)
+{
+	struct clock_event_device *ced = &ch->ced;
+
+	pm_runtime_get_sync(ch->dev);
+
+	ced->name = dev_name(ch->dev);
+	ced->features = CLOCK_EVT_FEAT_ONESHOT;
+	ced->set_state_shutdown = rzv2m_tim_shutdown;
+	ced->set_state_periodic = rzv2m_tim_set_periodic;
+	ced->set_state_oneshot = rzv2m_tim_set_oneshot;
+	ced->set_next_event = rzv2m_tim_clock_event_next;
+	ced->shift = 32;
+	ced->rating = 125;
+	ced->cpumask = cpu_possible_mask;
+	clockevents_config_and_register(ced, rate, 0xf,
+					0xffffffff);
+}
+
+static int rzv2m_tim_probe(struct platform_device *pdev)
+{
+	struct rzv2m_tim_channel *rzv2m_tim;
+	unsigned long apb_rate, rate;
+	struct clk *clk;
+	int irq;
+	int ret;
+
+	rzv2m_tim = devm_kzalloc(&pdev->dev, sizeof(*rzv2m_tim), GFP_KERNEL);
+	if (!rzv2m_tim)
+		return -ENOMEM;
+
+	rzv2m_tim->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rzv2m_tim->base))
+		return PTR_ERR(rzv2m_tim->base);
+
+	rzv2m_tim->rstc = devm_reset_control_get_optional_shared(&pdev->dev,
+								 NULL);
+	if (IS_ERR(rzv2m_tim->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rzv2m_tim->rstc),
+				     "get reset failed\n");
+
+	rzv2m_tim->dev = &pdev->dev;
+	clk = clk_get(&pdev->dev, "tim");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "cannot get tim clock\n");
+	rate = clk_get_rate(clk);
+	clk_put(clk);
+	if (!rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "tim clk rate is 0");
+
+	clk = clk_get(&pdev->dev, "apb");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "cannot get apb clock\n");
+	apb_rate = clk_get_rate(clk);
+	clk_put(clk);
+	if (!apb_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "apb clk rate is 0");
+
+	/* delay = 5 * PCLK + 5 * INCLK */
+	rzv2m_tim->delay = F2CYCLE_NSEC(apb_rate) * 5 + F2CYCLE_NSEC(rate) * 5;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_disable(&pdev->dev);
+		return dev_err_probe(&pdev->dev, ret,
+				     "pm_runtime_resume_and_get failed");
+	}
+
+	reset_control_deassert(rzv2m_tim->rstc);
+	platform_set_drvdata(pdev, rzv2m_tim);
+
+	/*
+	 * First probed device will be used as system clocksource. Any
+	 * additional devices will be used as clock events.
+	 */
+	if (atomic_inc_and_test(&clock_src_cnt)) {
+		ret = rzv2m_tim_init_clksrc(rzv2m_tim, rate);
+		if (ret)
+			goto err_cleanup;
+
+		dev_info(&pdev->dev, "%pOF: used for clocksource\n",
+			 rzv2m_tim->dev->of_node);
+	} else {
+		rzv2m_tim->period = DIV_ROUND_CLOSEST(rate, HZ);
+		/* clock sources don't use interrupts, clock events do */
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0) {
+			ret = irq;
+			goto err_cleanup;
+		}
+
+		ret = devm_request_irq(&pdev->dev, irq,
+				       rzv2m_tim_timer_interrupt,
+				       IRQF_TIMER | IRQF_NOBALANCING,
+				       dev_name(&pdev->dev), rzv2m_tim);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret,
+				      "failed to request irq%d\n", irq);
+			goto err_cleanup;
+		}
+
+		rzv2m_tim_init_clkevt(rzv2m_tim, rate);
+
+		dev_info(&pdev->dev, "%pOF: used for clock events\n",
+			 rzv2m_tim->dev->of_node);
+	}
+
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_irq_safe(&pdev->dev);
+
+	return 0;
+
+err_cleanup:
+	reset_control_assert(rzv2m_tim->rstc);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static const struct of_device_id rzv2m_tim_of_table[] = {
+	{ .compatible = "renesas,rzv2m-tim", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzv2m_tim_of_table);
+
+static struct platform_driver rzv2m_tim_device_driver = {
+	.driver = {
+		.name = "rzv2m_tim",
+		.of_match_table = of_match_ptr(rzv2m_tim_of_table),
+	},
+	.probe = rzv2m_tim_probe,
+};
+module_platform_driver(rzv2m_tim_device_driver);
+
+MODULE_DESCRIPTION("Renesas RZ/V2M Compare Match Timer Driver");
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

