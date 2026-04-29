Return-Path: <linux-renesas-soc+bounces-31753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKeDBAPx8WkOlwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:52:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308B493BEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF209308CAF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 11:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD2B3F23CA;
	Wed, 29 Apr 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sZmb7nN6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EBE3F2117;
	Wed, 29 Apr 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463470; cv=none; b=BsLjqoqNPOJk+Gds4KIQHDNc8etQC9s4EVdukL/GmmJQT/336jqNnOyrVzw7be1KFt8bibkt0uzEgNzo5tou3Ax1CxP1zGxUpuuOAmKPJZe4Nx+6ox/CwL6LWv+HwovbHlqJnby7dVD2njdzcofOv8RWo7VKM2UGCnlnL/Q9UVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463470; c=relaxed/simple;
	bh=8vbtotmnLl+jf5j6AqmH9R3IX/J1gu4+SOOLKAXG+Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z351cNbq2yYYGiDtD/2RDiPfvE3BIn5rzbdZkIwWdKeY1LTgA5XP20QBTolWu75Ve0sBjAvpGqjvJR89AHxUZTxV6y41bg+PpPcvpzzNeqTTlr4C7J+3MTFQ1cdcmXh/mGZ5g7hEGGv4ZLQrUDa9A94OtxY6UhBOIyu/kOCyso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sZmb7nN6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38B5FC5EF22;
	Wed, 29 Apr 2026 11:51:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22655601DF;
	Wed, 29 Apr 2026 11:51:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8E4C10728DDC;
	Wed, 29 Apr 2026 13:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463466; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QBLyVbc6XfhGx6fDWTmeL0AR9E9NNbe5OatPXW5jehI=;
	b=sZmb7nN6CgNb1teEIfkJ/dxPYAf15uyNsQcgwYP68RRyZ9MiRYTFEbN4cSYVafoxV1uUcz
	C/HyMG2aPWcR5cpDR8W/hTLk+injrc5072SKmm7UjsnW+1VCdqnrrbd9yXBNaeSd1heLET
	fSuqHdPxdJKaD/1XF/MICzZUlMPFzgd/ic5Mtto6mtaG2rKyaC6xnr7knpgK5w+5Rus8O8
	c53Ws5ymqvAhYnqAfilOv5jQ9Jzlwk5pXmrCAHwkm5qCJaOA1HIzZT/YQUqLmryseVljCX
	pcgIM82Q60VZkOPqeDYoEVHtW3M886jYkZ8iZG3I0vqrt40vs3T46zBya7dAGA==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 2/4] clocksource/drivers: Add support for the Renesas RZ/N1 timers
Date: Wed, 29 Apr 2026 13:50:21 +0200
Message-ID: <20260429115054.158160-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429115054.158160-1-herve.codina@bootlin.com>
References: <20260429115054.158160-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8308B493BEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31753-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,bootlin.com,kernel.org,glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family.

This controller handles 8 timers:
  - 6 16-bit timers
  - 2 32-bit timers

Each timer has its own interrupt, its own prescaler that can be used to
device the clock by 25 and all of them can work in either one-shot or
periodic mode.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 drivers/clocksource/Kconfig      |  10 +
 drivers/clocksource/Makefile     |   1 +
 drivers/clocksource/timer-rzn1.c | 442 +++++++++++++++++++++++++++++++
 3 files changed, 453 insertions(+)
 create mode 100644 drivers/clocksource/timer-rzn1.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index d1a33a231a44..f8e49a4ac8f6 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -152,6 +152,16 @@ config REALTEK_OTTO_TIMER
 	  RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x series
 	  such as RTL9301, RTL9302 or RTL9303.
 
+config RZN1_TIMER
+	bool "Renesas RZ/N1 Timer"
+	depends on HAS_IOMEM && COMMON_CLK && (ARCH_RZN1 || COMPILE_TEST)
+	help
+	  Enables support for RZ/N1 SoC timers.
+	  A timers block in RZ/N1 SoCs is composed of 8 timers
+	    - 6 16-bit timers
+	    - 2 32-bit timers
+	  Two timers blocks are available in RZ/N1 SoCs.
+
 config SUN4I_TIMER
 	bool "Sun4i timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index b46376af6b49..464ec6690ab6 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -96,3 +96,4 @@ obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+= timer-ralink.o
 obj-$(CONFIG_NXP_STM_TIMER)		+= timer-nxp-stm.o
 obj-$(CONFIG_RTK_SYSTIMER)		+= timer-realtek.o
