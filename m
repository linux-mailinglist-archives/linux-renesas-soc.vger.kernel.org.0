Return-Path: <linux-renesas-soc+bounces-27414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOEQEbpCd2mMdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0E86FE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B7993013ED1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B0A330D5E;
	Mon, 26 Jan 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PlUe6Aew"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912F330330
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423526; cv=none; b=hJJwh2b1CFUXXh7OAcOYWcVMU9FKOBdifbuXT3szpgW3N9b+rQdiKVWdK81vDNuYeDkVR7e2SjHoZJEkkHo/YWM/iqxGYM8NFSfCheJgPb3ke2FoQ682K7Gx8MG26Oj6qwFAu6R0WDfWOvl2d4lPh/Dd9b6ngNXNyYkkT7boN7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423526; c=relaxed/simple;
	bh=b1BJqAn5r2bWkK4hYICDDw4hYAlP5B50ADdrRpoAUlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJYSQkoVz6gA4X7JIlac6KpKI6E0cWDN2/Ya8MZLWD/OmUpN4HdlSdBPCWM8YREU2zpb24LUL0HomsrolvLy7KgnISdrlUwbZSfcppwenV9CrxgzCzi/rx3lTmK8BDViVWxhibhb07tZTeEG6gxP5M057W/2cq7A1avnrhen9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PlUe6Aew; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48049955f7fso36718055e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 02:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423522; x=1770028322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB0+q6M4rfVt0Jwi/g6CvASE0XuyTwoIRTjo+xXQvwE=;
        b=PlUe6AewimgXfywGrHukUjhtsXRq7OH4Q8+gffXmqg8Egt5n52I0gLu/aZEGP7Y1US
         KBwQGBHUy5wd9TmCzbnvrNLnex/oW5cLi/ZTxAY5LKJ+T9mK36Lyps291PV4yED4bejA
         SWJI5LANTQRd/L6rWpP9urUx+OkYmHkkF5XuTYp9oX+dkfG/NMrB2BJ14YPcH6mbs/Sl
         Z9E1D/3DhQwCMik/XY17k/jvE84vifHuYYFvKJinCrgCf6QGwd1nK1aE+ohuvp61pYKz
         rBS4FieBzQpebrMFVzZOgUX4oSVH86fytROoxApyJlHnl7hsrEqTSfMAGpKROxI4M/sy
         qK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423522; x=1770028322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EB0+q6M4rfVt0Jwi/g6CvASE0XuyTwoIRTjo+xXQvwE=;
        b=JNx35NDy1/ugONRVdX2eHlE8dw86Avw1ew1eRXX1ideQeanHvkIllbBFvT1PIptGTd
         YDJho3EEsIYmfcJDMVnUE93CJvtxJCTJQBLQuAeM3HoMsZYhkuhvC2bXW4iwKvV8ZAEH
         Z4Yf9otBN/U9QqWRpFYT+vSJLdOnQT0axWrjxZHO93Ov0QPJMsxEj9dN5fXUrxnG/Xo0
         en/lqLxrfCSWosHldZpMCGvBCDlqdDWqagNhAt5K10YdBzVw/twVzMd2+jrTWl/CeyZE
         Jmt9ZE3Qo6NDSa3U7W+M9CbMV0NYkG9ynPauAM3NK2G6TCPVDFoxxf2iPjhV6T8o4/WK
         T4mw==
X-Forwarded-Encrypted: i=1; AJvYcCXgrSiwZcIHEinaJGKeYpkf90zJqr0W8IR5Q4sZC7DfUOgYjhYzzUHuPY4+uhlN0egOl0ysq+rHhXC1fhYv4R8oRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxgZUczCyJGFcuHhsQPTnf0nTfyw08vFt0Q167Z3Q392oIWnWB
	ujxhX+iq9t8u6/bP/5CRztT+e2d69V+vdpboKLJLzLkP+mmYa8pj+3RMibDrEV++a7M=
X-Gm-Gg: AZuq6aJn2nKct+KOWQPXL54FMLU65bv+WMKRKawehR1z6DE3QHeVgLiI/tqNxWD4wye
	1SU21+udzl1iltzpq+C4d7R9NKgCF4sYr3VPP7w91jcb4U2YxTEDSsBoMnmVZGqqIaUbsnJLhf/
	F7BRRfFRdc1ODHeDarjosbbk4+bcwRCTiVyzjknS9907ugmCiJffoOPHpDKiR45MN6Dlp3WcmQD
	4ZMpewMUXzvGGb1z3T8snGovMQZ/BgMvAzSNUHx2TTTwvLdjJ4fjiCLW+9i4yZU/ByI+Tr36vj+
	BgrqM9IN09lo2aYnatRJE/B+NSDwDR7YvbF53FgxO433DWmg4tt25sfXU4NWIoe7xhQMX2wg5F8
	m5NDNVIyUMe8VyYBvcTtg5Vt+18S0Q8jywMEZ9yfxMPon09ZkABXSDa/b4wyj99sK9beIYeueRv
	hhBv8BObXRkpivMM/pqATcWxxgIYAhKB8PkhPtvdU=
X-Received: by 2002:a5d:5d09:0:b0:435:985c:48f8 with SMTP id ffacd0b85a97d-435ca39ad31mr6124120f8f.45.1769423522276;
        Mon, 26 Jan 2026 02:32:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:01 -0800 (PST)
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
Subject: [PATCH 1/7] dmaengine: sh: rz-dmac: Add enable status bit
Date: Mon, 26 Jan 2026 12:31:49 +0200
Message-ID: <20260126103155.2644586-2-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27414-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EED0E86FE1
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a status bitmask to struct rz_dmac_chan. This is currently stores only
the enable status of the DMA channel and it is a preparatory commit for
adding cyclic DMA support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/dma/sh/rz-dmac.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 35124043ae02..95ed357f2b74 100644
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
@@ -302,6 +312,8 @@ static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
 		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
 		rz_dmac_ch_writel(channel, chctrl, CHCTRL, 1);
+
+		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
 	}
 }
 
@@ -313,6 +325,8 @@ static void rz_dmac_disable_hw(struct rz_dmac_chan *channel)
 	dev_dbg(dmac->dev, "%s channel %d\n", __func__, channel->index);
 
 	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+
+	channel->status &= ~BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
 }
 
 static void rz_dmac_set_dmars_register(struct rz_dmac *dmac, int nr, u32 dmars)
@@ -578,6 +592,9 @@ static int rz_dmac_terminate_all(struct dma_chan *chan)
 	list_splice_tail_init(&channel->ld_active, &channel->ld_free);
 	list_splice_tail_init(&channel->ld_queue, &channel->ld_free);
 	vchan_get_all_descriptors(&channel->vc, &head);
+
+	channel->status = 0;
+
 	spin_unlock_irqrestore(&channel->vc.lock, flags);
 	vchan_dma_desc_free_list(&channel->vc, &head);
 
@@ -841,8 +858,7 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
-	val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-	if (!(val & CHSTAT_EN))
+	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_ENABLED)))
 		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
@@ -882,8 +898,10 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
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


