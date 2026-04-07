Return-Path: <linux-renesas-soc+bounces-30921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KImhDC8J1WnMzgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:39:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9F3AF4CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3293B3028E98
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF493B8932;
	Tue,  7 Apr 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fdJxSFr5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C45F3B6C00
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568932; cv=none; b=CsP/d/l+nlEeRIoMK/8kvqN4vhXZOiBnGLn6Sknkt5lnD+3/+DdQbP1Zmks1E7iVczpbfZFCRi2QK2KVaZUs79XLiGZQe/Pf+XVWF6Tw11KHdV5haYMjcaaJsSAdNgkYh9K64ptY4Q52sBoODu+RB2pdt01qZrwKAPZrr1o5N2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568932; c=relaxed/simple;
	bh=NqIhL7Kx94ecGHipdoYoYxEN9JWnQ7jKvcbzALuBTk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtmjjV6ITM+Ny2Z8G3nfQtpfuaR5ImCZP/q87EWA/yd3eBS6y3YXTSzMGnezZn/sKSTQXSg1sEDiTxr9xxF+AhcitFNxu1RjHYAx5qbHgHqARgHg5Q1m0j2LA8kGZ5qKR2hpw93ND1/0UZKMPWIXjuaVRmpw+fM/Kza0ygm0vqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fdJxSFr5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b8efed61so14020605e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568930; x=1776173730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgdgMNUKOKJYt+Gxqf2ssPII5esh2nyuFo140mcmnaw=;
        b=fdJxSFr5H7ExMS7lgqwv7EoHIf/Pj00zEgfWLWbHMNC8tQAkDRhQVDV79L0x4GZWUa
         FZrM8/Te4Lp3lTy4y7mhrvDSoCepv7x/nxI0E/h4iIJUbpJ8V3OiN8pLdgrIFVLd6Dqe
         MsdXVXqmzmGvBVf3LXv1RD93Y3mpzLbHCqv78R0kxtVs/FuN/RC9Np1XhsP1KBxa4Hmi
         o3CWRSZ67rPeabluA9A/Z8Sjm4dBwO+vVXCHs0vicoyWoADFgh8A0HoM2920103k59EC
         NTx9VYy6m2tuWSBOrUx7ryQUJpSZJDZwXel5Hfa//IWzh89bbZvvXIwIJJ1zASHBHjfz
         HU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568930; x=1776173730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgdgMNUKOKJYt+Gxqf2ssPII5esh2nyuFo140mcmnaw=;
        b=aUGYr2CiX3vYFi148JiUGS7UkZhxTDXj3ZksUKL7Ez1n6SLNB8qrC8lwid1Y49ZwVp
         YxfF/47V49byUxv4kQjk+dwsLiUy4S7KGJIKnKpk3B1SIj+SlyRt/ry58EtN+6IsidkO
         RLqBP/tGMkwl8qSBpY890l5ytl7Up4h4+jtXCc32eyyhWzhoLpNBgQcx0co5MDV49hNZ
         o9BjZLAawCznJM13GSePVigKZlqV3FIy6oT4kVzlRMoMkzK3kc2HrRTSHMWXMUVLq4Fj
         FE4YMF0Sgd6rOZAHkyvVOfnOyYRYqwooh519QjJdb1Ih2pd9KD7EYtq0PPu4GE3gm5Ur
         +Ypw==
X-Forwarded-Encrypted: i=1; AJvYcCWxKsKUWnNIdGa2BzpxaXiDo9UtURDSngHmxaAervAFGPhF+1K1j9a90DCTJD53WSNsAw5QLCfsO1jACm/Ywv0zZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiTVv53NRdiIyuvDwKR0oPndyWn0w5ITjudJ+Avj57qRlTcp6
	nR90zCaxkmgE30aL3D2Ww760dxAKUY5TLnV7uc26bsZYmniqg5gi69IuzO6Tgeab8h8=
X-Gm-Gg: AeBDieuBuNHXt9oH7IbEhTi2w4PyqQVSZYcs4uJV5XldBc0hTvkWblz/+kPlv9ATHCu
	J/l0BSnlVJsb4at7yhPm24IdK5VhCB3P8nSMXiDxYIZFxbPSxLslqrndIWmNSLyvIGVi9QucHqR
	zDiDvQtQJmxepv4UOur10K8kbaiqM+9vOYcNYVwFQ7tStQGcpT6z9dd+u033xf/HedKPZbjhnW3
	m93VGdAwALVeRjsNGBcZPGmiHnpGKqdsxgRzxIE8yLw8e4W6Nzo2jsFRxOJeTqWf7Nj7Dx9+KKB
	+qmFyqdKIihbR/K1Vx5QHQv/Jz0/jIiQkww1WdWjo9HKybUM1nYRUEXZcXI70Z+MrpiiWW0qvqP
	//lHoeN/4+P18vDscmcdzA4YE4HHtoOvdyVp5NCq25lTW3OTYXPWvBrZataJit93Mi0txSUXnCl
	njPl3RnpuWACCaln///NKKMvxh0lQfbSb0hrwimstomCOZLcy991AA
X-Received: by 2002:a05:600c:45cf:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4889945f8c3mr200858445e9.3.1775568929708;
        Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
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
Subject: [PATCH v3 02/15] dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
Date: Tue,  7 Apr 2026 16:34:54 +0300
Message-ID: <20260407133507.887404-3-claudiu.beznea.uj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30921-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: B0E9F3AF4CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use rz_dmac_disable_hw() instead of open codding it. This unifies the
code and prepares it for the addition of suspend to RAM and cyclic DMA.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 3d383afebecd..12c1163cb6ef 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -873,7 +873,7 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 			channel->index, chstat);
 
 		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			rz_dmac_disable_hw(channel);
 		return;
 	}
 
@@ -1020,7 +1020,7 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	rz_lmdesc_setup(channel, lmdesc);
 
 	/* Initialize register for each channel */
-	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+	rz_dmac_disable_hw(channel);
 
 	channel->vc.desc_free = rz_dmac_virt_desc_free;
 	vchan_init(&channel->vc, &dmac->engine);
-- 
2.43.0


