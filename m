Return-Path: <linux-renesas-soc+bounces-33709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ZgBJ5okJ2pIsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:22:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0F65A662
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:22:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RklmNhgk;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8E630B7AFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C213ED100;
	Mon,  8 Jun 2026 20:16:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DAB3B14C6;
	Mon,  8 Jun 2026 20:16:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949806; cv=none; b=B0hB5woLq+WZ9Wr3CdZSai8gdsKHooMWYvr5KVrmFJmrPTtDoFUCOEyUFINkL0haLDvQB+vxAL7qkv8WvuvDou7JRfUTeMuX1BGPIPpvV7y9Z/Yd1G4m2SbSm3elAD7s2qF4krBrwPTjprs/WxbIzmITPTvRsm6KyIofjJj1A5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949806; c=relaxed/simple;
	bh=NMiF3Yhwlu6+sd9U6+CIvmhY6LQUZh6QVX+1yZEO5BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vyw7CQ4KwJDSlWdoV18gXEsYkQZWVlu9Zq3OYwsOvuHCK0eHAF4f4rMik3DYsDWlD6qm6j2nFnnskQ37W+5vlOqa60x7mdJd9mL2j7dj2B2BaqS1QENy2gvX5ThbBKG2py5pFWejin/rAw19dGXAf+pLNRk3Y0ObMcf1XiZTt6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RklmNhgk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C93B1F00898;
	Mon,  8 Jun 2026 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949804;
	bh=RHP6HS6b5+U/6cKljmDnmU3I12hOu6mdtrdpdlC9EDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RklmNhgk0hda7262QggA9aE1BvmBXXEYSDqgiHg0kp2bzBqJ/qVGcg1lcrQrcZlY5
	 fYib/eILYhNwrN8P/zm47+9X/Qew+pZujoyWAsRO/bjvnmUXh8cSccZv0ZWlkZL0ZN
	 Ked/jVLIDv9VRjEhebWtSa8EaGo8Ho1L/DXdJFttJrzQ4506ElKO3wm5hwF3TyVezs
	 cD+f7Spe36trvz6vbVgcHwsiIMiquAeCvWrpYB0Ldicr8t5whvGrd0deyZN9hcuHjb
	 NlcqI4kxNubLLIBqu0w5u3wKpCuuHCJ6/QoYi0Zwfrenqe3oZXaSdjiH4BWTjk7Zp1
	 kltOyI4tcccyg==
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
Subject: [PATCH v3 17/17] i3c: renesas: Add runtime PM support
Date: Mon,  8 Jun 2026 23:15:43 +0300
Message-ID: <20260608201543.804902-18-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33709-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11D0F65A662

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
renesas_i3c_abort_xfer() was added to disable interrupts and clear any
pending IRQ status bits when there is no completion in the defined
timeout. Along with this, renesas_i3c_wait_xfer() return type was changed
to unsigned long.

Add runtime PM support for the Renesas I3C driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- dropped the RPM resume/suspend in renesas_i3c_suspend() to read the
  DATBASn registers as the DATBASn register are not used on suspend/resume
  path anymore in this version

Changes in v2:
- dropped the runtime suspend/resume functions as for now, there will be
  no pinctrl sleep state described in DT
- do not synchronize the IRQs in renesas_i3c_abort_xfer() as some handlers
  may re-enable interrupts; instead just disable the interrupts and clean
  any status bits that the IRQ handlers are touching; with this the
  struct renesas_i3c::{irqs, num_irqs} and the associated code was removed
- dropped the renesas_i3c_dont_use_autosuspend() along with the
  devm_add_action_or_reset() call to set it since the same operation is
  done by the devres cleanup helper of devm_pm_runtime_enable()
- adjusted the renesas_i3c_suspend() with RPM calls to save the DATBAS
  registers
- use pm_runtime_resume_and_get() in renesas_i3c_resume() to avoid
  mixing gotos with cleanup helpers
- adjusted the patch description to reflect these changes

 drivers/i3c/master/renesas-i3c.c | 150 +++++++++++++++++++++++++------
 1 file changed, 122 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index b6c282c53a54..d6121ca86990 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include "../internals.h"
