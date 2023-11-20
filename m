Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DBA7F0E03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 09:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjKTIrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 03:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbjKTIq6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 03:46:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83151701
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:45 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40859dee28cso15815375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700470003; x=1701074803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qirNTaItgFaMUz8YEvAxbXzojjhdr1B68PxcW9IQleo=;
        b=lHhSrTOzg2RcBZxg+vZ9/+B9PiidVlx1tBsEF1HhSdIHDYoTcmQAupzx+1xo86gsxq
         IjpZzSekwx2GZSUBPqwh0BwxH0tIWKeCe8kGP0aSh5knp0s17JZqxsXOj84z5wmendAZ
         wxGap0W2OR6CFsIJm7IHcTU25LB7sAGm8Itmm2R6kENa7suFL3VHBUeqCvTUeDkdRNpo
         uaEw7YZ/Vi8DbVrcy/9dkNt+ue1eYBj8zscqJ2SNl5fUYzf7O7rJSUsqmX6lUrjQSZwz
         +onPhF9Nh6INJUfu6ff1tX8LaeEAPnXDUA6dKGYgwgf/ZdoyPc/2EwtCP9SwFlo4Fsrl
         DOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700470003; x=1701074803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qirNTaItgFaMUz8YEvAxbXzojjhdr1B68PxcW9IQleo=;
        b=W21cxFQKodZOAk4RoQ/j1m0vOfFpnJTSCboGV1Th5DAcSAkyLZjYEyS012Gy3bC2ye
         lDL/3K4klcx1vzqNULBYio65bPx8kpTobIXNbti60bNIv2QKDjBQVZtJzafK91H0KzNF
         Lz2MPMbheaBy6ty7qtVlw2FQo0ZSApHYeJf52gNWS2RdQH2ZhKdn+lPngE3Sdn57ECBN
         uEWnUdr8iyMqhCSm3LM+idoXP1fdR/PjVu7illrIWKY8x20/fPkb3IWoIm6YlfVezOz6
         pIfYTJ0wfGAZd52GEk8yNGhojlGOODZsEWymWpQGjVbmNDaAfkqggGW5W7d7YxBvQ3AU
         FdOw==
X-Gm-Message-State: AOJu0Yw6SHZ2jPv7n4t6cLzTTm597N7Iou6Te6NMcIpMSMRUnnLZudt7
        Sa2zQyZECe/lrdNlkud+/uLuhg==
X-Google-Smtp-Source: AGHT+IEQ1eXLmnYRK/XGrJL81A/yawh9W/SR/aidkq6ssLa4Fbn90i50o8mhIyWvT0d7h6s3vgo4og==
X-Received: by 2002:a5d:59a9:0:b0:332:c2a0:c0d0 with SMTP id p9-20020a5d59a9000000b00332c2a0c0d0mr3072606wrr.46.1700470003219;
        Mon, 20 Nov 2023 00:46:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d45c8000000b003142e438e8csm10435267wrs.26.2023.11.20.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:46:42 -0800 (PST)
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
Subject: [PATCH 12/13] net: ravb: Assert/deassert reset on suspend/resume
Date:   Mon, 20 Nov 2023 10:46:05 +0200
Message-Id: <20231120084606.4083194-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/G3S can go to deep sleep states where power to most of the SoC parts
is off. When resumming from such state the Ethernet controller needs to be
reinitialized. Deasserting the reset signal for it should also be done.
Thus add reset assert/deassert on suspend/resume functions.

On resume function the de-assert was not reverted in case of failures to
give user a chance to restore the interface (e.g. bringing down/up the
interface) in case suspend/resume fails.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index a93b3d6b1863..f4634ac0c972 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2972,7 +2972,10 @@ static int ravb_suspend(struct device *dev)
 	if (priv->info->ccc_gac)
 		ravb_ptp_stop(ndev);
 
-	return ret;
+	if (priv->wol_enabled)
+		return ret;
+
+	return reset_control_assert(priv->rstc);
 }
 
 static int ravb_resume(struct device *dev)
@@ -2980,7 +2983,11 @@ static int ravb_resume(struct device *dev)
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	int ret = 0;
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
 
 	/* If WoL is enabled set reset mode to rearm the WoL logic */
 	if (priv->wol_enabled)
-- 
2.39.2

