Return-Path: <linux-renesas-soc+bounces-30931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ2eAHsK1WlQzwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:45:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D6E3AF66F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6D73112C0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0273BD251;
	Tue,  7 Apr 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FMOl4At/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C4B3BC669
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568956; cv=none; b=fjq6k/rM5ZsKPsu/K3jjzPnFlFTMVDSdnCRNbxZdFDwxwrtexXrtGHeyJ52+dm0WkijT4hcxAmddiNmU3dUmhF0JjCgtt1LBwCUnGBoMBrLlER8YBq6Qwir+dHeWedNC3T5angERY0tkR7OlO4f5M23Hszx9rtXdd74m72uXnnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568956; c=relaxed/simple;
	bh=Xs7tieydv3sKiMcD+C+sF1niTjjJU5jYr8NdxZL5LbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Emswg181xCdLtF037H4Y7qoei+t/AohX19BQFOKyxfpCMr1UObe9xObCErPHa+UxWeQ0EgRNkeGCJt0EHj3TxNUOcSzKHpl4KhETrQex2x9UklGSd8HzeCQT8xEcXCPaupa7Wl6cBCb7N4cnsAigGUIJyq1HN64t/lumKGgBMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FMOl4At/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso37146765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568949; x=1776173749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcU1x9xfP8ibyZGw0FaYmtMSZB/JFgRwhCjX8R29DUo=;
        b=FMOl4At/PFu/np+zOzCWBTU+2jfstG0/9CZDNgOwLWHQe9UnlqMcE2JyPg9ufM75kJ
         4v9++TtmLgL2lIJ3h+TGsyL0/tokhzhOyscaSit++NSUJ/u63/tJfA89SYHpyVnN1UfP
         kYgsqKrazz0vJm/J4ZEpk2cWDO00ZH/r4UbEbfe4EngE3zcTGS0/h3AITnR7rzasfKYH
         Y/tA2P8FWgzsahsnsd5hOLiZhSWaL60GG+f3wWmtA+wN2QGJbdx9uEYEaqMRPj1ZOiPX
         5NZc8F0vPe+9M0eoq/Xf8mFDDxuomGjDrVVh4U/cjxStj0v+97YHP+km5PAtNrTwzNo0
         Hdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568949; x=1776173749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcU1x9xfP8ibyZGw0FaYmtMSZB/JFgRwhCjX8R29DUo=;
        b=ix1duDbzMPIo1zAK67oeSPp9Bqk/pBu1l3pX2nnIJY5jJeR/Ka6nL2lG6FcXSgh3KN
         7d5W5ByVSMgT7i0yd+H48cQjrPD3LH1S04PWyBVjVsR1aIXpcrpd9LHDPhURJ60wh78C
         Cg+BswBKJPz2mmJ1jL3xQs/miWXOJipavJ9x1tBOXMtOqipSwlDKaMUFbd3PixYMbZcb
         KUGd8TBqUdc+C1qDt+e2b8U3O7LSRMKyKn66IILf0YCVxzQefWjENddZUjqW2Kzy+MUP
         c9Cr1seY9PHYaJf706xSPx7vWEh8GQk9CvJ1NHxSqVu9YV9Fm6I6nfCKkmGfWHm8twGh
         UHTg==
X-Forwarded-Encrypted: i=1; AJvYcCUWS1x7PcNreyFXmYaJkJBZb8ImHucvP1AcPFeytx/VZBvOa/72KfcM6VFFMYZDyu7OsBmSvoOH5qLarLnJUutlsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySgZxq9YeR6nS0Gykbm+Hv+jxiiUznPx71v0YayjJ/RJPoxtdI
	CIPMTid0M50FG6NLBoRZ17IQpL/bm2o/gSyS3dht982vQ/Ato4spKwA4L1cQh003rcI=
X-Gm-Gg: AeBDievx6VaWy2ezUUIBY4bYCd/lCkXhjWWf+sK6YGO8bYM9Y9i8dwooW56Jtss29BK
	ts/Fbk6L5BJvHSMCYfY88l++A76FjV7nkkXSdhXo1jyVL/KV73Q1S+mhNQlXUOlQrlli34kKANq
	1z60D4CPX473UGUXlxyRdGeOCoOSGosgkvECX+I4hBHusNpxb45DwMCVavT2gCE3LPXWuajn4IW
	ys1By+ABemnRlt1QGdxrQIeIKLV2JIb5UgSpkJX6iGYYE53+sfDmOSozo1y9zwEdZc50yLBsrTs
	FvUTtfcQUrInZh5tb9Gw8Iv/YnODoVm1QkEOTYOkYk1tOKEK0f7RGctt4UGUQvLcGm1Od7c1pOW
	foH5j8h4b+1Xc+sF9pFSm0dZx/S00spMzB+7W1E3rkyPOm4foEjNmpradUiCc2TKutSrS47fxzs
	wZXtv8dcgkrrz/K+Bt8BT/xhQdKQlvW7pksI8Bw1f0rMYhZVwksgo1
