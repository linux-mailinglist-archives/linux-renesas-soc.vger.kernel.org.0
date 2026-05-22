Return-Path: <linux-renesas-soc+bounces-32948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHLoKyQxEGoaUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:34:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5EE5B2312
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FA473025A7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83B43E5590;
	Fri, 22 May 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyaIQ0Me"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61A3CC338;
	Fri, 22 May 2026 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445161; cv=none; b=e6V1SgJjeA1nofMgKO6vq3DL8jsrF81sC+ksZRzkyLVlNAO58dxq7I77Vuu5jqw79q8fqGUwMqO4jU/xOq+gj+MzM4nSrNC9rGMr6wt2+Vm1wwNG+AyOaqmh/yfWFSNX1eUWD/YfUQNSRDZsAz6QJOn3pwL5GhUqhNhxHOYKfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445161; c=relaxed/simple;
	bh=lT/z5Xfp2qo/mEEPD4Df20ERYvicqktVH99+TSP1XEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTIwi0EPqk/r8WOC40jKpgJvMvW4VYUo362VemfsXPm3xW3rqtnc5FxVFVCOOOw6r7JMLbYXpVlXLcfUye2uiw0oxOBs0TMPQmsvM20JaMDbeTckbNF2ZR4wFD3l81vfaUEq9uOdV7shl3pgX+4NxmpUEXHbu+HiuzfU89tZ8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyaIQ0Me; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC211F000E9;
	Fri, 22 May 2026 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445156;
	bh=IzW7kACV2Oxk+ehTbe8c1b2lzYrTPzsmnd4TjxIv/+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VyaIQ0MecAB2Ak4e/W6cpM6seljgKtOEmUqNpADbDOke70gpMBm7NYaf4xlLO5TES
	 u2fpr8YF08yhl4Krki/ixG/ecR+cNCPZFrYZUngAubuw/Xowm/LRbwMRJgkqvfAbGG
	 TkWm5S0rEKnCma9SQCy8yfCRoHvvrx9iNhjbHa/r+TawO9ms1YM8OKIp0Y2Jqo+Tls
	 spSEO/bAxIpX4DFtWiDPw1UBZHlpPZ5kRhQk34Xu0ESRHVH4BFOtWfxio+vA2XJGDG
	 AA6JBSLE0Dg/KUbav9PmCnguycli6Ay6WENuil9kmVvx17XtSd/D3g9fIb6cRkr69Q
	 +5rWrkt1KQ02g==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 17/17] i3c: renesas: Add runtime PM support
Date: Fri, 22 May 2026 13:18:15 +0300
Message-ID: <20260522101815.1722909-18-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32948-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2F5EE5B2312
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the SoCs where the Renesas I3C driver is enabled (RZ/G3S and RZ/G3E),
the clocks of the IP are managed through a clock PM domain. To keep the
I3C code simpler, the explicit clock handling was dropped along with the
addition of runtime PM support, in favor of the runtime PM APIs. Only the
code for getting tclk was preserved, as it is necessary to compute the
I3C clock rate.

All the APIs provided to the I3C subsystem through struct
i3c_master_controller_ops are guarded with runtime PM APIs to
enable/disable the controller at runtime.

As the Renesas I3C driver implements an asynchronous transmit model by
preparing a transfer and waiting for its completion through the ISR,
renesas_i3c_abort_xfer() was added to disable interrupts and synchronize
IRQs before runtime suspending the controller. For this, the interrupts
were saved in struct renesas_i3c::irqs. Along with this,
renesas_i3c_wait_xfer() return type was changed to unsigned long.

Along with the clocks, the controller pin configuration is changed
through the provided "sleep" pin configuration.

Add runtime PM support for the Renesas I3C driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 183 ++++++++++++++++++++++++++-----
 1 file changed, 156 insertions(+), 27 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index a070db4d2440..3b9807a89b54 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -21,7 +21,9 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include "../internals.h"
@@ -199,8 +201,6 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
-#define RENESAS_I3C_TCLK_IDX	1
-
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -254,12 +254,15 @@ struct renesas_i3c_xferqueue {
 
 struct renesas_i3c {
 	void __iomem *regs;
-	struct clk_bulk_data *clks;
+	struct clk *tclk;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	struct device *dev;
+	int *irqs;
 	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
 	unsigned long rate;
+	unsigned int num_irqs;
 	enum i3c_internal_state internal_state;
 	u32 free_pos;
 	u32 dyn_addr;
@@ -268,7 +271,6 @@ struct renesas_i3c {
 	u32 extbr;
 	u16 maxdevs;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
-	u8 num_clks;
 	u8 refclk_div;
 };
 
@@ -433,7 +435,18 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
 	}
 }
 
-static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
+static void renesas_i3c_abort_xfer(struct renesas_i3c *i3c)
+{
+	/* Disable all interrupts */
+	renesas_writel(i3c->regs, BIE, 0);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Synchronize IRQs. */
+	for (unsigned int i = 0; i < i3c->num_irqs; i++)
+		synchronize_irq(i3c->irqs[i]);
+}
+
+static unsigned long renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
 
@@ -442,6 +455,8 @@ static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xf
 	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
 	if (!time_left)
 		renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	return time_left;
 }
 
 static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
