Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEE92E3242
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 18:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgL0RnB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 12:43:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:46782 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbgL0Rm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=D6gGMa1dkQLdi2
        nkNosIIXESgizvwXMVQk7mJTmNW8Y=; b=T/CNkOmP99inviPnh7TA78OuCUgvtT
        GcY7x5Oo6hez/IaJcLy09yoLfPZ02okWm4bwXYQ4l5fzwIvkOD1mc6cgMFUkbgqt
        gsl1cq2xHizT9rCD/qJAEUXW8Zv5+VvqFzGShiSQ1WdPRZVld+s00/uUI459JjQ3
        0gPDpBl73OscY=
Received: (qmail 1557080 invoked from network); 27 Dec 2020 18:42:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 18:42:13 +0100
X-UD-Smtp-Session: l3s3148p1@Tcd3rXW3VJ5UhsuJ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/6] clk: renesas: rcar-gen3: factor out CPG library
Date:   Sun, 27 Dec 2020 18:41:57 +0100
Message-Id: <20201227174202.40834-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car V3U has a CPG different enough to not be a generic Gen3 CPG but
similar enough to reuse code. Introduce a new CPG library, factor out
the SD clock handling and hook it to the generic Gen3 CPG driver so we
have an equal state. V3U will make use of it in the next patch then.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/Kconfig         |   4 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/rcar-cpg-lib.c  | 270 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.h  |  33 ++++
 drivers/clk/renesas/rcar-gen3-cpg.c | 252 +-------------------------
 5 files changed, 309 insertions(+), 251 deletions(-)
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.c
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 18915d668a30..7e788fee6b9f 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -162,12 +162,16 @@ config CLK_SH73A0
 
 
 # Family
+config CLK_RCAR_CPG_LIB
+	bool "CPG/MSSR library functions" if COMPILE_TEST
+
 config CLK_RCAR_GEN2_CPG
 	bool "R-Car Gen2 CPG clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_RCAR_GEN3_CPG
 	bool "R-Car Gen3 and RZ/G2 CPG clock support" if COMPILE_TEST
