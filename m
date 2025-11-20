Return-Path: <linux-renesas-soc+bounces-24899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 771AFC768F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 23:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1635A28AAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 22:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D5B2E0401;
	Thu, 20 Nov 2025 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rABcltEf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2268239E81
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 22:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763679358; cv=none; b=tX7aBpZ4XC8MgpZTMC0a/8KAfjcBXMzgHE/PN2eZe5cj7fi9MeGHaze0Bxo1rptyMH4R6NdH5xsx9AmEjr5SWGWYojioPoLdWyKsPL/PO75f+I9Y2O1g2yIrE1zFf8hxsJQLNcPD1aYYklkFY0lntI3AVX7UzcHKJIXPzbsIrmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763679358; c=relaxed/simple;
	bh=ruTPiZU4SY0bGdeASa0XW1NVi22khjea+gFiFjHXlzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgZ5l5AvasDCOl91yTJzOiwoBsoNhnlplzMhkhabaZb4ZjsO6npZ2LbkgXgbdMLoCv5bOFY+BT6eRAtOexyv83X8GOKVq1BWxgLRFCz9Y1/OcojHbQmeTZqQishzNnM2VThWS/RP4ObHGZC3DJP6sPBnBHd2knKnn8vMBimqoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rABcltEf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591c98ebe90so1794962e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763679354; x=1764284154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
        b=rABcltEf07vCK+ITpJKz1vWJ3jQK8WjZgkXZK2ED46KUHHgEINdk9nNmN/DbIDoDpD
         DRdHiMeEIGSVLMCVoYH8szVWJ+YYqdyftZf4ZcBaDh/u8d3ieiLloDIQDBHpjNeqje7I
         0HW8y7UlXhC2hhkaVYN/GLDg4yJCbVpuYl+84aCswn4e92kecNkm94D8kkohfzsKpW/f
         qDf5TGqx+X0LK1uem3SLo/l00gNv6Oi7tqyfhDhZjuJ59UHsQUHsGtXpvb+WmC0wwavk
         Ylg7oSIV7iUPmU3OZ7evQETFpBgzsMiuAyyILZgMu6yzY7UnCumdwdyc2vE0z00s7UlS
         YR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763679354; x=1764284154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
        b=H8GttbYY+P3wTJJy2UHnwvnUNUiFCEDZyk7rq2tzkcS//WtBwD/BTJh6oeKFO44WvY
         /Y3rUVD4TPvhihAJ8dGScJX61X6hRu+UNYxFOSug5wC9c1eU5vQjs+Gu0SM/B8eJ1WGh
         95a+tdDk7NIhp/a68EeiVt1Q7tesWFvVJcAmS19dPCO/3ZMcP8pnsREC3J52J9YrVdUb
         Ri+Wv4T9d1fwTJKakvizaYtF2cG8dEwvppm0MhAjzkNGf99YM4kXzwhAz6TnnWHDPhSW
         H5+1JWRe3b5oUxzsDAAUtm0pDRRiZso+KmpLeSz5EE+zzSuKs8gBDWeoju0JbhxWpVZG
         SSmA==
X-Forwarded-Encrypted: i=1; AJvYcCVUypXby5PMn5T2T0QyTrsjggw+JSEQqxSCmnSWBU1NODRyOoXTsGGSOI659hl/j9Bd/GXX/Jfny1DIrolIbcrjww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8aq/nsBW0/ctCXU+vExvNeAVeVmzz6fK5XiZ+AQ0GgcmA4YAK
	Vrb7Bm69ezmC+i4gXQWJ8s+mlZWeJrI0QDmJKUK3g6FGSr3IJGiA9IczVyX2QDggOKAlY2BWB3r
	hbhM14RBZZQ==
X-Gm-Gg: ASbGncvXJjo/cZmm6/lE5R/8gaFJbMpF5W6LMu3WP38IcgSh7VQ16c1RbuzOEq2xJEo
	I4Ni0RMQMaBuXqP8AnT7KjT9TKBBDsSqyj81JUaJTkOINv1nOMkC/XKq9So3CkrX5sPtDtyJYx2
	9shGDcZKntsp0i4lspFkQ6iwMMEM74EdV/+cJJ/o7gslgqgHoldT1nWnCGWMn7ggUmRcXWLXm+s
	JsGcUqtpPbFPgSRi6mj76Pmi/l84djbehx1GRN21jdXVyZ7cXGtpOkeI6l1d5+qe4mdkY19yqOE
	BlpcURw1jIibrxTj51Z12HaS9ntIIH6TTtvi+Jjv3smZRc0w4hMNixvNoCyMvPS//ugKIbIejO6
	IjdBw/P6xIQ7Qzbsl6eAVPZkZ+h+/jCzOsIlLZ4szwRZqkv9/CcZl2RO+zKEgPf8WBrIVbLxCCE
	4ppGIwq+C5NwDZREPB09O+YK8BeCTQKkfY4VUXc1aLb1qTp00xTXqsny0=
X-Google-Smtp-Source: AGHT+IH6YCa9UIe3b2frKJ2OHFfqg0ooXQh6HmGeTHCO6BkYBH0AHOCL5vFPB7J9FgKpShI8V2AdcA==
X-Received: by 2002:a05:6512:2342:b0:594:2475:a160 with SMTP id 2adb3069b0e04-596a2efd773mr246920e87.26.1763679354023;
        Thu, 20 Nov 2025 14:55:54 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:55:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 23:55:33 +0100
Subject: [PATCH v3 2/3] drm/mcde: Create custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-2-24b1e9886bbf@linaro.org>
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
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


