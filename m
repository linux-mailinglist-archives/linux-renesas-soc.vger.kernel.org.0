Return-Path: <linux-renesas-soc+bounces-2093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAA4843948
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FB0F283973
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD3563123;
	Wed, 31 Jan 2024 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a08gYhQR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7962E60898
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690511; cv=none; b=pCHJgKZUb/NpTDzlxkh1A/85N8M+LAn+WIYqxTszGoWtFxWQeYxhVOLiLxDHlfGD17jqcf+mNjE8wNvA3OSBXaYntY73ehETTTI3LDCYySCHzo0LhxYtf20W66EAPjkNQMA9r2GBjWuMIJwsExz3ceFIhqjBNwjv3trLK3yJM48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690511; c=relaxed/simple;
	bh=aaKf7z2xB1MNtfZ9vMqWh+Wx2jdR1MK9CRLol2unMF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jX+CkPrM9rWzTv6ejjMPjopOp4hREWt7ZWP/Q0IkBZPIfK9hhmi2w7UykZdZlyJoBNl6FGOnvnYVsTVIwq/6GT0k8MrJrvfu6sD5BmY+1Yxfab7Y4EK59i04U4vXyXfiHISiZwTu0in1g29E7IWffuJ+HgJvpLcsWbMf+4dmo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a08gYhQR; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d0600551ebso14518311fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690507; x=1707295307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nopmGlOYDibDD0J+/Hxx33H1qRqX0KJvglV4HoOWvw=;
        b=a08gYhQRlIgi/qUl044Zw3FcKBfxoHa6kVj6bphuS2MGkJ4DFPrA5WtlJW0b815jEj
         yNNwGWK+aydDHlUSOEA8m+rdv6R4Oz6nsAN3qLyrmcuSC5iyXvsO5Bjnslq2X/seI2WU
         GwiXz6rhsdd/VBbthhLOmqaREsCqZ3HmEg6YXiGJJfMglgpFD9VLfr2nHWuXgnCCbvSS
         kFncaSuNC9qQkBv6Clwqe7Vu3zjY3ID2FaJwvTikntRep5lxVzyQwFswkupI23g8Oju8
         o/K1p0ggZ3lgm/V29aZAfL0x0BhSKpgod51d/4lh32ECWTTCpX5kO/KIcRuodHs+NDXC
         3SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690507; x=1707295307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nopmGlOYDibDD0J+/Hxx33H1qRqX0KJvglV4HoOWvw=;
        b=Qi+f5a5jNcZgkArpj19+exOSoRvWZV7GpD1LI7EOfUpriw0ex0UoSC3RI/G23q6vAl
         KnnLgpZwFJ31a1RIXuB1HdkaOh0Ng9i4rexmbxuU/ohSrHSoIau5uNuIptljYf8hliDF
         0Ip5qKGvGkKRAtduWSD9B4rSZ6y/bZbIXrn80YjbeLLyIkbiUrD0IQrPEZXisjrpGqiN
         kHfcyFyh6zOxKwWgHV7l70eQb7EjicOrSEY8lGgZsp2i1PN/jQEFhFH4mkmaoU8j+7Q1
         sxgugM1cXXm1InDI4lRDFkH3RKpTqSIrGWuIbEpaLv2h5lsDqKJKexManDqTzswc8A7+
         dF7w==
X-Gm-Message-State: AOJu0YxV+KPU1jON6GwtAJDSm7Mazym5fD4MMZOBTpyZEZbJCpEoEAVV
	Rd7Z4YHlfEwkXQbAQqPNhI3LDAACQoy1eY40VueHZZyRWbFo+BBKiuP2LeMq/co=
X-Google-Smtp-Source: AGHT+IEEAYF9I0Wd8hE2FKGQaz5+GpmWeBgNzUkbk825w4QlQTz0p1tW17uQk+d/geaJtlQ+4a4B5w==
X-Received: by 2002:a05:651c:1a0f:b0:2cf:1ae2:dca with SMTP id by15-20020a05651c1a0f00b002cf1ae20dcamr799228ljb.16.1706690507376;
        Wed, 31 Jan 2024 00:41:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVINZIQxSHU9/Pkq2gP08HOZi6sVlBy3aTiloaO6v4iewhrYb8NolbjvUFEnGcamkz60RVZQPaEpoCm25S2D3KtobY34/cC3J+5c2db68rdUesbukQ2PDk/yl+19cu49aAWhdPT214NeskIYewypZ4LhXQJHSxXq/0vNHL1pT7M9w85CYUbtVv36onuBy3h8fkBead3dgATf9weN0/9QrT37J4bi0WVVHFhY181GC00R0hhJDmS1u8wnX4mayOpbUrqzg3YginFPuCoOMzv0NMbTvYngQhtbm7KZv9ugPwHOQiC0L9OGfBkPk4agQmKusxS84Sr3ZowH7+8mR5yFucpvC3n4nnMtTKIUrPlsL3WH/Y3yIO381AzrqQ8JInMxQEBqVBW4De67HXsmJ4ghB7SRsN8LTvZ1DZiv1fJyEpxO6/t3zY=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:41:47 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v5 01/15] net: ravb: Let IP-specific receive function to interrogate descriptors
Date: Wed, 31 Jan 2024 10:41:19 +0200
Message-Id: <20240131084133.1671440-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

ravb_poll() initial code used to interrogate the first descriptor of the
RX queue in case gPTP is false to determine if ravb_rx() should be called.
This is done for non-gPTP IPs. For gPTP IPs the driver PTP-specific
information was used to determine if receive function should be called. As
every IP has its own receive function that interrogates the RX descriptors
list in the same way the ravb_poll() was doing there is no need to double
check this in ravb_poll(). Removing the code from ravb_poll() leads to a
cleaner code.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
 - none
 
Changes in v3:
- collected Sergey's tag

Changes in v2:
- addressed review comments and keep stale code out of this patch

 drivers/net/ethernet/renesas/ravb_main.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0e3731f50fc2..d371c4bed634 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1288,25 +1288,16 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	struct net_device *ndev = napi->dev;
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	bool gptp = info->gptp || info->ccc_gac;
-	struct ravb_rx_desc *desc;
 	unsigned long flags;
 	int q = napi - priv->napi;
 	int mask = BIT(q);
 	int quota = budget;
-	unsigned int entry;
 
-	if (!gptp) {
-		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->gbeth_rx_ring[entry];
-	}
 	/* Processing RX Descriptor Ring */
 	/* Clear RX interrupt */
 	ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
-	if (gptp || desc->die_dt != DT_FEMPTY) {
-		if (ravb_rx(ndev, &quota, q))
-			goto out;
-	}
+	if (ravb_rx(ndev, &quota, q))
+		goto out;
 
 	/* Processing TX Descriptor Ring */
 	spin_lock_irqsave(&priv->lock, flags);
-- 
2.39.2


