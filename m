Return-Path: <linux-renesas-soc+bounces-24900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C6C768FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 23:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4A68D2B69F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 22:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A7F2FA0EE;
	Thu, 20 Nov 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmvcTinj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466282BE65B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763679363; cv=none; b=G3oq1tWsZhAulrr+RR4GYRO+YxNeBk9Wgr3b3oSY2M+GC38yeM9ZOcXDcQVr4zzW+m1uGTPJjz63m1KLhXTVi+FDxjIpyHXGSl0MqDJ760F92CNNhrG2fkiGeXWpZueOk4wghpyKMoyRlEbfKZa8hKp3wzKAy7jifjkIIMoKwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763679363; c=relaxed/simple;
	bh=YEGu4EyizIKrL8sJUoC2Y97vwucD9kiG4MeqWdpUyRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rApwHGX7AFMeGqrkCynDG5wm7thybZZ7IsQeeGxU3NueQbtV4u/NT3kEogTp18ZDuxR1bF6UjthgMv2qjZIYz4Kg2QmqycMzyIQerGg5rYiTjrPl6B1RlJ4ctwUduG7QDHZnhrgQDPGYPW11BCAVYj0fRV6oFXwp7Sq6WNdvy0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmvcTinj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957c929a5eso1976565e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763679358; x=1764284158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V19WHZJ0LiGdpxDp5Xzjy+hNnmDgOEjSJETgzGbOoc=;
        b=FmvcTinjMXOwrklLmyj4jZiDFRkRnLACfw6vXybIe8fdoiw455+ychuSSgyjcK1I4G
         z+N68g5Rjkfnaqt4QUhnN5UzcTb015poj71nr0iJtTGOu4SdPvCPfCX1S/3Wcj008KTh
         ag8yOeGAR7+wdw0KsgF0+FwcWrIrQEZ8qBKRhzsrxvLUdVTkdHy7ZcRODnOeYyj3CQE5
         A3Xu53/0LTA1QNH8TFO06S4htrq8lfhMwgI5DFBt4TXQIQj9boJ9pYZjKfH2Kje5bV9Q
         aYSWWkybaAHxd7SLFfK9etpwTuSIYXTnJNY4nB/8RcWidhoZDJhuFHVTXVTRP6rLPvgR
         s31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763679358; x=1764284158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9V19WHZJ0LiGdpxDp5Xzjy+hNnmDgOEjSJETgzGbOoc=;
        b=ZaBAszzP1FBGGIfvjP1k5lyzArMqdUN4U3s0dOOPadkem2jaeMKANb39teDpERuyWE
         MXuZGt6ohUaEikFGImgN90pIZp6De5x4nLRlRZxZUZCkiYV7hKD8ldvycaP29qLSmLJO
         BB+a/WDbtBjREMVJrAtpKVcy3wgnmg5Wj4fF6UU6eTREjT+kbBGs/g4FzRNE+ql9ATqA
         oxkJ0/wVNWZ3SnJWaq9skDEV4tEW3uJ6iBjRQ+lB09EjpqOuvMFcPyldMKUNSwWjgkF5
         N6i1y597p6f66m9mviU/103GVN2DVgRSNOTUa+MGewtYx8qu/AJBQD6SNuz068x2MyKi
         bBYA==
X-Forwarded-Encrypted: i=1; AJvYcCXQFyvVqQplPwiYMWMmABHX1XprZW6l+mN+4dlgBq9+eSBTb7YE46ZqzvKT1BZ4icY8J6PwZknTyiqN0WjFSk2mMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgj+L3V7LVR+BXrvjFywkDAJaLSASepmnK6MINvNGBZFGWwegz
	XeZQSoIVtZvaAJNT6KVe1eYR0KmFRXI5rWzPQXrNF1FZpj49rxYm1RaRfE0PlJoGAIq7OHPYvun
	LIMGcxSb1qA==
X-Gm-Gg: ASbGnctmDwsyogQacoMxpAWBpSEYZ5mwfOCaIwtsGUEc3MUuXCj4LLXfS1ldm1RlIac
	RwAgISVpxdBuHEgBdFJhlsb1WK4Sr0e5uvhHK1NUa6SiGJtCYpN+uBX5P4xDg8QDCqZwvCWVwBd
	P52aQfAdL+ohK4+C8Juzl55UV8RSGEtUy6NzoaLYCkpHvGQONlpQpM5fnWDYynKjVtvUKS/0ksF
	7PbEJXPyQPXSs/7Yg9zWkxWzckC1YCF4y1jxQwNYvWjhCU/wGOFpImu2i5wTTSHNZpZ3Tk+0g3L
	WIh/9mLptuMyQWUXfB9g5bYjPVHlXBkhQrme2WXyz4A0feKamB5edQSjqK04wOVfCQ2YFeAYJ4X
	8jGftF6bGaxrC/IUIq+LGXu5kVBtIfUB1jAteyDTj41SpxCYyvutv2SofMGXviMnMCR+FBg+rwS
	eitCW6g3JN9bC2xc/orUAjZ9zAuUCsZaJhUckl9hBWDdbOAbTUpbaqSD8=
X-Google-Smtp-Source: AGHT+IFQCy93+vVkz+zyf4jE1GvNsq0F+1SIQdV2kOxKmGKnmCHkK+0WJ82nyGq7goP7wnuIqeRZsA==
X-Received: by 2002:a05:6512:3d87:b0:595:83f5:c33f with SMTP id 2adb3069b0e04-5969e2d4b98mr1713739e87.19.1763679358449;
        Thu, 20 Nov 2025 14:55:58 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:55:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 23:55:34 +0100
Subject: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
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
caused regressions in all bridges that e.g. send DSI commands in
their .prepare() and .unprepare() callbacks when used with R-Car DU.

This is needed on R-Car DU, where the CRTC provides clock to LVDS
and DSI, and has to be started before a bridge may call .prepare,
which may trigger e.g. a DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This is a modified version of Marek's patch using the approach
from MCDE. I'm pretty sure this driver also needs the original
semantic ording during disablement, and it surely doesn't hurt
to restore it too.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 216219accfd9..d1d756f40fc6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -540,11 +540,30 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 			rcdu->dpad1_source = rcrtc->index;
 	}
 
-	/* Apply the atomic update. */
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	/*
+	 * Apply the atomic update.
+	 *
+	 * We need special ordering to make sure the CRTC disabled last
+	 * and enabled first. We do this with modified versions of the
+	 * common modeset_disables/enables functions.
+	 */
+
+	/* Variant of drm_atomic_helper_commit_modeset_disables() */
+	drm_encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
+	drm_crtc_disable(dev, state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+	drm_crtc_set_mode(dev, state);
+
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_writebacks(dev, state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);

-- 
2.51.1


