Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBE8115C6E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfLGOEN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:13 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43245 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfLGOEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:13 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so10680434ljm.10;
        Sat, 07 Dec 2019 06:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zyDIaHIEoOsgYEFRA3EghxouF1YrEXIv4HHsD97xPLY=;
        b=C9PRof0NX84HlyZnuMy1HkuR+urn77PykHwGwtYCsEyr6rTcJeRmCjQ5g2ixx/0RM9
         Se7vv0thWblq7zsasyBMcwA7XfTlbG738iwERThU8FvhOx6oedkZDjZTlZAQRFqRgodC
         6iYN4EYy2+8GUYYyjlAWKyn4JK8/JgHU9I/lvHsUxZAa4drMFxfQpzeRy8jMSqkpycA7
         XDrdyMwSWvwdrwp2ooadc+5+MYpufwz4goxK5Rf/Ti4jh/QjjEL63pOxHU6BQBCiZf0v
         95QHvqdd5J8P3iGhpXL6lDsvlVS/c5lE7Evs7ZJrLk8YB7No3rhmfYkrZrskHhjOqLPR
         xT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zyDIaHIEoOsgYEFRA3EghxouF1YrEXIv4HHsD97xPLY=;
        b=gqwLfZErB5TnYKPFIsdjqCuGm6YiZLDxu9bf8zk1VySWzqBdbY9HI92waHGNbGdB4j
         HK+TogJSxxeJapwhVzsE1ZSb07ByGspJCc4XIZkBejbA27XmbtMT3gLnxaHnI4Ub/2/v
         fp5VpJyr7vM1AesBh7A11+crZZxF5upcDlvOJnjjFSlq3KLTsx+p8STarMWQVZU2NWV5
         0tSdS94BtVcu3uVUIqxb1/E7y2SUGTViDSgIXwn/vApuXrp5R3AlnQg/h6v/1OZMEpE5
         TK7rXBNvrucDLy24XGcc0uVBXMBOnXxJ04gdqszjNYUKH1P+xPmjY9T74s4XHCYcAjq7
         AkGw==
X-Gm-Message-State: APjAAAX+UruMQkHUn1MwP8q5UkWTjDd8GUTkovKyYSP4vHKSmMntLUiO
        yuakDA3sNms53p2tqP1tZAs=
X-Google-Smtp-Source: APXvYqzpRBwpO/dF5C8JBYFQuw6pI7aoTL/fA2BOACkUfXUITFiwu46JMYMO1GTATj6PIk+cZ8htEw==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr4086043ljk.220.1575727450296;
        Sat, 07 Dec 2019 06:04:10 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:09 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 01/25] drm/drm_panel: no error when no callback
Date:   Sat,  7 Dec 2019 15:03:29 +0100
Message-Id: <20191207140353.23967-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The callbacks in drm_panel_funcs are optional, so do not
return an error just because no callback is assigned.

v2:
- Document what functions in drm_panel_funcs are optional (Laurent)
- Return -EOPNOTSUPP if get_modes() is not assigned (Laurent)
  (Sam: -EOPNOTSUPP seems to best error code in this situation)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 35 +++++++++++++++++++++++++----------
 include/drm/drm_panel.h     | 18 ++++++++++++++++--
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ed7985c0535a..4ab7229fb22b 100644
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
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index ce8da64022b4..d71655b2634c 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -65,6 +65,8 @@ struct drm_panel_funcs {
 	 * @prepare:
 	 *
 	 * Turn on panel and perform set up.
+	 *
+	 * This function is optional.
 	 */
 	int (*prepare)(struct drm_panel *panel);
 
@@ -72,6 +74,8 @@ struct drm_panel_funcs {
 	 * @enable:
 	 *
 	 * Enable panel (turn on back light, etc.).
+	 *
+	 * This function is optional.
 	 */
 	int (*enable)(struct drm_panel *panel);
 
@@ -79,6 +83,8 @@ struct drm_panel_funcs {
 	 * @disable:
 	 *
 	 * Disable panel (turn off back light, etc.).
+	 *
+	 * This function is optional.
 	 */
 	int (*disable)(struct drm_panel *panel);
 
@@ -86,14 +92,20 @@ struct drm_panel_funcs {
 	 * @unprepare:
 	 *
 	 * Turn off panel.
+	 *
+	 * This function is optional.
 	 */
 	int (*unprepare)(struct drm_panel *panel);
 
 	/**
 	 * @get_modes:
 	 *
-	 * Add modes to the connector that the panel is attached to and
-	 * return the number of modes added.
+	 * Add modes to the connector that the panel is attached to.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns the number of modes added, -EOPNOTSUPP if callback
+	 * is missing, -EINVAL if panel is NULL.
 	 */
 	int (*get_modes)(struct drm_panel *panel);
 
@@ -102,6 +114,8 @@ struct drm_panel_funcs {
 	 *
 	 * Copy display timings into the provided array and return
 	 * the number of display timings available.
+	 *
+	 * This function is optional.
 	 */
 	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
 			   struct display_timing *timings);
-- 
2.20.1

