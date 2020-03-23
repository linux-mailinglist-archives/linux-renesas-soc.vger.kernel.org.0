Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 250E918F757
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 15:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgCWOuv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 10:50:51 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37276 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgCWOuv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 10:50:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id d1so15129674wmb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+n0kt13JLOOA06dxYWckddoP/N3w9YSOQJqXMTw9VM=;
        b=gPUBcd+7Nu+3R0wF9D32HXrJtnM7RGxkWos+FNVOM10t0NU5wS+rjbPZUhViIIEiQy
         2hN3e48//EvHTJODobtxyldtYDU7BCa/fCmpj8jLTG2IaFtGqqo9ElMu51bayuno0Rar
         rH9cA/dMbeCXwI9fA1NjNYTKFsgXC5hHje2IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+n0kt13JLOOA06dxYWckddoP/N3w9YSOQJqXMTw9VM=;
        b=czbLvALW8A31jZghTuHAp8xa6f2FsuJx/HENjThp1aRZJh3y9qMKoBGnRhrG57xMh0
         8F6f1i6G3wysnsszOjLLO6tJ632PB9KBFgj0g9913HOvTycdfGJNtrog9Fdqzs0rE/Z0
         84s0Qq2yopk4I7SFABiwJ9hcTl7W8kTscyJeEowOo9gXx4TzM58cDxZPDQ82W4g3KR3L
         Ms2GiNneKcixhfihsDdTsM7wKUfvyd0J+rLZYUdiA89bScQIHSNBDZ5AbXQPNiEwUikS
         kIQOnjgIIYRXraKAeDh5zeh51A09te/koclrDP0nmPzAkS9Q6d7MnNMfOY1YHfOo2LBT
         6MuA==
X-Gm-Message-State: ANhLgQ3t77Xabvg1WqYdCQVntpgl8toU7i6x2WLSUdCp+XYyuhwkvHd7
        +ygSnJIe4pLK8oziNxIRN7i4fQ==
X-Google-Smtp-Source: ADFU+vtHZWCQK/GTRrPDdXMCEquiprZ3VAGWwPq8c0B1jFuBK238+5bVoXXCGHEUoRo0txw8kJqisQ==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr27147299wmi.174.1584975047937;
        Mon, 23 Mar 2020 07:50:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 07:50:47 -0700 (PDT)
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
Date:   Mon, 23 Mar 2020 15:49:35 +0100
Message-Id: <20200323144950.3018436-37-daniel.vetter@ffwll.ch>
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
2.25.1

