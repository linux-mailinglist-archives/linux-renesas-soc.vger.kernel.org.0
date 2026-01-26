Return-Path: <linux-renesas-soc+bounces-27417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM4LNMRCd2mMdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AEB86FF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 11:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 515E2300614D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE18331215;
	Mon, 26 Jan 2026 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qCAFhOT/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6A33123D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423533; cv=none; b=dWE9H0FYMZ+gnZelZ4h0IMtQsACo4F/vY9oDXxHumSF1TZfyCZ5OviXQQBkC1El0knaMeIq83zsGHe5EziHSrdiRIiCgv4s5fkSW+4e6r/fP242KXkaUUegUfN0wjJ2dAJTevnJ2s//ErBE0n1U7iM87VGH9be+t6HKxj1H8NfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423533; c=relaxed/simple;
	bh=FDjnF4UpSTEPXJyCUdbDCAy/0GBL/PqeHCzZosK9sC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0CT+H6PhxS6FD7Vjwb6Z7t01Wdnj4AyBTYxWU7DXkl/IhXnsWOxVuGkpg3yrjoSyW4E18aGbMfWOd7q3jcgskA7oEzbfX7C0hdUpkDDjyYYR6NH0EtZsUFqej452Q1OQmXtsC78Zj/XbgJass0B4GLPeFzCw4ztJ1Yam+pgqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qCAFhOT/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2784650f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 02:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423529; x=1770028329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80qOpgFk0DdjKJ6kD9DW3n53HU5v2XYf93zHUR/W1S0=;
        b=qCAFhOT/+Ce/FkmRiwIf2a2KDA7BwW36bF/TX5gzIbqevuCpVd9HzKu7m5fzGd5t9U
         ft0bhih/T7rsZUNsspc3Pi4CEkg6mODn/gq9HK6KwLJMXRZ5BUIOWUWmL9HInnEMa1IV
         kMNiNKeH8KQ/D2bfG6G8yyqXGf75eZNdBDJL5d+w7hCyOyS6Mc1Q8VgyLgIJzkpQaYE1
         p4YmH17MvGPsqy8wVBm2KMgXpuQ7X8gW6IhNm4BBi/o+GQM00FyxJwiFy5gNcgXB8l5M
         uK7uxWoeWaY4TykkS8/EXz36qFtQC/HZ6xl+UAtZNPdqInDsy37KtqPTl1okVQ+1BiEz
         Lsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423529; x=1770028329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80qOpgFk0DdjKJ6kD9DW3n53HU5v2XYf93zHUR/W1S0=;
        b=RGutiGWpHb0df+sS2otkaDr1ebRJbqdHBY1M6EUtLsCykDqNebIS2lROLHqzt8Pdyv
         614/evZC4FTqM310T3RXJXkOR829LYWQDyJlDBNm5Tebd40TH43pwGiQuxlU89NQ9VYc
         uwyaPntG5lhJQwlpAaZhZLcOc4MQhKBsv7XN/Yb+QTBKCwyFjGxfrON0h8AF6rmLSiLS
         1o1dLAkwhZN8WRew0Eir3mbce1i/Eiwe1C6WFBG5iqg2YUYMYq5P/LrLrjXtKWgBkxHL
         P16RoSyZGKlQ70Jw5JlLLhDQjxyBOWgx8UwbQwiJHHKR+WjlECtu70GIINViE3ZvMWIl
         5Diw==
X-Forwarded-Encrypted: i=1; AJvYcCXzwU80Y/X32efktmbLoDcPUfTM3glmj6WsqLPBK/n0OkHozz6L4lLDHpl8cBpjPABrED/AromjtnF7tuvpp6dQRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqVNB7Wo6GIc76S1TmmZRCtLe9qvpGE6M5Rj5pWaM431Jj0H+
	N7XYs1YRVvrFrxOvCriB29sp1Ocy8Hf5HzN83Zclo2B4w1v+aGPv4b8gwLEO9p28eVk=
X-Gm-Gg: AZuq6aJtlwCntc0w795cdkIuJ8GGCHlRCTXC8mZ34vieu5EGGnZxIhXKytSt2i502yI
	AxL/DzxIjcunihsPDWy7hzPJKDlzrUw4eeBK4wZ2bg2BpeIQ6vndX7dH8OE5XiInnc1Y+P8Qvn4
	z/lqaGCuMISqBMS0VGfB/ut5X7j53Qtn3inNQqW/BfRP7S4vP8ciarrjnG2m6fmKyVie1SxvJEy
	mEbGr/NHq9eAPuJ1wxxBk8xx5ojXhMrR9kDye1oUTlM+EpiAsqSkDjkO+EUfBaD4ZmMy5Onk9ui
	JF4JIA167WpgUina0+QAre6nwwY1uO9yBuggGkCrRQ23H1Xp0F7BaCharHqtkEsbArB3iz8O4At
	JMC8FdDNue0Fw/0ctZnxP5kyCPTaeO/9tqH1wBXzrO4U0PU/3MLFjAJs0bVkFJghUibwLu3d0MV
	KbE90OD5IAhzzQxMzbWTbvL0mTinxl8heq8v2FJVVxGvucaGhKyg==
