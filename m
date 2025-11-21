Return-Path: <linux-renesas-soc+bounces-24945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBFC79FC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 791042DED6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AECB1B4244;
	Fri, 21 Nov 2025 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgQplLtS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19952EC0AC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734140; cv=none; b=o8VO3h2UECecBR7FHA0B/WczoFVoEI9U9FJrsmjsuoR9iPLUNVGVaDI2+XJ55CnZO8W4N46/WQsTN2yQyrIajS8Pu3FLWzIQp0Aa4bjJFF+cSUAH0424BEJreZc4bt4XRza3qFLgO5YsgHSSo4PdPAq9ZYAILjL5qrtNuiZIpv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734140; c=relaxed/simple;
	bh=zKjcynNHDs+rFKTbjvvE8Fgex8DMs93zjJk1z8avIq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjFs0+WQglIyjKRjy78jhwPa1WobHydicyHPJe27ecbMz3V9+Ob7tWx/pGynXT1OFickQG1xpPc3wO4aEA+XOyr3Zh/WbwBX5FJJsJlwdljF8uZUB/JG3XIsBf2hYzQPdDnDNFWLh4yQACFMdntMbbUfp2JXa60wh3wrBdXnXus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgQplLtS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957f617ff0so2374073e87.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763734136; x=1764338936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
        b=DgQplLtSvc/B3LKeB8jGGJhy4wsy+8WfLIbGX+TQnHOCf89m0jn2NpgryeFiwt0HNc
         e4zLAISIbCdlYcTthW/NvfBTUj1LEUgztwWJnS+9BhWznojVaB9BH502WsR8RsgecAJb
         D08DsyizsaNgPgC5KrL2AeTWELF/GbVK+nm7lnfwuvQDPSu03Tc9MANTODLdBav1eAtL
         g4GNlGlnFsCFolAIl6Pmy9gNLVybYU136Fb+F2wvjlWQY7BQFVKJchsBkKh/Gx3Yq58U
         P0kTPPzzB0ujpoJSpsV9b9Nk20RCzdCIQ9t+jwmp1MhareVpDIidIsg4VBCW1MH2N/RM
         Oq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734136; x=1764338936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
        b=pHW6pzNtNWkcRJceux8EBR21sQQRDUJs3TkTxD+w0s+ElQtpOZbLEI9to2Ix1oPD7M
         paQXEsn5c6RIPNhnSTJGpmrv9rTc9P121T4xc2ASExHTMfUjmhn9cB1St+gfca765VEt
         7ITbPbFu+OfcEDO4Fr9qYE7WRpJILW1UfUJ6CU+cKHvMw0dOmHtzyaME509jOF0geJrr
         c+RC9DyWuPoGqfeOTanrreKOM+bOCRt1goqF35WCjOu4lT8Burq3Q5PkVEXUSKutYNqa
         tPLzdgjTYKlucEmKvgeCoMj0mYLoiw8x3O1wLfUszYK9WnspibRifzjLhZLBtI3Xv11c
         OdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0gXBZOlQOc8MkTlV9cg0UC3MUuUCpTT+yvUOkEob8aoBnXq0MJf9RYRP33cpmXO4jpXeq9VYpfAo4gS3PoZnPUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwInQGOvlbXyAkmgUbKVxns2G6EM561keKYHezeGVPhxk5EcNmx
	tPP9hNDIPAC/vhs27RTg++rmqDJCnO9A7xqo4xAR5FyKTH42VoFP0PwNmxAYBkKDhUo=
X-Gm-Gg: ASbGnctFt4mCO4T2gh2QfT3gbnxeu6MPf9A0K8MExSP55bO3wWkMcLZ0J8YD4a6ZOux
	aGhuGtYufGjR0q+o2Fo8e8HxPAT3WZtt6IuszIl1KAjds6LJ4kMEwSxlbBKjgbjBTqWrLMrNlnH
	W+MOEuZItoMpdnY67y+rM1MwJ8+cwgLYRRnwL9ipG0PmJ+AzPrYtSR3TGijyfRxIQsCyvtAw0pB
	8MPcscMiSWwpntPMD2cIRE+/b3pP0IIaJtKcO8O8TWD0QHOddPrFqCkkSWZ0GSb8uwYCbW1c1Ue
	+uCpB9qeNEQezQienXNgmBuMgcS3QQPF929ZEWRImf/y9kINBDgjClc4vKUUZiz6FFLD1Jug18T
	PzNtLw4t6vvPlYEqcW35Ft+M+TohOb1G94UsyFmRs57bItQUiyo1T64+xrzhERJ7ocpNMWcYGqE
	5A+dJLxnqxSYnwy+E0uJifeclqdF1/ArovqMNku/CafJZwMS94KpUbHfw=
X-Google-Smtp-Source: AGHT+IF2UxVhyVMW3AX/hoiGonlkOfpep4umI8fQpuWGyYEaK09IyOu8Yp1elYTOBgohXU5wXynToA==
X-Received: by 2002:a05:6512:b1c:b0:595:81e5:7570 with SMTP id 2adb3069b0e04-596a3ed98c0mr1009880e87.23.1763734135916;
        Fri, 21 Nov 2025 06:08:55 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:08:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 15:08:31 +0100
Subject: [PATCH v4 1/3] drm/atomic-helper: Export and namespace some
 functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-1-d89bf8c17f85@linaro.org>
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


