Return-Path: <linux-renesas-soc+bounces-31178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM6YJEg12ml9zAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:49:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E03DF9B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D6C93065A5E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAA734D3BE;
	Sat, 11 Apr 2026 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MLKtE0J4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33F359A81
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907811; cv=none; b=LBSXJDF9zYdyLK9n7KE2QKpfbS8seXBthIcEJAWCSNI8LiY5PJLDLFHvq0hLCIEEFpvYv57n8rTZ23c7d2vFiMk4qQRj3pMWh89orV5FbR1kVzA7BO6/C59QMQh95/2cqC3/8h0mroXNE+1rOHCyv/XqiJ5Zi5Blcvf4osBrKWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907811; c=relaxed/simple;
	bh=IW52sWUaqMFEY6BbWKKClK/wbgEBkQeALR5hdqMA95U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtdsanf3T4mX6AtLKPlWIhD6SCtfzkwHsUjr/EzfoAxmofHDiz+shRPMbtaWae5DiQu7keMGmmszYuHjQvymWORh/eIwwPylgzOlsocribcZtTEjc35Y8zLlchvljXsuCmDzW7D36SLdlC7tEbmqcdSmpoBl9HkQP4Ml9pv1k1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MLKtE0J4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1721731f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907808; x=1776512608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zdkb0CAXfpSevM/ivqXKAKRICDyAzezyAIbw20Wd9A=;
        b=MLKtE0J4OBmPZxXaz9RiZvRq2+nnNzXMbYGy2n/ectLDEhjHo+XxPM0s0XkB3bgoxl
         i7N5QlSfHqxhen27HErppclZvCimwOzUem7Y2LcVjnq/185sRvBR/vaeucKJmz6bI/pI
         IlFb/uBzOJQkaeR0MUy7rHiJoKYOjqtQOl4e/RmbL5sIFRIBpnY5R5hZeVp/Rc75TdE+
         HbXItGGWO72c+P5Tc8RnXaJUb+6uaZhQntmBBlXhTjw9+ya+r76Tr6PbpDRq7YBWLgE9
         T5uXW66wI9fKsMgiWfXtFf+AwhZlTMEfZD+gRfOzl/4CuM7Q/MhrpbYdmjzaqV269onT
         BVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907808; x=1776512608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3zdkb0CAXfpSevM/ivqXKAKRICDyAzezyAIbw20Wd9A=;
        b=eSP/OpE3tJHp7i7G8UfKMgt5gfYGCZJUhMSdtmB9j8RjyTsf82qvkg/T/HCy069WOk
         +YWlQqju6+cJC6EwnsDYAdVbuPl4mSZazioXPiARBlUytTusOctPWLF76fuWcJIuv7PJ
         xD8sYAL6ZjII/00zeuEcHZnqwr0R3ibzObyobIHjVYAJ/60YH72K1pLLc8Ikb60D1HRK
         MuPfrBsEx9MzXQqZ2wdBM5ZNCJ9qPTmXo7Wlag9agWO3AeGFKeNGfuqMmXiaO0tKRdF+
         DKhZWgBeQCMHvAhSj9+z7oHL5wRibkd/xThZ4/V0oiMDTcwBVtqitHk9AuAlu+d94YUc
         wXwg==
X-Forwarded-Encrypted: i=1; AJvYcCU1UXDPbDL3Edcy65/7PScV3P7U6vG4igL22GZMi7EAfAs/XxgYRsrJ6VNfXNIamJ8uNxHl2NucfVjbUe4zz3RvXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzOPhHK0aYFr5RrsK3DBnvS4EEoiqqVdg9/eP/WyXTScrt3dC
	NgYlV3xfQ2JDc/Fa+IPMz7B24EG+eboMSVYGtribFqud8sbJdFUSgbDnwuGiiZ15zYQ=
X-Gm-Gg: AeBDieu36eWnvpAp49CtuEowQQFHgth0bSIF8CQPAZ2XTL1sByZYQNecqeDNgfR13IY
	Iqh+7Msu+EQxCZBLjWYe150HfAkrEXqltVbsmEw1LtWiTmCvTO7Wc73YzKDxsjkVB0+Wu42sAFz
	RzWSvq7auLfe9kTBGF5mLX53XeN3xPZe3ODu2U3bIv4ybHcKQQSJPKPRIYTYEU/WkBoZVY3tNb6
	VqVFxTQTeu1aGdIuwXKrwrQR9q1RhIOjCMqwO+F6gnXNfZcWM0BZ2whSG3wPTTTJP4NLOJpndus
	D2n7XczXDGiS2tyy4ZSeZQ/ETfeD2+UGD2lU2lWi+ePfbruX4eBPe8OZO8HHNSAu6qBkREL7Ogz
	P39fwJNsuIzXtyV3VxrDBc6lBUHW6q6VL0NEfaIgvUrnrXfT0TXlirJzfag2V3rvwpmASf6XejR
	vJRnMX/AsUfix6nR3HaX5ChDnrp+QO5lVlSjRsghAJslA2PpU/6iH+
X-Received: by 2002:a05:6000:2304:b0:43d:1c3b:2dae with SMTP id ffacd0b85a97d-43d64255160mr9442521f8f.9.1775907808486;
        Sat, 11 Apr 2026 04:43:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:27 -0700 (PDT)
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
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 12/17] dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN
Date: Sat, 11 Apr 2026 14:42:58 +0300
Message-ID: <20260411114303.2814115-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-31178-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 141E03DF9B7
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

Changes in v4:
- set channel->chctrl = 0 in rz_dmac_prepare_descs_for_slave_sg()

Changes in v3:
- none

Changes in v2:
- fixed typos in patch title and patch description

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index d009b7607d44..958ee45abc70 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -377,7 +377,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -428,7 +428,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
 
-	channel->chctrl = CHCTRL_SETEN;
+	channel->chctrl = 0;
 }
 
 static void rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0


