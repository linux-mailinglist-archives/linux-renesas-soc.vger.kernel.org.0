Return-Path: <linux-renesas-soc+bounces-30008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDotG4EvvWmI7QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:29:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66B2D98F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CE87303EFD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196D43A5E62;
	Fri, 20 Mar 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SNRAD1nE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8B39B95B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006127; cv=none; b=p2A5ur405PkwlEg3mFVCCQZTfDJDEplNzpqJq1R1f50xNXN2y9BitL/6OR3sn2SmOneQz61L4drVJApwANVQGydGrYHM4yEUShvKbBqYlv16h0DScOadioLAZwbFQHtue8XbPdPGb58O0ZFAyef8f8H5adUHmFQdKQCcQYds/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006127; c=relaxed/simple;
	bh=wmr9euWcjMPiYL6aerS6JNLwSHajZ0RgtQYB1/Fq66c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVoTSrsjvmMrXi7jGZiuFFFXNpM6TORU8eQcOLvxpezyEgogBoNf0Ujf+5vJCeJrVAmEPJ5wgGOPD68nAud8mTP+M+d+TzIFi4O/KdnlYIFESX1hwjvXvCjT3XXffLStjFoqLt8vLwk9EP5mA+edwrSRfm2KZCGnVnbnWN+zeto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SNRAD1nE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so4197145e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006124; x=1774610924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veJgc6lsn6LoKy5z2ASTYaikRHENJLTUNe/jR8sCCz4=;
        b=SNRAD1nESNOnFbZTYx1zxjVbP6a4GEnhqWuftV77S/AIccGF1vGf/8g1b/LOQlhEqX
         lUuMU3+OMOWhhCVhMVtC/gC/0aKkg+5VHaQdQDRVYuiVNWi9MFlGHPvYyGVjZ5CpvIMC
         pdmDsEVzEXM8wXkbHe3XcoIfNPdDns0xBIG27NqEVKjdGP+wV1KM5oAr1yWGdHRKkO0h
         hKZQxGXb/TgWXBhnYTL66ZElWYoc6n0vkDXHRRDGo/WfHTtZ0x9S1pH6Kw7PY/yKE+Hc
         48NT8AKc50A86MpV0at0CN5q5ojZa4FnjeEEjd8gENPFFTyAWVhM/avrx7EOOvAT52UU
         au/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006124; x=1774610924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veJgc6lsn6LoKy5z2ASTYaikRHENJLTUNe/jR8sCCz4=;
        b=qRCB+ILaSecJC5kbZpXc+k1J6abAIErOX8TspCUvfzJOidPkioBV1tbeo5lU9WFJDJ
         LXN+eTg6fc7LnpWAuwLnkfcFV/k+5PaowQ5E66Dps1oQq+hR8E1UmD25fRi3KnK1bdfN
         9RHAiJDCjsM+lOghqGBRMrFArfFsLt0XeSwzgD8BwbjkrLvmUDihe4og/o7CJJmul/qj
         aVdptYQmUVqCVEa7gVCTULG6/QS/W2yGIxIhJc7VP4FfnjYBAB3UQZy3BSnVnhhOrctw
         LE2Gt+Z7rpuQKQGKnWBaCvM97mO2NGocW5ze8500BnJ08LkLcea/O2XRj/YYcnTA830o
         c/BA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ylPkwjFQfntQwvY5x4B/FPTI7vY3vKxTLt9pWwBcWBdeADrmxow6dnCfNOqJYuV4BAsFNBTMhgYMUuGpZmUNBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8QwKgAAPd0KtjCTZESyRZJ3QkqXUuudBfZK2tTIyEJQ4WgHcY
	J8w8hS/UwiPQtAzTnJWnIiHj+tijvopu9Da8CIvUryyyFWT967/pLtnshBfx47ODy1o=
