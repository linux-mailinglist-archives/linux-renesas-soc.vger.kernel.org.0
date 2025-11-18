Return-Path: <linux-renesas-soc+bounces-24730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A73C6A0C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F44B34E03C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB722EC092;
	Tue, 18 Nov 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rth9koCj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19E292938
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476601; cv=none; b=HBhnMh5xGkJR2vsnkjMJEI7ZbR6+1rnFFugnBRkNbU92r2EJOwsVtwqc+HoiIry7/OIiIPfYIo/eo4Qd9G+8MB1e/zD5JInxac9z0EA8NXnmyQitOIcQDqUhXwiDyOYIV0zL0KKKySsdahBtp4qAh+WqN42MFu++wS7HacJTF0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476601; c=relaxed/simple;
	bh=FpL7wQ1uMxPW/aAEUKE0kQsmSaiilVIesNlTPJ41kvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYOVbyhVrXy4BECp9VPCw3iAjXqZE0XlF2jH9bPNCKadEeyLV5svxlou4HuhBjG1fPA4Y3yPxxEWmCb2fkv5NCN+PNEKpX9UAjvxKjkbx7jsyO0+smS9fnSRY4bAR+TFrPoDCaFgvueeFKdXao9fQR98OWlIl6No1BFgjhjr8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rth9koCj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5958931c9c7so4116157e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763476598; x=1764081398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bycRO5ju+g9tmmqMlsbxCbRXsywPFhsV7WY8G2XSAs=;
        b=Rth9koCjDBxsFp5GzeIpRyDZgbqpxXAmpjVnhroDYjEXML7y2t4CW1weeL60tJoDgH
         DxZU9XILcVcGsERm49KSyl7z6yAR+flAw/WNCxHrvcu8ZGIrgd3NzRzzsSGX+VniLLsG
         1lSqoOhQGES+XFpVDnwMkiIvN3AGtkOqqUgeMGxUzVO+iEJWM8ZxGGtlP5bhZADWTaay
         F2vfMobxkQb+SR48tFtAJvK6syjnyvzYnrigcJqrPICqTGfuaIANGB4mD9wuexkJAbxQ
         oB2pDAlxQVbntGv9+ADEgr+CqzBx5zb9Kn70jBgeRDco4oir4Z8pTTz19J5zPH8nO3dw
         esgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476598; x=1764081398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bycRO5ju+g9tmmqMlsbxCbRXsywPFhsV7WY8G2XSAs=;
        b=MTA5qBpwqZxtc3/BMeFtHq7WVKmrTnBIKBwY0MjzIu3q+dQ+gTZHe2NGE6aD7nzVX3
         xJxtrt9eClZftQEZ5tl/R5YaQCS285eSvmf+yo9Wa21oNs1CYFwrPVoikbKiVQyxThV2
         6fjYJtGUj54N8jo1ArhewS5lUFTM+ruy215vI2zaZTZ5tiaLhABwAORMuCtPiYpEC1Z+
         jcODyxsC4caC+iJ9k2ZBiiNHtAAE+8+Me0WVZ78rlP3rh+AnbmdBLxFCO4YqfpYuApoD
         Xi9XHQINGWZIpmfO3ppcCyK2qURMtohaBNMlhLwqdbjTQklDMc/Dj+J99GQMlV0T8kLL
         /VxA==
X-Forwarded-Encrypted: i=1; AJvYcCVQIYSke3cQHr1imhXmEYzMzAFEDkt2e1s6AylfKpE/xzjfZiGj7ZUFBKcU0XxUlseYy4pgxji6pcyOnN207k2X4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJxMCj2eP9oWghSzTsuK9V5v6Ygn21kVP7XML9AbxaAjDBH4g
	bLUy2rr6VPzbBfCu8gpNz6659tHBHf56CVnnyDZhFbqlK1j6jXymOcRBN3u0wHcsTCo=
X-Gm-Gg: ASbGnctAknk0bBXzdn3w2u9+VjAMgGFoHy+iwc26imeyhy6iZdCgVKyuad/uykvFNou
	hoGJ8BsrAxys8cCAH7MqCqm844O33DDfeudQFHCrg4+qem5FBV2Jg/0hKFQ6I6+fp9/4AEE2XVa
	LvXrjiGcpSropNMfV750pgmH+S1DXzyrTIcK4jl7EsoRVO5GxqtdXcM42BCVwrLFAcd2ai2brzC
	g8vMRiAd8zAXenWyHFTJtzLWE8RXuDjqUtH95z8yDhBJjg+d3k6vEUKvuI10CG/ypFXQAhcGc34
	Pe68XTFoEF8P0dX2X/rFRmTEUz4sWh9tYUx6Eh8IyV5jI093nAtrr1NhKm1zUv0IF0f95aKbTxp
	kiO21mPNXETTTv1UC+Dflk7zJXBOV/JvADy4A/Tmr2Rwu5B0nJQPyJ0CmehF+3rP82QXhdpXJeG
	FgJm1OwdbOuNu7EUPWOth1rtKnHyMtyi9Gx7xoXG3NRRgKCKSNWTVMggofVGxAaznP4g==
X-Google-Smtp-Source: AGHT+IEjIbE007XQ42Lov4SPdYVQSps/79scrhFaNGH/VJZzATj+erAnkiycTvxb8UPryBCvY5yJjA==
X-Received: by 2002:a05:6512:3e05:b0:57d:1082:e103 with SMTP id 2adb3069b0e04-595841ae2b3mr5805736e87.16.1763476597995;
        Tue, 18 Nov 2025 06:36:37 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:36:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:36:05 +0100
Subject: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
In-Reply-To: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3

This adds (yet another) variant of the
drm_atomic_helper_commit_tail_crtc_early_late() helper function
to deal with regressions caused by reordering the bridge
prepare/enablement sequence.

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

This patch from Marek Vasut:
https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
solves part of the problem for drivers using custom
tail functions, since MCDE is using helpers only, we
add a new helper function that exploits the new
drm_atomic_helper_commit_modeset_enables_crtc_early()
and use that in MCDE.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c     |  6 ++++--
 include/drm/drm_atomic_helper.h     |  1 +
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index eb47883be153..23fa27f21c4e 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2005,6 +2005,41 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
+/**
+ * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
+ * @state: new modeset state to be committed
+ *
+ * This is an alternative implementation for the
+ * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
+ * that support runtime_pm or need the CRTC to be enabled to perform a
+ * commit, and also need the CRTC to be enabled before preparing any
+ * bridges, as well as leaving the CRTC enabled while unpreparing
+ * any bridges.
+ *
+ * Otherwise, one should use the default implementation
+ * drm_atomic_helper_commit_tail().
+ */
+void drm_atomic_helper_commit_tail_crtc_early_late(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	drm_atomic_helper_commit_modeset_disables_crtc_late(dev, state);
+
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, state);
+
+	drm_atomic_helper_commit_planes(dev, state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_fake_vblank(state);
+
+	drm_atomic_helper_commit_hw_done(state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_tail_crtc_early_late);
+
 static void commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..f3833d20c0fa 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -104,9 +104,11 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
-	 * the case with e.g. DSI displays.
+	 * the case with e.g. DSI displays, and also make sure that the
+	 * CRTC is enabled before any bridges are prepared and disabled
+	 * after any bridges are disabled.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_crtc_early_late,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index d479afcd1637..1e85df5eea4f 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -64,6 +64,7 @@ int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state);
+void drm_atomic_helper_commit_tail_crtc_early_late(struct drm_atomic_state *state);
 int drm_atomic_helper_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock);

-- 
2.51.1


