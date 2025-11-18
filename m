Return-Path: <linux-renesas-soc+bounces-24717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465FC69A16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 037FD2B632
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 13:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED16279794;
	Tue, 18 Nov 2025 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wosVQi8a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6622230BE9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473161; cv=none; b=O8Lt3JO9Ruf5M3qQ1UPRsoN3LEeZY93P0ktZcCb7EyAhWdWiY8DioiK2EthEpV+3t5FtU9WiLBDu1pFu4YkqJ71qFV6edr11fdRweFBq27ozEQ/xRRVmUhI+uX80enGi/U568xTUM3ky+hLPt0aO3Uh65PUpfppou9H9G6AScQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473161; c=relaxed/simple;
	bh=z64W0N6rffPcUYaFXCVa0YVtmC6aEoMZJV8l9z5QIU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qblEkCY+58tiW+z8pZphJ55/cevBRQFMZjAl8IsoA39/Io1D7/P/oMOswsJW5HRb3ADsjCedy/AM8mYskukEbjL8TANtg/XmBg942waNJZQkCPE0cVhtaEmjh3fWtd/ykB7cMsGRMyE+uVss1/inrH+zEl4mfJgvuJ7cA8wpcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wosVQi8a; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-595825c8eb3so5455628e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763473158; x=1764077958; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaTe+b1ye5h/AwfFGLANzjH/J5A7rL3yeYNV/rVxI2I=;
        b=wosVQi8aVgbU2QBe0n+U5nGhyw0iweYxp+wPwm8m0Im/ha0bVq5AITqBBHpMRf4p/c
         iN+J9R5CIajI+v41sLNYvm5WnHtf9NdGJI2Wc9xlK78Y5PBRpR3AXFCAEeCqr2ktVksG
         rwlMfOCv1JOMhA/dFimP+mr3LJRVEjpaCzcLrYx6hG7V9g6Asd0cKBTev+eCiRxTi8M/
         WcGhOatNXwMjNJZ2dgReOh9xZ1KuwuA7+EaTsGJOg9EGlehiCxz4+nkOaLhUYs7JHcJF
         ur2RpBefckV+eByTGm/g9SV9Yfsc3RcGDdu4ECHNhUinD3n2WvzcLuyepa9fkEswjndH
         o4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473158; x=1764077958;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaTe+b1ye5h/AwfFGLANzjH/J5A7rL3yeYNV/rVxI2I=;
        b=qbxZEmCM8eaznrk1WGVe28PtIcVMK+9dGfifdBjh8M6QzMkDew4AwFVeN6LTJSz9Sg
         +4Cr4wZ4TS2aZjb8Ke5gph2J1O9f4CIT6P+nnXtmZvP8z7DvqPbU9mLIdXDDOao9iXXB
         13VXnHYfYl6JJqa+jn/PhvImw7IPlC16Z/H0euVhF4aE5aLBcK5Q4yoj5C5liIUy/GZL
         m7eTwzyj9STx0oGD8j5VoAS1W/iLcKZJRlGmJwCLbAll1Z89hi5WX3LV77KOYPIxyOz5
         nuLXHo6K/JcDieBSMLXF86tlGB09xR8xcXCQpC0ULmJqw5OiE0NFIegOtFIK/zrloqXm
         islg==
X-Forwarded-Encrypted: i=1; AJvYcCVttTtqsQdNWvUZwecmEY574+qYWoDEDFQr/iGPzpW//sXIlUnGGUAdqbHJboQjddCMNOOLZ9YDhz34sy41r5GC1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjh6MJwejBbEWLPrgkUDva9fKI21kZmOcXEnRqIgpGYi/sBN9s
	o31dv3myywIAY4tdZ4+/v/6pEhTLopqbhWx6B/bWyENvIgXhrt/fqMcx9fxicMPGJMU=
