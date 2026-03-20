Return-Path: <linux-renesas-soc+bounces-30014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFnkJbQvvWmI7QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:29:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A61832D9939
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67231302A9CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5AA3AC0D9;
	Fri, 20 Mar 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ln7tn2Vd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8093AB277
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006139; cv=none; b=Wlfc3qJjRnW7wEBumumznk1CbuKPhR/EGc9YxztabtGgdNL1xFNDCFxlMxd8Xa+L9Vc3+bBuwfTovG7QtBW7P7uNy5Ef9kgN1rzrfAHr9tXFhWJ+ZC+xQ6RubdMJ25RWe8hmowCPXMMqaVQfd7eQELgBT6bj6Pyqw+UcrFex7ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006139; c=relaxed/simple;
	bh=ZIU6VE1rdd8h/W/u6JZmxearSKQT4cdulYKTOXV8vf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckiTRNtwpyu00F2rIVaz+LcW5SrweyPhp/EqOrJKSjzgE1w1HJzyOu9aOsgqqYph/heh3Ek/RDqCe3tx7RFs5DvXHwBFWwVyyp8Nw9FtmBvBkqqjCYOHj06ehknv/zy8Jx7iiSzOUVFUDb5Gz44iK6ZAQCCvwkcWss783DG23n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ln7tn2Vd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so5868565e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006135; x=1774610935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxH8LfUYZeKM7Jz/vL5iiWORgbu1oqnI0wnugAc7pg8=;
        b=Ln7tn2Vd/xaWBuZvnC1Dv00t40u9P+GmGV07DSu+KOAtQlDjpa1fxTTlSEDSxazW3b
         vjkF6WyY+IGyWf+7ug36rmplxFq8Wd+rPBqLeP0kgs7pN3oyXI37s7yt2sbm7sRyyWLA
         QsTeWrzSrnT91cx5GABhVPQZFvkrjH+ghaplkdz6kr6nc49XRZ3bYuKztfQDx1YhooO/
         GHvbtGZe1tsDKo1FpIaWrG3qEkkBSoLV2TiLQ0XDu4Rr0QTctrt1zYdZoPVdmvT+mAh8
         4x4n0h4b/Ia8Coy9yI+rtElrALojjs93n8eXkT+TC0WDVielVaNSaV9teeGieeN1dETK
         rDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006135; x=1774610935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxH8LfUYZeKM7Jz/vL5iiWORgbu1oqnI0wnugAc7pg8=;
        b=dfmTM+/zPX5oSAkl+i4Uw9T1VrJ564rP+UZjO5UOwAYVmdSToAnO3n0SJL3BU/YkjD
         UKui4/mApOptgE5FQ2VSNWU7iQYQvE0dqvUT0gzVnFCvox5tWhBfT3Fc6ERjS4ryvKPH
         7NoJW/8Ch58HPrjaTnoFJUVYc07ffopR2pRef85rkqZrPCkDBRddIMSWB0OzlZWTpI/i
         Fy6qlKPzlHWwmXE+PzltasQIHWgxQIso2rKMoWAHbYfezrFvFgsYzXzT98RcYnENjWO4
         jDaclu/0S5LuoPurKBT8gd/8PZUqKjPtlKjC1JAM9GBHB293Un1z8qGGQbqHIRE43Hoz
         Q/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCViAeLXHVndYFRnujrHKQEfkXTCVXR7woS2m0moFv7p40ZqF0NLPorvRNkhBRMLXorqqTf6qJU718pBgP2DeFESYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxta6zZLYgxnXAS+0UbDNgqY3wAR1FumUhvMN246rYll0YVyHvf
	GjOKTXExu8+okrg4Kou3V+8OBd2HWcn6Q72/pGSp+bdVMVrDYvPlR4owwibD0IiWilA=
X-Gm-Gg: ATEYQzwiz9m9q3egSpuqYlpQJcyxDWDRLYM4w1QgwlJL3p2nf9DN2gOoUaT/pRdn1Fw
	ADy5wzooLUD5AtyPZBs/olFJ0riMJlekacWslcx0hSEr4eAQtF6Z0UKrIIdDaljiI7ro3A63Kk3
	t2UXFAxyKdI+Jn/89k62zYtQbZdJv5rHHGKMB2FkFJM86ObbCPXs3pFW3M5O8E4e2IeKJJYqXgf
	EaO/rlNvJzF6Dyhgewl8zBnZcbOWoQjCHuuh9gEde/LtMS4SyrHwklWtASxtyNMeNcccV8z6yPA
	RGYhu1keeljHmUWdKgYrleoNsF+plgsK+IqvsAYJDjHokCR3hr64atOanVjQqbDGPv/MPhU127f
	uoVp2/LggGt7V0YreBtP1OoNPTjQVEuA/GGr6CugblPLBEGdDCeOfgL1NNdwXCwg4TQbCeR+qAA
	d+ks8mOp5MuU4OhSrXlBKPbQ7RC2pnkm8mnQF9pcUxqQdv3lFm4Mvya4tO9mI1w0M=
X-Received: by 2002:a05:600c:1e09:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-486fedfb677mr41638975e9.11.1774006134684;
        Fri, 20 Mar 2026 04:28:54 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:54 -0700 (PDT)
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
Subject: [PATCH v2 7/7] dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last descriptor
Date: Fri, 20 Mar 2026 13:28:38 +0200
Message-ID: <20260320112838.2200198-8-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-30014-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A61832D9939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On an RZ/G2L-based system, it has been observed that when the DMA channels
for all enabled IPs are active (TX and RX for one serial IP, TX and RX for
one audio IP, and TX and RX for one SPI IP), shortly after all of them are
started, the system can become irrecoverably blocked. In one debug session
the system did not block, and the DMA HW registers were inspected. It was
found that the DER (Descriptor Error) bit in the CHSTAT register for one of
the SPI DMA channels was set.

According to the RZ/G2L HW Manual, Rev. 1.30, chapter 14.4.7 Channel
Status Register n/nS (CHSTAT_n/nS), description of the DER bit, the DER
bit is set when the LV (Link Valid) value loaded with a descriptor in link
mode is 0. This means that the DMA engine has loaded an invalid
descriptor (as defined in Table 14.14, Header Area, of the same manual).

The same chapter states that when a descriptor error occurs, the transfer
is stopped, but no DMA error interrupt is generated.

Set the LE bit on the last descriptor of a transfer. This informs the DMA
engine that this is the final descriptor for the transfer.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/dma/sh/rz-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 6f83ccdf94c6..95a89c9d2925 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -206,6 +206,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_LE			BIT(1)
 #define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
@@ -376,7 +377,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	lmdesc->chcfg = chcfg;
 	lmdesc->chitvl = 0;
 	lmdesc->chext = 0;
-	lmdesc->header = HEADER_LV;
+	lmdesc->header = HEADER_LV | HEADER_LE;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
@@ -418,7 +419,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 		lmdesc->chext = 0;
 		if (i == (sg_len - 1)) {
 			lmdesc->chcfg = (channel->chcfg & ~CHCFG_DEM);
-			lmdesc->header = HEADER_LV;
+			lmdesc->header = HEADER_LV | HEADER_LE;
 		} else {
 			lmdesc->chcfg = channel->chcfg;
 			lmdesc->header = HEADER_LV;
-- 
2.43.0