+obj-$(CONFIG_RZN1_TIMER)		+= timer-rzn1.o
diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer-rzn1.c
new file mode 100644
index 000000000000..1b95b0b5cd3b
--- /dev/null
+++ b/drivers/clocksource/timer-rzn1.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/N1 timers driver
+ *
+ * Copyright (C) 2026 Schneider-Electric
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sched_clock.h>
+
+/* Per-timer register offsets */
+#define RZN1_TIMER_LOAD_COUNT_REG	0x00
+#define RZN1_TIMER_CURRENT_COUNT_REG	0x04
+#define RZN1_TIMER_CONTROL_REG		0x08
+#define   RZN1_TIMER_CONTROL_INT_UNMASK		BIT(3)
+#define   RZN1_TIMER_CONTROL_ENABLE		BIT(2)
+#define   RZN1_TIMER_CONTROL_AUTORELOAD		BIT(1)
+#define   RZN1_TIMER_CONTROL_PRESCALER_DIV25	BIT(0)
+#define RZN1_TIMER_CLEAR_INT_REG	0x0c
+#define RZN1_TIMER_STATUS_INT0_REG	0x10
+#define RZN1_TIMER_STATUS_INT1_REG	0x14
+
+/*
+ * 8 timers are available. Among those 8 timers, the first 6 timers are 16-bit
+ * timers and the last two ones are 32-bit timers.
+ */
+#define RZN1_TIMER_BASE_INDEX_16BIT_TIMERS 0
+#define RZN1_TIMER_NB_16BIT_TIMERS 6
+
+#define RZN1_TIMER_BASE_INDEX_32BIT_TIMER 6
+#define RZN1_TIMER_NB_32BIT_TIMERS 2
+
+#define RZN1_TIMER_IS_16BIT_TIMER(_i) ((_i) < RZN1_TIMER_BASE_INDEX_32BIT_TIMER)
+
+/* Total numbers of timers */
+#define RZN1_TIMER_NB_TIMERS	(RZN1_TIMER_NB_16BIT_TIMERS + \
+				 RZN1_TIMER_NB_32BIT_TIMERS)
+
+/* Offset of registers related to the timer number _i in the timers regs area */
+#define RZN1_TIMER_REGS_OFFSET(_i) (0x20 * (_i))
+
+struct rzn1_timer {
+	void __iomem *base;
+	unsigned int width;
+	unsigned long rate;
+	unsigned long hz_period;
+	struct clock_event_device ced;
+};
+
+static int rzn1_timer_config(struct rzn1_timer *timer, u32 period, bool is_periodic)
+{
+	u32 ctrl;
+
+	ctrl = readl(timer->base + RZN1_TIMER_CONTROL_REG);
+
+	/* Disable the timer */
+	writel(ctrl & ~RZN1_TIMER_CONTROL_ENABLE,
+	       timer->base + RZN1_TIMER_CONTROL_REG);
+
+	/* Set the new period */
+	writel(period, timer->base + RZN1_TIMER_LOAD_COUNT_REG);
+
+	/* Prepare the timer mode */
+	if (is_periodic)
+		ctrl |= RZN1_TIMER_CONTROL_AUTORELOAD;
+	else
+		ctrl &= ~RZN1_TIMER_CONTROL_AUTORELOAD;
+
+	/*
+	 * Enable the timer.
+	 *
+	 * This automatically resets the CURRENT_COUNT register.
+	 */
+	ctrl |= RZN1_TIMER_CONTROL_ENABLE;
+	writel(ctrl, timer->base + RZN1_TIMER_CONTROL_REG);
+
+	return 0;
+}
+
+static void rzn1_timer_disable(struct rzn1_timer *timer)
+{
+	u32 ctrl;
+
+	ctrl = readl(timer->base + RZN1_TIMER_CONTROL_REG);
+	ctrl &= ~RZN1_TIMER_CONTROL_ENABLE;
+	writel(ctrl, timer->base + RZN1_TIMER_CONTROL_REG);
+}
+
+static void rzn1_timer_int_enable(struct rzn1_timer *timer)
+{
+	u32 ctrl;
+
+	ctrl = readl(timer->base + RZN1_TIMER_CONTROL_REG);
+	ctrl |= RZN1_TIMER_CONTROL_INT_UNMASK;
+	writel(ctrl, timer->base + RZN1_TIMER_CONTROL_REG);
+}
+
+static irqreturn_t rzn1_timer_interrupt(int irq, void *dev_id)
+{
+	struct rzn1_timer *timer = dev_id;
+
+	/* Ack the interrupt */
+	readl(timer->base + RZN1_TIMER_CLEAR_INT_REG);
+
+	timer->ced.event_handler(&timer->ced);
+	return IRQ_HANDLED;
+}
+
+static int rzn1_clkevt_set_next_event(unsigned long cycles,
+				      struct clock_event_device *evt)
+{
+	struct rzn1_timer *timer = container_of(evt, struct rzn1_timer, ced);
+
+	return rzn1_timer_config(timer, cycles, false);
+}
+
+static int rzn1_clkevt_shutdown(struct clock_event_device *evt)
+{
+	struct rzn1_timer *timer = container_of(evt, struct rzn1_timer, ced);
+
+	rzn1_timer_disable(timer);
+	return 0;
+}
+
+static int rzn1_clkevt_set_periodic(struct clock_event_device *evt)
+{
+	struct rzn1_timer *timer = container_of(evt, struct rzn1_timer, ced);
+
+	rzn1_timer_config(timer, timer->hz_period, true);
+	return 0;
+}
+
+/*
+ * This global lock is used to prevent race conditions during global timers
+ * test and set operation in case the driver is using the async probe option.
+ */
+static DEFINE_MUTEX(rzn1_global_timers_lock);
+
+static int rzn1_timer_instance;
+
+/* scheduler and clocksource */
+static struct rzn1_timer *rzn1_sched_clock;
+
+static u64 notrace rzn1_sched_read(void)
+{
+	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_REG);
+}
+
+static u64 rzn1_clksrc_read(struct clocksource *cs)
+{
+	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_REG);
+}
+
+static struct clocksource rzn1_clocksource = {
+	.name = "rzn1_timer_clocksource",
+	.rating = 200,
+	.flags = CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
+	.read = rzn1_clksrc_read,
+};
+
+/* Timers table where 32-bit timers will be assigned per-cpu */
+static struct rzn1_timer *rzn1_tab_timers;
+
+static int rzn1_local_timer_starting_cpu(unsigned int cpu)
+{
+	struct rzn1_timer *timer;
+
+	if (cpu > RZN1_TIMER_NB_32BIT_TIMERS)
+		return -EINVAL;
+
+	timer = &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_32BIT_TIMER];
+
+	timer->ced.cpumask = cpumask_of(cpu);
+	irq_force_affinity(timer->ced.irq, cpumask_of(cpu));
+	clockevents_config_and_register(&timer->ced, timer->rate, 1,
+					GENMASK(timer->width - 1, 0));
+
+	return 0;
+}
+
+static void rzn1_timer_init(struct rzn1_timer *timer, unsigned int index,
+			    void __iomem *timers_base, unsigned long clock_rate)
+{
+	timer->base = timers_base + RZN1_TIMER_REGS_OFFSET(index);
+
+	/* Disable the timer */
+	writel(0, timer->base + RZN1_TIMER_CONTROL_REG);
+
+	/* Clear potential interrupts */
+	readl(timer->base + RZN1_TIMER_CLEAR_INT_REG);
+
+	if (RZN1_TIMER_IS_16BIT_TIMER(index)) {
+		timer->width = 16;
+		/*
+		 * Enable pre-scaler for 16-bit timers.
+		 *
+		 * Timers are fed by a 25MHz clock. With this pre-scaler (1/25)
+		 * enabled, the 16-bit timers resolution is 1 microsecond.
+		 */
+		writel(RZN1_TIMER_CONTROL_PRESCALER_DIV25,
+		       timer->base + RZN1_TIMER_CONTROL_REG);
+		timer->rate = clock_rate / 25;
+	} else {
+		timer->width = 32;
+		timer->rate = clock_rate;
+	}
+	timer->hz_period = DIV_ROUND_UP(timer->rate, HZ);
+}
+
+static void rzn1_timer_clkevt_init_ced(struct rzn1_timer *timer, const char *name,
+				       int irq)
+{
+	timer->ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	timer->ced.set_next_event = rzn1_clkevt_set_next_event;
+	timer->ced.set_state_shutdown = rzn1_clkevt_shutdown;
+	timer->ced.set_state_periodic = rzn1_clkevt_set_periodic;
+	timer->ced.cpumask = cpu_possible_mask;
+
+	/*
+	 * 32-bit timers are fed with a 25 MHz clock directly derived from the
+	 * main PLL (1 GHz). The arch timer, ARMv7 CP15 in RZ/N1 SoCs, is fed
+	 * with to a 6.25 MHz clock.
+	 *
+	 * The clock of the RZ/N1 timers block is a stable one and the RZ/N1
+	 * timers have a higher resolution than the ARM CP15 one.
+	 *
+	 * Also those 32-bit RZ/N1 timers are assigned per-cpu.
+	 *
+	 * Use a high rating for the 32-bit RZ/N1 timers in order to have them
+	 * chosen by the system.
+	 */
+	timer->ced.rating = timer->width == 16 ? 200 : 460;
+	timer->ced.owner = THIS_MODULE;
+	timer->ced.name = name;
+	timer->ced.irq = irq;
+}
+
+static int rzn1_timer_probe_first(struct platform_device *pdev, struct rzn1_timer *tab_timers,
+				  void __iomem *base, unsigned long clock_rate)
+{
+	struct device *dev = &pdev->dev;
+	struct rzn1_timer *timer;
+	unsigned int i;
+	char *name;
+	int irq;
+	int ret;
+
+	/*
+	 * Probe the first instance. In that case, timers are assigned as
+	 * follow:
+	 *   - First 16-bit timer: clocksource and sched_clock
+	 *   - Other 16-bit timers: clock events for all possible CPUs
+	 *   - 32-bit timers: clock events per CPU
+	 *
+	 * First step, perform all operation that could fail without calling
+	 * clockevents_config_and_register(), sched_clock_register() nor
+	 * cpuhp_setup_state(). Those operation don't have unregister nor
+	 * teardown counterparts and so, once called, we cannot remove the
+	 * related resource.
+	 */
+
+	/*
+	 * First step for 16-bit timers except the first one and all 32-bit
+	 * timers.
+	 */
+	for (i = RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 1; i < RZN1_TIMER_NB_TIMERS; i++) {
+		timer = &tab_timers[i];
+
+		rzn1_timer_init(timer, i, base, clock_rate);
+
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_name(dev), i);
+		if (!name)
+			return -ENOMEM;
+
+		rzn1_timer_clkevt_init_ced(timer, name, irq);
+
+		ret = devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
+				       IRQF_TIMER, timer->ced.name, timer);
+		if (ret < 0)
+			return dev_err_probe(dev, irq, "timer%d: Failed to request IRQ\n", i);
+
+		rzn1_timer_int_enable(timer);
+	}
+
+	/*
+	 * Second step, almost all operations that can fail have been called.
+	 * Timers are ready to work. Start with the last operation that can fail,
+	 * installing and invoking hotplug callbacks
+	 */
+	rzn1_tab_timers = tab_timers;
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"clockevents/rzn1/global_timer:starting",
+				rzn1_local_timer_starting_cpu, NULL);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Setup CPU hotplug state failed\n");
+
+	/*
+	 * At this point, no more operations can fail. Perform remaining
+	 * operations. Starting by handling the first 16-bit timer
+	 */
+	timer = &tab_timers[RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];
+
+	rzn1_timer_init(timer, RZN1_TIMER_BASE_INDEX_16BIT_TIMERS, base, clock_rate);
+	rzn1_timer_config(timer, GENMASK(timer->width - 1, 0), true);
+
+	rzn1_sched_clock = timer;
+
+	sched_clock_register(rzn1_sched_read, rzn1_sched_clock->width, rzn1_sched_clock->rate);
+
+	rzn1_clocksource.mask = CLOCKSOURCE_MASK(rzn1_sched_clock->width);
+	clocksource_register_hz(&rzn1_clocksource, rzn1_sched_clock->rate);
+
+	/*
+	 * Register clockevents only for 16-bit timers. 32-bit timers clockevents
+	 * are registered by CPU hotplug startup function set previously by the
+	 * cpuhp_setup_state() call.
+	 */
+	for (i = RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 1; i < RZN1_TIMER_NB_16BIT_TIMERS; i++) {
+		timer = &tab_timers[i];
+		clockevents_config_and_register(&timer->ced, timer->rate,
+						1, GENMASK(timer->width - 1, 0));
+	}
+
+	return 0;
+}
+
+static int rzn1_timer_probe_other(struct platform_device *pdev, struct rzn1_timer *tab_timers,
+				  void __iomem *base, unsigned long clock_rate)
+{
+	struct device *dev = &pdev->dev;
+	struct rzn1_timer *timer;
+	unsigned int i;
+	char *name;
+	int irq;
+	int ret;
+
+	/*
+	 * Probe other instance(s), i.e. not the first one. In that case,
+	 * all timers are used as clock events and available for all possible
+	 * CPUs
+	 *
+	 * First step, perform all operation that could fail without calling
+	 * clockevents_config_and_register(). Unregister counterpart does not
+	 * exist and so, once called, we cannot remove the related resource.
+	 */
+	for (i = 0; i < RZN1_TIMER_NB_TIMERS; i++) {
+		timer = &tab_timers[i];
+
+		rzn1_timer_init(timer, i, base, clock_rate);
+
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_name(dev), i);
+		if (!name)
+			return -ENOMEM;
+
+		rzn1_timer_clkevt_init_ced(timer, name, irq);
+
+		ret = devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
+				       IRQF_TIMER, timer->ced.name, timer);
+		if (ret < 0)
+			return dev_err_probe(dev, irq, "timer%d: Failed to request IRQ\n", i);
+
+		rzn1_timer_int_enable(timer);
+	}
+
+	/*
+	 * Second step, all operation that can fail have been called. We can
+	 * register our timers
+	 */
+
+	for (i = 0; i < RZN1_TIMER_NB_TIMERS; i++) {
+		timer = &tab_timers[i];
+		clockevents_config_and_register(&timer->ced, timer->rate,
+						1, GENMASK(timer->width - 1, 0));
+	}
+
+	return 0;
+}
+
+static int rzn1_timer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzn1_timer *tab_timers;
+	unsigned long clock_rate;
+	void __iomem *base;
+	struct clk *clk;
+	int ret;
+
+	tab_timers = devm_kcalloc(dev, RZN1_TIMER_NB_TIMERS, sizeof(*tab_timers),
+				  GFP_KERNEL);
+	if (!tab_timers)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get pclk\n");
+
+	clock_rate = clk_get_rate(clk);
+
+	scoped_guard(mutex, &rzn1_global_timers_lock) {
+		ret = !rzn1_timer_instance ?
+			rzn1_timer_probe_first(pdev, tab_timers, base, clock_rate) :
+			rzn1_timer_probe_other(pdev, tab_timers, base, clock_rate);
+		if (!ret)
+			rzn1_timer_instance++;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id rzn1_timer_of_match[] = {
+	{ .compatible = "renesas,rzn1-timer", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rzn1_timer_driver = {
+	.driver = {
+		.name = "rzn1_timer",
+		.of_match_table = rzn1_timer_of_match,
+	},
+};
+builtin_platform_driver_probe(rzn1_timer_driver, rzn1_timer_probe);
-- 
2.53.0