@@ -475,6 +490,12 @@ static void renesas_i3c_bus_enable(struct i3c_master_controller *m, bool i3c_mod
 static int renesas_i3c_reset(struct renesas_i3c *i3c)
 {
 	u32 val;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	renesas_writel(i3c->regs, BCTL, 0);
 	renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
@@ -546,7 +567,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	i3c->rate = clk_get_rate(i3c->tclk);
 	if (!i3c->rate)
 		return -EINVAL;
 
@@ -617,6 +638,11 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
 	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
@@ -639,6 +665,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0, pos;
 	int ret;
@@ -651,6 +678,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	cmd = xfer->cmds;
 	cmd->rx_count = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -685,7 +717,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
 		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_abort_xfer(i3c);
 
 	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
 	newdevs &= ~olddevs;
@@ -747,6 +781,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	int ret, pos = 0;
 
 	if (ccc->id & I3C_CCC_DIRECT) {
@@ -764,6 +799,11 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, true);
 
 	/* Calculate the command descriptor. */
@@ -798,7 +838,9 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 		}
 	}
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_abort_xfer(i3c);
 
 	ret = xfer->ret;
 	if (ret)
@@ -813,7 +855,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int i;
+	unsigned long time_left;
+	bool abort_xfer = false;
+	int i, ret;
 
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
@@ -821,6 +865,11 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 
 	init_completion(&xfer->comp);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -852,9 +901,14 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
 		}
 
-		renesas_i3c_wait_xfer(i3c, xfer);
+		time_left = renesas_i3c_wait_xfer(i3c, xfer);
+		if (!time_left)
+			abort_xfer = true;
 	}
 
+	if (abort_xfer)
+		renesas_i3c_abort_xfer(i3c);
+
 	return 0;
 }
 
@@ -863,12 +917,17 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data;
-	int pos;
+	int pos, ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 	if (pos < 0)
 		return pos;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
@@ -890,12 +949,17 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int pos;
+	int pos, ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 	if (pos < 0)
 		return pos;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	if (data->index != pos) {
 		renesas_writel(i3c->regs, DATBAS(data->index), 0);
 		i3c->addrs[data->index] = 0;
@@ -920,6 +984,12 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
 
 	renesas_writel(i3c->regs, DATBAS(data->index), 0);
 
@@ -937,7 +1007,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
 	u8 start_bit = CNDCTL_STCND;
-	int i;
+	unsigned long time_left;
+	bool abort_xfer = false;
+	int i, ret;
 
 	if (!i2c_nxfers)
 		return 0;
@@ -950,6 +1022,11 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, false);
 
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
@@ -976,7 +1053,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 
 		renesas_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
 
-		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		time_left = wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		if (!time_left)
+			abort_xfer = true;
 
 		if (cmd->err)
 			break;
@@ -985,6 +1064,10 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	if (abort_xfer)
+		renesas_i3c_abort_xfer(i3c);
+
 	return cmd->err;
 }
 
@@ -1347,6 +1430,11 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 	{ .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
 };
 
+static void renesas_i3c_dont_use_autosuspend(void *data)
+{
+	pm_runtime_dont_use_autosuspend(data);
+}
+
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
@@ -1360,12 +1448,21 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
-	if (ret <= RENESAS_I3C_TCLK_IDX)
-		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
-				     "Failed to get clocks (need > %d, got %d)\n",
-				     RENESAS_I3C_TCLK_IDX, ret);
-	i3c->num_clks = ret;
+	i3c->tclk = devm_clk_get(&pdev->dev, "tclk");
+	if (IS_ERR(i3c->tclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tclk), "Failed to get tclk");
+
+	i3c->dev = &pdev->dev;
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_dont_use_autosuspend,
+				       i3c->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
 	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(i3c->tresetn))
@@ -1384,19 +1481,25 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	i3c->num_irqs = ARRAY_SIZE(renesas_i3c_irqs);
+	i3c->irqs = devm_kcalloc(&pdev->dev, i3c->num_irqs, sizeof(*i3c->irqs), GFP_KERNEL);
+	if (!i3c->irqs)
+		return -ENOMEM;
+
 	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
 		const char *irqname;
 
 		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
 		if (ret < 0)
 			return ret;
+		i3c->irqs[i] = ret;
 
 		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
 					 renesas_i3c_irqs[i].desc);
 		if (!irqname)
 			return -ENOMEM;
 
-		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
+		ret = devm_request_irq(&pdev->dev, i3c->irqs[i], renesas_i3c_irqs[i].isr,
 				       0, irqname, i3c);
 		if (ret)
 			return ret;
@@ -1432,10 +1535,14 @@ static int renesas_i3c_suspend(struct device *dev)
 	if (ret)
 		goto err_mark_resumed;
 
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		goto err_resets_deassert;
 
 	return 0;
 
+err_resets_deassert:
+	reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 err_mark_resumed:
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
@@ -1451,17 +1558,22 @@ static int renesas_i3c_resume(struct device *dev)
 	};
 	int ret;
 
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
 	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
+	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		goto err_resets_asserted;
 
-	ret = renesas_i3c_reset(i3c);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
-		goto err_clks_disable;
+		goto err_resets_asserted;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1486,14 +1598,31 @@ static int renesas_i3c_resume(struct device *dev)
 	 */
 	return 0;
 
-err_clks_disable:
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
 err_resets_asserted:
+	/*
+	 * If this happens, there is no way to recover from this state without
+	 * reloading the driver. We want to avoid keeping the reset line
+	 * deasserted unnecessarily. The runtime paths will still work correctly
+	 * even if the IP registers are accessed while reset is asserted (e.g.
+	 * if a runtime path is triggered after a failed resume). Checked on
+	 * RZ/G3S.
+	 */
 	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 
+static int renesas_i3c_runtime_suspend(struct device *dev)
+{
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static int renesas_i3c_runtime_resume(struct device *dev)
+{
+	return pinctrl_pm_select_default_state(dev);
+}
+
 static const struct dev_pm_ops renesas_i3c_pm_ops = {
+	RUNTIME_PM_OPS(renesas_i3c_runtime_suspend, renesas_i3c_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
 };
 
-- 
2.43.0


