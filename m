Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8112172686
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 19:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgB0SQX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 13:16:23 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38084 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbgB0SQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:16:23 -0500
Received: by mail-wr1-f67.google.com with SMTP id e8so4642003wrm.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2020 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tQeVYfsUFKgsSmw1aQPclRTOralMynD4h6posp0ymq0=;
        b=QpZz+x7qTZ0cIHMKmJI6gf5gkWK7udNthFy81iarVRgF0kyurSwfEMl32D78HKX9N2
         /by26du92UtcjJfjKhsf+26TKpoRQDp18dx/B5y8mqEbwneMsL24R2cIqRRkOtWz/c8M
         PLnOS+GlpWrkI06ifm/qATNirUqAEy/F50cAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tQeVYfsUFKgsSmw1aQPclRTOralMynD4h6posp0ymq0=;
        b=fSPP/jRtel88Q0xBUEHPxadoKpoIXWrX3UF7z7BIM4f8slJP+o6VbNrNoGsbkpYCg5
         PCD3slrquTpfRuHqmD3wJ14Y5WceAQLoc3xipUvQVPwenNuWYuANU3g8wUCPskFEs+C5
         bTqfhBZEP083zXNOdqUwkk85DVeW+ytUpcAHSdLQd4qx1Hn385qC7iKa3Rk5WzO5SEr6
         jlPZar+BnrxgGsf9Tg4FVlFyd6QpImYoweujlQ7zn89yylwbW2UcsnKNL/IDQa9fubZe
         H5G+CRXHAfZn3cPVutFE/Fk/f5xAlLe8QjFxbkrDX+l9PgA82f8b8rmpQ96TTXWw0PlV
         jbEA==
X-Gm-Message-State: APjAAAW0AorG/zXcPmAajYzrckQj398Oyrkoec33ARdJf7XTYpHFJsji
        DJeymrc2gJlpJJX0xmCMSC7DjQ==
X-Google-Smtp-Source: APXvYqyaAs7Wox6OrUGyqy2LVfaaxaf9zFMiki8XCJ/0996IbxKxCCV0WUVHKUKtJsRW/zSs+7dGbg==
X-Received: by 2002:adf:fac3:: with SMTP id a3mr129988wrs.370.1582827379573;
        Thu, 27 Feb 2020 10:16:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 10:16:18 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        l.stach@pengutronix.de, m.felsch@pengutronix.de,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 39/51] drm/shmob: Drop explicit drm_mode_config_cleanup call
Date:   Thu, 27 Feb 2020 19:15:10 +0100
Message-Id: <20200227181522.2711142-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