X-Gm-Gg: ATEYQzxadCwdZSWJs8/jEu84qpE3re5E89vKM7IL51aeT8Tu1JFNCIKtv1lq8RHo3mR
	4JD9MFpGDtQJakMaYB8AXaHa3MrioHQvMDALJ/CoDVP1uWHjBtyAqzDQBNB/x/q96sN/AkscziY
	RDyS+pdy40tgAZjbb36YWM4IxmYs8Epb8YsNKdVZpESm8NFvTQzTRoJKuEmVdjo4rkn2IxyjvBG
	dDuJWETw0odDaHet4oBC1OFPC9BPhQWEYO6qF5wIZj4JQuWb35gHcsxfTLL54RUnnvf8CRRUycL
	acu11MlwPMYClbXKavzmMhr0MgZ42MgiBoKsKWvAVMxl3ERg2R/lSdvcBXNI6OYcsePaRTfelfa
	rfyQly3oVTaPBBTQJRdeOtB4QKMLaXQirmLq7FAFbCBbhMDMV6lYp0rAPpZS104NE+MooCWH/4g
	w3QkKEfXhygHrMH/UEW+Kg1eLBpnmbmNbyUHfAj09C9x0KiAgUeslQGMy/F+z2+To=
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr40608545e9.9.1774006123656;
        Fri, 20 Mar 2026 04:28:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:43 -0700 (PDT)
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
	fabrizio.castro.jz@renesas.com,
	john.madieu.xa@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	tommaso.merciai.xr@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/7] dmaengine: sh: rz-dmac: Add enable status bit
Date: Fri, 20 Mar 2026 13:28:32 +0200
Message-ID: <20260320112838.2200198-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-30008-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EF66B2D98F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a status bitmask to struct rz_dmac_chan. This currently stores only
the enable status of the DMA channel and it is a preparatory commit for
adding cyclic DMA support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typo in patch description

 drivers/dma/sh/rz-dmac.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 625ff29024de..8148a1c78e12 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -62,6 +62,14 @@ struct rz_dmac_desc {
 
 #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
 
+/**
+ * enum rz_dmac_chan_status: RZ DMAC channel status
+ * @RZ_DMAC_CHAN_STATUS_ENABLED: Channel is enabled
+ */
+enum rz_dmac_chan_status {
+	RZ_DMAC_CHAN_STATUS_ENABLED,
+};
+
 struct rz_dmac_chan {
 	struct virt_dma_chan vc;
 	void __iomem *ch_base;
@@ -73,6 +81,8 @@ struct rz_dmac_chan {
 	dma_addr_t src_per_address;
 	dma_addr_t dst_per_address;
 
+	unsigned long status;
+
 	u32 chcfg;
 	u32 chctrl;
 	int mid_rid;
@@ -295,6 +305,8 @@ static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
 		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
 		rz_dmac_ch_writel(channel, chctrl, CHCTRL, 1);
+
+		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
 	}
 }
 
@@ -306,6 +318,8 @@ static void rz_dmac_disable_hw(struct rz_dmac_chan *channel)
 	dev_dbg(dmac->dev, "%s channel %d\n", __func__, channel->index);
 
 	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+
+	channel->status &= ~BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
 }
 
 static void rz_dmac_set_dmars_register(struct rz_dmac *dmac, int nr, u32 dmars)
@@ -571,6 +585,9 @@ static int rz_dmac_terminate_all(struct dma_chan *chan)
 	list_splice_tail_init(&channel->ld_active, &channel->ld_free);
 	list_splice_tail_init(&channel->ld_queue, &channel->ld_free);
 	vchan_get_all_descriptors(&channel->vc, &head);
+
+	channel->status = 0;
+
 	spin_unlock_irqrestore(&channel->vc.lock, flags);
 	vchan_dma_desc_free_list(&channel->vc, &head);
 
@@ -833,8 +850,7 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
-	val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-	if (!(val & CHSTAT_EN))
+	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_ENABLED)))
 		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
@@ -874,8 +890,10 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
 			channel->index, chstat);
 
-		scoped_guard(spinlock_irqsave, &channel->vc.lock)
+		scoped_guard(spinlock_irqsave, &channel->vc.lock) {
 			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			channel->status &= ~BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
+		}
 		return;
 	}
 
-- 
2.43.0


