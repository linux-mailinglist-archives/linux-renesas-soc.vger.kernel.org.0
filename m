Return-Path: <linux-renesas-soc+bounces-24729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF4C6A12F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21AAA4EEF3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C96E30649F;
	Tue, 18 Nov 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZS5wLNB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682F303CAA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476601; cv=none; b=DyLS8axXjk1jIMqM2FEAjPyCQmb4bXC8DfERV0GMXW8A51vjfpkMORGVnOWmwPurRimVKdQ2Xay/LsTVOZi9+eb0hVk4ZyWAWm19vwNycQNQb8plnNXiT704g2q0jC6VjW87UqCDwxrkCr79dzJ5SJZSaJQlNpcUB37DWd3lLSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476601; c=relaxed/simple;
	bh=Zh3kfuQF2+1xwxywH4G8I3O9b/fOlYZbjLpAUskAgPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBOu9Ye8uoUy5HZm6AJWebkrLJ5PnOZ4DW5XSn7K0IWjrZPRBuFKTDg/4UTBL/bJh43fd0SQxy8vozbKQ5dw7BtjsskbWW1HSP7zGrjfuA7oFsBSsNaiUyoHmI3qE9ASnxONs55DHVf1W2uIcTQp1wgy/49ylliguG77XmbHJeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZS5wLNB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b99da107cso50202901fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763476597; x=1764081397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpriEPRIqUaaYe29NxJfEOiaFF5obd11Irf91BzDQtA=;
        b=TZS5wLNB9wMR41a8uPDc1biUZKPqEseUCOTGxo11HpKW/m+uy/2C4HknrOs8MY2MMe
         cznrMi3lFgCJ1kZQFGPUnbWblFGneOCnvD1OzPEylVwQSyL2x6tfu7O2OO/8vhuFFjDT
         4pQIryiu24r05vXkgv0gOW2P8GnoS+s+SVmE+pJKX9j3W3cJzM9VtBtcGdBG2fAZQkKF
         R4jcJEW2ehDmwm84gGlqb7y3EoXwRx1XiVMgLh5nOCcZhwDE2HaI+dj/0EnWH4wREocq
         c/CpsivkUtQrpiiV7KIf9+hkGfX6P06WI+bj979jbXdskJ2jvJMedmiPoMtkuGMtKNNu
         lECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476597; x=1764081397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpriEPRIqUaaYe29NxJfEOiaFF5obd11Irf91BzDQtA=;
        b=qDnHm28bO+eMDSOb1DuWjT8Y19q357nPC94AQ4/ZLMiI7Hdaq7v0PNYSF5/Qimzgk6
         p4iRYiM4RSa003sZWelzRTgYzdh3AqScIENB5FWxEeyjD57+IWF4q6bGecQ9AE+3Errg
         liRQ+6SDXhlQeSP1h0onB4q1LyVuhC2ZvoVJ3V1BulOjI0hIFw0YzcDUnIX/p0QZ3jla
         XH20JfDE2VSHBBPoZtiUpTRsncOO94ZCeVJ5+ZiyaURu9StCL9ONlgJNll0II9QFnO9z
         F+JBLL/rzOUVhAh/L0Kwa9+KPHV3BqhR8FFgBQ/iWVlkC3PabpXBnH5bdXqpcnAKUA0u
         jigA==
X-Forwarded-Encrypted: i=1; AJvYcCW/1oA7k/pLcwOYqqkaR7Tmo3vJhK2+5yo0v9D495GVzKNTMOI3H0s8JPmyU9HeFWS/ju2K7C6SutixCiXlucv7Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN685oe+x3HOFTNmG5L2UqoONjulZDwAZxznkHUOxP2MCVils/
	El46QdOQxR3XLbYwTMMLYKvvkU1+EiGVSezRu+HcGeptpszV8WV3i7WYavxUihjcnuk=
