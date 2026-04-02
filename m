Return-Path: <linux-renesas-soc+bounces-30733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEV9L5pUzmmEmwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 13:35:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DB38864D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 13:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56B6C3105ADE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 11:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B8C3DA5AF;
	Thu,  2 Apr 2026 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lV/APieO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2E23CAE85
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129278; cv=none; b=hFxjxh6R6fEAWIM1DxQpgm2blKJ2nZvDO9+nTfWaR0O3IhEdpPMEGFZlvZ+7Y6XzDEgAhysepPds2QUgODQ4Bb0V1hOSQmIhdfxcg4K6vo0FzwK6Mv/pTNv4Pbyxz7RsOo604ViVl6NKIbPJtt14svepu5EsPK2gGa0QisfDVBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129278; c=relaxed/simple;
	bh=0c46ZuEPBNO+/W1uWG3bnq/cdwDNO4WbeQsqV2PRHwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHUyfEf6Ij9D3vAuEwmtXGCoQ45AqceLbw0RhdE4gPjH2WklW2eQQkEB9tqaLHR36nhxk534eg8tmKF3R3S9t0KNMHRmoh1FINH3Ea8F/FUnZ7s6z7o5YU40CYj0TdNDzuMQo9b+oN7CM6kPkqOv9Zwv26cePIevoIdUYGsqsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lV/APieO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=6jbsIGjGvxMUHttwN4fWdHOUnHxcTAMlQq5tKtNQ16M=; b=lV/APi
	eO7TshUZXS9oeQeM9N3seatbF9IMX1pizfkdEqzRBv/MUlV8yF3cctT/iGvRLHrG
	30NBqRsakgoKPtrvt/J0JaEhF3KEOs52d1Q2ch0bkdshhR5mziYQwxhp3wk1s1v/
	ZukY8F4pnbeYFSmf4MURBkqn5sBIjkwsnFP983wHX+jG5CsdrFQ7rNGqnn/wcw1D
	Uh3/05mz7IDumrjfcQeYS5cjIAfcJEPYrFuhRGrVnWXQMlPhAV81vUXCZkmN5p2h
	QYgbcT+WgXRhHzlfM2WlQe8BHkTPHs/HB4Yko4E8uo9BpthpU799OZb0AnLxy6/J
	4VptFrkp9P+fXvSg==
Received: (qmail 2479197 invoked from network); 2 Apr 2026 13:27:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 13:27:42 +0200
X-UD-Smtp-Session: l3s3148p1@YFgXfXhOuN9UhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 2/3] soc: renesas: Add Renesas R-Car MFIS driver
Date: Thu,  2 Apr 2026 13:27:06 +0200
Message-ID: <20260402112709.13002-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30733-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,vger.kernel.org,sang-engineering.com,renesas.com,gmail.com,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 7B6DB38864D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas R-Car MFIS offers multiple features but most importantly
mailboxes and hwspinlocks. Because they share a common register space
and a common register unprotection mechanism, a single driver was chosen
to handle all dependencies. (MFD and auxiliary bus have been tried as
well, but they failed because of circular dependencies.)

In this first step, the driver implements common register access and a
mailbox controller. hwspinlock support will be added incrementally, once
the subsystem allows out-of-directory drivers.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v3:

* use more 'unsigned int' instead of 'int'
* re-ordered declarations to be more xmas-tree like
  (don't want to go farther than this)
* added tags from Geert (Thanks!)

 drivers/soc/renesas/Kconfig     |   9 +
 drivers/soc/renesas/Makefile    |   1 +
 drivers/soc/renesas/rcar-mfis.c | 344 ++++++++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)
 create mode 100644 drivers/soc/renesas/rcar-mfis.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 26bed0fdceb0..2ab150d04bb1 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -465,6 +465,15 @@ config ARCH_R9A07G043
 
 endif # RISCV
 
+config RCAR_MFIS
+	tristate "Renesas R-Car MFIS driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on MAILBOX
+	help
+	  Select this option to enable the Renesas R-Car MFIS core driver for
+	  the MFIS device found on SoCs like R-Car. On families like Gen5, this
+	  is needed to communicate with the SCP.
+
 config PWC_RZV2M
 	bool "Renesas RZ/V2M PWC support" if COMPILE_TEST
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 655dbcb08747..81bde85c2178 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
+obj-$(CONFIG_RCAR_MFIS)		+= rcar-mfis.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
 obj-$(CONFIG_RZN1_IRQMUX)	+= rzn1_irqmux.o
 obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
