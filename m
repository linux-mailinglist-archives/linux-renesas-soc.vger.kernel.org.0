Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630EB7F0DED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 09:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbjKTIqj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 03:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjKTIqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 03:46:37 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B65192
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:28 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso2579410f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700469987; x=1701074787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTMsePF1mIhRVZgGZkTVw0dE2aONjlO+ow85WD/JWc8=;
        b=ktCZkBmkvmQUDiyuap6uQwubSBx7KGSyi5EtxzayIrQ8mSpYn8nEM7yjrs8+RbyHng
         Rg3Dr7OTYPdQ2I5lYB0Ff2+9k1CSYbG5St9XWKu/diOxFfCW38O75PK0PX+CPusRH/D7
         mh5m8YPIaILJM6NoK2UH7jn+uWoLwI4QtoWePpC7W/nTojbKAyAgX3RuDNwfhd0uFc25
         S6BV2OTfxLOZ9FgMedRqAwbMALqpUVONeG7f0chfq2aXWCJSIxca4gaaTlmiisBX6VGd
         DO1+5vK3+CBGMArf3bmA9Ngzv5Z31sZfIlsiddoSsDQKAvSqbmkaBHzfEwOff/MJq3Ou
         W2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469987; x=1701074787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTMsePF1mIhRVZgGZkTVw0dE2aONjlO+ow85WD/JWc8=;
        b=ed8mfar+Cg+QBZF1RJ2YcIXLlhdhuEL8DJbI03QDpTaKLPeSkGihX4b7r3dL5z4krw
         qDeF9lN627ObPwaIQ0K+sQg6uWTnZTqreLEGxeqcEPCr7tsTbXupMc5/DktTWrMGS3/y
         jKDOjBYGOiDmourPq/8hXOIZT1WZWv67VkcTfdR5JtC1IdFcgx3kmcA1FVAQzCW8W6Pv
         VRt/0YETNYZl8Gp3GLhwWAv/Jmxlbr9HY3RefhJ+4MZPH9t1jyXiuSXJ2xaVGpjOkbrQ
         BiH5xmnEV7b0pC+uF2zLMfWG0e56/gSwkr3M5mVCyTn84qhSFt5yZQv+zj64y2rU57Yt
         gLDw==
X-Gm-Message-State: AOJu0Yz382Jn5JNMLsjlxUCfIaDcY+6iM/0rXuwQ+zxGark743qd3Tsf
        Eb/Zk7+9CLkvuiHFqZstY2NjvQ==
X-Google-Smtp-Source: AGHT+IHfqiV7VgEqFIq+d6ViMBq15jgGeoQzEC1z36ww167uYWXbfgpS3O66gbmfQWdM9U1Cajw2iQ==
X-Received: by 2002:a5d:64e5:0:b0:32d:8da0:48d0 with SMTP id g5-20020a5d64e5000000b0032d8da048d0mr4783264wri.68.1700469987164;
        Mon, 20 Nov 2023 00:46:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d45c8000000b003142e438e8csm10435267wrs.26.2023.11.20.00.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:46:26 -0800 (PST)
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
Subject: [PATCH 05/13] net: ravb: Stop DMA in case of failures on ravb_open()
Date:   Mon, 20 Nov 2023 10:45:58 +0200
Message-Id: <20231120084606.4083194-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In case ravb_phy_start() returns with error the settings applied in
ravb_dma_init() are not reverted (e.g. config mode). For this call
ravb_stop_dma() on failure path of ravb_open().

Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b7e9035cb989..588e3be692d3 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1825,6 +1825,7 @@ static int ravb_open(struct net_device *ndev)
 	/* Stop PTP Clock driver */
 	if (info->gptp)
 		ravb_ptp_stop(ndev);
+	ravb_stop_dma(ndev);
 out_free_irq_mgmta:
 	if (!info->multi_irqs)
 		goto out_free_irq;
-- 
2.39.2

