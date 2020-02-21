Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013991688A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 22:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgBUVES (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 16:04:18 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51268 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgBUVES (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 16:04:18 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so3173050wmi.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2020 13:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZMfA9aWw1LYmrFFdoc2a+Paav2KuYGb9y2DZvr6Ld/Y=;
        b=g3UdLycTZRD8eeM5HSVKb7Alhdfbqm49HlpEfjUk6LOpVS1Ffp4p2RIj0PubzXi5P9
         6Wa+z1O7LOV5f3HFlmXwR+XbEeyZL1Vvig0eb37FFNGX4zIivB+wIeswU18TurO5bJso
         TQE+68ROrlv9WG/cfwVlkqTNEaKuqfoGINntU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZMfA9aWw1LYmrFFdoc2a+Paav2KuYGb9y2DZvr6Ld/Y=;
        b=rU5dqXnU8Z5YixAOiUJC0FugS+FdLDvF49DVNb2EIwTWO/hgMtNy6o+pk3/YxOHmxc
         OtFsPiiCrYTGBr5NKhJqaOInhVbbXTyiYonpJdrYB9LfvZuUfxNCn7fIagfnIxR7UAFz
         9VpmseukFGibLCDD2i56N6gqtfwdqcEeTC28eYtA6f3tSR9YCaMY8NfSp5vaR5AqCTT7
         BuDs2QXYYD2GPmwf7qtese4ZpgYL9yfML6K4LYBjnjzTwvid8EOBKpsUtXGxLVRGdJVf
         kgVkOaSoW7sY/pPj0Cx73ZKS1sHdYj5jRGX3F/msHTjB0nuyRlBBfeSYLHoRy6pNtgpb
         0VAQ==
X-Gm-Message-State: APjAAAVB0flbC9iBBNkZDRxZoX8wJNpwz7Yuzzy4T597wFvpb6wWM1/P
        IZOdemb/Lcdyb3Kdqw3PM718og==
X-Google-Smtp-Source: APXvYqzmUOd6nPukL54uGIe88r3O8OEPKDecAxQQve/5H3z4OSQr84J5cLIUUx7ml4UnPRNvKdgTuw==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr5608079wmh.176.1582319056102;
        Fri, 21 Feb 2020 13:04:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 13:04:15 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 36/51] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
Date:   Fri, 21 Feb 2020 22:03:04 +0100
Message-Id: <20200221210319.2245170-37-daniel.vetter@ffwll.ch>
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
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 654e2dd08146..3e67cf70f040 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -530,7 +530,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 	drm_dev_unregister(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
-	drm_mode_config_cleanup(ddev);
 
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fcfd916227d1..dcdc1580b511 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	unsigned int i;
 	int ret;
 
-	drm_mode_config_init(dev);
+	ret = drm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-- 
2.24.1