X-Received: by 2002:a05:6000:2c03:b0:434:24e2:bed7 with SMTP id ffacd0b85a97d-435ca0dd3d2mr5726046f8f.13.1769423528627;
        Mon, 26 Jan 2026 02:32:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:08 -0800 (PST)
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
Subject: [PATCH 4/7] dmaengine: sh: rz-dmac: Add cyclic DMA support
Date: Mon, 26 Jan 2026 12:31:52 +0200
Message-ID: <20260126103155.2644586-5-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27417-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 81AEB86FF7
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add cyclic DMA support to the RZ DMAC driver. A per-channel status bit is
introduced to mark cyclic channels and is set during the DMA prepare
callback. The IRQ handler checks this status bit and calls
vchan_cyclic_callback() accordingly.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/dma/sh/rz-dmac.c | 137 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 4bc7ea9566fd..ab5f49a0b9f2 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -35,6 +35,7 @@
 enum  rz_dmac_prep_type {
 	RZ_DMAC_DESC_MEMCPY,
 	RZ_DMAC_DESC_SLAVE_SG,
+	RZ_DMAC_DESC_CYCLIC,
 };
 
 struct rz_lmdesc {
@@ -59,6 +60,7 @@ struct rz_dmac_desc {
 	/* For slave sg */
 	struct scatterlist *sg;
 	unsigned int sgcount;
+	u32 start_lmdesc;
 };
 
 #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
@@ -67,10 +69,12 @@ struct rz_dmac_desc {
  * enum rz_dmac_chan_status: RZ DMAC channel status
  * @RZ_DMAC_CHAN_STATUS_ENABLED: Channel is enabled
  * @RZ_DMAC_CHAN_STATUS_PAUSED: Channel is paused though DMA engine callbacks
+ * @RZ_DMAC_CHAN_STATUS_CYCLIC: Channel is cyclic
  */
 enum rz_dmac_chan_status {
 	RZ_DMAC_CHAN_STATUS_ENABLED,
 	RZ_DMAC_CHAN_STATUS_PAUSED,
+	RZ_DMAC_CHAN_STATUS_CYCLIC,
 };
 
 struct rz_dmac_chan {
@@ -194,6 +198,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
 #define RZ_DMAC_MAX_CHANNELS		16
@@ -426,6 +431,60 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
 }
 
+static void rz_dmac_prepare_descs_for_cyclic(struct rz_dmac_chan *channel)
+{
+	struct dma_chan *chan = &channel->vc.chan;
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
+	struct rz_dmac_desc *d = channel->desc;
+	size_t period_len = d->sgcount;
+	struct rz_lmdesc *lmdesc;
+	size_t buf_len = d->len;
+	size_t periods = buf_len / period_len;
+	u32 start_lmdesc;
+
+	lockdep_assert_held(&channel->vc.lock);
+
+	channel->chcfg |= CHCFG_SEL(channel->index) | CHCFG_DMS;
+
+	if (d->direction == DMA_DEV_TO_MEM) {
+		channel->chcfg |= CHCFG_SAD;
+		channel->chcfg &= ~CHCFG_REQD;
+	} else {
+		channel->chcfg |= CHCFG_DAD | CHCFG_REQD;
+	}
+
+	lmdesc = channel->lmdesc.tail;
+	start_lmdesc = channel->lmdesc.base_dma +
+		       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
+	d->start_lmdesc = start_lmdesc;
+
+	for (size_t i = 0; i < periods; i++) {
+		if (d->direction == DMA_DEV_TO_MEM) {
+			lmdesc->sa = d->src;
+			lmdesc->da = d->dest + (i * period_len);
+		} else {
+			lmdesc->sa = d->src + (i * period_len);
+			lmdesc->da = d->dest;
+		}
+
+		lmdesc->tb = period_len;
+		lmdesc->chitvl = 0;
+		lmdesc->chext = 0;
+		lmdesc->chcfg = channel->chcfg;
+		lmdesc->header = HEADER_LV | HEADER_WBD;
+
+		if (i == periods - 1)
+			lmdesc->nxla = start_lmdesc;
+
+		if (++lmdesc >= (channel->lmdesc.base + DMAC_NR_LMDESC))
+			lmdesc = channel->lmdesc.base;
+	}
+
+	channel->lmdesc.tail = lmdesc;
+
+	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
+}
+
 static int rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
 {
 	struct rz_dmac_desc *d = chan->desc;
@@ -446,6 +505,10 @@ static int rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
 		rz_dmac_prepare_descs_for_slave_sg(chan);
 		break;
 
+	case RZ_DMAC_DESC_CYCLIC:
+		rz_dmac_prepare_descs_for_cyclic(chan);
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -580,6 +643,52 @@ rz_dmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	return vchan_tx_prep(&channel->vc, &desc->vd, flags);
 }
 
+static struct dma_async_tx_descriptor *
+rz_dmac_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
+			size_t buf_len, size_t period_len,
+			enum dma_transfer_direction direction,
+			unsigned long flags)
+{
+	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	size_t periods = buf_len / period_len;
+	struct rz_dmac_desc *desc;
+
+	if (!is_slave_direction(direction))
+		return NULL;
+
+	if (periods > DMAC_NR_LMDESC)
+		return NULL;
+
+	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
+		if (list_empty(&channel->ld_free))
+			return NULL;
+
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))
+			return NULL;
+
+		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_CYCLIC);
+
+		desc = list_first_entry(&channel->ld_free, struct rz_dmac_desc, node);
+
+		desc->type = RZ_DMAC_DESC_CYCLIC;
+		desc->sgcount = period_len;
+		desc->len = buf_len;
+		desc->direction = direction;
+
+		if (direction == DMA_DEV_TO_MEM) {
+			desc->src = channel->src_per_address;
+			desc->dest = buf_addr;
+		} else {
+			desc->src = buf_addr;
+			desc->dest = channel->dst_per_address;
+		}
+
+		list_move_tail(channel->ld_free.next, &channel->ld_queue);
+	}
+
+	return vchan_tx_prep(&channel->vc, &desc->vd, flags);
+}
+
 static int rz_dmac_terminate_all(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
@@ -731,9 +840,18 @@ static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel)
 	}
 
 	/* Calculate residue from next lmdesc to end of virtual desc */