+	select CLK_RCAR_CPG_LIB
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_RCAR_USB2_CLOCK_SEL
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index c803912ef2ce..ef0d2bba92bf 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
+obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+= rcar-cpg-lib.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
new file mode 100644
index 000000000000..7e7e5d1341d5
--- /dev/null
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car Gen3 Clock Pulse Generator Library
+ *
+ * Copyright (C) 2015-2018 Glider bvba
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ *
+ * Based on clk-rcar-gen3.c
+ *
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#include "rcar-cpg-lib.h"
+
+spinlock_t cpg_lock;
+
+void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&cpg_lock, flags);
+	val = readl(reg);
+	val &= ~clear;
+	val |= set;
+	writel(val, reg);
+	spin_unlock_irqrestore(&cpg_lock, flags);
+};
+
+static int cpg_simple_notifier_call(struct notifier_block *nb,
+				    unsigned long action, void *data)
+{
+	struct cpg_simple_notifier *csn =
+		container_of(nb, struct cpg_simple_notifier, nb);
+
+	switch (action) {
+	case PM_EVENT_SUSPEND:
+		csn->saved = readl(csn->reg);
+		return NOTIFY_OK;
+
+	case PM_EVENT_RESUME:
+		writel(csn->saved, csn->reg);
+		return NOTIFY_OK;
+	}
+	return NOTIFY_DONE;
+}
+
+void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
+				  struct cpg_simple_notifier *csn)
+{
+	csn->nb.notifier_call = cpg_simple_notifier_call;
+	raw_notifier_chain_register(notifiers, &csn->nb);
+}
+
+/*
+ * SDn Clock
+ */
+#define CPG_SD_STP_HCK		BIT(9)
+#define CPG_SD_STP_CK		BIT(8)
+
+#define CPG_SD_STP_MASK		(CPG_SD_STP_HCK | CPG_SD_STP_CK)
+#define CPG_SD_FC_MASK		(0x7 << 2 | 0x3 << 0)
+
+#define CPG_SD_DIV_TABLE_DATA(stp_hck, sd_srcfc, sd_fc, sd_div) \
+{ \
+	.val = ((stp_hck) ? CPG_SD_STP_HCK : 0) | \
+	       ((sd_srcfc) << 2) | \
+	       ((sd_fc) << 0), \
+	.div = (sd_div), \
+}
+
+struct sd_div_table {
+	u32 val;
+	unsigned int div;
+};
+
+struct sd_clock {
+	struct clk_hw hw;
+	const struct sd_div_table *div_table;
+	struct cpg_simple_notifier csn;
+	unsigned int div_num;
+	unsigned int cur_div_idx;
+};
+
+/* SDn divider
+ *           sd_srcfc   sd_fc   div
+ * stp_hck   (div)      (div)     = sd_srcfc x sd_fc
+ *---------------------------------------------------------
+ *  0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
+ *  0         1 (2)      1 (4)      8 : SDR50
+ *  1         2 (4)      1 (4)     16 : HS / SDR25
+ *  1         3 (8)      1 (4)     32 : NS / SDR12
+ *  1         4 (16)     1 (4)     64
+ *  0         0 (1)      0 (2)      2
+ *  0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
+ *  1         2 (4)      0 (2)      8
+ *  1         3 (8)      0 (2)     16
+ *  1         4 (16)     0 (2)     32
+ *
+ *  NOTE: There is a quirk option to ignore the first row of the dividers
+ *  table when searching for suitable settings. This is because HS400 on
+ *  early ES versions of H3 and M3-W requires a specific setting to work.
+ */
+static const struct sd_div_table cpg_sd_div_table[] = {
+/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  sd_srcfc,   sd_fc,  sd_div) */
+	CPG_SD_DIV_TABLE_DATA(0,        0,          1,        4),
+	CPG_SD_DIV_TABLE_DATA(0,        1,          1,        8),
+	CPG_SD_DIV_TABLE_DATA(1,        2,          1,       16),
+	CPG_SD_DIV_TABLE_DATA(1,        3,          1,       32),
+	CPG_SD_DIV_TABLE_DATA(1,        4,          1,       64),
+	CPG_SD_DIV_TABLE_DATA(0,        0,          0,        2),
+	CPG_SD_DIV_TABLE_DATA(0,        1,          0,        4),
+	CPG_SD_DIV_TABLE_DATA(1,        2,          0,        8),
+	CPG_SD_DIV_TABLE_DATA(1,        3,          0,       16),
+	CPG_SD_DIV_TABLE_DATA(1,        4,          0,       32),
+};
+
+#define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
+
+static int cpg_sd_clock_enable(struct clk_hw *hw)
+{
+	struct sd_clock *clock = to_sd_clock(hw);
+
+	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK,
+		       clock->div_table[clock->cur_div_idx].val &
+		       CPG_SD_STP_MASK);
+
+	return 0;
+}
+
+static void cpg_sd_clock_disable(struct clk_hw *hw)
+{
+	struct sd_clock *clock = to_sd_clock(hw);
+
+	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
+}
+
+static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
+{
+	struct sd_clock *clock = to_sd_clock(hw);
+
+	return !(readl(clock->csn.reg) & CPG_SD_STP_MASK);
+}
+
+static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct sd_clock *clock = to_sd_clock(hw);
+
+	return DIV_ROUND_CLOSEST(parent_rate,
+				 clock->div_table[clock->cur_div_idx].div);
+}
+
+static int cpg_sd_clock_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
+	struct sd_clock *clock = to_sd_clock(hw);
+	unsigned long calc_rate, diff;
+	unsigned int i;
+
+	for (i = 0; i < clock->div_num; i++) {
+		calc_rate = DIV_ROUND_CLOSEST(req->best_parent_rate,
+					      clock->div_table[i].div);
+		if (calc_rate < req->min_rate || calc_rate > req->max_rate)
+			continue;
+
+		diff = calc_rate > req->rate ? calc_rate - req->rate
+					     : req->rate - calc_rate;
+		if (diff < diff_min) {
+			best_rate = calc_rate;
+			diff_min = diff;
+		}
+	}
+
+	if (best_rate == ULONG_MAX)
+		return -EINVAL;
+
+	req->rate = best_rate;
+	return 0;
+}
+
+static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct sd_clock *clock = to_sd_clock(hw);
+	unsigned int i;
+
+	for (i = 0; i < clock->div_num; i++)
+		if (rate == DIV_ROUND_CLOSEST(parent_rate,
+					      clock->div_table[i].div))
+			break;
+
+	if (i >= clock->div_num)
+		return -EINVAL;
+
+	clock->cur_div_idx = i;
+
+	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
+		       clock->div_table[i].val &
+		       (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
+
+	return 0;
+}
+
+static const struct clk_ops cpg_sd_clock_ops = {
+	.enable = cpg_sd_clock_enable,
+	.disable = cpg_sd_clock_disable,
+	.is_enabled = cpg_sd_clock_is_enabled,
+	.recalc_rate = cpg_sd_clock_recalc_rate,
+	.determine_rate = cpg_sd_clock_determine_rate,
+	.set_rate = cpg_sd_clock_set_rate,
+};
+
+struct clk * __init cpg_sd_clk_register(const char *name,
+	void __iomem *base, unsigned int offset, const char *parent_name,
+	struct raw_notifier_head *notifiers, bool skip_first)
+{
+	struct clk_init_data init;
+	struct sd_clock *clock;
+	struct clk *clk;
+	u32 val;
+
+	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
+	if (!clock)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_sd_clock_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clock->csn.reg = base + offset;
+	clock->hw.init = &init;
+	clock->div_table = cpg_sd_div_table;
+	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
+
+	if (skip_first) {
+		clock->div_table++;
+		clock->div_num--;
+	}
+
+	val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
+	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
+	writel(val, clock->csn.reg);
+
+	clk = clk_register(NULL, &clock->hw);
+	if (IS_ERR(clk))
+		goto free_clock;
+
+	cpg_simple_notifier_register(notifiers, &clock->csn);
+	return clk;
+
+free_clock:
+	kfree(clock);
+	return clk;
+}
+
+
diff --git a/drivers/clk/renesas/rcar-cpg-lib.h b/drivers/clk/renesas/rcar-cpg-lib.h
new file mode 100644
index 000000000000..d00c91b116ca
--- /dev/null
+++ b/drivers/clk/renesas/rcar-cpg-lib.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * R-Car Gen3 Clock Pulse Generator Library
+ *
+ * Copyright (C) 2015-2018 Glider bvba
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ *
+ * Based on clk-rcar-gen3.c
+ *
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ */
+
+#ifndef __CLK_RENESAS_RCAR_CPG_LIB_H__
+#define __CLK_RENESAS_RCAR_CPG_LIB_H__
+
+extern spinlock_t cpg_lock;
+
+struct cpg_simple_notifier {
+	struct notifier_block nb;
+	void __iomem *reg;
+	u32 saved;
+};
+
+void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
+				  struct cpg_simple_notifier *csn);
+
+void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set);
+
+struct clk * __init cpg_sd_clk_register(const char *name,
+	void __iomem *base, unsigned int offset, const char *parent_name,
+	struct raw_notifier_head *notifiers, bool skip_first);
+
+#endif
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3b2eb46b7e58..17826599e9dd 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -23,6 +23,7 @@
 #include <linux/sys_soc.h>
 
 #include "renesas-cpg-mssr.h"