@@ -199,8 +200,6 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
-#define RENESAS_I3C_TCLK_IDX	1
-
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -263,9 +262,10 @@ struct renesas_i3c_addr {
 
 struct renesas_i3c {
 	void __iomem *regs;
-	struct clk_bulk_data *clks;
+	struct clk *tclk;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	struct device *dev;
 	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
 	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
@@ -278,7 +278,6 @@ struct renesas_i3c {
 	u32 i3c_STDBR;
 	u32 extbr;
 	u16 maxdevs;
-	u8 num_clks;
 	u8 refclk_div;
 };
 
@@ -443,7 +442,24 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
 	}
 }
 
-static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
+static void renesas_i3c_abort_xfer(struct renesas_i3c *i3c)
+{
+	guard(spinlock_irqsave)(&i3c->xferqueue.lock);
+
+	/* Disable all the interrupts */
+	renesas_writel(i3c->regs, BIE, 0);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear normal transfer status flags. */
+	renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0 | NTST_RSPQFF |
+					   NTST_TEF | NTST_TABTF);
+	/* Clear bus status flags. */
+	renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF | BST_SPCNDDF);
+	/* Clear error flags. */
+	renesas_clear_bit(i3c->regs, BCTL, BCTL_ABT);
+}
+
+static unsigned long renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
 
@@ -452,6 +468,8 @@ static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xf
 	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
 	if (!time_left)
 		renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	return time_left;
 }
 
 static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
@@ -485,6 +503,12 @@ static void renesas_i3c_bus_enable(struct i3c_master_controller *m, bool i3c_mod
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
@@ -556,7 +580,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	i3c->rate = clk_get_rate(i3c->tclk);
 	if (!i3c->rate)
 		return -EINVAL;
 
@@ -627,6 +651,11 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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
@@ -716,6 +745,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0, pos;
 	u8 first_i3c_pos = 0;
@@ -729,6 +759,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	cmd = xfer->cmds;
 	cmd->rx_count = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -777,7 +812,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
 		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_abort_xfer(i3c);
 
 	/* Skip attaching if there are failures on the xfer. */
 	if (xfer->ret) {
@@ -870,6 +907,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	int ret, pos = 0;
 
 	if (ccc->id & I3C_CCC_DIRECT) {
@@ -887,6 +925,11 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, true);
 
 	/* Calculate the command descriptor. */
@@ -921,7 +964,9 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 		}
 	}
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_abort_xfer(i3c);
 
 	ret = xfer->ret;
 	if (ret)
@@ -936,7 +981,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int i;
+	unsigned long time_left;
+	bool abort_xfer = false;
+	int i, ret;
 
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
@@ -944,6 +991,11 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 
 	init_completion(&xfer->comp);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -975,9 +1027,14 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
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
 
@@ -986,12 +1043,17 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
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
@@ -1015,7 +1077,12 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_dev_desc *tmp_dev = i3c->addrs[data->index].i3c_dev;
-	int pos;
+	int pos, ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 
@@ -1045,8 +1112,12 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
+	int ret;
 
-	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (!ret)
+		renesas_writel(i3c->regs, DATBAS(data->index), 0);
 
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index].addr = 0;
@@ -1063,7 +1134,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
 	u8 start_bit = CNDCTL_STCND;
-	int i;
+	unsigned long time_left;
+	bool abort_xfer = false;
+	int i, ret;
 
 	if (!i2c_nxfers)
 		return 0;
@@ -1076,6 +1149,11 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, false);
 
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
@@ -1102,7 +1180,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 
 		renesas_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
 
-		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		time_left = wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		if (!time_left)
+			abort_xfer = true;
 
 		if (cmd->err)
 			break;
@@ -1111,6 +1191,10 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	if (abort_xfer)
+		renesas_i3c_abort_xfer(i3c);
+
 	return cmd->err;
 }
 
@@ -1511,12 +1595,16 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
 	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(i3c->tresetn))
@@ -1583,8 +1671,6 @@ static int renesas_i3c_suspend(struct device *dev)
 	if (ret)
 		goto err_mark_resumed;
 
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
-
 	return 0;
 
 err_mark_resumed:
@@ -1606,13 +1692,13 @@ static int renesas_i3c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
+	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		goto err_resets_asserted;
 
-	ret = renesas_i3c_reset(i3c);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_clks_disable;
+		goto err_resets_asserted;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1635,15 +1721,23 @@ static int renesas_i3c_resume(struct device *dev)
 
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
+	pm_runtime_put_autosuspend(dev);
+
 	/*
 	 * I3C devices may have retained their dynamic address anyway. Do not
 	 * fail the resume because of DAA error.
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
-- 
2.43.0