-	while (lmdesc->chcfg & CHCFG_DEM) {
-		residue += lmdesc->tb;
-		lmdesc = rz_dmac_get_next_lmdesc(channel->lmdesc.base, lmdesc);
+	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)) {
+		struct rz_dmac_desc *desc = channel->desc;
+
+		while (lmdesc->nxla != desc->start_lmdesc) {
+			residue += lmdesc->tb;
+			lmdesc = rz_dmac_get_next_lmdesc(channel->lmdesc.base, lmdesc);
+		}
+	} else {
+		while (lmdesc->chcfg & CHCFG_DEM) {
+			residue += lmdesc->tb;
+			lmdesc = rz_dmac_get_next_lmdesc(channel->lmdesc.base, lmdesc);
+		}
 	}
 
 	dev_dbg(dmac->dev, "%s: VD residue is %u\n", __func__, residue);
@@ -972,7 +1090,15 @@ static irqreturn_t rz_dmac_irq_handler_thread(int irq, void *dev_id)
 	}
 
 	desc = list_first_entry(&channel->ld_active, struct rz_dmac_desc, node);
-	vchan_cookie_complete(&desc->vd);
+
+	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)) {
+		desc = channel->desc;
+		vchan_cyclic_callback(&desc->vd);
+		goto out;
+	} else {
+		vchan_cookie_complete(&desc->vd);
+	}
+
 	list_move_tail(channel->ld_active.next, &channel->ld_free);
 	if (!list_empty(&channel->ld_queue)) {
 		desc = list_first_entry(&channel->ld_queue, struct rz_dmac_desc,
@@ -1239,6 +1365,8 @@ static int rz_dmac_probe(struct platform_device *pdev)
 	engine = &dmac->engine;
 	dma_cap_set(DMA_SLAVE, engine->cap_mask);
 	dma_cap_set(DMA_MEMCPY, engine->cap_mask);
+	dma_cap_set(DMA_CYCLIC, engine->cap_mask);
+	engine->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	engine->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_0_7_COMMON_BASE + DCTRL);
 	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_8_15_COMMON_BASE + DCTRL);
@@ -1250,6 +1378,7 @@ static int rz_dmac_probe(struct platform_device *pdev)
 	engine->device_tx_status = rz_dmac_tx_status;
 	engine->device_prep_slave_sg = rz_dmac_prep_slave_sg;
 	engine->device_prep_dma_memcpy = rz_dmac_prep_dma_memcpy;
+	engine->device_prep_dma_cyclic = rz_dmac_prep_dma_cyclic;
 	engine->device_config = rz_dmac_config;
 	engine->device_terminate_all = rz_dmac_terminate_all;
 	engine->device_issue_pending = rz_dmac_issue_pending;
-- 
2.43.0