+#include "rcar-cpg-lib.h"
 #include "rcar-gen3-cpg.h"
 
 #define CPG_PLL0CR		0x00d8
@@ -31,52 +32,6 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
-static spinlock_t cpg_lock;
-
-static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
-{
-	unsigned long flags;
-	u32 val;
-
-	spin_lock_irqsave(&cpg_lock, flags);
-	val = readl(reg);
-	val &= ~clear;
-	val |= set;
-	writel(val, reg);
-	spin_unlock_irqrestore(&cpg_lock, flags);
-};
-
-struct cpg_simple_notifier {
-	struct notifier_block nb;
-	void __iomem *reg;
-	u32 saved;
-};
-
-static int cpg_simple_notifier_call(struct notifier_block *nb,
-				    unsigned long action, void *data)
-{
-	struct cpg_simple_notifier *csn =
-		container_of(nb, struct cpg_simple_notifier, nb);
-
-	switch (action) {
-	case PM_EVENT_SUSPEND:
-		csn->saved = readl(csn->reg);
-		return NOTIFY_OK;
-
-	case PM_EVENT_RESUME:
-		writel(csn->saved, csn->reg);
-		return NOTIFY_OK;
-	}
-	return NOTIFY_DONE;
-}
-
-static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
-					 struct cpg_simple_notifier *csn)
-{
-	csn->nb.notifier_call = cpg_simple_notifier_call;
-	raw_notifier_chain_register(notifiers, &csn->nb);
-}
-
 /*
  * Z Clock & Z2 Clock
  *
@@ -215,211 +170,6 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	return clk;
 }
 
-/*
- * SDn Clock
- */
-#define CPG_SD_STP_HCK		BIT(9)
-#define CPG_SD_STP_CK		BIT(8)
-
-#define CPG_SD_STP_MASK		(CPG_SD_STP_HCK | CPG_SD_STP_CK)
-#define CPG_SD_FC_MASK		(0x7 << 2 | 0x3 << 0)
-
-#define CPG_SD_DIV_TABLE_DATA(stp_hck, sd_srcfc, sd_fc, sd_div) \
-{ \
-	.val = ((stp_hck) ? CPG_SD_STP_HCK : 0) | \
-	       ((sd_srcfc) << 2) | \
-	       ((sd_fc) << 0), \
-	.div = (sd_div), \
-}
-
-struct sd_div_table {
-	u32 val;
-	unsigned int div;
-};
-
-struct sd_clock {
-	struct clk_hw hw;
-	const struct sd_div_table *div_table;
-	struct cpg_simple_notifier csn;
-	unsigned int div_num;
-	unsigned int cur_div_idx;
-};
-
-/* SDn divider
- *           sd_srcfc   sd_fc   div
- * stp_hck   (div)      (div)     = sd_srcfc x sd_fc
- *---------------------------------------------------------
- *  0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
- *  0         1 (2)      1 (4)      8 : SDR50
- *  1         2 (4)      1 (4)     16 : HS / SDR25
- *  1         3 (8)      1 (4)     32 : NS / SDR12
- *  1         4 (16)     1 (4)     64
- *  0         0 (1)      0 (2)      2
- *  0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
- *  1         2 (4)      0 (2)      8
- *  1         3 (8)      0 (2)     16
- *  1         4 (16)     0 (2)     32
- *
- *  NOTE: There is a quirk option to ignore the first row of the dividers
- *  table when searching for suitable settings. This is because HS400 on
- *  early ES versions of H3 and M3-W requires a specific setting to work.
- */
-static const struct sd_div_table cpg_sd_div_table[] = {
-/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  sd_srcfc,   sd_fc,  sd_div) */
-	CPG_SD_DIV_TABLE_DATA(0,        0,          1,        4),
-	CPG_SD_DIV_TABLE_DATA(0,        1,          1,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        2,          1,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        4,          1,       64),
-	CPG_SD_DIV_TABLE_DATA(0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        1,          0,        4),
-	CPG_SD_DIV_TABLE_DATA(1,        2,          0,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        3,          0,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        4,          0,       32),
-};
-
-#define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-
-static int cpg_sd_clock_enable(struct clk_hw *hw)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK,
-		       clock->div_table[clock->cur_div_idx].val &
-		       CPG_SD_STP_MASK);
-
-	return 0;
-}
-
-static void cpg_sd_clock_disable(struct clk_hw *hw)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
-}
-
-static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	return !(readl(clock->csn.reg) & CPG_SD_STP_MASK);
-}
-
-static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
-						unsigned long parent_rate)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-
-	return DIV_ROUND_CLOSEST(parent_rate,
-				 clock->div_table[clock->cur_div_idx].div);
-}
-
-static int cpg_sd_clock_determine_rate(struct clk_hw *hw,
-				       struct clk_rate_request *req)
-{
-	unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
-	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned long calc_rate, diff;
-	unsigned int i;
-
-	for (i = 0; i < clock->div_num; i++) {
-		calc_rate = DIV_ROUND_CLOSEST(req->best_parent_rate,
-					      clock->div_table[i].div);
-		if (calc_rate < req->min_rate || calc_rate > req->max_rate)
-			continue;
-
-		diff = calc_rate > req->rate ? calc_rate - req->rate
-					     : req->rate - calc_rate;
-		if (diff < diff_min) {
-			best_rate = calc_rate;
-			diff_min = diff;
-		}
-	}
-
-	if (best_rate == ULONG_MAX)
-		return -EINVAL;
-
-	req->rate = best_rate;
-	return 0;
-}
-
-static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long parent_rate)
-{
-	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned int i;
-
-	for (i = 0; i < clock->div_num; i++)
-		if (rate == DIV_ROUND_CLOSEST(parent_rate,
-					      clock->div_table[i].div))
-			break;
-
-	if (i >= clock->div_num)
-		return -EINVAL;
-
-	clock->cur_div_idx = i;
-
-	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
-		       clock->div_table[i].val &
-		       (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
-
-	return 0;
-}
-
-static const struct clk_ops cpg_sd_clock_ops = {
-	.enable = cpg_sd_clock_enable,
-	.disable = cpg_sd_clock_disable,
-	.is_enabled = cpg_sd_clock_is_enabled,
-	.recalc_rate = cpg_sd_clock_recalc_rate,
-	.determine_rate = cpg_sd_clock_determine_rate,
-	.set_rate = cpg_sd_clock_set_rate,
-};
-
-static struct clk * __init cpg_sd_clk_register(const char *name,
-	void __iomem *base, unsigned int offset, const char *parent_name,
-	struct raw_notifier_head *notifiers, bool skip_first)
-{
-	struct clk_init_data init;
-	struct sd_clock *clock;
-	struct clk *clk;
-	u32 val;
-
-	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
-	if (!clock)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-	init.ops = &cpg_sd_clock_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
-
-	clock->csn.reg = base + offset;
-	clock->hw.init = &init;
-	clock->div_table = cpg_sd_div_table;
-	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
-
-	if (skip_first) {
-		clock->div_table++;
-		clock->div_num--;
-	}
-
-	val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
-	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
-	writel(val, clock->csn.reg);
-
-	clk = clk_register(NULL, &clock->hw);
-	if (IS_ERR(clk))
-		goto free_clock;
-
-	cpg_simple_notifier_register(notifiers, &clock->csn);
-	return clk;
-
-free_clock:
-	kfree(clock);
-	return clk;
-}
-
 struct rpc_clock {
 	struct clk_divider div;
 	struct clk_gate gate;
-- 
2.28.0

