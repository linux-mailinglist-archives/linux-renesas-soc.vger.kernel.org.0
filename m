Return-Path: <linux-renesas-soc+bounces-1311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C23824FD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19B141C22C8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A072B9AF;
	Fri,  5 Jan 2024 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ft9p0Rvq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6790E2D791
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a26f5e937b5so144567866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443092; x=1705047892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZFMoutT1OQ8HdoT2b40UgTdsfQKAEafv0v+pAiov+w=;
        b=ft9p0RvqjmKcN6JGEvHRVPCsnrLAqZ83Kw73PCVBgcH/i75mE9WiN0jz4IHpGxEq3O
         6OqcNxA78YeC6Tc/54Vfamyonx+TGcrKD7bgouwMCBAMRIRfeFswNFrz5kYkTOoKCx3s
         y3rKXESVs1dmt5Gc3SJjxoWnxFYd12uEzuowtb/aAQgd7ssQ7sWGwrZHmHGlDSNk2tMw
         nkVWkuO9kfqEB3yJgMbraU3fbOPXi8MuCVEXezodOaY9LhLpRlJPegT/FBcYZAf8YIOh
         onnvDZK5Bnxm813DRJ3GPb5iFk8hGvJomsPuObFTLtCcWy85DRxVNU502YS7xgccd/+P
         XFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443092; x=1705047892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZFMoutT1OQ8HdoT2b40UgTdsfQKAEafv0v+pAiov+w=;
        b=T9g8OD37LSoMYbxuXAfz+o+97uTpD9YO1WMxcZ4ImBvDrb3dPkdK/d6BBZ5W4LsU6Y
         SZVH8er2R7WZRx4A7vbdU7GoiIQ2Tgyk9Px32JS+ZlFtpRNDYMskiDsnvXJvqny3iO7K
         qT1KJcaTsf643i8RYazTfefkOPMjyMNDdeunSPNgOkVSNYAM7Q2kko4lY/71yfrloivd
         LTMKMuG6fRi/RReOjKgJv7Jh0Tg3Jja4b9i4bpDofeYXSoPApx/Oyqvs2gP9W522GWCN
         cDc/kevtm2hU62c8uBPnBC0NIPWYKCDGvFpleFjTpO5y5gK/JFgnh00hWKc2ge9X81pm
         iivA==
X-Gm-Message-State: AOJu0Yz2K1NIIDDI0vTnzAdL2vKYqXHWl0SpObDw5Yos5/ryF3T6rawr
	SVW0qV2Tq/8trDkGRPHKUS/skdsrz1j0/A==
X-Google-Smtp-Source: AGHT+IGamykpfCXZTmwezBWlaPRnK9OkJ4Kb09yxSJO3CZqMdbV0HbCFEN5cxq06kIiNKZqFPjeFHg==
X-Received: by 2002:a17:906:19c:b0:a28:f8d2:4648 with SMTP id 28-20020a170906019c00b00a28f8d24648mr601871ejb.83.1704443092762;
        Fri, 05 Jan 2024 00:24:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:24:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 11/19] net: ravb: Move DBAT configuration to the driver's ndo_open API
Date: Fri,  5 Jan 2024 10:23:31 +0200
Message-Id: <20240105082339.1468817-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- collected tags

Changes in v2:
- none; this patch is new


 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 946abd7606ca..dbc26c3e95ec 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1826,6 +1826,7 @@ static int ravb_open(struct net_device *ndev)
 		napi_enable(&priv->napi[RAVB_NC]);
 
 	ravb_set_delay_mode(ndev);
+	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
 	/* Device init */
 	error = ravb_dmac_init(ndev);
@@ -2769,7 +2770,6 @@ static int ravb_probe(struct platform_device *pdev)
 	}
 	for (q = RAVB_BE; q < DBAT_ENTRY_NUM; q++)
 		priv->desc_bat[q].die_dt = DT_EOS;
-	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
 	/* Initialise HW timestamp list */
 	INIT_LIST_HEAD(&priv->ts_skb_list);
-- 
2.39.2


