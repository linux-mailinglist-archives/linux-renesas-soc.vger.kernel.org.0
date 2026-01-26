Return-Path: <linux-renesas-soc+bounces-27418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JRkHctCd2mMdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED48700E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 733773007BBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE782D060B;
	Mon, 26 Jan 2026 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MjQRkvpG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1527E3314A8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423535; cv=none; b=e5qdb2X2H/lgiBzFvK2HtcW9EmKhxidRj3ERlmUPnkrMmKQlY1izow0gjyNY8S2GjhepD5yCfVQ1YB0X1ai9+9uUicb4IhyUtRwXmZxxVUDuM19YdykpJz1Ll8m/+bNtTD3rA/QNrQZPNnhcNrYWt3l9WxbfveK25y71ZsnXZOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423535; c=relaxed/simple;
	bh=mZe19bFK/S4/K+saPikdJBeJIpbKrPgWGTChE+D5OPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGEU1i8z5z+qaafwLz8wUMP8nSzOorPiJq+KlJdowGpl3UqcKEhyA+8YnGxLCFH6rWYosEIV5VFCVwFUJS3xLwejj98R0+BtY0XuCfxpDXmCCuBkDJ170MmKnuZ/PlZ9VyvkPSfRsB6UfeeDlGmaCE8ugm8xok0RYXsOrTtX3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MjQRkvpG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee2715254so21973855e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 02:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423531; x=1770028331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77QZXmKdSVMSMO6XhwWHW9cRB7VDPOEmlJRMnWPda5M=;
        b=MjQRkvpGUheDT9YszmXnNK5TstIhbsMPaCX3WkJhTvkosKI9gdLXrmfia8TrjcfWHp
         mXIx2r2c7pfZQq2K3rE88WuDLglWzUJYl4b8S0edSADrD4OBHb5CnrlzVrcGHD5NVxcn
         c3ls7BDKXB4zvQALJgbxGlAOsFnRTuwYTsR4mEfW1CgP/LoWfWu8Z+iAUYjT+76D6Clz
         CZ8GQ1iTXfqdVjBCdb/0rcNCjhSq3EuslFsJLbIWKtB1JzL/pRdJRKOINhfHX0E69hEO
         YWtXcGS7zEsuJwhmgw/3jfDr1EcNo6StTOk9DwT6NN2mhJsADtoxqRj07pRBIMt2Xsq5
         6nLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423531; x=1770028331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=77QZXmKdSVMSMO6XhwWHW9cRB7VDPOEmlJRMnWPda5M=;
        b=ApwxWvleEHpkjE+iDP6wTCSze49n8QPJPDS3GBXqklmnQnvtZkZjUyd4H1mjCONnBb
         AKjXBsBfSotZuaV13CB9DbFOugXQj1WqbsSE6zyYoO6mogpI/mmItV18/9C3KK17W7vQ
         xAhqsKzBKLwLvje8Ex+omMltq5GGCjXOz4jSZuNWNPCK1Sn8+oxUGV6jOvrzPFQpU+6u
         onzpurB272SljMU+Xd1OREFO481kIEO4BHmhh5iG+b1d/wT2c7p4fU3Etq5dXjDKrN95
         TuYroI2Lf35UGXrSCid/hvBlIIp7BsTS7wC0d4KBKubjGKMZIA6VT4le73rmjq6hNpeP
         kLFw==
X-Forwarded-Encrypted: i=1; AJvYcCWrcDaNUsnxSddodIzdwRw1wKN7pO7438JQfP1tsPSaXhkc6HXgX3iwrBLP1DgU9WJM3dwZtdVAmneIIPfRKJ5gZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mmnDIi8rZqskswsWU9+XLgbKwnF3FleBud2WDzpIOyeWosJy
	NAZGL0/F7mBepdXpyl04p9PJQ35J53lGXn/agPedyssRdtNsEGg8DUkqXIzMszavdqg=
