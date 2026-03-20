Return-Path: <linux-renesas-soc+bounces-30010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCRQKccvvWmI7QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:30:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE72D994E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BEDE3043AD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56303A9D8C;
	Fri, 20 Mar 2026 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SkFXGbql"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175D3A9015
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006130; cv=none; b=KjwMI6gxk92Zt9ANCqPcquwh4H01vGWVuI2HYSryJa5EuzL1hlVkefEnNPBlxBgAY70TsdSJzIdmsA2a+V4mcItC4rom7Y21FnWI6ThFK/iC/z2ZOdeOV2h+dUiN0i95zwDp4EZyhuIbssnjUB89gIcu0bhucpv8HD6NRhcZy0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006130; c=relaxed/simple;
	bh=GD9E2/SQwtIIE1eJkpGHpxa3R5g8LJo5xRqW215y1pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTWNMqvEMGTtmKq6sdLb5eePQGB77gjoshA7+mLQYesvCEa5Ggq7kfpOH+C94OUDIxG2nrM3gobQPUEGqHKo3nLPncPGoixBj8pHBLSnrEL4HSyGsCGqVZt1PC/QORhOXe1crGrNT/0+Tb7yAP2gcq6d+KoU0RYGVyJGOlVLxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SkFXGbql; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so14565125e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006128; x=1774610928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZSF6Phsi5Ep6XqjzxpapK7aNLJkF/Hb03hbbBTs8F4=;
        b=SkFXGbql1tHWC0FQoTE5nLfAzdcerDWpmihpAW3yl3f7vb5v8AD+AYjbyCK6p6pVHE
         FYyHiRPruswVsJ8bcnWKIQ6bPoEi1qeSytHvw+6+pxIVEXR3Lr04b5xm0W1Sc6sAxxJ7
         ZjVk7bRRVmQfuSEnUca1dsFdNfCO1Fx5prX9mo+Wdo/fFiNkqomspFPB9ajZvoqGHGEq
         GUQSk6BCI7HEPbG0bnpwlzvEYugZJu0rXkGJWO+7Fcl3sxnlzLboOdFsq+e6oNXEhtU/
         Lg3CLnWrCGwlqyBXm2BrOYoI+fcfKpOYw98AwJFb3MYlvBgQVcjYM796xiFdd41ibMTX
         BcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006128; x=1774610928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZSF6Phsi5Ep6XqjzxpapK7aNLJkF/Hb03hbbBTs8F4=;
        b=Pyz9OdpCZTSx/FIkHfb5FxgoMZurQeq84PV7dlL/sD92CiFucYA5k/Oq/zB4WsX1GA
         paYbcDqfTIaRW530k5NRzaFypXHjF2EvqlglGMpdi81IPDtlhwt23pEGmjQaoLigVGMy
         dgDfROtvtlyd188x0/B9HEyPnRrKHwVNthilrZCv9mQhPrsvc4sULscC+PQaHO++dRxP
         aJVpomhfriv6OO7N+UYmh4w7zEVZ3M6CanavfFHO5XHjedlZNieOGIxuRmy2Y0IaFo3R
         kzMhh1C3vgBrgdjkQoHT56pyyKXB1/j1Hcv9tNGJs74vIq2W0m0eqPUbseb+aF1mvNI5
         A2gw==
X-Forwarded-Encrypted: i=1; AJvYcCWy+pFAKVa6TGxDuQ8Jt2XYuwv3LUiE7Eua++UC6mLEvJvuppOJ/3IZqVjtO4s7NXYsi9fvz/Sc1s3BtMSRPNeS7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUkwQPUxvF+uL4s/3H3WYTS1BVnTGSxcEnUNBU3tf6z7kIAqU
	BDfOrDV0wgtCfyDOXg2UgpUrS35qvnhjAD9fD3v5QgACQAhCPKE5isfp5GhIOguOsJI=
X-Gm-Gg: ATEYQzz8uvjIWSu/829OjVryYbAD6Lto1EI1U/u2swEjEo+YN+33e0tpZHyv/xqcluT
	XeC3S+vQcw7O2RF6SkpV5Ln+C+Y00sft+Y050gmrwUidF23G8ej4IsntXpTLj+C9GwTpgrUJe+S
	WkFOeVQVdH1dbm5mpO9CY2oerKz9pASKmKCf7YGSSI3a+uQUsEZgTzFwzfl9v4MAC+F39ecqSp9
	I/urWyxn/4d06wJBubrZZeXX47yQiuEUJB9IXBy6+SR5R0IzDUGZQHkUESzhWKgqYrKW9fLm/Hl
	HH10xKH5G0TuNUvK25LH7HqqA+QhLWGwetUDV8ndRHA4fH106BuPQNgprQRiqy5woErNL0x/Ztd
	h7o7tN/oFNxep1gLW6ZqZAcPjaCi01xWiTM8iJt8y0plGVkdvumiTIEI7C0hB7KCw6A4AlkQCp0
	A61+Lf7GLLTNqmM47V+unDpoF0zE3Do4Yk4DQP+NPXve/WNdMeAdNt
X-Received: by 2002:a05:600c:c493:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-486fedbd0b0mr40251935e9.11.1774006127646;
        Fri, 20 Mar 2026 04:28:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:46 -0700 (PDT)
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
Subject: [PATCH v2 3/7] dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN
Date: Fri, 20 Mar 2026 13:28:34 +0200
Message-ID: <20260320112838.2200198-4-claudiu.beznea.uj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30010-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 22EE72D994E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The CHCTRL_SETEN bit is explicitly set in rz_dmac_enable_hw(). Updating
struct rz_dmac_chan::chctrl with this bit in
rz_dmac_prepare_desc_for_memcpy() and rz_dmac_prepare_descs_for_slave_sg()
is unnecessary in the current code base. Moreover, it conflicts with the
configuration sequence that will be used for cyclic DMA channels during
suspend to RAM. Cyclic DMA support will be introduced in subsequent
commits.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typos in patch title and patch description

 drivers/dma/sh/rz-dmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 32349d214f68..58446726afb5 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -368,7 +368,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -417,8 +417,6 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	channel->lmdesc.tail = lmdesc;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
-
-	channel->chctrl = CHCTRL_SETEN;
 }
 
 static int rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0


