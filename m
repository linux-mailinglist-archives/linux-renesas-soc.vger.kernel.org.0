Return-Path: <linux-renesas-soc+bounces-30922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICu5Mm4K1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:45:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA673AF661
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B1D130A85EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F96C3B8BD1;
	Tue,  7 Apr 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jMnAS88q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C63B893A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568934; cv=none; b=p7PpEK93wA/maY0sQoSmQIu9aGfVYDT6bBEMc/Vkqj/EFzl5ZZfhtZPPuW/osV9mKtUDybV27i6gAvEg/Jw0p4D9dKFmT9FN9OuYlY3pXu54S5dRtGHH+zKE7nvDFSjYZviyS4134Co8ToAUVEHielW3boRY4G3YUluaK2y1Y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568934; c=relaxed/simple;
	bh=GsHrr3v1WQnQ5DxgbOvb6THwJZZ0B3v3vS+57NzKOOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvC5jw7o+9kWmLLGH9pSslNdw5y03oMpnsTDhlcSUUfgZPafc+cENpanjN8KRs02ZB57j8vQmvL/tXeprOc2sZqbt9DM7Z/icZiqayg3blcEE+H6smSlPmmRYqvvaVENPi63zfR3GlrrUA0hkbpDUvsoSuqPPpNBpkHypxrBZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jMnAS88q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a29e6110so31576975e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568931; x=1776173731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzHnoo+7b5dFLN3aUDtXl6ixzTaf+bVpk2UW7fOlKww=;
        b=jMnAS88qmSq6/7+QpGlw2HPv4jD56tR+xneJ9mT8ZdiSyx9K5/kSHt5BJ4FGeg1IYV
         R49RkdgYTSmPLVD6ROllor8Eqd5FCyrwqMZaYpmKKdrY0aCmj9AqsKh0LwL8GF3OHBR4
         7Ko1BS4Ggh2CPrAYTCspJco08PtJHkwdK/YwTyd9XgQHc88Cg7W6LLP7/kAR6Y6qJDuT
         Z5P30t+QnzrB19tysTMbZrMYnujMBNytWwg6jG+lhtAVp9eUMQ25bzaSD9TRba7DGrFv
         I+3cRZXl6C0XJJs7jTATpmWAeoIUqhD6M7w2Nhc0MhaicaMVZOTDYr9ZqxHr0L8I8TxL
         vNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568931; x=1776173731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QzHnoo+7b5dFLN3aUDtXl6ixzTaf+bVpk2UW7fOlKww=;
        b=D8/odE1EpmxH8ILlznTdS3eqmSBfO6eRe07851fhJxBqFxA/bW3dRRzJfR3/4bxTB2
         EkkcDoIv1BqMbWJwyrVg77T8Eq9WLGQJpA7Qh9y+cH5Bq4nSCfsyTJq+vGS6UXaAsX8n
         81nj7G43M+384gy0AiUAMwLFe8Rdt3/np2aV0CfsJdotY/iFzw7mF2JkANmgVDOn3xdc
         WREoRufjKiSrl0xCwWNzvQDiLxuaQaHDHQiwY16NWnhfiV1ySRXuAwTZbjcnEsi9jelz
         ra8iZ4uDEzKJb6rqbB9mxdq2qn/b1daxXnA26D4dgDVD/hpcYblcQ8eYIYAJHrjDFLFo
         Ielg==
X-Forwarded-Encrypted: i=1; AJvYcCUl5xbb2D7O517MitQuu1IvRwmZG3IIV0jEzNEn/iSMVhF5UHR94y7OSXpaHY9WyYbR+0Di0Q+lwh6dlYE67743Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKN+i2CHmpVXNLS/1Y+HRVYEMjfyTexqZzcxoiPIhZDtJyCXh
	VYosFEPuvghO++tqR597VvsKz9dQGjZwe/kxpY9S8BNAdRRgho2H9/3ys7DFLnzRmsc=
X-Gm-Gg: AeBDies950jzUqROqOHlgGlAsZ7pCYa42sMRc1/WaKJg1+KcI7MFkAJKZ5hNtVfUgeD
	RXTrTZ3dlF6J+Cvn8XAHPWBo2out/22M90ZJ9ivCGAX2hj1UCXZB0iX94dbIPA4X3kT4ZjcZQWH
	Bv3jK4pmNWYV2G5tDSsrR59P9C+kXQmom8rZWPBBY70Hg7KW0DmeZsUwSZkFRJAr9S7/4OMBAvN
	72vhOsKyrNiMpbPY2WnjCau/p3WzFBnSih/FverkfCSuTZ1oGCTR0JAzheYAhSHMBDEwchq87nP
	vSa86fi5mZN29Vbgy5L0fXEEf0JAD0LxHPCTMMK59I+4qIDdU5LlgF1QbMuwJeQ0yuInQ3Dab0A
	HuqpwufXVezl2oN0W7NDAUzqHJs90DdXscJYehbD2+PCfedcrEvQluh0HVQ/ExsSl8qvi442Rjt
	96Bi14Q7s+K2hZuw/LBDoH8Wktnvg0BNVT88E5/wHK5K6ncYtuPxLP
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488996f08f5mr261826025e9.9.1775568931434;
        Tue, 07 Apr 2026 06:35:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:30 -0700 (PDT)
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
Subject: [PATCH v3 03/15] dmaengine: sh: rz-dmac: Do not disable the channel on error
Date: Tue,  7 Apr 2026 16:34:55 +0300
Message-ID: <20260407133507.887404-4-claudiu.beznea.uj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30922-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 2AA673AF661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Disabling the channel on error is pointless, as if other transfers are
queued, the IRQ thread will be woken up and will execute them anyway by
calling rz_dmac_xfer_desc().

rz_dmac_xfer_desc() re-enables the transfer. Before doing so, it sets
CHCTRL.SWRST, which clears CHSTAT.DER and CHSTAT.END anyway.

Skip disabling the DMA channel and just log the error instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 12c1163cb6ef..34c00f3ffd4c 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -871,10 +871,6 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 	if (chstat & CHSTAT_ER) {
 		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
 			channel->index, chstat);
-
-		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_disable_hw(channel);
-		return;
 	}
 
 	/*
-- 
2.43.0


