Return-Path: <linux-renesas-soc+bounces-30924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOgKNJMJ1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:41:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944F3AF548
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0459A309409C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5300E3B7B99;
	Tue,  7 Apr 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l+sATYvk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93A3B960F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568939; cv=none; b=WH2zKhp+I0xcy2r8AJiMx5tmc4iGwEhQ8MHpmAFHcJKdn0On+w9bHOWL7a5XtZtP6FlGV97mlCpHe38ONM+2p7KJfpPFZiyOVZIFb/c4So6V9Iqdz2UchtHg1u7ripKXrVVwxhnZSNd9tFshp4KYvStUXq03W3UMddYdUVslOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568939; c=relaxed/simple;
	bh=wlgiHcw/Rk80blgSRKmBaac9zbE36CHj3pI+3DwhduA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0iyogrTmAWWCxZMHQyQCsQUgFp7CIqRfco4HKAe2dPBsHd+40OpBQRZ9gyA22a+dZfHzNOwnm19oKVPouDtSZxHCp9MKpOympE2UMoXI99aVHznJGD9w/JzI9fPP0Hvbfg0Wd36uxkt9hQ9nsRV8gPgHSWjb3UBi3AD7Y8v82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l+sATYvk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso4656223f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568935; x=1776173735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTJu85pQngl59MNDpS68s7UI0YBuMw9BWj2f+iVnYOc=;
        b=l+sATYvkvpwAyWBkV456ZreNDwKAqQXW58CplwrCTzkqJ+DQKpIHT60q20zwd+pzDd
         eFqJUckAiVGJXpwV05ky94WIJitohLI/a7jqvTHxmVlpMKQExsCaakDqylGOXIbhA5e0
         F7pPcDU5ZKE61CGudJ2rUYCpKijaMEBIV9jkRe7wg2ymZsWtpBsKsA/CwPnToYR5binA
         FA5RjiKlOcXl0QHxC/7wWSIGtCHOO6V0cUgamc0tYk+2iYtqxnSXExDGkHzO8UBkDvy4
         rgYqXmq8ZfIH1+frnYpIfX8eSjSZPWHgwvKMvl6YRQRzNp420xNSh8YjNc5F3CFUSsRC
         IG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568935; x=1776173735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTJu85pQngl59MNDpS68s7UI0YBuMw9BWj2f+iVnYOc=;
        b=a5rKwYd7IVGnoje8sriX2/xNMDl4WMsklUajIwpMC9T87j++3gm1AVGJACucqYiIDQ
         y/FmH4VQIqh/QWaw+u0BEymDKjUfnYLekGjRWBE3jMlLHxvZFb+a0BjHRkPKWrQZBIcF
         6Fpxa4ZqtFU+GV6n8NBgScCKtykDB7VV0TBqAJ/4SOM8Ka4rq+rF31hCdcPSoqpfLv0H
         2mxYUjc4jE6dmX9WPmHc4czqaZhuwPtQ9agAiy3Z8j3m1P+swV/XbaqYcVAZcgWKfo8P
         E+FBPvLuNsFaSV+9BHhoSKFu5iHSdmrj6fhdEXit4oqKMHW7WlHdJQY3cUehkSh+iVGF
         0AZg==
X-Forwarded-Encrypted: i=1; AJvYcCUjN4IHujhxn0HpJcGwl8endClTIGPD4cRd83zCKX/+d3EE2/4CzkNf1wAqA81IzE6y+476O0Hcm7zoVkBVZRiVsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gKnOsqtggEgdrUsLhfFRh/L69EYurw/fEkTlu4XlQdCMiITg
	XkBrdj6IKNYYqQK4zyvsDr3M3SeDP1xcq1n/OmJopvWNoUjSv8gGYMFIWmdaZ7QChc0=
X-Gm-Gg: AeBDietgEOy7Mod/QaRNNekMTpa4Xw3PEirx/YQw7Kr32DHJhfmsXM8PW5/xzasF4Vl
	UoYhll65f+uLiC1FJv4XqoNWxYyhN4BxRsFpl79rNsE07rt8M9wNfYMdFo15efbdxY+SpfzaJI/
	TEmhRqbIBxquhiZhoCD3Y+hcp6NZsOJ1fztHgNDf2PNC/yBWnDxlMmX1UMjt+Ul7KL2mNU9lwY8
	nG7BRmI5npogHlCFh57PDJ0c/j1QcnsjLKXmISK23WtSIbu1i+0kCYW361vk8be8tvqumEbEKxV
	NIgvWuWUkLkl+1lJuEhhGEPElRNbRT0N4zQgOA1GD0XLizmm9aCYt3Fw3HH0ySpZof8nBsGerWr
	cH6cptDLnS6Y/IhOr/XhCPsue4YH5upAzJ5PoJSP9bMUzzin+N26U/2IFz1kaishZ4ydG58Z7DI
	LSFdCJ/5CSI+EOiBBH/MR7pZELv8dFAy2EVYuns2keu+IYp0uMhQn0
X-Received: by 2002:a05:600c:46d5:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488995d5fa9mr245123205e9.0.1775568934551;
        Tue, 07 Apr 2026 06:35:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:34 -0700 (PDT)
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
Subject: [PATCH v3 05/15] dmaengine: sh: rz-dmac: Save the start LM descriptor
Date: Tue,  7 Apr 2026 16:34:57 +0300
Message-ID: <20260407133507.887404-6-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30924-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 4944F3AF548
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Save the start LM descriptor to avoid looping through the entire
channel's LM descriptor list when computing the residue. This avoids
unnecessary iterations.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index ef775ffa1099..cd639aa9186a 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -58,6 +58,7 @@ struct rz_dmac_desc {
 	/* For slave sg */
 	struct scatterlist *sg;
 	unsigned int sgcount;
+	struct rz_lmdesc *start_lmdesc;
 };
 
 #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
@@ -343,6 +344,8 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	struct rz_dmac_desc *d = channel->desc;
 	u32 chcfg = CHCFG_MEM_COPY;
 
+	d->start_lmdesc = lmdesc;
+
 	/* prepare descriptor */
 	lmdesc->sa = d->src;
 	lmdesc->da = d->dest;
@@ -377,6 +380,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	}
 
 	lmdesc = channel->lmdesc.tail;
+	d->start_lmdesc = lmdesc;
 
 	for (i = 0, sg = sgl; i < sg_len; i++, sg = sg_next(sg)) {
 		if (d->direction == DMA_DEV_TO_MEM) {
@@ -693,9 +697,10 @@ rz_dmac_get_next_lmdesc(struct rz_lmdesc *base, struct rz_lmdesc *lmdesc)
 	return next;
 }
 
-static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel, u32 crla)
+static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
+						 struct rz_dmac_desc *desc, u32 crla)
 {
-	struct rz_lmdesc *lmdesc = channel->lmdesc.head;
+	struct rz_lmdesc *lmdesc = desc->start_lmdesc;
 	struct dma_chan *chan = &channel->vc.chan;
 	struct rz_dmac *dmac = to_rz_dmac(chan->device);
 	u32 residue = 0, i = 0;
@@ -794,7 +799,7 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	 * Calculate number of bytes transferred in processing virtual descriptor.
 	 * One virtual descriptor can have many lmdesc.
 	 */
-	return crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, crla);
+	return crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, current_desc, crla);
 }
 
 static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
-- 
2.43.0