X-Received: by 2002:a05:600c:1f96:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48899753e5fmr238859485e9.9.1775568948579;
        Tue, 07 Apr 2026 06:35:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 12/15] dmaengine: sh: rz-dmac: Add suspend to RAM support
Date: Tue,  7 Apr 2026 16:35:04 +0300
Message-ID: <20260407133507.887404-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30931-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tuxon.dev:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47D6E3AF66F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC supports a power saving mode in which power to most
of the SoC components is turned off, including the DMA IP. Add suspend to
RAM support to save and restore the DMA IP registers.

Cyclic DMA channels require special handling. Since they can be paused and
resumed during system suspend/resume, the driver restores additional
registers for these channels during the system resume phase. If a channel
was not explicitly paused during suspend, the driver ensures that it is
paused and resumed as part of the system suspend/resume flow. This might be
the case of a serial device being used with no_console_suspend.

The cyclic DMA channels used by the sound IPs may be paused during system
suspend. In this case, since rz_dmac_device_synchronize() is called
through the ASoC PCM dmaengine APIs after the channel has been paused,
the CHSTAT.EN bit never goes to zero because the channel remains paused
and enabled.

As a result, the read_poll_timeout() call in rz_dmac_device_synchronize()
times out during system suspend. Since vchan_synchronize() is called to
complete any ongoing transfers and stop descriptor queuing, it should be
safe to drop the read_poll_timeout() from rz_dmac_device_synchronize().

For non-cyclic channels, the dev_pm_ops::prepare callback waits for all
the ongoing transfers to complete before allowing suspend-to-RAM to
proceed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- dropped RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED
- dropped read_poll_timeout() from rz_dmac_device_synchronze() as
  with audio drivers this times out all the time on suspend because
  the audio DMA is already paused when the rz_dmac_device_synchronize()
  is called; updated the commit description to describe this change
- call rz_dmac_device_pause_internal() only if RZ_DMAC_CHAN_STATUS_PAUSED
  bit is not set or the device is enabled in HW
- updated rz_dmac_device_resume_set() to have it simpler and cover
  the cases when it is called with the channel enabled or paused;
  updated the comment describing the covered use cases
- call rz_dmac_device_resume_internal() only if
  RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL bit is set
- in rz_dmac_chan_is_enabled() return -EAGAIN only if the channel is
  enabled in HW
- in rz_dmac_suspend_recover() drop the update of
  RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED as this is not available anymore
- in rz_dmac_suspend() call rz_dmac_device_pause_internal() unconditionally
  as the logic is now handled inside the called function; also, do not
  ignore anymore the failure of internal suspend and abort the suspend
  instead
- report channel internal resume failures in rz_dmac_resume()
- use rz_dmac_disable_hw() instead of open coding it in rz_dmac_resume()
- call rz_dmac_device_resume_internal() uncoditionally as the skip
  logic is now handled in the function itself
- use NOIRQ_SYSTEM_SLEEP_PM_OPS()
- didn't collect Tommaso's Tb tag as the series was changed a lot since
  v2

Changes in v2:
- fixed typos in patch description
- in rz_dmac_suspend_prepare(): return -EAGAIN based on the value returned
  by vchan_issue_pending()
- in rz_dmac_suspend_recover(): clear RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED for
  non cyclic channels