X-Gm-Gg: AZuq6aInCeg6UJ4lNHghV/peg+AOE6dv91WcCz+pHaPuZ6EnojNbff2xWH3ZQmqgB8p
	Hf8C0XnX1nW0W8dT2CO/WJEtZIp8BK3nUVMN3EKl4up9pDSoqVa5nG0SEp7mKohmgnJPTDQq1ER
	ajVDCC2PP77H5jrlpgs8KecIJmlYnmz1ujzDrnomNrORWbVlziP0SsphwsPDvdt6dfLlXc8x2nv
	OezsLsygJxhzzhO3rRjXwBNvozAWKPP7tEk89LgcozXl6o5MVmiR6CoPrl9MAvNtHeMyYgBn7In
	UDUiwJd+hAWcoFDDwHZajP9YYcObbttiUulEcBur+urPsJNJpRNR71SMuC2pPCwUayLpDdzE7V0
	fr93gYiwkiEckZ+iGBXQ5SojOYnA4WJC+y9Pxg0cOv+Fmd8t3Jq5XHFZvdKus0tYXHB42P/5pnL
	+wqAdFzF3Vy2EY0gluybkWPzNJHiGAfY+LGyMamc4=
X-Received: by 2002:a05:600c:4f8a:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4805ce4e7e2mr71803555e9.16.1769423530663;
        Mon, 26 Jan 2026 02:32:10 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
Date: Mon, 26 Jan 2026 12:31:53 +0200
Message-ID: <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27418-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16ED48700E
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC supports a power saving mode in which power to most
SoC components is turned off, including the DMA IP. Add suspend to RAM
support to save and restore the DMA IP registers.

Cyclic DMA channels require special handling. Since they can be paused and
resumed during system suspend and resume, the driver restores additional
registers for these channels during the resume phase. If a channel was not
explicitly paused during suspend, the driver ensures that it is paused and
resumed as part of the system suspend/resume flow. This might be the
case of a serial device being used with no_console_suspend.

For non-cyclic channels, the dev_pm_ops::prepare callback waits for all
ongoing transfers to complete before allowing suspend-to-RAM to proceed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/dma/sh/rz-dmac.c | 183 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 175 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index ab5f49a0b9f2..8f3e2719e639 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -69,11 +69,15 @@ struct rz_dmac_desc {
  * enum rz_dmac_chan_status: RZ DMAC channel status
  * @RZ_DMAC_CHAN_STATUS_ENABLED: Channel is enabled
  * @RZ_DMAC_CHAN_STATUS_PAUSED: Channel is paused though DMA engine callbacks
+ * @RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL: Channel is paused through driver internal logic
+ * @RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED: Channel was prepared for system suspend
  * @RZ_DMAC_CHAN_STATUS_CYCLIC: Channel is cyclic
  */
 enum rz_dmac_chan_status {
 	RZ_DMAC_CHAN_STATUS_ENABLED,
 	RZ_DMAC_CHAN_STATUS_PAUSED,
+	RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL,
+	RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED,
 	RZ_DMAC_CHAN_STATUS_CYCLIC,
 };
 
@@ -94,6 +98,10 @@ struct rz_dmac_chan {
 	u32 chctrl;
 	int mid_rid;
 
+	struct {
+		u32 nxla;
+	} pm_state;
+
 	struct list_head ld_free;
 	struct list_head ld_queue;
 	struct list_head ld_active;
@@ -1002,10 +1010,17 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 	return rz_dmac_device_pause_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED);
 }
 
+static int rz_dmac_device_pause_internal(struct rz_dmac_chan *channel)
+{
+	lockdep_assert_held(&channel->vc.lock);
+
+	return rz_dmac_device_pause_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL);
+}
+
 static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 				     enum rz_dmac_chan_status status)
 {
-	u32 val;
+	u32 val, chctrl;
 	int ret;
 
 	lockdep_assert_held(&channel->vc.lock);
@@ -1013,14 +1028,33 @@ static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED)))
 		return 0;
 
-	rz_dmac_ch_writel(channel, CHCTRL_CLRSUS, CHCTRL, 1);
-	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-				       !(val & CHSTAT_SUS), 1, 1024, false,
-				       channel, CHSTAT, 1);
-	if (ret)
-		return ret;
+	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED)) {
+		/*
+		 * We can be after a sleep state with power loss. If power was
+		 * lost, the CHSTAT_SUS bit is zero. In this case, we need to
+		 * enable the channel directly. Otherwise, just set the CLRSUS
+		 * bit.
+		 */
+		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
+		if (val & CHSTAT_SUS)
+			chctrl = CHCTRL_CLRSUS;
+		else
+			chctrl = CHCTRL_SETEN;
+	} else {
+		chctrl = CHCTRL_CLRSUS;
+	}
+
+	rz_dmac_ch_writel(channel, chctrl, CHCTRL, 1);
 
