Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8AF57F0DE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 09:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjKTIqa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 03:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjKTIq3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 03:46:29 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D2BE5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32f7bd27c2aso3060212f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700469984; x=1701074784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5DUTseQ9M13B3c/uNsGDyKmzs8yrYsJMqyVo9/Bt0g=;
        b=SffkOGBzwA4VLDateY/j88lK4kM93BCcrecM+r8sOsIKiPFqFMkxD0QZCLGS1KDKA8
         lTV6i6Dnmn9kr14gQvYDiLHLIS/SpKkA/FxTWm+ZoEQP/s5WFg5osYmiwgumnu8SautG
         Cmr0qYF2ZrSURmdKM6tBsZe+0FIN9XNtFX8xOy4wRL0j7vcmx0ERgJJN3LfITIGIrq4g
         J1JICItYgP6tOBuNBlnaLIVFRwbxRHOcu6UQ0GkCnAnho21UN5lujm7tOl82twRISzAF
         pZU0w4/2vTwireL9dEIg7VNqCwabLw9Fs7au5Lzh4+uF6dLL17nB7cQzoDrxX5fhXTDa
         0CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469984; x=1701074784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5DUTseQ9M13B3c/uNsGDyKmzs8yrYsJMqyVo9/Bt0g=;
        b=Pt/e7hAA95RloUixw7cB1gzqs8Idcmnn8W9Emj4Y373h9n0evIpCch+ozWoTD8n6PG
         pwxFt+WXCZrafR70GxGbnzpfzIiy2BdcWbBgFeyy6W8JqJJowhNbAzXP2sveeglVLaxL
         4Q7Dmp/h196a0sBE1FqZmJyEzL39/EWtMFmDor8/px05WJfOsdcWHd5PBxjAuIIj3O0A
         xB3WAG4SbJ/Ic4hTL5ToyuYPlOzCIptXm7N9UnZXqkog2Gzd1bJUR2aNF7UbGOJjTyPD
         7UYzzNHelfW3Q8+wHxy+aKOCxeR8gLLzArxiXV2dj4KBPb/ay9uHO4ZZx570gnax54lY
         jjBg==
X-Gm-Message-State: AOJu0Yw3mP2a7hFZ6Jq1pu1n/YtZPLcRufbB2/ZjQNZt+i4iOeKmjtoy
        kyEzLdlUb6KNd/gijVXz5FyHbw==
X-Google-Smtp-Source: AGHT+IH+kw0D3I8hcIjXDKB623M+1uoixo0SRLnUYry7SJ1e2Cyi7IKXMIG8YCxsaQqU/WoO+oYnFw==
X-Received: by 2002:adf:e406:0:b0:331:6d38:5d18 with SMTP id g6-20020adfe406000000b003316d385d18mr3774080wrm.61.1700469984417;
        Mon, 20 Nov 2023 00:46:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d45c8000000b003142e438e8csm10435267wrs.26.2023.11.20.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:46:23 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de,
        yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
        wsa+renesas@sang-engineering.com, biju.das.jz@bp.renesas.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        sergei.shtylyov@cogentembedded.com,
        mitsuhiro.kimura.kc@renesas.com, masaru.nagai.vx@renesas.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 04/13] net: ravb: Start TX queues after HW initialization succeeded
Date:   Mon, 20 Nov 2023 10:45:57 +0200
Message-Id: <20231120084606.4083194-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

ravb_phy_start() may fail. If that happens the TX queues remain started.
Thus move the netif_tx_start_all_queues() after PHY is successfully
initialized.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d798a7109a09..b7e9035cb989 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1812,13 +1812,13 @@ static int ravb_open(struct net_device *ndev)
 	if (info->gptp)
 		ravb_ptp_init(ndev, priv->pdev);
 
-	netif_tx_start_all_queues(ndev);
-
 	/* PHY control start */
 	error = ravb_phy_start(ndev);
 	if (error)
 		goto out_ptp_stop;
 
+	netif_tx_start_all_queues(ndev);
+
 	return 0;
 
 out_ptp_stop:
-- 
2.39.2

