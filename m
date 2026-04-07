Return-Path: <linux-renesas-soc+bounces-30919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPjVD+gJ1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:43:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED33AF5CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8BBD309624A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5943B6C02;
	Tue,  7 Apr 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WQviGMsc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83AE3859EC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568931; cv=none; b=XuZQrEOfTf1wbQcadu1XMk/iqM7hiXgtEd4rtv5fayupWbjWfFUlswvOUfy7an9YWUYMChg/BA17/10bsCyXxoA5kuB6+EkrtcTUl2Rim8gD9I1mnnEEIYpbQJBHJz3wOGpFF1Uk9xwqYeaRHHW65QX8Ek7Rt5USOBr4BV9Kmr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568931; c=relaxed/simple;
	bh=LcM1SQxlU2zEePNOi96MarO1mcGQ7md8H0StgtARPbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAEpW044Flw4tVQH04iNPwmtFlmg1gE8oa1wfTGFP4/hz8iDVSgcCCzYpGI0rZGLyR7hp1egsVvIhtWAN7lTPdjZgTU5zaU7o0y/4F7swJRXlVS54olDKqcLTSS/Uk7nd57Q8P72GoW6P76PXAbuAl2Q30kNhReYEmkNrzcIZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WQviGMsc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso21711775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568928; x=1776173728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCNFfp+Y9opqUXxX/kFeUJeNq0Sa3NxuCau415grZd0=;
        b=WQviGMsc+PBHWW6R4QWTxwm67V2khKr+ngGMwqh1WOalxQ1dhASp08TdsHXSl4zQm2
         tRn6A/WsnuiRzPAWktaDBfmiqccyd0PBJJbKvaIJMxGTThBMxwrmmBu7vqxvNg5Zo0Q2
         7Ys21l40Gv+fSmVHC1g0Tp2TVa2+NQxj7zN/4qJqtzDkeRds20XQRJMy7oUBh73s6BI2
         +iEeX/TsjaNvFnF9aNNlHULzvyYGfmUb1GdIAeXHzN9V9C4WyqLmorM+ajeUM7DR+iIg
         zr3NGWmqjXMoqMzNEyGRa8hq5Ax312SIv4on2s7DPza4MG7S1/x6tj4OrEvq5nYfRMrt
         +YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568928; x=1776173728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCNFfp+Y9opqUXxX/kFeUJeNq0Sa3NxuCau415grZd0=;
        b=gBop5yFlvA1Ev9SIFjcMl2c4msk/9CcHCI/ZrNeDJhd31VZ2Qz8zWpsUNrArAfXKyd
         x/4Roa2wlHTb1ZpKWVOum5jfDcDmQYrOpnYRkbOWt5SnN0yb1QyUDmq3nfEqmHSChKIa
         CKECmodTIcERkMqjhIX0gkxs/edTweJ/Nvi5zODt4+XHAhuxeggGEBR0LwPxp6vKVAX9
         yFfJMsT9FVUBY7051hcZwvfmPpbtvucUbCzCGuOVV5yOzxHhvdrveV2Mp8JQqQc3Y7FN
         imM0KTb0LuoUytTWx1VYNvlQKanroWqQlMW2JXBHAxZ1Bj2oB6+Qm0jnqsEW4SpH1PCb
         eSDw==
X-Forwarded-Encrypted: i=1; AJvYcCVY/TmiXhE6yO6em23LfZ4qcA5WFAHLXIGl8BhlnVlLqC17TqCsLD4pDZeRFXyxsyHMZH01eZLZqfDjmpOlqcKIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKMwXDGHRoj+VrdWE6uKJh2g9kZCHawBebT7vJaZp6zD5QO9ym
	5dLJCbAfZHHbkPqFaIUHic/XsrBYnEO9R+VS7i2Mr8bM5RBUa+8BIha6XJvbm7sfwqw=
X-Gm-Gg: AeBDieunvxVrsdIryDqOXgRPNMWRSehMnBidrhgRrzdTk+DN4G3vs/eMRlt1aAhcFtV
	Pg6CvyXhAeci54qmOFlgk/eBydyWt4H3qFIYA9i5j5tGYjN1E0Y0Wb+8Re9j55aYWqalrX/WgBK
	5dbONZfsW20/Te2cDPPoy9zxu1g8QZ1ODJrhlqDFQDog4EK45txKek405Nf2kVqqmktnymM/w/s
	0Ge5pz+kqjN44gixY3iica8AFOqtdwv83BblEYwqdEPvKOuPYVUbcYlTXqDLH5buTwkl6mkT8nK
	uQZD6B/AFf7P6oHonF7Kx7NJZn4j4Dk1ujSVStfLT7zTA8sI6kTHOFVVUhUPyphMcLDj9yVbVvG
	CEnd6ecVijRWydYlWiLON90NMJXfEeBDmGYqMyIQ/Kk3LbKcRH+wZmx9cOH/o4LfQr9so8aoEWE
	4MQKbPBelgotOMx8XZU3ii2U1XreHdtaBwzYOWyCavEgq1Uf6roPwB
X-Received: by 2002:a05:600c:8b34:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488997d530fmr246087405e9.22.1775568928120;
        Tue, 07 Apr 2026 06:35:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:27 -0700 (PDT)
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
Subject: [PATCH v3 01/15] dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
Date: Tue,  7 Apr 2026 16:34:53 +0300
Message-ID: <20260407133507.887404-2-claudiu.beznea.uj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30919-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D8ED33AF5CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use list_first_entry_or_null() instead of open-coding it with a
list_empty() check and list_first_entry(). This simplifies the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 625ff29024de..3d383afebecd 100644
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