-	channel->status &= ~BIT(status);
+	if (chctrl & CHCTRL_CLRSUS) {
+		ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
+					       !(val & CHSTAT_SUS), 1, 1024, false,
+					       channel, CHSTAT, 1);
+		if (ret)
+			return ret;
+	}
+
+	channel->status &= ~(BIT(status) | BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED));
 
 	return 0;
 }
@@ -1034,6 +1068,13 @@ static int rz_dmac_device_resume(struct dma_chan *chan)
 	return rz_dmac_device_resume_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED);
 }
 
+static int rz_dmac_device_resume_internal(struct rz_dmac_chan *channel)
+{
+	lockdep_assert_held(&channel->vc.lock);
+
+	return rz_dmac_device_resume_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL);
+}
+
 /*
  * -----------------------------------------------------------------------------
  * IRQ handling
@@ -1438,6 +1479,131 @@ static void rz_dmac_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static int rz_dmac_suspend_prepare(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		/* Wait for transfer completion, except in cyclic case. */
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_ENABLED) &&
+		    !(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			return -EAGAIN;
+	}
+
+	return 0;
+}
+
+static void rz_dmac_suspend_recover(struct rz_dmac *dmac)
+{
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			continue;
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL)))
+			continue;
+
+		rz_dmac_device_resume_internal(channel);
+	}
+}
+
+static int rz_dmac_suspend(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+	int ret;
+
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			continue;
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED))) {
+			ret = rz_dmac_device_pause_internal(channel);
+			if (ret) {
+				dev_err(dev, "Failed to suspend channel %s\n",
+					dma_chan_name(&channel->vc.chan));
+				continue;
+			}
+		}
+
+		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
+		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED);
+	}
+
+	pm_runtime_put_sync(dmac->dev);
+
+	ret = reset_control_assert(dmac->rstc);
+	if (ret) {
+		pm_runtime_resume_and_get(dmac->dev);
+		rz_dmac_suspend_recover(dmac);
+	}
+
+	return ret;
+}
+
+static int rz_dmac_resume(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(dmac->rstc);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dmac->dev);
+	if (ret) {
+		reset_control_assert(dmac->rstc);
+		return ret;
+	}
+
+	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_0_7_COMMON_BASE + DCTRL);
+	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_8_15_COMMON_BASE + DCTRL);
+
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))) {
+			rz_dmac_ch_writel(&dmac->channels[i], CHCTRL_DEFAULT, CHCTRL, 1);
+			continue;
+		}
+
+		rz_dmac_ch_writel(channel, channel->pm_state.nxla, NXLA, 1);
+		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
+		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
+		rz_dmac_ch_writel(channel, channel->chctrl, CHCTRL, 1);
+
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL)) {
+			ret = rz_dmac_device_resume_internal(channel);
+			if (ret) {
+				dev_err(dev, "Failed to resume channel %s\n",
+					dma_chan_name(&channel->vc.chan));
+				continue;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rz_dmac_pm_ops = {
+	.prepare = rz_dmac_suspend_prepare,
+	SYSTEM_SLEEP_PM_OPS(rz_dmac_suspend, rz_dmac_resume)
+};
+
 static const struct rz_dmac_info rz_dmac_v2h_info = {
 	.icu_register_dma_req = rzv2h_icu_register_dma_req,
 	.default_dma_req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
@@ -1464,6 +1630,7 @@ static struct platform_driver rz_dmac_driver = {
 	.driver		= {
 		.name	= "rz-dmac",
 		.of_match_table = of_rz_dmac_match,
+		.pm	= pm_sleep_ptr(&rz_dmac_pm_ops),
 	},
 	.probe		= rz_dmac_probe,
 	.remove		= rz_dmac_remove,
-- 
2.43.0


