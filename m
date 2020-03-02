Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24849176702
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2020 23:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCBW11 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Mar 2020 17:27:27 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40954 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgCBW11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 17:27:27 -0500
Received: by mail-wr1-f66.google.com with SMTP id r17so1857056wrj.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2020 14:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XLB1vU/39S2Lof2grAgxld8x9sPN0Iai5xJTjmM/yrw=;
        b=gz2zyeDw92tjfvUQHg5JxOClnircKGZKS3A9dwWWiMBjTghPQZf/wl4m/L1QzmU5mo
         IN9BV9+TQ7k0fbiuL8hL9OiXEoARjddtB8AdMW/RMB+xyWhrwoPVxA+xSF58C7zrujQ/
         7LmRpR2e8MlSDe8p5siniyZCxpiTmRgPXG7dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XLB1vU/39S2Lof2grAgxld8x9sPN0Iai5xJTjmM/yrw=;
        b=Wo5ZKLp6dBNenkyTwCha87AjSK9BbtrHHq+PxmlZ9EW1eQ5SEBCNdkppxPrqip+dTe
         xyQQc8QMS1uS/7lvJHT+n+7quXhCzKIu2VV6nSqpr7TAtUK2pzgqkM3UQkS/bdDw5f8w
         9GxquklM8pU7VHOz+aybgXcQlLvS/Ho5qrTV43YcKWBemlXB4U8g8i9AxG4s5xucylEg
         WkllGu1OM1XwHiugJadoydOoCh+L8IxH8ojF2or59vHSr6zorAz/eE3vQCPx9K/oQIwi
         yJhZYydBMc7N+4E9ovAkZd4h9JF3iLHYc3LZl60R7ymZH6e46cmWt7D2vYKc5Y3Okund
         Xl6A==
X-Gm-Message-State: ANhLgQ24hkBZrRVRe6NXi1vN0IP1ccUTQ17aWF6zK0h7KQj2rhRZctO1
        UTmE2yjwZQeitIALoOpX2GcAqg==
X-Google-Smtp-Source: ADFU+vuUjfxngpkQcrLGTPuwROZuakjZovqai1az90//TPKjP7VfXSrOJ+yfCrY4hzJo+cYgTqsvOw==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr1555758wrv.48.1583188045300;
        Mon, 02 Mar 2020 14:27:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 14:27:24 -0800 (PST)
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
Subject: [PATCH 36/51] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
Date:   Mon,  2 Mar 2020 23:26:16 +0100
Message-Id: <20200302222631.3861340-37-daniel.vetter@ffwll.ch>
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
index fcfd916227d1..482329102f19 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	unsigned int i;
 	int ret;
 
-	drm_mode_config_init(dev);
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-- 
2.24.1

