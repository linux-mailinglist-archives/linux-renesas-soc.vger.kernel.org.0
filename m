Return-Path: <linux-renesas-soc+bounces-24946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E223C79FCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id C563B2D108
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD9E1B4244;
	Fri, 21 Nov 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0BTjMSF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9F2F657E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734154; cv=none; b=q+gHXjAiKc0cyxCoukoaQlVgmO30W9D6IuQPXTct/x5wH7kVsDvrQLk+Y+gkk2VPnR6uVErjKJ8/5Qm0zscmowowoexFgWdE8zjnImGUiuS765a4zPFcpi0815wg1YiLBywsDTCjaLeCxPQZ54N0iBsMdQkj9fA05HKLg7WpNTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734154; c=relaxed/simple;
	bh=ruTPiZU4SY0bGdeASa0XW1NVi22khjea+gFiFjHXlzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ld8XkqD8aK/a1XL7gucBbqioi4v3oJvCzEB7EYBThK/HJ9zs9RuUBsiVXXS7O4v05j/RtRsV0v5p4rIl1PwAEAmB+4svnh58dlEPzaFe5Q5UzOAsow2SSpwRzZMYRI5mFLFHurc0EekhQhVfD4OKTwrgp4lSJZ6YJMU2d9dobCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0BTjMSF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so2895431e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763734150; x=1764338950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
        b=b0BTjMSFjaR0Pkur50uvWCc8NYkS23+avvnl7dEpkyYZ7A3klqBystTFQsNBgsVNOp
         6HNwZXTSF7gDxRInS0fjhO7PR3CJItEqCrtlWUXvSMNc+hfMWNL4wFy8f9t7+byezjDb
         FXe0Zp4kBaKeP5ClRfo/kvDoTbvcx5yV3konIqFWrUrkhF0YsSSYd5QtKHUg56DQq2c1
         dhh60YuQA8JAy+5hELY8GvH/GBMB6BBpYjzUm26E4ipCd8YoymVrggvckXjRmTZOCXSg
         fhq4JLL6Aov8Gz/w0WuE9n0SDfMvkU3N1YclUmNzNdTifZAOvLBPczgIeJ+HnB1B8O9L
         v9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734150; x=1764338950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
        b=qi9SGnM0Q3RSoTVm8BnEd8POypPnzvWylWQMhoXymyqeC5XkyrDlRrxS3hliOREjeb
         WtTYoI5Akx3ET4j8H/R+qPYsLpuFjKaTs1jLl0yhtUUnYVaj+U2PAlAQl4YHiNdEe6pS
         gF/mYwh0oSXSGkpyAQCnrSWbbfHEYE/8uWR4HZfusMPxyo2PPluv0l4IQYZtKDROTJQi
         qb+M+hCzEeelpqeHAbq7zg5cDuJzHe4zi+PQHEwZRZ8lwrsemiReDYW8MtWFbAPmPUIz
         6nTYfLfPKIuwnXN6UPYP9yQ4ZNwUx4jRKrcft133HHL8tt1z12i1WNyBVMPgnExBXWq2
         fyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrsZczayha+ERRuAImazdp6i/adyax7GSo9Pa5O6Y/+Y1fsbNf/ywMp8LaqVEOIVlxs/t2Px3hYzkvjsEIBiHxHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5K7KSsSMRMzsRg1VEWEtr2DD2YuLEswpP24G8rRZtpPp1++j2
	Ow2oa29bXEWiNh9N0l5HidhExFIVVIyhy1aKCCJbe/IcN+uoe6pdVNggWlRbUEUlHtc=
X-Gm-Gg: ASbGnctmdAP1RWgMuONk3niyVoQ0qYyAeLkoZlCL0p9L62iK4QMinPnqSmd9UbA6CgO
	KTXZjVdI3wHIRedtWGyNsL0Nl9TL/LRE5qmvRk09Jk+d7ElYmseOdcbwUwAd14jS4EP4djSypDM
	Lb0ttcX3PtbihRTUpbNMEC9JH5/v0qdoG9G2DPd9ZhhfiQ4c7uYRGvTu51+YbEmQeWGhA+lG9C2
	0iUfKisrjz5DffSFa1nwa0cTOsz51adtFBwIaU0EjXWqnOHnZS+C5wXyw/+md8RLqG+jpBJPRoX
	Mrg3nexNYjhkt6IHPmJSKuK+AWUMcHcgSrzdNb3+u3iuCNPpleqnst3s3jvDYd5a0EgYS8UwY1U
	4kq7bNgYaSfo7jz2gwLYvbG9w+le8qRag0Dwa/H9DIIKCVOhbW7f2VdH0Qg4GG94IAs1fnJW0Kx
	u/g9NHVFoEaIdV4su8ofz0Tus9PfJ6jHTmzjOyzMifGjbpdtLZeDftjt4ywsOZboD1zA==
X-Google-Smtp-Source: AGHT+IGGcDGEKQITT5/tGvcE73xIUckd+xCT0V0Qk+ljyWya35+gF4rei0wl07b04qDunpMZy60+Ew==
X-Received: by 2002:a05:6512:ba3:b0:595:9195:338f with SMTP id 2adb3069b0e04-596a37a17fbmr1051650e87.23.1763734149570;
        Fri, 21 Nov 2025 06:09:09 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:08:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 15:08:32 +0100
Subject: [PATCH v4 2/3] drm/mcde: Create custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-2-d89bf8c17f85@linaro.org>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
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

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks when used with MCDE.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

Solve this by implementing a custom commit tail function
in the MCDE driver that always enables the CRTC first
and disables it last, using the newly exported helpers.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..290082c86100 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -100,13 +100,48 @@ static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/*
+ * This commit tail explicitly copies and changes the behaviour of
+ * the related core DRM atomic helper instead of trying to make
+ * the core helpers overly generic.
+ */
+static void mcde_atomic_commit_tail(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	/* Variant of drm_atomic_helper_commit_modeset_disables() */
+	drm_encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
+	drm_crtc_disable(dev, state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+	drm_crtc_set_mode(dev, state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_writebacks(dev, state);
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
+
 static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
 	 * the case with e.g. DSI displays.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = mcde_atomic_commit_tail,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)

-- 
2.51.1