X-Gm-Gg: ASbGncsKs8111dqzNcT7FbYvh6DNraBo4GkTMWUL9+529/FTDQBB2CoALheXQm2BVOw
	KqcoICT7kmTsQb2CDIgstOltJ1vx4CtXkgK7II03GYKjQYal9YAsRHP/J4yp0JTWCnTZFx0Bop8
	dYb6pRE4fQUOhpatTIx1kjEIxbWBWxcDnPT4aNPrjPSD9EVW9tfvmR7Er4Q1mUf/WgqVnNHIBcK
	X8SNIh2aJIHTlbZT5HLAhmFl83S1TehQFujjr7W/O4EUqPFtsBYb4GLqqJ9vK6vyQGTOeW3zGrO
	ucRKbnqRarFhsx6BgYiOjDwipuGT/F6JgW5W7c4ybzb/DZ0XotZiiX5l0G2VXyo8a+wpGgE7lFy
	+kokRd4g5GGRS0MclovAWXEvqvT/mx3hwzZOhpuS8+Skr117gYiNEaNX3F0PUkzU98L9l5o+khe
	/jkYMXObyyPR+KD3tQyU2c2A2tUD4y6xQ6hClw4MLqV3PuiKegCHlE8Xg=
X-Google-Smtp-Source: AGHT+IFaM18nTVu333bbUCq7VxC1brsVvz9U5JSgeOsz389jmfv/SgEaP5v2AVDm854VlQ/Cs6q0xw==
X-Received: by 2002:a05:6512:1250:b0:594:54ec:92e7 with SMTP id 2adb3069b0e04-595842523bfmr5002142e87.28.1763473157864;
        Tue, 18 Nov 2025 05:39:17 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040c55fsm3963391e87.98.2025.11.18.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:39:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 14:39:12 +0100
Subject: [PATCH] drm: atomic helper: Add special quirk tail function
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MzQ5AMBAGX0X2bBPVoLyKOKAf9uAn20Qk4t2V4
 yQzc1OACgI1yU2KU4LsWwSTJjQu/TaDxUemPMsLY4zjdfRgrysrZkX4fLbWY6hcX5duolgeikm
 u/9p2z/MC4g+P4WUAAAA=
X-Change-ID: 20251118-mcde-drm-regression-33deb78a968f
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
drm_atomic_helper_commit_tail() helper function to deal
with regressions caused by reordering the bridge
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
This obviously needs Marek's patch to be applied first, as
it is a prerequisite.
---
 drivers/gpu/drm/drm_atomic_helper.c | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c     |  5 +++--
 include/drm/drm_atomic_helper.h     |  1 +
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f03b93c72b8f..fe30159d13b1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1976,6 +1976,38 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
+/**
+ * drm_atomic_helper_commit_tail_early - commit atomic update to hardware
+ * @state: new modeset state to be committed
+ *
+ * This is an alternative implementation for the
+ * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
+ * that support runtime_pm or need the CRTC to be enabled to perform a
+ * commit, and also need the CRTC to be enabled before preparing any
+ * bridhes. Otherwise, one should use the default implementation
+ * drm_atomic_helper_commit_tail().
+ */
+void drm_atomic_helper_commit_tail_early(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	drm_atomic_helper_commit_modeset_disables(dev, state);
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
+EXPORT_SYMBOL(drm_atomic_helper_commit_tail_early);
+
 static void commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..4d88b342ed9e 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -104,9 +104,10 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
-	 * the case with e.g. DSI displays.
+	 * the case with e.g. DSI displays, and also make sure that the
+	 * CRTC is enabled before any bridges are prepared.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_early,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index d7fb473db343..75e480760313 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -64,6 +64,7 @@ int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state);
+void drm_atomic_helper_commit_tail_early(struct drm_atomic_state *state);
 int drm_atomic_helper_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock);

---
base-commit: 643e6ae9e34fc3a87c7953b6929265e93b9c38e1
change-id: 20251118-mcde-drm-regression-33deb78a968f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


