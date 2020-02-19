Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA3B164181
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 11:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgBSKWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 05:22:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39124 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgBSKWW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 05:22:22 -0500
Received: by mail-wm1-f68.google.com with SMTP id c84so6137741wme.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ra/jYUSiXamgYu/JamVQr8pWXrAQtMQY8c7jRMMc6pY=;
        b=S8G+9qlagL5yIxvDS2Cmne8waOo0yaG0iNuzqxZupk4N2TnpZOeD9Y+aBIzJ89UiyC
         yMXxqMPId9KcRWO43mwxgBpTIwZx/8M+Ez3vr0pbRlhmimOiJemxIuG0PsCnUqm+hYYV
         hasVGlBcvKMJ2cVFWasJDiqAsucEUXpFD26Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ra/jYUSiXamgYu/JamVQr8pWXrAQtMQY8c7jRMMc6pY=;
        b=EMmRX0ecoj+VdfriBWWRVLXgfk0Gaeg/JcU8RKopHHqZJacl12roeJa6FsbIoln+CW
         JjGBftmOQsV2iCqPhS6eNWoPXWbLKJPJoTHIovPONdHIOgoFfiJO+yp0qMb84FZnIpx1
         bS2lCsZIugzmufAsnQjHg4q1dQavZQN8NLi8v/2uoKUyfnntBQGNyvlz2tdrU0obsHHG
         JPJjyln5fsAaNhvBhmPyfiptvaZIOu4LpUpBB4X+dEc+xta0qVrvhWSn21dKq1ZbdX9i
         qO3hjz6ulGy2KHDSoCi/DKcOB29epAb2LcLLayveM1rtoPUwHXXOKzLEKJ0kXzZnya90
         1jiw==
X-Gm-Message-State: APjAAAUEUjhqcpuMLWpirJOT5MeP4YTHwVObPV9J1tPu+5rR28kBK2Xk
        blwYBTzSJJEfZ76mVpA4gT+GKA==
X-Google-Smtp-Source: APXvYqyXrsEWE44mHqV6H9DQnZaeWEEjB0A4IvWm1mBkRUT8/uZfDnbxEm/1kdjWKDQVjddy+Vgj8A==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr9100246wmj.27.1582107739143;
        Wed, 19 Feb 2020 02:22:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:22:18 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 40/52] drm/shmob: Drop explicit drm_mode_config_cleanup call
Date:   Wed, 19 Feb 2020 11:21:10 +0100
Message-Id: <20200219102122.1607365-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It's right above the drm_dev_put().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

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
index c51197b6fd85..e6e34bb75ba0 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -126,7 +126,11 @@ static const struct drm_mode_config_funcs shmob_drm_mode_config_funcs = {
 
 int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 {
-	drm_mode_config_init(sdev->ddev);
+	int ret;
+
+	ret = drm_mode_config_init(sdev->ddev);
+	if (ret)
+		return ret;
 
 	shmob_drm_crtc_create(sdev);
 	shmob_drm_encoder_create(sdev);
-- 
2.24.1

