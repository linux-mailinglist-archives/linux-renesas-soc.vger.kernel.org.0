Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9525268F7C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Feb 2023 20:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjBHTEX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Feb 2023 14:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjBHTEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 14:04:21 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5D758280
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Feb 2023 11:03:47 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so2203567wmb.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Feb 2023 11:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNVN/OO+jfgI5RvM56FJVYGYKwTjLRnzHtKeSKViuh8=;
        b=f3557eDV+KHfVT++hnwi2wo0VAnOYvMdvVcfRK8Nji/dEenEWGvtQ8f184Z/eVHDpl
         3VJx60468pDqvy3oMf71lW47Vikk2VEJMmosYze9XFvO8NHI3L47jB1JM1NkR3fh3kna
         AG0geGuH1PI1tAZ6grXJUCkg+jSpucp0ggYQWX3tstxnOobMyPzctzkXrrqbjXpy4Kxb
         TTtpwgFZr6qp9nNx4yJVfFv5JuyJpYv+o7WomccOBGf1oc9d17DmX3tlNKTjNDFUYnnD
         A8ACUGgLlHhsXLEPpx6YK+bSMzAebnN8mJ3Kpp4fNC94Nf08Li/xFLLtMNBzBiTxeV9C
         mA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNVN/OO+jfgI5RvM56FJVYGYKwTjLRnzHtKeSKViuh8=;
        b=yQiK6/SQoDn0w13LXh22swT85kkGQRN9K3BrdUb30O0YWnBrOFpFrUo9Dk95fdWNLE
         IPKJxggRA3gFEez6x8IbMXkC80w+IIGULEHtVdarkEvMNSQ/jsCn6s5D9L/JDq+zm/nI
         yv/Oe7FJoFC51uhajTFPP/w0Pnj8Lap0mgMPKZ2+TryCIOP1N9e9mzYd8kwaG2swFv9l
         eUvCx4897i/dxQuwBlcZYGPnEkHrHPxiyYVevHUH5taUF+lC8NQKWKjtlvE0kHWqymZl
         3xt3oLItEjlXHoqRT5Y8BH2UTOWeiilIU/KlnbMiuZQcghLcvWXdYRNgNqnjugFOtibH
         VrJg==
X-Gm-Message-State: AO0yUKVqHIpD2IhO+25zrRTgJJlSTNirpYEJwfk/yPuYKgvqZTNVYCJp
        QpZSvKYPdW5m9fa8RdVG0Cy0mQ==
X-Google-Smtp-Source: AK7set80PmuLRQIV/7yvZj67igffYoysm1Ao6c0nxiz36R0NxuhtCHp46KA4pu2PnnIpzqt59kUALA==
X-Received: by 2002:a05:600c:44d5:b0:3df:30c9:4865 with SMTP id f21-20020a05600c44d500b003df30c94865mr7394165wmo.26.1675883025680;
        Wed, 08 Feb 2023 11:03:45 -0800 (PST)
Received: from sleipner.berto.se (p4fca2792.dip0.t-ipconnect.de. [79.202.39.146])
        by smtp.googlemail.com with ESMTPSA id c12-20020adffb4c000000b002b6bcc0b64dsm14201382wrs.4.2023.02.08.11.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:03:45 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/3] drivers/thermal/rcar_gen3_thermal: Do not call set_trips() when resuming
Date:   Wed,  8 Feb 2023 20:03:31 +0100
Message-Id: <20230208190333.3159879-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208190333.3159879-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230208190333.3159879-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to explicitly call set_trips() when resuming from
suspend. The thermal framework calls thermal_zone_device_update() that
restores the trip points.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 4c1c6f89aa2f..5a715a58f18b 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -556,12 +556,8 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
 
 	for (i = 0; i < priv->num_tscs; i++) {
 		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
-		struct thermal_zone_device *zone = tsc->zone;
 
 		priv->thermal_init(tsc);
-		if (zone->ops->set_trips)
-			rcar_gen3_thermal_set_trips(zone, zone->prev_low_trip,
-						    zone->prev_high_trip);
 	}
 
 	return 0;
-- 
2.39.1

