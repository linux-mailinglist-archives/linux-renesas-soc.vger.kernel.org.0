Return-Path: <linux-renesas-soc+bounces-31169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAChLBw02mlqzAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9323DF8E2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 602E33069BAB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D60C346E71;
	Sat, 11 Apr 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UaQ8JVKm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93211345734
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907796; cv=none; b=Z6dhdahws3XYJFMZr1hg42WDgFhHafzhRJN0Hsc11+if3WJortwS4bRDy4+2A816CB9nlezmPJDgBiZ41LqcQHbbkWkiKFIFMOt9SzcL1VMxFhhA4kQaVP9zb+ai2EQ423KWCd9L0Cz6xGAdFxAkCmlIeWXxD7J/rpaxO+S72tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907796; c=relaxed/simple;
	bh=ZB6OzeV1iuOY4cphwcy1NTv7nOJuOcS76pQLBa2mvQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFreNDfOTdqef0CvUbmsye0EFXafgvzwfjfPuP+n1ON2b0B2aFXBpMnaOnn/2Mt3+b/4VCRlNHDDGA4fMyQJjFP08eTPik8UUFFCjQXKZnMHyuGQMw0G4GIPx3QvYTNGmflLi7FrwuTzlhfTlxlA9m58TdTihXNRw6VSEEY+s28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UaQ8JVKm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso2887375f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907793; x=1776512593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j+XdlT3aD7tJGwl9xLTbJEKXv1OztcK3gKQoyq2CgQ=;
        b=UaQ8JVKmly6Bd6KpAeT0HIxw89p8cBqDvUR3YQYkHE/dboPgPUIt5zz/3sQ9WRaykp
         WjWbWfeL4ZrflH41LxHJTDeWLNW9qevlHTs32AF5taRIYUe6gRsBhKuhWvFEL6mm29Zd
         IgkuzXYeNtW6KE8Zcfsh44WGDVqoTaudNdQGB5CxAXlOuj2Au7k918yjvU2FivDomPS+
         IXP5rcA6ADrXnJrGE9C5324eOo+B1XnRaUiiwU2n3ZgNSfdN0f9wEmA7ObbC+UelynZF
         BbOmyfEcjSgMWf3WfAs6+T53SvB2A/TmPFdILdbUwdNoIrnifDlezgzkVBUk1TZDbycQ
         fa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907793; x=1776512593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7j+XdlT3aD7tJGwl9xLTbJEKXv1OztcK3gKQoyq2CgQ=;
        b=VgTtZXwkr03QYe3GABc7KomqljY9YdGZ4MG/hcWyJwaMMmFBn9tAzCS8kHjfltj81A
         Mrd9q9vYCWwUBUAIql3kVJ/0/AwvGqGOKVRejkTRB8kL/b6fKA3gQWn/ZH7+riu1Vog9
         CibLoUemS57gDIWOPjOi+jDqBo2XumpQlLO/mSoUgOuByT1Fup/SX+BJy8E+zUPHx/Yp
         oH7sSbWuksWYyS0IbLaEAwtfZvTraE2ivqkDlWPzdIfJ0AIS10pZAcdVL+pru+fcLnF9
         Zzq4Aik8Q9hxLSndYj/nn1TZ227Zx1iSFfVZ1oP9bNRzru4SdZ6Gy28f14ZX0dKBMRFs
         jCaw==
X-Forwarded-Encrypted: i=1; AJvYcCWFSndwRm0qCBJ+gkawoM8Z7abL4Y3Hn/jcr7Tj9AMlQRrhAK6Sc/Or3bwY4m+HQTNnxEJP9VkBdjux1rlYGmJchg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3SwSWy7yIKSo35CjEUdAtfpXBk4j1d3ap7m9k9NWNGdi+a/g
	GXhLxhUGNcYNrKtIvV52GZf1MCgn87/h8pvn8sGQLXGA01FBbdyzqnCA6fluc4Q8/GE=
X-Gm-Gg: AeBDietCM+E5xi0+yUqkhIub6fz6ns4/wy4weiRK7c4R3pZ66kWT1vpKQDfxr856sXo
	S3vy7eXu56GJqEyAGmbnrWVwV71OmrmQeD6KGYf3oK8ItlmbIVQ9aw55WCiQAdoIZ869R5ckO8j
	t6mm7KFKIucAujwylHGkhbDHFNcqrDmaIy9iqMLxB+aIgumZLW3/uA+fwjm94SgZfW9KJwUd1bb
	EKZRsk+2o+Wm/1vY9bR++2taZqlbO/RXFphZUmqXosh9Js26Al/jzv5d4Lh9/vWYreJwlfnEd4q
	pjkhh68h3Xy3zr/Enqi+vp4eD18yRIdakrBDsf/0n3dQe/vykh29dccKaOEqpyKfSeJUOqcDO9S
	ZcS2w7Tt2lPB0n5miis0h2r8cGV+/1c9L8Sj7PMwlljK5nz6eJ30GW+fIIqoxc6ykmIaAYr7UlR
	mqTdPoJkWnUrnooPEFltphpCz4IKztOIluZYrxtPkXwvpj3XaSePh0
X-Received: by 2002:adf:e80d:0:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-43d69ff69c4mr3162191f8f.9.1775907792998;
        Sat, 11 Apr 2026 04:43:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:12 -0700 (PDT)
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
Subject: [PATCH v4 03/17] dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
Date: Sat, 11 Apr 2026 14:42:49 +0300
Message-ID: <20260411114303.2814115-4-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31169-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 3A9323DF8E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use list_first_entry_or_null() instead of open-coding it with a
list_empty() check and list_first_entry(). This simplifies the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 6d80cb668957..1717b407ab9e 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -503,11 +503,10 @@ rz_dmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 		__func__, channel->index, &src, &dest, len);
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		if (list_empty(&channel->ld_free))
+		desc = list_first_entry_or_null(&channel->ld_free, struct rz_dmac_desc, node);
+		if (!desc)
 			return NULL;
 
-		desc = list_first_entry(&channel->ld_free, struct rz_dmac_desc, node);
-
 		desc->type = RZ_DMAC_DESC_MEMCPY;
 		desc->src = src;
 		desc->dest = dest;
@@ -533,11 +532,10 @@ rz_dmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	int i = 0;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		if (list_empty(&channel->ld_free))
+		desc = list_first_entry_or_null(&channel->ld_free, struct rz_dmac_desc, node);
+		if (!desc)
 			return NULL;
 
-		desc = list_first_entry(&channel->ld_free, struct rz_dmac_desc, node);
-
 		for_each_sg(sgl, sg, sg_len, i)
 			dma_length += sg_dma_len(sg);
 
-- 
2.43.0


