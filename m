Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500501688AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 22:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgBUVEY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 16:04:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52451 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgBUVEX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 16:04:23 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so3170010wmc.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2020 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tQeVYfsUFKgsSmw1aQPclRTOralMynD4h6posp0ymq0=;
        b=THRswSvqhN6fuSW/RSrVM9RPAjhndUlmnGE89EsKP80IKDfhjFyO1hMmTUdUt9rz4u
         QdLfA7QbMHQooJBBp/3/vCHT+vMb+ZPUPqORQMWgdwJ0EgX48DKGCN+3PxM5Bsu7uchQ
         g5pdj5d3MXo+4eZJbhEfzk2rvFeQcXlzzLttg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tQeVYfsUFKgsSmw1aQPclRTOralMynD4h6posp0ymq0=;
        b=aWSqqWq3AQfbb2xhKXt35wt3cDcv7Maj70pOpP6tIeDWHQ0wqryk2OH8XH1EMvE6CT
         dAOZxjjzzEVl7iQjdo0R9RVapIebpG9XcZeRbT7yRCUs6y3wtWJt50ne6k08/3R4iNL9
         G0QjHGyt3hk+aflNiRRhTQruQwXcNHjb8btYoa0tw502Rpg+CvHKW45TSzdu+THTeXxb
         XryH8c/6CL2t4invX8y5y2KfoXbhQDa4vZIUYvVyBoYsoVF26HyPFfib8MumbH+/XFr6
         uyqynecsQ0hqhPlqnbTgskRbn2mfKITYQFtD7R+7ePhbzXUs6yphPwAhVgf1Th9zQqtq
         Ucjw==
X-Gm-Message-State: APjAAAWEbYgMgFdxlXpTxrOSbI0pfOuGh5aZTB4J1AXqTNtwaEx42XrD
        xLPgCD29kjc2WrQ5C293T1/O5g==
X-Google-Smtp-Source: APXvYqxKNfNo2ZTASEwgaTgXiTDV9loh8FfFaeHxuGt6Q57q6i8b1517mqplnCB5bL7BwexqCIjXWw==
X-Received: by 2002:a1c:8151:: with SMTP id c78mr5326076wmd.29.1582319060158;
        Fri, 21 Feb 2020 13:04:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 13:04:19 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 39/51] drm/shmob: Drop explicit drm_mode_config_cleanup call
Date:   Fri, 21 Feb 2020 22:03:07 +0100
Message-Id: <20200221210319.2245170-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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

