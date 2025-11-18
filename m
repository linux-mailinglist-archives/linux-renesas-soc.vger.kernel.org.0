Return-Path: <linux-renesas-soc+bounces-24728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B99AC6A183
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 180622ADBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBE62EC092;
	Tue, 18 Nov 2025 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDOO207O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8553019B7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476598; cv=none; b=RCH70r++k2AfK1CjMY9HzYT9t6y02Z8ckJdnfF16FeXVaWbR/L5Zo8S3W0E5ozh9Lwbw59JMp6gmQUqjKBij20lnnOGiOA2eg7bFYyFMGECK9DWau37X21Hh9zi1uFlJx1g5Wa9qgWFFnx7xHtHLZQjEX/y0k/SvUZKTI9usOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476598; c=relaxed/simple;
	bh=npv/YOhCuZVF1WsevvKgch4k1f35hhp4L4AASakOyB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGWLvphWUI00K6O43zGZgICD3Q6GCwaLE1n4Jl83X7Z3fmzD4zOPcd9urfM/yEh1XLMwuhTaxicvmHdHjqv1pfG/lzDfSmx6izpQRXzgVZQ2KMoKb//WJlncfp4ldsOb3j/5wW2qO4VEg6ZDoqLn5xpj2n6oUTQS58MaxqsO+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDOO207O; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so508521e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763476594; x=1764081394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6Voq0GRJwbVB5Ud6eqsoz8Deil83ba6/78LmZuuOio=;
        b=yDOO207OwMp0AL9KsSmcmzsiCTsqAlhmo5TR1Z34thvZVrsrVTwXFvVciwA18tW9/L
         GCnPcqoONPo183LeT28+hIT/FKuNXUEYwU5Bm9P8vXjEO87szkRgbEO7Ob+VmuUsO5k6
         PCUCBGSuB1i/UM6IgVz2yqQw2W7p6BhzTFRs5eQ/oKUEyCHIp+LCBPkuhQqe/S6cQWsG
         yZlJ53Q8LBHlfzxmfqyv6eBmnO7PUVuL6B6MENAjrW8vEVuO5GaelSGgGbCqPRdBqnVX
         XuFIKI8tKWZG3eq7KQoLjhs3ynnpDFvIdub2Ske3dZVOIM/a8wemJHOy1AjrsMn0CfoH
         YaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476594; x=1764081394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6Voq0GRJwbVB5Ud6eqsoz8Deil83ba6/78LmZuuOio=;
        b=wboU//aQxRkb6mgn9gEm4SEny6n1SXGrdEIh8gTsgY/PIRufNV+RdWcGgDym4zmnE9
         ciiS2bCslhvB0cCpeyD/Q11f+F1szs/vyNLPaSTMgEOChPSanKYwi8AdUDU4f9UvwEwK
         6Mv9d7Z/5OX38z/FyLMybYa16iWew3HaPsc3EI8u3Ol4lNImYibbB6PWUi6BjmEg8krI
         ZOezEPIettyEaVW98d75gToI7mMPvWwp4hB0j6tf11GxcdyxJdeQYVAWJlZf5vU5JYB/
         Aahc4E/N7LYn/bGRm3/QKmbC7iWQFrD+hhH8vQs0Sq+bwO4NUA4t2XkfVkK/jHbrHjzQ
         o5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU23VRvkTbwf1VFKbdjJ35+HPoyy+P2lOzga/rkOJtOeqd5NBPco+nYDCI4w4wSer42EtLIc5pcnCYu5XEOJkIiNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEEDDvqrkPM/COkLArEXrUOaIF49dZHjlN/nG5vqpQDrWkCrhb
	iIct4FNT5zE0ULvR9DJogufZ7vP04ur6cy4z/8OP1rdlWdxWzam6cOqgE598r5cKtWk=
X-Gm-Gg: ASbGncuDYy4cRRG9lRBMG2xhgESWQ9Hb61P+TbsbRcY03dqo0BN1ow2RC6sGvfBM+ov
	xLFResX0NbGRbJNfatNa0EoixclsHIKZs2ythhRtynsg+xd0uVDVUr/b3dKqJW5FOJi2IMZDIFN
	jnLO0OzpE8GMXKMP2qEQ+/Qb/9b/5bGn/Oyu4n3f7uyA3AmA4AYYv5P4DmbZT2YAsu/NysJBo9/
	YGEVYPc8xzE0vJnkZ6agI6Vw/R+ElOVcMplkAqKwYILNcz2ydT+OLw+ZUHxjo3FiIUkmadlyhzA
	FbfZDJbj3agNrdMGkVlThJgIhmdlFD15tLOqRgkHscUjoE6mtYC465738QQWTnSklXZEDCyqYic
	Drn/BYpdOOJUY2Djjz/c3Ku0QpZ4d8Rk3U4EXps3n1xKF1/Qz0Bx50MnveJXSeFcWdY09HFHz/0
	VhJS3V1xuFp4FMFTcbW/rD7LlE93GzYQqrv/+5ceCAvqY5YKhN3T35ksRjZgcp3K0Hjw==
X-Google-Smtp-Source: AGHT+IHuRAfdYD4bkCkXQzm/ea/1Tzt5yWvWJ5jl5KjnlhYhPPbLeti1M/oytNz6VAwH5hDhO779lA==
X-Received: by 2002:a05:6512:2342:b0:595:7bd7:41d4 with SMTP id 2adb3069b0e04-595841bb9b0mr5828579e87.23.1763476593949;
        Tue, 18 Nov 2025 06:36:33 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:36:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:36:03 +0100
Subject: [PATCH v2 1/3] drm/atomic-helper: rcar-du: Enable CRTC early on
 R-Car DU
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v2-1-4fedf10b18f6@linaro.org>
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

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

Introduce a variant of drm_atomic_helper_commit_modeset_enables()
which enables CRTC before encoder/bridge. This is needed on R-Car DU,
where the CRTC provides clock to LVDS and DSI, and has to be started
before a bridge may call .prepare , which may trigger e.g. DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fix this by restoring the enable ordering introduced in commit
c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable"), to enable CRTC early.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 drivers/gpu/drm/drm_atomic_helper.c           | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 include/drm/drm_atomic_helper.h               |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..f03b93c72b8f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/**
+ * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This function is a variant of drm_atomic_helper_commit_modeset_enables()
+ * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
+ * where the CRTC provides clock to LVDS and DSI, and has to be started
+ * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
+ */
+void
+drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+						    struct drm_atomic_state *state)
+{
+	crtc_enable(dev, state);
+
+	encoder_bridge_pre_enable(dev, state);
+
+	encoder_bridge_enable(dev, state);
+
+	drm_atomic_helper_commit_writebacks(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
+
 /*
  * For atomic updates which touch just a single CRTC, calculate the time of the
  * next vblank, and inform all the fences of the deadline.
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 216219accfd9..b2403be4436b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -544,7 +544,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..d7fb473db343 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -93,6 +93,8 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
+void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+							 struct drm_atomic_state *old_state);
 
 int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 				     struct drm_atomic_state *state);

-- 
2.51.1


