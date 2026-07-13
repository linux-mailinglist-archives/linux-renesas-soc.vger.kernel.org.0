Return-Path: <linux-renesas-soc+bounces-35127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4gh0KijkVGprggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:12:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7974B5EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=KdoFZe3w;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEB2B3077E2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DDA4189B7;
	Mon, 13 Jul 2026 13:06:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953784252D8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947982; cv=none; b=d25IzxzMJgPQ0Y7vNJ6oiiopvwExZ2+3TblllZmL5htzqMTzIaOBH1wRwS3USz5moI+CU/3nVmoqftEbn9gmzsDeVvawbyHfl1ZEMBhyRf8KnH47iDvlGKELB+myKdkVtEm8F+nAGM3SBV8y6yMAwxNYJGA3GyRAwWNkSqfiTjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947982; c=relaxed/simple;
	bh=XSu/gYmP8pxt4kcvM2Lbs8rQpVWb8am6eq2C2RLxobI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvHESk/vCRS/A7OicKDFt3asB0F/wDbyK28hrMf2QffBFz7FmA2VST+nBhnD9X/83VeNBu7QXQYFlqgBtG/OUOQ2q6qeoXkgjmiSVqHOA8X6R7f+NziIse2h9Xz3Co2UV12xGJZArgWQ5MDyBWKMkiXu4Ec3ySyZDGoJfqIlx1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KdoFZe3w; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1874318f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947979; x=1784552779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13ulA9xiGeZHoehEPfVqSD4E9lgwTJlF+km3jctT3S4=;
        b=KdoFZe3w8iyHKqnmyecVrGB9ObxAg0MDGqgrEhwAljcFoSddjHnaz9P5lM24cETxcs
         qm6phtgF4uYXIXMZUE823VuNGBiCfswf/dk0K1d0J4zv2v4+yBYRyniqFIRRSahAKhTc
         JNylqP4DodrY7YSyp9zFJSV23JdD7PcqqJpY7ubi6m6tZa+bsBwYg6uYvmKT8K6vBsdb
         Y7zOsY1kkuRrnoA4d8h6aSzWbhR7+viJp7dKpZ+UsUV38PnXT/0qSjT10UXSW2deXWBB
         LfW5xRWzeCGDJPEbbhXHrQLKtN41eJ2Ml934MwSjAR+SCRiVxEqGQmSZPJmxmwTCuEWx
         /TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947979; x=1784552779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13ulA9xiGeZHoehEPfVqSD4E9lgwTJlF+km3jctT3S4=;
        b=p9hLUscb2K3oZE8MA99/yIuvoygYUA2gScTbIf6i2fB7lESKqxLvO/Rq4EKEBm8OvX
         ge8+YxA4Aklmx9Z+g12nZ3S2DiTTxtDU755aEfVtbpZZIsYnTIlOwALJa+wMsWFXQSly
         pz3JtV/1YFIT/1FggPHpKomz31roEl4A8oyRYSS4OtddU85dCGlyHbSJ8he1kvFC/Dwz
         B6/WHXAiyBOKBmwt+93rhz6lmHeuveKIKrEXUW3F5nNY+FyzNDZvEkbfmRIJ6liC00Sp
         5D7KalfzY6/0uugaoq43xpz0mR4kX2tQl4A3CV4LoD2hXh5q/nBVTVmqqfVHXklJQqLC
         YNZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5KjqZE6fKZ/XZZJIAMd8hIASOIszDTkDvBpT/A+H1atY9gcDohYQiCl5bDSH7LEuTAdeAOkoUqzq9ytCBsT7oEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7+MM5k3jC2P1wayzJU6GKim2z9ItdYUfYNo9ub9sZh/sprQQ
	qaxzL7QCcmbLtvl+p7shP7QO5q4Bp1fGAiBr4uBuigSTEQ7YMwJkexwWEK401KLPAQg=
X-Gm-Gg: AfdE7clhxO7HGUXxWWTTzOoARsYcLF0tgywlchOvXfc9NbmG2wAjxhu/VRBCoYkKnDQ
	OSk55h/gPm3j7/r9B8ZUKGzyU1pbdJNbDslkYv7WQ9HHKvv65lSpK092BVcQaExNWAVVtLBw+vu
	LNLgzYLam0VB7lYhRUNwu9aexEM5xcQ8QcB1ZZdMlj3qQkK1Q47LWX404ADK9GgH9LGM7jIWNcf
	yGboHOVxO0V3hcxu28ev6yos8qxaCF2+Xd8NlBzNjaer3bHxTHm/H9+zKYwI7fZ1/8pr5jMA3y2
	J4gBGxPgxmE88AKUnJstIQHQQQla697HC3+2CNZlbr9hmozyqJBKHNEd1zAa4nStyJZu3M35WcL
	/AICr7cjZcyPl87aEEHgZ3SA84H9m6xpY26771YQCTu7xKR+oH5e4aC+IjgTFbLVXjlPH8ZvmMa
	ni9I6rQ8wQ9zhOB0Ua9uyYAiJiSPjEudxRV0WBJzWx/tV4qo7XfuyyzXuCifuJC+EweDxORnDW8
	/qqhLdsbw==
X-Received: by 2002:a5d:5846:0:b0:47d:ef62:cae0 with SMTP id ffacd0b85a97d-47f2dcde19bmr9660430f8f.51.1783947979049;
        Mon, 13 Jul 2026 06:06:19 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:18 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 17/17] i3c: renesas: Add runtime PM support
