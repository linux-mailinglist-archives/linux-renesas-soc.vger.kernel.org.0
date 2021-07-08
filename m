Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBBC3BF7D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 11:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhGHJ7l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 05:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhGHJ7k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 05:59:40 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FA0C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 02:56:59 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v5so6774754wrt.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RccvP9R4lUGcD44xAkhVggOj5bj+/uygz9cm0wyLvxY=;
        b=yuhX2xMjchOaG/Dj7bCgBj2+5NLMoTElZv0di4pM9dSZAV5URM/WrRSdH3VB5OAo9Y
         wKGoIC+AylKR1bwJHeiH2R2Akg+UdhMdt9tVPuR+t2E8He96nmO49KNkmj7Vwlkuy442
         qWwsYarsdfdBq65zRzfsG3CalqboGgl3THbpSBRhcaz9iHxadWn/S2OFBY5pYKgjTV3j
         i5GzUjjpZYAAjESDkikpLEU6V6hFcB1OZoxiaCVmMVXu89kzwlwjbamlCyyG27pii+XY
         PezHqSYDlVwPvOChokoPRcji3DyFnt3xbUrjhI7ziTMP+q2j/rhdNSZJlFqHi1wNOEj6
         yVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RccvP9R4lUGcD44xAkhVggOj5bj+/uygz9cm0wyLvxY=;
        b=fwWlMGHAS0LWw4hpKJC+Tz3clMo3n3LCwmSaXoC5CgLvNDjApw2HOprbQfD205yt8z
         l/OV/pEWH5OKkpjyX5Kh3vQO6XKvnHPfrswEQZcp5dgTTjR7KhPrHeAszesx+xC026qs
         v3VA0F59S2Z0uRCE0LuB03F2INiFVy7iQjyhWVK0nCSjOBQRjJXytAAaloQ8+bfYG2XN
         pv8Ixof94dvDvltIdSjUov6MJo1eE7jmY+3A2xsP8xEFSc6hZIttyCvshrbswbTkT3i1
         4Popak/WkxelpkBO0uxRD0gQXudBvlkJ4z4YMapMDRCXXm2b4TTVhYzkZPvKKENvqlQ6
         byxw==
X-Gm-Message-State: AOAM531ls9ql574svv0G2pqh/RVUqSrSF3iVg/y52yVQYhM56oMa/s2m
        lWycw6tueYwzRsx3o67T9l4F0g==
X-Google-Smtp-Source: ABdhPJzrURB31XIYI2GavF3TUaoiqk1rmifOg0cvqNhp6BVyQMTpULBZthlkQmY7qpeftrnnZ57QkA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr34974961wrn.62.1625738217682;
        Thu, 08 Jul 2021 02:56:57 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id b7sm1624849wri.96.2021.07.08.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 02:56:57 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: i2c: max9286: Remove unneeded mutex for get_fmt and set_fmt
Date:   Thu,  8 Jul 2021 11:55:50 +0200
Message-Id: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to protect 'cfg_fmt' in get_fmt() and set_fmt() as the
core protects these callbacks. As this is the only usage of the mutex it
can be removed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/max9286.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1aa2c58fd38c5d2b..b1d11a50d6e53ecc 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -18,7 +18,6 @@
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -173,9 +172,6 @@ struct max9286_priv {
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
 
-	/* Protects controls and fmt structures */
-	struct mutex mutex;
-
 	unsigned int nsources;
 	unsigned int source_mask;
 	unsigned int route_mask;
@@ -768,9 +764,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	if (!cfg_fmt)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
 	*cfg_fmt = format->format;
-	mutex_unlock(&priv->mutex);
 
 	return 0;
 }
@@ -796,9 +790,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 	if (!cfg_fmt)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
 	format->format = *cfg_fmt;
-	mutex_unlock(&priv->mutex);
 
 	return 0;
 }
@@ -1259,8 +1251,6 @@ static int max9286_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
-	mutex_init(&priv->mutex);
-
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
-- 
2.32.0