diff --git a/drivers/soc/renesas/rcar-mfis.c b/drivers/soc/renesas/rcar-mfis.c
new file mode 100644
index 000000000000..059539eb8ab0
--- /dev/null
+++ b/drivers/soc/renesas/rcar-mfis.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Renesas R-Car MFIS (Multifunctional Interface) driver
+ *
+ * Copyright (C) Renesas Solutions Corp.
+ * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ * Wolfram Sang <wsa+renesas@sang-engineering.com>
+ */
+#include <dt-bindings/soc/renesas,r8a78000-mfis.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define MFISWPCNTR	0x0900
+#define MFISWACNTR	0x0904
+
+#define MFIS_X5H_IICR(i) ((i) * 0x1000 + 0x00)
+#define MFIS_X5H_EICR(i) ((i) * 0x1000 + 0x04)
+
+#define MFIS_UNPROTECT_KEY 0xACCE0000
+
+struct mfis_priv;
+
+struct mfis_reg {
+	void __iomem *base;
+	resource_size_t start;
+	struct mfis_priv *priv;
+};
+
+struct mfis_info {
+	u32 unprotect_mask;
+	unsigned int mb_num_channels;
+	unsigned int mb_reg_comes_from_dt:1;
+	unsigned int mb_tx_uses_eicr:1;
+	unsigned int mb_channels_are_unidir:1;
+};
+
+struct mfis_chan_priv {
+	u32 reg;
+	int irq;
+};
+
+struct mfis_priv {
+	spinlock_t unprotect_lock; /* guards access to the unprotection reg */
+	struct device *dev;
+	struct mfis_reg common_reg;
+	struct mfis_reg mbox_reg;
+	const struct mfis_info *info;
+
+	/* mailbox private data */
+	struct mbox_controller mbox;
+	struct mfis_chan_priv *chan_privs;
+};
+
+static u32 mfis_read(struct mfis_reg *mreg, unsigned int reg)
+{
+	return ioread32(mreg->base + reg);
+}
+
+static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
+{
+	struct mfis_priv *priv = mreg->priv;
+	u32 unprotect_mask = priv->info->unprotect_mask;
+	u32 unprotect_code;
+	unsigned long flags;
+
+	/*
+	 * [Gen4] key: 0xACCE0000, mask: 0x0000FFFF
+	 * [Gen5] key: 0xACC00000, mask: 0x000FFFFF
+	 */
+	unprotect_code = (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
+			 ((mreg->start + reg) & unprotect_mask);
+
+	spin_lock_irqsave(&priv->unprotect_lock, flags);
+	iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
+	iowrite32(val, mreg->base + reg);
+	spin_unlock_irqrestore(&priv->unprotect_lock, flags);
+}
+
+/********************************************************
+ *			Mailbox				*
+ ********************************************************/
+
+#define mfis_mb_mbox_to_priv(_m) container_of((_m), struct mfis_priv, mbox)
+
+static irqreturn_t mfis_mb_iicr_interrupt(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
+	struct mfis_chan_priv *chan_priv = chan->con_priv;
+
+	mbox_chan_received_data(chan, NULL);
+	/* Stop remote(!) doorbell */
+	mfis_write(&priv->mbox_reg, chan_priv->reg, 0);
+
+	return IRQ_HANDLED;
+}
+
+static int mfis_mb_startup(struct mbox_chan *chan)
+{
+	struct mfis_chan_priv *chan_priv = chan->con_priv;
+
+	if (!chan_priv->irq)
+		return 0;
+
+	return request_irq(chan_priv->irq, mfis_mb_iicr_interrupt, 0,
+			   dev_name(chan->mbox->dev), chan);
+}
+
+static void mfis_mb_shutdown(struct mbox_chan *chan)
+{
+	struct mfis_chan_priv *chan_priv = chan->con_priv;
+
+	if (chan_priv->irq)
+		free_irq(chan_priv->irq, chan);
+}
+
+static int mfis_mb_iicr_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
+	struct mfis_chan_priv *chan_priv = chan->con_priv;
+
+	/* Our doorbell still active? */
+	if (mfis_read(&priv->mbox_reg, chan_priv->reg) & BIT(0))
+		return -EBUSY;
+
+	/* Start our doorbell */
+	mfis_write(&priv->mbox_reg, chan_priv->reg, BIT(0));
+
+	return 0;
+}
+
+static bool mfis_mb_iicr_last_tx_done(struct mbox_chan *chan)
+{
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
+	struct mfis_chan_priv *chan_priv = chan->con_priv;
+
+	/* Our doorbell still active? */
+	return !(mfis_read(&priv->mbox_reg, chan_priv->reg) & BIT(0));
+}
+
+/* For MFIS variants using the IICR/EICR register pair */
+static const struct mbox_chan_ops mfis_iicr_ops = {
+	.startup = mfis_mb_startup,
+	.shutdown = mfis_mb_shutdown,
+	.send_data = mfis_mb_iicr_send_data,
+	.last_tx_done = mfis_mb_iicr_last_tx_done,
+};
+
+static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
+					  const struct of_phandle_args *sp)
+{
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(mbox);
+	struct mfis_chan_priv *chan_priv;
+	struct mbox_chan *chan;
+	u32 chan_num, chan_flags;
+	bool tx_uses_eicr, is_only_rx;
+
+	if (sp->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	chan_num = sp->args[0];
+	chan_flags = sp->args[1];
+
+	if (chan_num >= priv->info->mb_num_channels)
+		return ERR_PTR(-EINVAL);
+
+	/* Channel layout is described in mfis_mb_probe() */
+	if (priv->info->mb_channels_are_unidir) {
+		is_only_rx = chan_flags & MFIS_CHANNEL_RX;
+		chan = mbox->chans + 2 * chan_num + is_only_rx;
+	} else {
+		is_only_rx = false;
+		chan = mbox->chans + chan_num;
+	}
+
+	if (priv->info->mb_reg_comes_from_dt) {
+		tx_uses_eicr = chan_flags & MFIS_CHANNEL_EICR;
+		if (tx_uses_eicr)
+			chan += mbox->num_chans / 2;
+	} else {
+		tx_uses_eicr = priv->info->mb_tx_uses_eicr;
+	}
+
+	chan_priv = chan->con_priv;
+	chan_priv->reg = (tx_uses_eicr ^ is_only_rx) ? MFIS_X5H_EICR(chan_num) :
+						       MFIS_X5H_IICR(chan_num);
+
+	if (!priv->info->mb_channels_are_unidir || is_only_rx) {
+		char irqname[8];
+		char suffix = tx_uses_eicr ? 'i' : 'e';
+
+		/* "ch0i" or "ch0e" */
+		scnprintf(irqname, sizeof(irqname), "ch%u%c", chan_num, suffix);
+
+		chan_priv->irq = of_irq_get_byname(mbox->dev->of_node, irqname);
+		if (chan_priv->irq < 0)
+			return ERR_PTR(chan_priv->irq);
+		if (chan_priv->irq == 0)
+			return ERR_PTR(-ENOENT);
+	}
+
+	return chan;
+}
+
+static int mfis_mb_probe(struct mfis_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct mbox_controller *mbox;
+	struct mbox_chan *chan;
+	unsigned int num_chan = priv->info->mb_num_channels;
+
+	if (priv->info->mb_channels_are_unidir) {
+		/* Channel layout: Ch0-TX, Ch0-RX, Ch1-TX... */
+		num_chan *= 2;
+	}
+
+	if (priv->info->mb_reg_comes_from_dt) {
+		/* Channel layout: <n> IICR channels, <n> EICR channels */
+		num_chan *= 2;
+	}
+
+	chan  = devm_kcalloc(dev, num_chan, sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	priv->chan_privs = devm_kcalloc(dev, num_chan, sizeof(*priv->chan_privs),
+					    GFP_KERNEL);
+	if (!priv->chan_privs)
+		return -ENOMEM;
+
+	mbox = &priv->mbox;
+
+	for (unsigned int i = 0; i < num_chan; i++)
+		chan[i].con_priv = &priv->chan_privs[i];
+
+	mbox->chans = chan;
+	mbox->num_chans = num_chan;
+	mbox->txdone_poll = true;
+	mbox->ops = &mfis_iicr_ops;
+	mbox->dev = dev;
+	mbox->of_xlate = mfis_mb_of_xlate;
+
+	return devm_mbox_controller_register(dev, mbox);
+}
+
+/********************************************************
+ *			Common				*
+ ********************************************************/
+static int mfis_reg_probe(struct platform_device *pdev, struct mfis_priv *priv,
+			  struct mfis_reg *mreg, const char *name, bool required)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+
+	/* If there is no mailbox resource, registers are in the common space */
+	if (!res && !required) {
+		*mreg = priv->common_reg;
+	} else {
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		mreg->base = base;
+		mreg->start = res->start;
+		mreg->priv = priv;
+	}
+
+	return 0;
+}
+
+static int mfis_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mfis_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->info = of_device_get_match_data(dev);
+	if (!priv->info)
+		return -ENOENT;
+
+	spin_lock_init(&priv->unprotect_lock);
+
+	ret = mfis_reg_probe(pdev, priv, &priv->common_reg, "common", true);
+	if (ret)
+		return ret;
+
+	ret = mfis_reg_probe(pdev, priv, &priv->mbox_reg, "mboxes", false);
+	if (ret)
+		return ret;
+
+	return mfis_mb_probe(priv);
+}
+
+static const struct mfis_info mfis_info_r8a78000 = {
+	.unprotect_mask	= 0x000fffff,
+	.mb_num_channels = 64,
+	.mb_reg_comes_from_dt = true,
+	.mb_channels_are_unidir = true,
+};
+
+static const struct mfis_info mfis_info_r8a78000_scp = {
+	.unprotect_mask	= 0x000fffff,
+	.mb_num_channels = 32,
+	.mb_tx_uses_eicr = true,
+	.mb_channels_are_unidir = true,
+};
+
+static const struct of_device_id mfis_mfd_of_match[] = {
+	{ .compatible = "renesas,r8a78000-mfis", .data = &mfis_info_r8a78000, },
+	{ .compatible = "renesas,r8a78000-mfis-scp", .data = &mfis_info_r8a78000_scp, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mfis_mfd_of_match);
+
+static struct platform_driver mfis_driver = {
+	.driver = {
+		.name = "rcar-mfis",
+		.of_match_table = mfis_mfd_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe	= mfis_probe,
+};
+module_platform_driver(mfis_driver);
+
+MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
+MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Renesas R-Car MFIS driver");
-- 
2.51.0


