Return-Path: <linux-renesas-soc+bounces-7326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7C930E0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 08:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58723B20BF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 06:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7809E1836FC;
	Mon, 15 Jul 2024 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSmvU2fG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337B21836C3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721025199; cv=none; b=NkTg2P/I2SqlKXi7sI0m4TxvcnSHCh4Lxb7yxrEnM0T9xEZc4vB/I2xg5C3ZObURrtVvtfh93iQGE7FfxtpPaYZvzaIEG5gBcPhJHnwCyFm08SseGb+HnWOuzn0U1Yg0wDdk15V4x6gvjnf3xskvaXU6sxdKGwkCVrhb1wC7krM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721025199; c=relaxed/simple;
	bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2p8mNCC+slaGk6nPiiFvRV4EqonTux1p0qoB4ukiQ9RDRZXKkuU47xigBZdpDZZ3WS/YmskIttW1f/HDUCtw4kMyFBKSFiGLwojtAhPbHdlEhkLVClc0J7IiIh50bJPLmSSCnmxSPFV/RGADVwvFaqGKZ091JM3BeLwjOweTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSmvU2fG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso6773627e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jul 2024 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025195; x=1721629995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=sSmvU2fGovHWpRBTxXACCoYBikjEHP9MSyyV1OY3mqC2n5YQ/fbPs5pYkDza+79WN9
         dpPDkUs7sVSJ1ryPHafi1BdnocDZyYUFmrqSCFEF5QfC6l+TV8KdMQSsNvT3hMoThEyt
         z/WuP2fww+nmIDevqTqCH6ait2hDbA0LooOy+CbAeH/HbW0ovBgZsntP/km3E0QcRioR
         97xbR75TZiNVtDJeUgdXH1R6kUgj0lhnZteJ9CaM9CLHAxTTehUONMiRbhZNREppwfrm
         DL+mdpFzd8czrM1ELTQysaMx4tY5GM6YG682e0Nbju856xPlJkRlqQ5xk67GAefknddd
         lTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025195; x=1721629995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=NGwaQSY668EwreAHDhXpDzdqBGPUyAksTxfUsEAyMLTR1MHFRHeuZ7QKgd2sg4C4+0
         BWzDukkq96llnozk+2xxWTeAoFDDgWaHxNoklidBcSWQozBtaJDR9/ji+9j2X+t0G9x+
         BATwbohKYZWm8nstPRAThUC3QS2gMXlh5z3pjFTeIjN1E9XVoQerHKSRm8Ia/H15xi7n
         YKSwtjlZyZc2rBQ1e61vIfvqR7dWJ2n1Guu4m6nrOlcLwCGPNo/9XpDgbpvafWRDs1lY
         6hHlphsScl98KwdKlILgiSzzUlRsmBdhZgtBIzcKRdYSz1m8Oh4z6GfQs2Kjfbdd6V5k
         91Zg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ij6yzE2UME4mJQgqunN7RPqr4a6oqPbSlhWFVa7AXX30vE97lByYWNkYtZq/yEIV6N3KdRrKUaE3RXKpRr/SzE6Isl62IjKswI3cdr/Leug=
X-Gm-Message-State: AOJu0Yz6BKLlCi2rULUQYnKHvVrW8xR0viRo+HJxj8WIp9C81nRyg7Vh
	/kSz7kmXrSKUWDmNPHJDJlHzqL+l1VLDLKgeUW+NrFQJF9We9KcYFjBWBTFJT/8=
X-Google-Smtp-Source: AGHT+IHT4xz2WdhLKgSzBOFGajWmbSWMHs5k5m2atVJlXqSvlJsy3hyS+kPlM6QSPNXfSrtWv1LNGg==
X-Received: by 2002:ac2:41da:0:b0:52c:90b6:170f with SMTP id 2adb3069b0e04-52eb99a0e7emr11020892e87.29.1721025195187;
        Sun, 14 Jul 2024 23:33:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:01 +0300
Subject: [PATCH v4 1/5] drm/display: stop depending on DRM_DISPLAY_HELPER
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-1-61e6417cfd99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKouj4z7T/shiz6BaAt6p7GIaGUsCT7QSQ3+
 htjgKfZW+aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqAAKCRCLPIo+Aiko
 1fbaB/9HucxwZ9XXPDZRoDro66r9wo860mrSEB1fXkutEFrGC+zz13rgdDbGHIAnd9uv8iJQ+eZ
 FnHusEklODaV6JVOBxry88xtNubs2YKCDCryw4tsCNUJYHXtqBVrqFKiiEgV1fVPr24ZnOES7Px
 Ef31DsPrCnhXzvJAcgn+EE6UnjT0qx1Dz+nQGStxm+6YqKFaq65IMQDATwngmZiTJO6wMQzT85Y
 E0pyIkvXXAP2khDqrLtpUkroiEy+rITOfqGW43AggLIZgaaB3hI8mzpqjQor1sFYzMyqCtn11OD
 0TKL0KUECMJb2hfkYtMQg3IX8xjnSc79S3gqxbWQwws7xLIS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Kconfig symbols should not declare dependency on DRM_DISPLAY_HELPER.
Move all parts of DRM_DISPLAY_HELPER to an if DRM_DISPLAY_HELPER block.

It is not possible to make those symbols select DRM_DISPLAY_HELPER
because of the link issues when a part of the helper is selected to be
built-in, while other part is selected to be as module. In such a case
the modular part doesn't get built at all, leading to undefined symbols.

The only viable alternative is to split drm_display_helper.ko into
several small modules, each of them having their own dependencies.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index a2e42014ffe0..9c2da1e48b75 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,19 +1,20 @@
 # SPDX-License-Identifier: MIT
 
+config DRM_DISPLAY_DP_AUX_BUS
+	tristate
+	depends on DRM
+	depends on OF || COMPILE_TEST
+
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
-config DRM_DISPLAY_DP_AUX_BUS
-	tristate
-	depends on DRM
-	depends on OF || COMPILE_TEST
+if DRM_DISPLAY_HELPER
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
@@ -25,7 +26,6 @@ config DRM_DISPLAY_DP_AUX_CEC
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
@@ -34,7 +34,6 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 
 config DRM_DISPLAY_DP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
@@ -61,25 +60,23 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 config DRM_DISPLAY_DSC_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
 
 config DRM_DISPLAY_HDCP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
+
+endif # DRM_DISPLAY_HELPER

-- 
2.39.2


