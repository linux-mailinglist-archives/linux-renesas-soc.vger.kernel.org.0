Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4484424ECD4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Aug 2020 12:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgHWKq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Aug 2020 06:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHWKq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Aug 2020 06:46:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89A9C061573
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2020 03:46:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 185so6439423ljj.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2020 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7l6jdZamlqEsFmZWjsOIxeaEnRE65B410R46FIxqF2Y=;
        b=NgHujceRWQ7T502W1AGoMKPrxJeM7G6girgvVlbeV+j3Sw48PkyeztD30TGatNEnzH
         RXh4XtKCx3Mvu5JeNREsvGW5q88XeG1KLo5g/aEyJX0/wD7oVgMOd0DGH/uhqiHMA39A
         SA58BXG+lwmz3eShi+x9CsrarJsjw6qP/B/gVU1dndE9mhD9DJdvMjpq/RgNSbU7EqMx
         atKR5j5wgVu3joTuCYQkwRA4T/YMiGk7G3EXM3KvbIuRanBR8X+BHCPqQrP64A5AfqLG
         9qwl2vU1M8BLf2x+SKUMrsCx+7Wl1SavV6CoS5P7sCcX/X340IJo55lfN0ROoxhTnQdS
         cfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7l6jdZamlqEsFmZWjsOIxeaEnRE65B410R46FIxqF2Y=;
        b=tOFZYllAv3AcCyza+iU5oYbfIbE8kJHU2TOxjUOD2S1j0iFwZg7UGNyLnqgyWrHfQi
         h4xUJrjsFB4zHqe8lLKd1+JgBjVzytBCZT0Usaaj9zjZZZIFwy4Np0eF9VfWEHw5zJ8V
         n3HUZ5MwQuEcxfN7i8uAFlijVjXphRp+HG0txhH11cl8teb5CcWKRE31m2t+vLP81lqx
         fSzfUP59kgcLPTMhw1ED+jiKb9L4SJdRfae4fEyJW2pqT89qOShqolPzUtCEcJxMHJZh
         XDOc+0llyBAIDuPgMiXIghvSfWY7YN98KBtcOMesnFr2qhOK9JGkRyTe55lzu0DDL/vP
         7aaQ==
X-Gm-Message-State: AOAM5328TqRu5Du24IySWfJYSlKLkc/GGha9OZaIMql1aKmzYUytrNbA
        r/ZM0UiptZrsGMzgVTQuMKQ=
X-Google-Smtp-Source: ABdhPJya6ritx1IFagTY3VZYCPCibTXPllnn2aEVUQ08oCMufSBAE+kemNZ/qhACJp/hJuVtbECZ8w==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr483132ljg.406.1598179584290;
        Sun, 23 Aug 2020 03:46:24 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
        by smtp.gmail.com with ESMTPSA id h13sm1516301lji.134.2020.08.23.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 03:46:23 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 24/24] drm/shmobile: Backlight update
Date:   Sun, 23 Aug 2020 12:45:32 +0200
Message-Id: <20200823104532.1024798-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

- Use get/set methods for backlight_properties
- Use macro for backlight initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 .../gpu/drm/shmobile/shmob_drm_backlight.c    | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
index f6628a5ee95f..634b49e50ded 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
@@ -18,13 +18,8 @@ static int shmob_drm_backlight_update(struct backlight_device *bdev)
 	struct shmob_drm_connector *scon = bl_get_data(bdev);
 	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
 	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
-	int brightness = bdev->props.brightness;
 
-	if (bdev->props.power != FB_BLANK_UNBLANK ||
-	    bdev->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	return bdata->set_brightness(brightness);
+	return bdata->set_brightness(backlight_get_brightness(bdev));
 }
 
 static int shmob_drm_backlight_get_brightness(struct backlight_device *bdev)
@@ -47,9 +42,10 @@ void shmob_drm_backlight_dpms(struct shmob_drm_connector *scon, int mode)
 	if (scon->backlight == NULL)
 		return;
 
-	scon->backlight->props.power = mode == DRM_MODE_DPMS_ON
-				     ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-	backlight_update_status(scon->backlight);
+	if (mode == DRM_MODE_DPMS_ON)
+		backlight_enable(scon->backlight);
+	else
+		backlight_disable(scon->backlight);
 }
 
 int shmob_drm_backlight_init(struct shmob_drm_connector *scon)
@@ -59,21 +55,19 @@ int shmob_drm_backlight_init(struct shmob_drm_connector *scon)
 	struct drm_connector *connector = &scon->connector;
 	struct drm_device *dev = connector->dev;
 	struct backlight_device *backlight;
+	DECLARE_BACKLIGHT_INIT_RAW(props, bdata->max_brightness, bdata->max_brightness);
 
 	if (!bdata->max_brightness)
 		return 0;
 
 	backlight = backlight_device_register(bdata->name, dev->dev, scon,
-					      &shmob_drm_backlight_ops, NULL);
+					      &shmob_drm_backlight_ops, &props);
 	if (IS_ERR(backlight)) {
 		dev_err(dev->dev, "unable to register backlight device: %ld\n",
 			PTR_ERR(backlight));
 		return PTR_ERR(backlight);
 	}
 
-	backlight->props.max_brightness = bdata->max_brightness;
-	backlight->props.brightness = bdata->max_brightness;
-	backlight->props.power = FB_BLANK_POWERDOWN;
 	backlight_update_status(backlight);
 
 	scon->backlight = backlight;
-- 
2.25.1

