Return-Path: <linux-renesas-soc+bounces-24947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69234C7A162
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 280874EAB81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3035283C82;
	Fri, 21 Nov 2025 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXHeRkqb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A72D283CA3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734158; cv=none; b=sgvSW/WNrCyrLaesoDbbmVbi9zy3Bx6XsVRDMUwNWCGr1skjx5VO51J/JxZD30BZ0hk1pOuE0rhbDQR9yS4cWws+f/QsW034thp3HMh61pRgKdB8NulkLOR5+aBBysJ/9Ng/WYvlteTRKH0O1M4O/qvnAZzAixrkFkclf1IajPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734158; c=relaxed/simple;
	bh=rGomwv1j+WjYPUB0s2gBlaDRESkkQ460rifo0izm2us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SV/61JB2gE7mjp/Mc8iAzhl3V7hOFiXf59KnAiGdYAH1L4rZnM3DLWr/0CSW+I2xUcxhgvQdE1Oze9D5OeXwmja31T0hqACUl8pQth9dTjTALfjQpXNGjXhnhvigFxsLtW/MPPV+jCTTFnYKQAvcee90PUQy9uiYAyrJNRyLdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXHeRkqb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-378e8d10494so26158101fa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763734153; x=1764338953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d60XQjiW64npXlclebZS9Rgc/GJY+6pGwgEBihMlifw=;
        b=QXHeRkqb0Gif9hZm+cHK9R0QCRQKDEZw+xR1GNWp/Z1nmMM/cgcmpeXi2TyuoRcsBp
         xQFg3V0zoh/TUl5trVJdfPMNZB1T7UuVbhSA42sB/jZQ3jxeCuxzeECHYp5snbvyv9tM
         dQNI8LLNNV59ykF+6GKUARLTseUoEisCoeHKpKMCxl2Q42lqBX62PSo1gLvEB3V6CPS5
         UWICQVM4E/t8fVL7jTPClJ/QafKmFwx2ybmux6IbgdeTMycbxgcAUR4R4y8/6KUrZwa/
         zZLnmLkLHf1yaOpg9kT1EUGUMYpCpliw6ZvaCq7NPopNZJO+bHMvJ8x68yonI5zdPuTO
         PpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734153; x=1764338953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d60XQjiW64npXlclebZS9Rgc/GJY+6pGwgEBihMlifw=;
        b=ujj7haWzmS69mr4jB+eg+VZYRr5EocOFpMai4uWYrziFCCjggV8PFsCUk1CAFD73Ht
         cmmY1ILeia1q0OO05QBYZPy1hcwgxZT9ZgUX0eRp46mCq1KG9TBv5nPnJG5JDZz92wZM
         i+ICX0F0OhCM+Xerfd7dVM5WnJIGe/mj1KJ39uSXuuVl9SftCjRb6lqSkmJeIXQYX76Z
         MrH8s5ERr1uH3fY6Yc8P5nztkv3Z+1dmBAiFPFUj99ZJUWmB+MdK2P9HGB7cu0RhVT8z
         G3S223158Qx4I3xizqzcgVuPFz+rze0MZ7vx/0HcKZpwGHLAktyksdkfNPGxNB2b1jzs
         W1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQsbCd7VDCZW5Ed9KYFW19gDfdewMrMUvdwCJUZf2PXOneLrTRXPE4Jzs0tqETIMoSvHMcZeWmdDtg1z6T3yf5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEsjTpZ4gnD54Kx5JHVAldqZnVLQIIzRDAWYdYtjBWostvoYEK
	4a00KS1x9N91DLg14xNt6a9g3kDDPYmGhzBTNrPCAC48hwRATSW1A9KSziwJX0q66Z8=
X-Gm-Gg: ASbGnctVhvxgPNY43SAbwEK7eAzN1yFHGVgeE3E47djiUE6YBU5IIee0MhiPFIl+sle
	K8GMMnsDwHrZBHdkmYsozxCi33/K4oXhUR+RkskNpaJEHC3JDFvzl39RqnurQujGUJrFi7aZOvq
	G+iSWYQuwf5a45CoO5zVdEnTVdLemDvXL0+y+5WvXjYjxf6rGL4yturYRKzUsrjoScP7VyIzAxw
	j2AA/2n/dzyTqvuvyW2Ed0XG6zfusspdFrmy7F9uT4p/dFMDWfX5D89OUIK9CkN5jlFjrjEvuBo
	B9CxVaR17/RdH7rb9PnFVRfM+f0slUAmYtVGbzQ9JvVCxdI39H9jnHGdCu+cFSWdN/EGrUQ+mv9
	SohHhBb0Jka0QibTL4QJi0QmDKJ5doAKQiAzv9+R0JMbnNCkm5fcios9NbYM8ibYdXltZOlZJrM
	I07YSmitdBH/yQnk/qglpylRk54HziKhAoRBOsCWk1/1nM1Jj1FNC9kjY=
X-Google-Smtp-Source: AGHT+IFvk99EN3C1k7NRA4IPuhp3HI8V4IBTrZL8ZX0888GMzEzI9uRCSO8HT09T295ZD+Poj0Sdfg==
X-Received: by 2002:a05:6512:6d1:b0:595:76aa:8e with SMTP id 2adb3069b0e04-596a3edac17mr794945e87.38.1763734152584;
        Fri, 21 Nov 2025 06:09:12 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:09:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 15:08:33 +0100
Subject: [PATCH v4 3/3] drm/rcar-du: Modify custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-3-d89bf8c17f85@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
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
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
index 216219accfd9..704f5e067357 100644
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
+	drm_encoder_bridge_disable(dev, old_state);
+	drm_encoder_bridge_post_disable(dev, old_state);
+	drm_crtc_disable(dev, old_state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
+	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_crtc_set_mode(dev, old_state);
+
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, old_state);
+	drm_encoder_bridge_pre_enable(dev, old_state);
+	drm_encoder_bridge_enable(dev, old_state);
+	drm_atomic_helper_commit_writebacks(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);

-- 
2.51.1


