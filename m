Return-Path: <linux-renesas-soc+bounces-24898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B626EC768EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 23:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 997414E06A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 22:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC61239E81;
	Thu, 20 Nov 2025 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgBvvilL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C705283C8E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763679351; cv=none; b=TrXvoS3EHIFj2Kp7193i1/pGcnv8qNbFvje0h95bX+OJS2SmoqazJMg3d41Zxpd8mFFcxGXv9zmpghGwUQJNEO9grO6YZx40/LpKwEX4vKxh51h1UnHqeqt0Y21G1mWpT+Yc3Ihdo49IlhMV66sK8ezC8UVm+kW/PeJSIyi7Glo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763679351; c=relaxed/simple;
	bh=zKjcynNHDs+rFKTbjvvE8Fgex8DMs93zjJk1z8avIq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uW1gis9s7hFYzsKRsz0+6cFQXnKQ+WYYHc5tarc6ktUgb1p9FHONqDsaCtPhW9//tghq9tf18vWBFgdxnpyaoH26qszQP2DB842eqX8BMUaBTq4xHwtephMYsV4AsNfzqbRxR//B8r4+5Yogs5cWOPousKzi7S/KmL4h/paEA/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hgBvvilL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5945510fd7aso1155721e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763679346; x=1764284146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
        b=hgBvvilLu2E6tFe5mdYbjwRdVNMQDcz2j3L9eVFDe7v8tOEjQI8HpRx18YV/vx6Njb
         BX02Tb/YEfYpOgodLblRXq4A7XAqJSDzHXTRS06qwH4z6J5E5mKr5bNRgNhdaYXHgssD
         bbHhl1cFxpcIHlvMURkJ8ZlMEhstXzwKeSyhSfJGfiVIZEZtBrE20kLkwZjUSCF50zh0
         S/LnWjKh4KbhHT7NhIu6LmYlq8DYOFj9sNVYsq1SeOLwkgI+4Fpl1gH6ooqIRqlQbpeQ
         k5ro5XL5yAS48BEGT04j5tq/B3neISn7UoccxuTNs+QwvDkLdGk262KLzbpfTyOOA4tI
         m+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763679346; x=1764284146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
        b=ZHMCTqA6FA94B/pWIhAuO8oDrsKRAbPjrWAtlQCL1Y7FlnQr9ErpNE+jfI85FQJ3Vx
         BV/OVjpmVkEhmFtuzd9DjCGgzmCsAvMxUDE3fFfiyRDKnk8DEr5mZgrqpvOdG9KYBMRZ
         5mTdIgXxwQpInZ88F1/khCvY2vnQ7nAZ75sC9bpywxwYsZPAUniYBqqPrghwSzr7d0hv
         5Bl0sjJj3M04gZVCU3A6JRvaP7h4cvHbB8ZD+FH+bn64Jlf/GcqdgR1qQEaaBlvdKNRF
         6PNR+cIm2yFPX7Yhq5O2ds2RTiqPqnaeJv4UO5axZHXT+gnvKL+MnDmWOVXPKq6PmBPE
         em/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1Va52aKFLENUOraZ1UMfSWNfI4KJONnT11QV5nq+YzAqqvPXGaCAnerv7smrT/UNX4fFUI6M/yB4mB5SHBHoqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7aF4TgeZpuVhk/r8xpwdctp/iEZi9r4K+LiYiVEUuhnRZ3RdC
	RiuQweCYdPzwsCrzhhxF53MP5mN42VNpGEQuh3m9ETBDKCz6Gu+bYXOkWFqthWre9gZU5GkD3BX
	Xy4YOqKDSzw==
