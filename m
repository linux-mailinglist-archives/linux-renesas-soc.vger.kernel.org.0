Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E3240BD5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 03:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhIOBv7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 21:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhIOBv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 21:51:59 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CFCC061766
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Sep 2021 18:50:41 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so3557593wmq.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Sep 2021 18:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ve0ND4UBUtoUsSmBb/d0sk2VLmXxugvcGbqrng16nFQ=;
        b=oJWx0DOL9rcSzv32jyMD4k6BUzlr3HdVDeBWS9DfSoIR1I2kpAZ4rgRU0cdgI4LXkn
         6E675WS2hhXPXfma8Jx+LrKeO6n69vEiuY254K21yI0iCvtbsh3R7w0QWHBRvemxHOPG
         6d3cjF7ML4bPbGQFXeANdIUo+v8OKYvll9dxExLDIAw/SuGwigTxDcTPy2ILk23EHW6m
         FWFXPXADkg35GYVk/b+Zpm2fd4tYktkw9y4ul6eXdUX+fL+dA9mGiTismfNwlS8LSc6S
         6S3kxaAhvO+Q0XQMFiZ+jJo8/sFSjAHH0HKhZPoC/i/y9QqSFm3h/RnKjkSe3Sec4Yul
         W8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ve0ND4UBUtoUsSmBb/d0sk2VLmXxugvcGbqrng16nFQ=;
        b=uI4XnYD97Ox0DhbVT/OooG1qwrzL31la+3TVASJDiL9vF0hcvT+PiirTFv+fOJ0lzQ
         rk1FhnOKZgUKCOhWFvkycKnx1z45FpmGnUQLmNNHjk6885Z3Wk4hr/UHbeHrvPr/2vme
         D4lYtcUnVN0R2Txe0wKuQGqL2XeUFgCLxD1FDVdJdTETxwIQageg78sWFmvRa5jGCN9R
         JX42zSePM6q1FWW/+dxvbmWjtZW/leYmypIRz2ein/D9DnOmZ4wEO21LGBL6jtezrcdW
         fB2SaKs1AJZelF1ycErgR+vGF7W+VDlz/ZegO1w0Rq+RnfgBk2XdQTwdGICE0e2eB7Vi
         IVKQ==
X-Gm-Message-State: AOAM530f6zL4bzQhbO7EIeNFuTqd+BL3rX7f4bLXS7dq8/42pPwjV8pi
        j+Z3zwCTnGD1vgqSeH1OYTuN3Q==
X-Google-Smtp-Source: ABdhPJzNOU+4RJWC02/KeeE88/YDMG42AWECECOz94A7GVN0VoTAmVd7kgSO6bp/UyECdlf7cSrv5w==
X-Received: by 2002:a1c:2705:: with SMTP id n5mr1847214wmn.176.1631670639666;
        Tue, 14 Sep 2021 18:50:39 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id k17sm3486863wmj.0.2021.09.14.18.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 18:50:39 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 1/2] media: rcar-csi2: Cleanup mutex on remove and fail
Date:   Wed, 15 Sep 2021 03:50:12 +0200
Message-Id: <20210915015013.3169934-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The mutex was not destroyed on remove or failed probe, fix this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
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
2.33.0