- in rz_dmac_resume(): call rz_dmac_set_dma_req_no() only for cyclic channels


 drivers/dma/sh/rz-dmac.c | 191 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 179 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index f7133ac6af60..3265c7b3ab83 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -69,10 +69,12 @@ struct rz_dmac_desc {
  * enum rz_dmac_chan_status: RZ DMAC channel status
  * @RZ_DMAC_CHAN_STATUS_PAUSED: Channel is paused though DMA engine callbacks
  * @RZ_DMAC_CHAN_STATUS_CYCLIC: Channel is cyclic
+ * @RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL: Channel is paused through driver internal logic
  */
 enum rz_dmac_chan_status {
 	RZ_DMAC_CHAN_STATUS_PAUSED,
 	RZ_DMAC_CHAN_STATUS_CYCLIC,
+	RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL,
 };
 
 struct rz_dmac_chan {
@@ -92,6 +94,10 @@ struct rz_dmac_chan {
 	u32 chctrl;
 	int mid_rid;
 
+	struct {
+		u32 nxla;
+	} pm_state;
+
 	struct list_head ld_free;
 
 	struct {
@@ -803,16 +809,9 @@ static void rz_dmac_device_synchronize(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
 	struct rz_dmac *dmac = to_rz_dmac(chan->device);
-	u32 chstat;
-	int ret;
 
 	vchan_synchronize(&channel->vc);
 
-	ret = read_poll_timeout(rz_dmac_ch_readl, chstat, !(chstat & CHSTAT_EN),
-				100, 100000, false, channel, CHSTAT, 1);
-	if (ret < 0)
-		dev_warn(dmac->dev, "DMA Timeout");
-
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 }
 
@@ -960,20 +959,57 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 	return rz_dmac_device_pause_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED));
 }
 
+static int rz_dmac_device_pause_internal(struct rz_dmac_chan *channel)
+{
+	lockdep_assert_held(&channel->vc.lock);
+
+	/* Skip channels explicitly paused by consummers or disabled. */
+	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED) ||
+	    !rz_dmac_chan_is_enabled(channel))
+		return 0;
+
+	return rz_dmac_device_pause_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL));
+}
+
 static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 				     unsigned long clear_bitmask)
 {
-	int ret = 0;
 	u32 val;
+	int ret;
 
 	lockdep_assert_held(&channel->vc.lock);
 
-	/* Do not check CHSTAT_SUS but rely on HW capabilities. */
+	/*
+	 * We can be:
+	 *
+	 * 1/ after the channel was paused by a consummer and now it
+	 *    needs to be resummed
+	 * 2/ after the channel was paused internally (as a result of
+	 *    a system suspend with power loss or not)
+	 * 3/ after the channel was paused by a consummer, the system
+	 *    went through a system suspend (with power loss or not)
+	 *    and the consummer wants to resume the channel
+	 *
+	 * To cover all the above cases we set both CLRSUS and SETEN.
+	 *
+	 * In case 1/ setting SETEN while the channel is still enabled
+	 * is harmless for the controller.
+	 *
+	 * In case 2/ the channel is disabled when calling this function
+	 * and setting CLRSUS is harmless for the controller as the
+	 * channel is disabled anyway.
+	 *
+	 * In case 3/ the channel is disabled/enabled if the system
+	 * went though a suspend with power loss/or not and setting
+	 * CLRSUS/SETEN is harmless for the controller as the channel
+	 * is enabled/disabled anyway.
+	 */
+
+	rz_dmac_ch_writel(channel, CHCTRL_CLRSUS | CHCTRL_SETEN, CHCTRL, 1);
 
-	rz_dmac_ch_writel(channel, CHCTRL_CLRSUS, CHCTRL, 1);
 	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-				       !(val & CHSTAT_SUS), 1, 1024, false,
-				       channel, CHSTAT, 1);
+				       ((val & (CHSTAT_SUS | CHSTAT_EN)) == CHSTAT_EN),
+				       1, 1024, false, channel, CHSTAT, 1);
 
 	channel->status &= ~clear_bitmask;
 
@@ -992,6 +1028,16 @@ static int rz_dmac_device_resume(struct dma_chan *chan)
 	return rz_dmac_device_resume_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED));
 }
 
+static int rz_dmac_device_resume_internal(struct rz_dmac_chan *channel)
+{
+	lockdep_assert_held(&channel->vc.lock);
+
+	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL)))
+		return 0;
+
+	return rz_dmac_device_resume_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL));
+}
+
 /*
  * -----------------------------------------------------------------------------
  * IRQ handling
@@ -1374,6 +1420,126 @@ static void rz_dmac_remove(struct platform_device *pdev)
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
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))
+			continue;
+
+		if (rz_dmac_chan_is_enabled(channel))
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
+		ret = rz_dmac_device_pause_internal(channel);
+		if (ret) {
+			dev_err(dev, "Failed to suspend channel %s\n",
+				dma_chan_name(&channel->vc.chan));
+			goto recover;
+		}
+
+		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
+	}
+
+	pm_runtime_put_sync(dmac->dev);
+
+	ret = reset_control_assert(dmac->rstc);
+	if (ret) {
+		pm_runtime_resume_and_get(dmac->dev);
+recover:
+		rz_dmac_suspend_recover(dmac);
+	}
+
+	return ret;
+}
+
+static int rz_dmac_resume(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+	int errors = 0, ret;
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
+		rz_dmac_disable_hw(&dmac->channels[i]);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			continue;
+
+		rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
+
+		rz_dmac_ch_writel(channel, channel->pm_state.nxla, NXLA, 1);
+		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
+		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
+		rz_dmac_ch_writel(channel, channel->chctrl, CHCTRL, 1);
+
+		ret = rz_dmac_device_resume_internal(channel);
+		if (ret) {
+			errors = ret;
+			dev_err(dev, "Failed to resume channel %s\n",
+				dma_chan_name(&channel->vc.chan));
+		}
+	}
+
+	return errors ? : ret;
+}
+
+static const struct dev_pm_ops rz_dmac_pm_ops = {
+	.prepare = rz_dmac_suspend_prepare,
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(rz_dmac_suspend, rz_dmac_resume)
+};
+
 static const struct rz_dmac_info rz_dmac_v2h_info = {
 	.icu_register_dma_req = rzv2h_icu_register_dma_req,
 	.default_dma_req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
@@ -1400,6 +1566,7 @@ static struct platform_driver rz_dmac_driver = {
 	.driver		= {
 		.name	= "rz-dmac",
 		.of_match_table = of_rz_dmac_match,
+		.pm	= pm_sleep_ptr(&rz_dmac_pm_ops),
 	},
 	.probe		= rz_dmac_probe,
 	.remove		= rz_dmac_remove,
-- 
2.43.0