X-Gm-Gg: ASbGnctiWoPcMLugLfhbMSFxJ8m7qPXUGsFGCemT4sYcpPnATHlA4raSwFWKkNAv3yc
	yzB1rApA4f/6+xtEZzRWnlPQ+DStlsE8p7Yd7GD9QIYIX7fu361E/+EPSWH7ljgbti46Ue6aXiw
	mbnhOlLHTgYtxYEfDjJz/im1A0jXy/YysCcfyz0+uRV5amVyE07Ydi5kTP41sn8DQu6uxytvSff
	xuFUNeeFJjQS8s4kPILJ+BCqgrkTlAqKHiCzklYDv+BVL0WyOFTGa4WotU+jx2DqEY2Xc5QVRwN
	0m+xDoRPl1MR/JuFnpiHKJXRTNvEYOSi1V49Ooi0Re+D1hvOzBYjwqC0y4PTSB0o3/7vUeR/Bnv
	yX7R4tlH1Z3EFSLSYyDPKKJ0UWYI2jWP5cvpjONYep+awLCSHZeLJEjGtG9SZCg5peMAN8BdT37
	nxqHVQLrSFiVsNxZI4Y1ff/CINvvXW4xvcddjjIVBXkA1IAGP2KRbeQrE=
X-Google-Smtp-Source: AGHT+IHLRrOzhC7ObQ8MKBVPSFy/UQwfEh66CdUz8udFR249vfAwDFDWn4Pi6Z2qjNghgsWN8ERXYw==
X-Received: by 2002:a05:6512:3ca8:b0:595:7bc3:133d with SMTP id 2adb3069b0e04-5969e2bd0a5mr1785651e87.11.1763679346441;
        Thu, 20 Nov 2025 14:55:46 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:55:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 23:55:32 +0100
Subject: [PATCH v3 1/3] drm/atomic-helper: Export and namespace some
 functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-1-24b1e9886bbf@linaro.org>
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

Export and namespace those not prefixed with drm_* so
it becomes possible to write custom commit tail functions
in individual drivers using the helper infrastructure.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 54 +++++++++++++++++++++----------------
 include/drm/drm_atomic_helper.h     | 19 +++++++++++++
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..906eb4b0852c 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1162,8 +1162,8 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	       new_state->self_refresh_active;
 }
 
-static void
-encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1229,9 +1229,10 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_disable);
 
-static void
-crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
@@ -1282,9 +1283,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 			drm_crtc_vblank_put(crtc);
 	}
 }
+EXPORT_SYMBOL(drm_crtc_disable);
 
-static void
-encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1335,15 +1337,16 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_post_disable);
 
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
-	encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_disable(dev, state);
 
-	crtc_disable(dev, state);
+	drm_crtc_disable(dev, state);
 
-	encoder_bridge_post_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
 }
 
 /**
@@ -1446,8 +1449,8 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
 }
 EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
 
-static void
-crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
@@ -1508,6 +1511,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_crtc_set_mode);
 
 /**
  * drm_atomic_helper_commit_modeset_disables - modeset commit to disable outputs
@@ -1531,12 +1535,12 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
 
-	crtc_set_mode(dev, state);
+	drm_crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
-static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
-						struct drm_atomic_state *state)
+void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
+					 struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1555,9 +1559,10 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 		}
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_writebacks);
 
-static void
-encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1588,9 +1593,10 @@ encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_pre_enable);
 
-static void
-crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
@@ -1619,9 +1625,10 @@ crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 }
+EXPORT_SYMBOL(drm_crtc_enable);
 
-static void
-encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1664,6 +1671,7 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_enable);
 
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
@@ -1682,11 +1690,11 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					      struct drm_atomic_state *state)
 {
-	encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
 
-	crtc_enable(dev, state);
+	drm_crtc_enable(dev, state);
 
-	encoder_bridge_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..39878aa485c3 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -60,6 +60,11 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 int drm_atomic_helper_check_planes(struct drm_device *dev,
 			       struct drm_atomic_state *state);
 int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state);
+void drm_encoder_bridge_disable(struct drm_device *dev,
+				struct drm_atomic_state *state);
+void drm_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state);
+void drm_encoder_bridge_post_disable(struct drm_device *dev,
+				     struct drm_atomic_state *state);
 int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
@@ -89,8 +94,22 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 void
 drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *state);
 
+void drm_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state);
+
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
+
+void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
+					 struct drm_atomic_state *state);
+
+void drm_encoder_bridge_pre_enable(struct drm_device *dev,
+				   struct drm_atomic_state *state);
+
+void drm_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state);
+
+void drm_encoder_bridge_enable(struct drm_device *dev,
+			       struct drm_atomic_state *state);
+
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
 

-- 
2.51.1


