Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA5FD10F009
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbfLBTdI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:08 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35545 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbfLBTdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:08 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so858870lja.2;
        Mon, 02 Dec 2019 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LGOgtva2q0s1MxBZFBlNQnZLc92S/tb/mTErWAKqBVc=;
        b=h7uMpYQXU8nqH68TzydRnhCOy45ksFGq28L6tPaxa9aEiPfo5jSOpVakkWN+0K9IK7
         1qclRlZSneydfgb76u5Ne20nNLk1wsQj7Cj3Z64NUtI+I5OintjAleMXZo4ugNCWp8cR
         TIJ2NPk5BEhgyBCMlG9HktzmqwwZDSKf95YjiSNXJqGur69kbxDYG6cpihUCHnCAnA9c
         FwdPExbDCZ0VRivGRZ3sHk6QYNEYi4Xtmw7nn9Oqqkg5edr6javNtcxYL2hagI7YMyrp
         K4DxbC0F1zZ4WICEWZPbLWQ4xrh18gufaVK0s5f6vAXNDlFps/DBo/4ma1VXmzNRXKkX
         YoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LGOgtva2q0s1MxBZFBlNQnZLc92S/tb/mTErWAKqBVc=;
        b=KIoLMKEeuZeABb56j32sQN4X2hOuj7xZn2QZzoKUXZ9voP07/Pt1NHYeQZLtYnziqu
         4jtRUk0mxEyTbRT9114eZtQ4hqbbGUjB8Du30l4DIZJPch7/EzfGYNpXLvsov5mISx3q
         U8haKSN8f0vxUjB8DQJ3Yct8r4BVcdy2lMGxYPW5stQ5P9IfN3bhm37NrID6/OrX0UUM
         pZY26dPt0bXnhQPUmRUNYmBfzfxYwvNRRiDD2aP/e2LhSCjb7Yq3qM9xNNGgWLlTuhy3
         IZeVruJ11UTkjJZXk7h5J0s0t2H2rXfAxWJ2Y9txcmvVY8QRcvUAvRMT2hiR8hO/6JJc
         g1Ug==
X-Gm-Message-State: APjAAAXlK7tWaAr7ZNDaEG8rSCQKUs5qBJfFe/LYUiTV5AyFDOXeWWaL
        Drm8hBjOf4Skyrtx+LbfYlI=
X-Google-Smtp-Source: APXvYqxqWDVM+ppo9LUJvIL0zSPxHW/xwhiU6h6G2FvCLak5I1Hn77t5p5FArs7DmDjbO05gcgebKA==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr219541ljj.207.1575315185572;
        Mon, 02 Dec 2019 11:33:05 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:04 -0800 (PST)
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
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 01/26] drm/drm_panel: no error when no callback
Date:   Mon,  2 Dec 2019 20:32:05 +0100
Message-Id: <20191202193230.21310-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The callbacks in drm_panel_funcs are optional, so do not
return an error just because no callback is assigned.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ed7985c0535a..2d59cdd05e50 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -151,10 +151,13 @@ EXPORT_SYMBOL(drm_panel_detach);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->prepare)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->prepare)
 		return panel->funcs->prepare(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
@@ -171,10 +174,13 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->unprepare)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->unprepare)
 		return panel->funcs->unprepare(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
@@ -190,10 +196,13 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 int drm_panel_enable(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->enable)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->enable)
 		return panel->funcs->enable(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -209,10 +218,13 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 int drm_panel_disable(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->disable)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->disable)
 		return panel->funcs->disable(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
@@ -228,10 +240,13 @@ EXPORT_SYMBOL(drm_panel_disable);
  */
 int drm_panel_get_modes(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->get_modes)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->get_modes)
 		return panel->funcs->get_modes(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
-- 
2.20.1

