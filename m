Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24398235678
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Aug 2020 13:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgHBLHo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 2 Aug 2020 07:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgHBLHn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Aug 2020 07:07:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D139C06174A
        for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Aug 2020 04:07:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t6so23805417ljk.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Aug 2020 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEcpsVf39+7/Uy8QFIkZ4uxu9ITqpVFs9Owkdb5+woM=;
        b=BF/uNf/J26fC+nHoQaR9gDgGU+ECsOSvcyOhdXmzNN/hRZjkOnjdhqGU8iF8xM2bsx
         21debF9MJ0Z5wxcSxSX1FInON5T8ZRyvzVrGGzh3C2GcQy3SteB2sLjOW/Uj8oNVRZIq
         dNDco9j/rZ8qgO2Oe70+oC8rWsih1+aX/lTinvMvyW9HgBZE6JRpwU7zaNb289nvOoDq
         gtMx0m8zJtPPIPJnHfQOk0riKQnn42J8CrORrmp9Y4XMWLOMpgcgxXb2Oyf14IRZRfGy
         E0gRZn98jrUgV7LvoglUtqPKju07lqVl5zw9BpaphopABSxwC9QtAjMujdylrn6pZkML
         2RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FEcpsVf39+7/Uy8QFIkZ4uxu9ITqpVFs9Owkdb5+woM=;
        b=oVbwJju9/LzN5mMwhAGbjUdAjkfsAPpm14HTUXsduLvWWUGNVE7hKVsVDIfujXbWoA
         KDpeXMNgOWC5ruTdSBNs9zn9UUy5RFJdpWDrzr0mOfVGHRXVrEIh8SCnsa3HcM7PY6NP
         b4TOFjEYJHu5B5sz2PfJVF3wEZ+Ze8E/wnzREACdtoyuvcVwp+hVBL4WQfzVDpqXYDTt
         x2zon+JBBd6f6O3g+cCQaRD1pbyeTtCd3Bg+C6O5vFWMpSedHmHcfGpkwmgCtRYWKzr5
         icJLa1rzY7EtSxUHrDqPh8H5dT7Tdh9fHcsBOhUEZq6TFBMSWr10QfpDyvw33glmzqrP
         atRQ==
X-Gm-Message-State: AOAM531O0awg7L3lZwHv6BE3k5TmL8ik8qnjUBxkPuaDpCKNMJfDwuHz
        rJyTbuUoLZeR3WHf+uvTzYg=
X-Google-Smtp-Source: ABdhPJxBkBe+C5nCBLJFhML/H+5832j8Io4xrlU+8eZiAfv3yCUDJd/hOQ1Ovpfi5BmTYeAq0w/k2g==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr5577357ljg.435.1596366461983;
        Sun, 02 Aug 2020 04:07:41 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
        by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2020 04:07:41 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 22/22] drm/shmobile: Backlight update
Date:   Sun,  2 Aug 2020 13:06:36 +0200
Message-Id: <20200802110636.1018743-23-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
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
 .../gpu/drm/shmobile/shmob_drm_backlight.c    | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
index f6628a5ee95f..407028df0212 100644
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
@@ -47,8 +42,11 @@ void shmob_drm_backlight_dpms(struct shmob_drm_connector *scon, int mode)
 	if (scon->backlight == NULL)
 		return;
 
-	scon->backlight->props.power = mode == DRM_MODE_DPMS_ON
-				     ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
+	if (mode == DRM_MODE_DPMS_ON)
+		backlight_set_power_on(scon->backlight);
+	else
+		backlight_set_power_off(scon->backlight);
+
 	backlight_update_status(scon->backlight);
 }
 
@@ -59,21 +57,19 @@ int shmob_drm_backlight_init(struct shmob_drm_connector *scon)
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