X-Gm-Gg: ASbGnculF02bWmgmlMNjXrFztQQbkMmszcMoaoC7/S9hd1o6lOOkBZu8SS+FnE233Z2
	T/zPboSQG0evU5BRMmNrxLNcCiZSL5pgM9jJ2vsG2Pcl5nkMGYH3D+VmV3qfZsAGzW1xDVEoaHJ
	/1t/2CAGEtf3Sy5EAt0zMtD190EQBmBchD+aH3eVq3MFQ7a2gKfGnhkwra525aYjKb+H3bAaCwy
	i0FsIxQ2qaixSKOYT5KWcEFZgRkHSjUhH3m0NBmDCeAmitMISmKA1nn+CERo1VdueUbG/PAD8pw
	xja3oe0tRleiZdF9yP4t3wwriJ+6c4ScZXHDrayKAo02+iXN7E1gtvXiqTykIVQ9qZjwgj6vFUX
	P+CDhManLLhkPsxLmLNO+Lm6VYPCowj33qHD+RcHhC0u057qIuWtifzg+u0a2ErfEEL9WqPtUNd
	mC4mtw+aDiMLwcxwh9q3jVNOS872IydlVGzPRZRgUPH5r5ZwdhDoZCc2anyUTULJupnM89TomKR
	NB3
X-Google-Smtp-Source: AGHT+IHUYN0gIKBgoNcp/XIDcRJ3B1pwzXqhuUZD6AOz918aJmBQapxGNJskh5sXazOT6XAQc28WwA==
X-Received: by 2002:a05:6512:3f18:b0:592:ed29:9dde with SMTP id 2adb3069b0e04-5958425aa01mr5240229e87.44.1763476597193;
        Tue, 18 Nov 2025 06:36:37 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:36:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:36:04 +0100
Subject: [PATCH v2 2/3] drm/atomic-helper: Add disable CRTC late variant
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v2-2-4fedf10b18f6@linaro.org>
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

This augments the previous patch that provide an alternate semantic
to enable the CRTC early adding a function to also disable the CRTC
late, essentially restoring the entire old sequencing if you
use both these helpers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 39 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_atomic_helper.h     |  2 ++
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f03b93c72b8f..eb47883be153 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1337,13 +1337,17 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state, bool late_crtc)
 {
 	encoder_bridge_disable(dev, state);
 
-	crtc_disable(dev, state);
-
-	encoder_bridge_post_disable(dev, state);
+	if (!late_crtc) {
+		crtc_disable(dev, state);
+		encoder_bridge_post_disable(dev, state);
+	} else {
+		encoder_bridge_post_disable(dev, state);
+		crtc_disable(dev, state);
+	}
 }
 
 /**
@@ -1526,7 +1530,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state)
 {
-	disable_outputs(dev, state);
+	disable_outputs(dev, state, false);
 
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
@@ -1535,6 +1539,31 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
+/**
+ * drm_atomic_helper_commit_modeset_disables_crtc_late - modeset disable outputs
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This function shuts down all the outputs that need to be shut down with
+ * CRTC last in the disablement chain and prepares them (if required) with the
+ * new mode.
+ *
+ * This is a version of @drm_atomic_helper_commit_modeset_disables() that disables
+ * the CRTC last in the chain of disablement calls instead of the intuitive
+ * order to disable the bridges before the CRTC.
+ */
+void drm_atomic_helper_commit_modeset_disables_crtc_late(struct drm_device *dev,
+							 struct drm_atomic_state *state)
+{
+	disable_outputs(dev, state, true);
+
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+
+	crtc_set_mode(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables_crtc_late);
+
 static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 						struct drm_atomic_state *state)
 {
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index d7fb473db343..d479afcd1637 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -91,6 +91,8 @@ drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *state);
 
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
+void drm_atomic_helper_commit_modeset_disables_crtc_late(struct drm_device *dev,
+							 struct drm_atomic_state *state);
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
 void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,

-- 
2.51.1


