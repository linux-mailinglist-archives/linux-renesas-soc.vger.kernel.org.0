Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7752F18F75B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 15:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgCWOu4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 10:50:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40446 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgCWOu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 10:50:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id a81so9382775wmf.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Za1bF6q9SnbLT2dlG9RacEv7dXITfnV43EwkE571pzA=;
        b=F/JRVml+NXMQzY6pwDvbYqXy3GO+gx7CHiglakobw5tixXcqmzpQa8YL78kKowYqY+
         vHSwi0sU1F9WAE8DSYUwc4Ew9t9JCUcPbSizGCnV0/rFJFnTMh2XsgVwa9319Y03gTJq
         ChDI/VpEAzdjd+iXHEfp+ZPvTFcGtogNszBxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Za1bF6q9SnbLT2dlG9RacEv7dXITfnV43EwkE571pzA=;
        b=kLgbw5qXBcKO1/3IaUU0TRWGL/aV9/yykUcPzJB8OKWvSRdltSnVExXaYFL48XmZhQ
         rogGZ3Ap5Qx6gklndY6YWXHa75Zz1yXxHLR9HG4V8R1Pl+RUahhdvFhNL3wuMRTKpOCU
         ansMri4bO+r7fyNbgLCriAmZELBO0lNGqGmL9RbBZlIFzC80O4946dTdDomTmZ5MyRU9
         oF33Juw/xZqChvQbUrWefLC/L+9SbUTcPrSVrkRqsh2IRQerFaFgyLCKynwLc0Y2Igk6
         hlrQO/QcHPWPFzg0ogkvMroGA8uMtXuW7yPfMeHJpA/qgPPLs3AFn+z309bCMe2ildlr
         Tbzw==
X-Gm-Message-State: ANhLgQ3JgH12VADKkQbomxZk3GHuI5kq2KmF897N6R/lX65gbx5+sX3z
        iCiNsoeBTX4zA2dXzXKYA6g7kw==
X-Google-Smtp-Source: ADFU+vtG5OpGrjZlPOoT2PK7yv6S1SZWX0aj0+3nc4cGeOC5PoRvBL6VZZs/WwMmGgIhAsKrO+XdBQ==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr27635278wma.20.1584975052499;
        Mon, 23 Mar 2020 07:50:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 07:50:51 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 39/51] drm/shmob: Drop explicit drm_mode_config_cleanup call
Date:   Mon, 23 Mar 2020 15:49:38 +0100
Message-Id: <20200323144950.3018436-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v2)
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 2 --
 drivers/gpu/drm/shmobile/shmob_drm_kms.c | 6 +++++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index b8c0930959c7..ae9d6b8d3ca8 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -192,7 +192,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
-	drm_mode_config_cleanup(ddev);
 	drm_irq_uninstall(ddev);
 	drm_dev_put(ddev);
 
@@ -288,7 +287,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	drm_irq_uninstall(ddev);
 err_modeset_cleanup:
 	drm_kms_helper_poll_fini(ddev);
-	drm_mode_config_cleanup(ddev);
 err_free_drm_dev:
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
index c51197b6fd85..7a866d6ce6bb 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -126,7 +126,11 @@ static const struct drm_mode_config_funcs shmob_drm_mode_config_funcs = {
 
 int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 {
-	drm_mode_config_init(sdev->ddev);
+	int ret;
+
+	ret = drmm_mode_config_init(sdev->ddev);
+	if (ret)
+		return ret;
 
 	shmob_drm_crtc_create(sdev);
 	shmob_drm_encoder_create(sdev);
-- 
2.25.1

