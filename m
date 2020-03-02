Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC7E6176706
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2020 23:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgCBW1a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Mar 2020 17:27:30 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39138 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgCBW1a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 17:27:30 -0500
Received: by mail-wm1-f67.google.com with SMTP id c24so788784wml.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2020 14:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6DriMqNrv3MKXMhvrVNVwIC8amEVGk3oHUDtDqCIMXk=;
        b=RVEHrfgtQxq1/nzEhU76zs0XvyioZOCh6pO18ycvt28PFf40wBw78qU3QJwKNhBeP4
         nBha0WE/zkFiW1PQ2n5vGTvXfX/ic3z/a1PvQqtoDprhunYTTrjZeNrQsuZgZQFpas/k
         Do4rhll0llCtI7E7L2OeRJp75Np7PBusjXIIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DriMqNrv3MKXMhvrVNVwIC8amEVGk3oHUDtDqCIMXk=;
        b=lURLd9cT4MyIsVio/UCfuHYzSZ3rHPJlVv6f2XRZ76OUVeKCuBN0L2Phabmrh8YxyZ
         sACkGxbfXylc7CHeloxh5VAuyfb7Q7An9fdkxkdfZ2gwbFc225K0b0P6JXeFHqGoBgfH
         OOU2LhRgxp7wKRXKxbYw7xSYdst2Yfjk9SqCoGKuSBWwKGyQHJWLgOIn1YhxblVAr4Yf
         TToKtWiunwZx6VRdPwnambzdf7ai4iV9ReHo5eH0IIihKkgwqhdrUNhg0fi+gIOg/op/
         /O8Cm53UfhVjowu/x2KAyyWccU2p73xsS4RunYa88dzlUpkHYTA9yj+V1ab8fjYxTJFA
         3CIw==
X-Gm-Message-State: ANhLgQ194lnyHsgH+h6901n5kSOIuAU5QVB3WoWDEv6Jmk3X4gVZ0B+S
        T025HpEL6Ip7Z+1FpZj+XCDZrwJ+WNk=
X-Google-Smtp-Source: ADFU+vsn4MKfj97OsTbMi8CfKepnUCKiQDy0RxR/F7ytd7UoGiLxVxGT7CFnLk/JK8IVIJovtQCHZg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr572046wmj.12.1583188048768;
        Mon, 02 Mar 2020 14:27:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 14:27:28 -0800 (PST)
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
Date:   Mon,  2 Mar 2020 23:26:19 +0100
Message-Id: <20200302222631.3861340-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
2.24.1

