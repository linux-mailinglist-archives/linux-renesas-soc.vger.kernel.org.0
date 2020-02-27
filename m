Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C85E172685
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 19:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgB0SQR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 13:16:17 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54170 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbgB0SQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:16:17 -0500
Received: by mail-wm1-f66.google.com with SMTP id f15so424114wml.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2020 10:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZMfA9aWw1LYmrFFdoc2a+Paav2KuYGb9y2DZvr6Ld/Y=;
        b=idI/nUprJ45PYhJp29FjMNueKSpuMVv0zdPxqGEuKgnDrpaNm35BZDDfsJv90EIqHq
         GrbL/2o+aXpDbyAQZgfMUaOdHWKKoPWUc8Llev7MeRNcKmjsYLyq9ofxH9FvaqC6u0hr
         TpC43EzxIsJwK9HmgscpnLu4jYNAdGXVXiQhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZMfA9aWw1LYmrFFdoc2a+Paav2KuYGb9y2DZvr6Ld/Y=;
        b=jmyEtO53Lc+1nSq8KCdMOyq7FkuOz+w27JTRd9Eu/E/DtmX55+rFu4Zp19PX9BTahL
         mUttwZNN1/8+C4JHC5XnC+hZSYsps2X6+do126pKIlQONZ3LFazPSnmBg7SE0/3mxXcu
         mrxtm129hbkmYi1I7gjtiNhd99ZybTB3Qt4iwnqD80C+AKOkpyxr+rDi8KdzgSKASlmA
         HfFOJJ52E+Ao0jlz5I0a9UguOKZPx6ownJTOYXPXlfnTp/yIYek2wXx11SHGbWCDDtyp
         hA9MDt//jcp4KSVgo0b4HmvvWA6zKfRV/UrM9yQ4td5hqKo1UTHbTI+ZKovhV2/SBWe+
         dU1w==
X-Gm-Message-State: APjAAAWvVyEra17GPTJtsrtpZq8ov09m3NhHIZgvOwF/G3MM2lXkbXFY
        Ka8eYLE0YgTSs4Iv8ndGkPtVag==
X-Google-Smtp-Source: APXvYqyAiAd3NqjzGM5pcc7wXbEXPSOeetuKuPXQLAVyaBb11j4QYczqKjclZTpGgJDMIkv+DTiqsg==
X-Received: by 2002:a1c:7512:: with SMTP id o18mr50299wmc.110.1582827375044;
        Thu, 27 Feb 2020 10:16:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 10:16:14 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        l.stach@pengutronix.de, m.felsch@pengutronix.de,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 36/51] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
Date:   Thu, 27 Feb 2020 19:15:07 +0100
Message-Id: <20200227181522.2711142-37-daniel.vetter@ffwll.ch>
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

