Return-Path: <linux-renesas-soc+bounces-7327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE944930E16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 08:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61C81B20D73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 06:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86893184114;
	Mon, 15 Jul 2024 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDo5cQfW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4151836DF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721025200; cv=none; b=Egov3FueHpOkDhEqW/nWKsvFm2yjND7O7GuzkKBiOVh1mmWuH619TZoo/+ZcnQgwwreZjfteuiFUJSPdk/CF1NF/mGZ2eBLGaR2mohv2sQ8uUGPil4CfNC+e/uSkjoUV2VhwkKlNTYsT9PtiukHVhbfkqjs0Sag1yE5nbI2mZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721025200; c=relaxed/simple;
	bh=ElUTEfRFQUeTMBsWyzbhEyDMF5jl1RThHLUf4PWNs3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWMiiXzCmwNe4viKAzSG0IGAF/bwLAOw/VFgg0TbrEhrHFpnjsMDUuINc/9AL2A5ZiaGn+r4XRgWIdxsZQI4+YYWora0nDpl2RRcyyX8G3jaWnSnxP3qcguOERRiYtHYCZo08Qjoz9g+hOx97XBLNW8ODQQeqeVYV3UWJLTj8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PDo5cQfW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea929ea56so7226989e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jul 2024 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025196; x=1721629996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hD96SukkfsNyjNTVedgkKQiaViidlloIggj4cO+Fh4=;
        b=PDo5cQfWkWdbEUjAPGvxBFP4niuEFSCyI2REVrudOO5Xg6sTDyTbwc9j0l0phPVIT3
         6lSMOXv9GR4Zue9M1yy7/WQPM6Vb0n3wvRMW/TEE5iNZIEZuUm+hLz0xI/1oKapckcUt
         AtHWr8cbnLOycmKs3WZi3S4AMsBqc1JGSUsE5TCSZWeo8BAL7HQzSFoZRM2jss0Gl/ih
         lu65E9Cg7RK79sjiVb9YfLbBEO/Xq/jOm4h63Q4efFYRMtNd53jJPhsjTiGOvTrfvyD7
         4bViJIjRgRcR8Qi0ju9I7SWkBLls2nErtjRGnTLruHxoiUqncGCwFJxfkwkwQZxoATsF
         V7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025196; x=1721629996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hD96SukkfsNyjNTVedgkKQiaViidlloIggj4cO+Fh4=;
        b=lZOsA9B2TvioEyaqCjym9cu0agQ/YJJoSsTdxmhBVaxoYWYF9pcv4WEPHHC/JfANI5
         qFhwK1ioeDyCY8yatDnhUFX3NKOeSgVwbtNFXtbuG4PS45hDyLszan+qfPqNy0PSOAbQ
         PaYk8EYNC8ZJ8JeHnkXotxEwZaEkGWAqwHK4/igZumPBxUVk8pLY5uM/8qAZ6xj69ksj
         TkG2gnRI/wPWIIdUrEB034tIEODgIuaOkGAom+q44xWuG3R/Irrr6J9DEfeKj0/6Ic0Q
         4LF8Xj4i41EHwMV+sl3yRH2vW3kgYTlDBpXWNagugRiUkTFXgtEvkWjf6rRTlOyy/VIW
         jX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+aJlbq0fkRSNWTaXLwipzs26kKZf6ERhMSMdgG4LtklYmvaDbZkr9mBx78dRWY1BClUCPmCWpz0mb8Q8BUJv18RADKpXF78ZKWGF93Jhn8DM=
X-Gm-Message-State: AOJu0YxzP8g5pt42HdC+0dSCZTfnBffSdVIqMfgPrh3PN6HoVaNkvZC9
	WKEHFGTdxb0aubTi734fHfmKNxr8R4AfDbCCPnbOAVX6NeVZfcFmal+e0CG7Wd4=
X-Google-Smtp-Source: AGHT+IFX0QH8GNKb6vSmUPAoENVWks4aXQTHoSfQhbwYfR/OvyXjXMYla/ZB9rPLdfgjOmPqGKpO/g==
X-Received: by 2002:ac2:5544:0:b0:52e:751a:a172 with SMTP id 2adb3069b0e04-52eb99d288dmr13038205e87.49.1721025196342;
        Sun, 14 Jul 2024 23:33:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:02 +0300
Subject: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ElUTEfRFQUeTMBsWyzbhEyDMF5jl1RThHLUf4PWNs3U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKovm5l+7A24sivlmJ0R0FXE9iAwNjDSrOKP
 WDSbfR6q0WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqAAKCRCLPIo+Aiko
 1e+8CACEJovL304bl9alKdbKAOnfEF/R08MCNCfeoeQl2+qtgfzhmRdNpjupcxELHKcsWM+QIMF
 y5SHMmA5MDdtTOnk1pk9JWqRfeB2hUSWYs3LYMmYEQy7Tz+BYPrK4ScYeUHR6+qj0oCHUZHBpWe
 jB29sogURM+xEeh1n0770SS5O7ZxzrOm+Hxi3UAo62YKLxcXGsWm6Lyx/3MtlyAPTJKZzM3T3ko
 biVZKcN3GeHZhA4YojTOl5G8riLQxBO1BmRwBev3679IUvrG/ciHfbmLdysd4FqK1H0pZF5YX4Y
 mYOPUHKTFUgJ8Z2ftC0dD6tj00ePMiHdUlm/pBEnIMFwUVaU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
that are immutable by definition - e.g. ranges with min == max or enums
with a single value. This matches the behaviour of the IGT tests, see
kms_properties.c / validate_range_prop(), validate_enum_prop(),
validate_bitmask_prop().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_property.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 082f29156b3e..d78ec42de42f 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -162,6 +162,9 @@ struct drm_property {
 	 *     userspace, e.g. the EDID, or the connector path property on DP
 	 *     MST sinks. Kernel can update the value of an immutable property
 	 *     by calling drm_object_property_set_value().
+	 *     This flag MUST be set for all properties that have only a
+	 *     single value (e.g. min == max or if enum has only a single
+	 *     value).
 	 */
 	uint32_t flags;
 

-- 
2.39.2


