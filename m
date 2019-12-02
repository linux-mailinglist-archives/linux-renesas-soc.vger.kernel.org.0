Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D0810F01F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbfLBTdW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:22 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34755 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbfLBTdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:21 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so806529lfc.1;
        Mon, 02 Dec 2019 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bDB+ry94KK7oIL0OpHG93ZpwaWVw2/vv2p+DvmVNoo8=;
        b=kYgunyP2i9Ayet6lMKznMH5w9Pw1O3NwrHR40KkICtQXJ3n05r24HPZlE8IzGRf5a0
         ZG4Tl1j433To0AdI3WsdBWEf3ixsvYYMLiMNuYRUGjVr1ZEoLW9kIXxObCZXvo0LBV3I
         uyYZwhH9eUe9ip5HifF3lUn6zJtOb5aRrpxrz+zHWhri4kqYBP+iEdsJ40go/mhOhemc
         ODCOjP6ah+7Ejf44pkVobctv8DtFUcklLHvQP8JicNshzMziVHkryicGKhTNG/O2wwwl
         ZRBNKeT34tVwDMKtPegTjSWzBNwEQbBzUvZ2JtPBuY5wTFhGtLRrXB0z7FtxsIZFhvkO
         4hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=bDB+ry94KK7oIL0OpHG93ZpwaWVw2/vv2p+DvmVNoo8=;
        b=JilWVuRdDmw2IVO7qQO/04hHkVzVQ/jRAz/cm29Kn9DJwmhMGPcrDDYHXIHrBzxA7I
         Z8McAQ2UfpQN5Uuk++CYaNJNBgG+pfgTdqFY20XRLNcML5zN2SjVGDpoUWaB9KljfJpU
         EXCdjnP/9mluKot+LY3fqeqRCJpXuKeaDqxeHEGZjw2EoWvn6KwmGUqeyvxcOJ+wHV3A
         c5qZDfA7DqJ/YDYA7JwLAMrDUILMvb1hANHmioQXNQARC8ptgWXZpHu39R+ClQpJb1a9
         21UM64p9U/Bcq4TKhSVI5gQUPYEX44l/hbcdLimM1ZU+lDPSHQPs5ZLsCz59pkXngHk2
         jKAA==
X-Gm-Message-State: APjAAAUJuuxOKccXUNLij+thdnSCcxcvZh42vZ39Dlni4u2w0Jx3mAji
        kz+MNrU7yK/bSFG5GyqKPsA=
X-Google-Smtp-Source: APXvYqzTYsasNQayRM2nLXydOk+hJmtyoXsoit7N2AFCfkwcqCook4x6ElJIboXFRkeIVoP8hTsVxw==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr427722lfk.67.1575315198474;
        Mon, 02 Dec 2019 11:33:18 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:17 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 07/26] drm/panel: remove get_timings
Date:   Mon,  2 Dec 2019 20:32:11 +0100
Message-Id: <20191202193230.21310-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There was no users - so remove it.
The callback was implemented in two drivers - deleted.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
 drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
 include/drm/drm_panel.h                     |  9 ---------
 3 files changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index b878930b17e4..3bcba64235c4 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -217,30 +217,12 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
 	return seiko_panel_get_fixed_modes(p, connector);
 }
 
-static int seiko_panel_get_timings(struct drm_panel *panel,
-				    unsigned int num_timings,
-				    struct display_timing *timings)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static const struct drm_panel_funcs seiko_panel_funcs = {
 	.disable = seiko_panel_disable,
 	.unprepare = seiko_panel_unprepare,
 	.prepare = seiko_panel_prepare,
 	.enable = seiko_panel_enable,
 	.get_modes = seiko_panel_get_modes,
-	.get_timings = seiko_panel_get_timings,
 };
 
 static int seiko_panel_probe(struct device *dev,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d6299fe6d276..e225791a6fb2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -326,30 +326,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	return num;
 }
 
-static int panel_simple_get_timings(struct drm_panel *panel,
-				    unsigned int num_timings,
-				    struct display_timing *timings)
-{
-	struct panel_simple *p = to_panel_simple(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
 	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
-	.get_timings = panel_simple_get_timings,
 };
 
 #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 4fd61cb9eb93..c4e82b9ce586 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -102,15 +102,6 @@ struct drm_panel_funcs {
 	 */
 	int (*get_modes)(struct drm_panel *panel,
 			 struct drm_connector *connector);
-
-	/**
-	 * @get_timings:
-	 *
-	 * Copy display timings into the provided array and return
-	 * the number of display timings available.
-	 */
-	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
-			   struct display_timing *timings);
 };
 
 /**
-- 
2.20.1

