Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE9A3EC6C5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Aug 2021 04:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbhHOCuQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Aug 2021 22:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbhHOCuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 22:50:15 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2FBC061764
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Aug 2021 19:49:46 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso12410286wmj.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Aug 2021 19:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jjixc7LVMXe0bD3rZWuXthNBA6KrBliq5QpvQpx/lIY=;
        b=UJgLNKravN1J4O5txgp+u/5e/AvMSWEksFZBgkNzrfSKY4qCzwlDH/fDvyoMI34jKH
         vNQ1GDmzERx8PbsGHKWDaXkA6YLSY2231zkjx5tripTvXKkz3MQJoT+VXvqDKKbEXkPr
         IxJXeQETQtZQNimAH/9xr1CDL5xDYNJAuyw+IvnOmSJhcAYy+IUSZSnsu5ltAutMPdV3
         Uf0Jm5rFdtLkEZr6r08yv0DqWTT8i/bNKLTTnZdFlaJUj1aFjj/i5XPJmXQC6kaDNyXc
         FCkZLQeAOf1Tm4/Au5ZdgumERb7CVRlqNQZUbptDYi/a9gpLBb4kvcSsCWQEZB+4pIE3
         48pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jjixc7LVMXe0bD3rZWuXthNBA6KrBliq5QpvQpx/lIY=;
        b=fDJ4vhFn+/snpH8qsEmg0tMXgudyjQnrZffVdtfG/BUCSNjwF2VehsJu4U13yEwVce
         qI6Vx19HK6LvqiXJl8N0R+SleDBX4OiFjalNkMw2pdAnlVkVlgrA+gE55hWFEMqipXpf
         wWNVopRQbWjXgujJmuC1eOWpiudzR+1sV6K5G56kY+q/T6pYN2gi2gtQ8X+SrtYbQ37M
         PDCb3C+JJrPoqUAOEowGOkYECpvhBGL3VKdIFW4EyCoQ/TaGhXvHqfeHOs4xBz+oya4V
         nQAimnFq0/5Mmf/8Nf3vOX47cjuG0/jZcqAH48IWR247xRiKnB9OltUDh2XPgIuUEcl2
         n8Gg==
X-Gm-Message-State: AOAM533syDHlvVe11Bm5EkBMm53uXcIF2fV8poaHmCEwooj3oBGygD7o
        SByWZaQtH5x/bpA0aBtC5x0ir/UW6hK+kQ==
X-Google-Smtp-Source: ABdhPJypWSh6UFvRp+cVUxpN/vFejFYry3wjQAPIMUN62oEA06odK+faFb3zPJrWLllI5tjEHWLF4g==
X-Received: by 2002:a05:600c:350a:: with SMTP id h10mr9287501wmq.89.1628995783659;
        Sat, 14 Aug 2021 19:49:43 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h9sm5866342wmb.35.2021.08.14.19.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 19:49:43 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] media: rcar-csi2: Cleanup mutex on remove and fail
Date:   Sun, 15 Aug 2021 04:49:14 +0200
Message-Id: <20210815024915.1183417-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The mutex was not destroyed on remove or failed probe, fix this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff0396888f2d..a02573dbd5da4f62 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1245,14 +1245,14 @@ static int rcsi2_probe(struct platform_device *pdev)
 	ret = rcsi2_probe_resources(priv, pdev);
 	if (ret) {
 		dev_err(priv->dev, "Failed to get resources\n");
-		return ret;
+		goto error_mutex;
 	}
 
 	platform_set_drvdata(pdev, priv);
 
 	ret = rcsi2_parse_dt(priv);
 	if (ret)
-		return ret;
+		goto error_mutex;
 
 	priv->subdev.owner = THIS_MODULE;
 	priv->subdev.dev = &pdev->dev;
@@ -1272,21 +1272,23 @@ static int rcsi2_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&priv->subdev.entity, NR_OF_RCAR_CSI2_PAD,
 				     priv->pads);
 	if (ret)
-		goto error;
+		goto error_async;
 
 	pm_runtime_enable(&pdev->dev);
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error;
+		goto error_async;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
-error:
+error_async:
 	v4l2_async_notifier_unregister(&priv->notifier);
 	v4l2_async_notifier_cleanup(&priv->notifier);
+error_mutex:
+	mutex_destroy(&priv->lock);
 
 	return ret;
 }
@@ -1301,6 +1303,8 @@ static int rcsi2_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	mutex_destroy(&priv->lock);
+
 	return 0;
 }
 
-- 
2.32.0

