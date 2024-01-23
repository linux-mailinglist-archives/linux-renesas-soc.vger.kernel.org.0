Return-Path: <linux-renesas-soc+bounces-1715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0B838F3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C96C41C26169
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FBB6088A;
	Tue, 23 Jan 2024 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kVpYesco"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DFD605CC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014789; cv=none; b=RVja8rL12eavouF+zTj0S5hs38blNsjF8frQGnp1rAyINlfKTKH/9reKKO3ClTkcrqZ9ESzUai8vTyRvi8euwZP1Gn9rRZpe+oPcmkzeBJW4iVCy78mxIVCiySLJ0G0pd6DUoDlRM/yrEvuW6z9bVzs+DWX8HW0Gq22VY3GZrRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014789; c=relaxed/simple;
	bh=zwRf00erI7gL+iVp7EL8wRdj+/3c4hH+mO5H4G4Z5WQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cZX3cphBQ6Q5pP+Gs+Zh4b7lDu51/liXLwnav0+fYt/kSI68TIC9YJxDGPQl23zcUfBd+KA8t5HzvkWp+0wbzC9HonIO6uYwbxqIkvd9xx6vupilahX23235AbjoTp7eHzEEbbu8EPWCi1WOn0uUba0AO7svSKpzXuY8vQci/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kVpYesco; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso51321495e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014786; x=1706619586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oU6e2ETHxF91J7rUEFncHWZOjTNYygzuarRFBzd88c=;
        b=kVpYescoHborLoAT9qW+S2lnooV0v/b3/gznd1o5vXvEeodA2PO1bd2ppn5zhMCn16
         End3R3dAhRk5TqPXUD9ddS+vZuEVfmSnDS90dNyKRNE4j/Pv8hBVJ7va1fqOR9NaEs88
         vZyUq0ZnjE04WqDx5wq4F8/Fm1VBhUQGdMiHRIuR4ijBpgg0+KPo4f9c1j7bFyJ77MP7
         fXKKvlywOONJTtBta0fGRKQTUvM7j/pK1kJ2ckI214RJLP4D44sPHdvnXV59lJZY5kqz
         Hhk6DQ7/6k8YrpPVF1C1dhjvy9iG6gS/tKsTvJAcpSUvwqajGfLkWCa59fG+dSTEy3d/
         iPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014786; x=1706619586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oU6e2ETHxF91J7rUEFncHWZOjTNYygzuarRFBzd88c=;
        b=rL5meVbPj55oiHB50tXeBXo3aHCyPHPVVb1JNBiErZfuVC2t0ztyenujh8n/BzeHH1
         i2HvQBaTbubPia4sGsrfrVJ+dQzg2EyWkHmLjRDuZ5a9hCuxEYEtYTrUUFow6CqUzj80
         99S1y0b8uWga5TO+/LacLJhRnH7flxCtUl9Q3+mE889OzP2aewToZxN4Yzo3Rvn0z4i9
         35StaCSYq0zLnw4eJCXmYIvE/HT6oaMeuGhpe3UQF60TdJddG/YywCylcEceFJwy6DVT
         qMcrBQzv4ze8kCB94lDDlvSw7vyRytR9h9gkWelAb/KNegrcHC9i7sC1IduWTncshn43
         wtkw==
X-Gm-Message-State: AOJu0Yw2TwI46oyW/UHk3la4JUuPTHiyFXX3CZ1DsnJHD+/Iqgjj5zFm
	9gf1lMEr7ZxBymIdSRMVbhsUAhHzWYhdQmZlaLWzOlg2NagCFnxbiz2E//vuBoE=
X-Google-Smtp-Source: AGHT+IGB+gMNBnzgu6BSJSZSWfnZQHIGkS7WejcQ267fGk9sxfCygh1ubyAyFYo2rFP0dkj3WSmDkw==
X-Received: by 2002:a7b:cb0e:0:b0:40e:4996:13b0 with SMTP id u14-20020a7bcb0e000000b0040e499613b0mr240501wmj.272.1706014786082;
        Tue, 23 Jan 2024 04:59:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:45 -0800 (PST)
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
Subject: [PATCH net-next v4 11/15] net: ravb: Move DBAT configuration to the driver's ndo_open API
Date: Tue, 23 Jan 2024 14:58:25 +0200
Message-Id: <20240123125829.3970325-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

DBAT setup was done in the driver's probe API. As some IP variants switch
to reset mode (and thus registers content is lost) when setting clocks
(due to module standby functionality) to be able to implement runtime PM
move the DBAT configuration in the driver's ndo_open API.

This commit prepares the code for the addition of runtime PM.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none; this patch is new


 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 69d4854d6738..3c7748b5e14e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1865,6 +1865,7 @@ static int ravb_open(struct net_device *ndev)
 		napi_enable(&priv->napi[RAVB_NC]);
 
 	ravb_set_delay_mode(ndev);
+	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
 	/* Device init */
 	error = ravb_dmac_init(ndev);
@@ -2808,7 +2809,6 @@ static int ravb_probe(struct platform_device *pdev)
 	}
 	for (q = RAVB_BE; q < DBAT_ENTRY_NUM; q++)
 		priv->desc_bat[q].die_dt = DT_EOS;
-	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
 	/* Initialise HW timestamp list */
 	INIT_LIST_HEAD(&priv->ts_skb_list);
-- 
2.39.2