Date: Mon, 13 Jul 2026 16:05:45 +0300
Message-ID: <20260713130545.568657-18-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35127-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39C7974B5EF

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

Changes in v5:
- updated renesas_i3c_irqs_mask_and_clear() to use the
  renesas_i3c_irqs_mask_and_clear_locked() introduced in patch 1 from
  this series

Changes in v4:
- renamed renesas_i3c_abort_xfer() from v3 to
  renesas_i3c_irqs_mask_and_clear(); along with it renamed local varibles
  abort_xfer to xfer_failed

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

 drivers/i3c/master/renesas-i3c.c | 140 ++++++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 378baac71aef..1975c599ca43 100644
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
@@ -254,9 +253,10 @@ struct renesas_i3c_xferqueue {
 
 struct renesas_i3c {
 	void __iomem *regs;
-	struct clk_bulk_data *clks;
+	struct clk *tclk;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	struct device *dev;
 	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
@@ -269,7 +269,6 @@ struct renesas_i3c {
 	u32 i3c_STDBR;
 	u32 extbr;
 	u16 maxdevs;
-	u8 num_clks;
 	u8 refclk_div;
 };
 
@@ -449,7 +448,14 @@ static void renesas_i3c_irqs_mask_and_clear_locked(struct renesas_i3c *i3c)
 	renesas_readl(i3c->regs, BST);
 }
 
-static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
+static void renesas_i3c_irqs_mask_and_clear(struct renesas_i3c *i3c)
+{
+	guard(spinlock_irqsave)(&i3c->xferqueue.lock);
+
+	renesas_i3c_irqs_mask_and_clear_locked(i3c);
+}
+
+static unsigned long renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
 
@@ -458,6 +464,8 @@ static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xf
 	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
 	if (!time_left)
 		renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	return time_left;
 }
 
 static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
@@ -491,6 +499,12 @@ static void renesas_i3c_bus_enable(struct i3c_master_controller *m, bool i3c_mod
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
@@ -562,7 +576,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	i3c->rate = clk_get_rate(i3c->tclk);
 	if (!i3c->rate)
 		return -EINVAL;
 
@@ -633,6 +647,11 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
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
@@ -655,6 +674,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0, pos;
 	int ret;
@@ -667,6 +687,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 	cmd = xfer->cmds;
 	cmd->rx_count = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -701,7 +726,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
 		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_irqs_mask_and_clear(i3c);
 
 	if (cmd->rx_count >= i3c->maxdevs)
 		newdevs = 0;
@@ -767,6 +794,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
+	unsigned long time_left;
 	int ret, pos = 0;
 
 	if (ccc->id & I3C_CCC_DIRECT) {
@@ -784,6 +812,11 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	cmd->rnw = ccc->rnw;
 	cmd->cmd0 = 0;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, true);
 
 	/* Calculate the command descriptor. */
@@ -818,7 +851,9 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 		}
 	}
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	time_left = renesas_i3c_wait_xfer(i3c, xfer);
+	if (!time_left)
+		renesas_i3c_irqs_mask_and_clear(i3c);
 
 	ret = xfer->ret;
 	if (ret)
@@ -833,7 +868,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int i;
+	unsigned long time_left;
+	bool xfer_failed = false;
+	int i, ret;
 
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
@@ -841,6 +878,11 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 
 	init_completion(&xfer->comp);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
@@ -872,9 +914,14 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
 		}
 
-		renesas_i3c_wait_xfer(i3c, xfer);
+		time_left = renesas_i3c_wait_xfer(i3c, xfer);
+		if (!time_left)
+			xfer_failed = true;
 	}
 
+	if (xfer_failed)
+		renesas_i3c_irqs_mask_and_clear(i3c);
+
 	return 0;
 }
 
@@ -883,12 +930,17 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
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
@@ -910,7 +962,12 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int pos;
+	int pos, ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
 
 	pos = renesas_i3c_get_free_pos(i3c);
 
@@ -938,8 +995,12 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
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
 	i3c->addrs[data->index] = 0;
@@ -955,7 +1016,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_cmd *cmd;
 	u8 start_bit = CNDCTL_STCND;
-	int i;
+	unsigned long time_left;
+	bool xfer_failed = false;
+	int i, ret;
 
 	if (!i2c_nxfers)
 		return 0;
@@ -968,6 +1031,11 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	xfer->is_i2c_xfer = true;
 	cmd = xfer->cmds;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	renesas_i3c_bus_enable(m, false);
 
 	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
@@ -994,7 +1062,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 
 		renesas_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
 
-		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		time_left = wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
+		if (!time_left)
+			xfer_failed = true;
 
 		if (cmd->err)
 			break;
@@ -1003,6 +1073,10 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	if (xfer_failed)
+		renesas_i3c_irqs_mask_and_clear(i3c);
+
 	return cmd->err;
 }
 
@@ -1384,12 +1458,16 @@ static int renesas_i3c_probe(struct platform_device *pdev)
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
@@ -1456,8 +1534,6 @@ static int renesas_i3c_suspend(struct device *dev)
 	if (ret)
 		goto err_mark_resumed;
 
-	clk_bulk_disable(i3c->num_clks, i3c->clks);
-
 	return 0;
 
 err_mark_resumed:
@@ -1479,13 +1555,13 @@ static int renesas_i3c_resume(struct device *dev)
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
@@ -1504,15 +1580,23 @@ static int renesas_i3c_resume(struct device *dev)
 
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


