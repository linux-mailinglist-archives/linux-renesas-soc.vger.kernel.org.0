Return-Path: <linux-renesas-soc+bounces-16171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07990A93DE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E8D217B3DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE5325525D;
	Fri, 18 Apr 2025 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVEkce+G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DB254B1D;
	Fri, 18 Apr 2025 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002050; cv=none; b=mH/ApNgY2T+qXG68EltjG/w2Fru0o26tNt2HolXD7/lsNiw2Qjacx0lEl47TJwO561iqLmf65r0w5DE1K4wtF1HA8MZY2pAhZ1poWGqTV+tXZ7CC+S61e6p1vre6+X6UjaKHaUcw+ui32ZH+hPJGYoBz7IjYibFb7LPuhfL6YKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002050; c=relaxed/simple;
	bh=Xz1Q7gmchKZaAh4WW+KIc48EuyNDV/mtzF5MtiiipQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcvcsGH9SdOtclly+8pwkrH+0hfwisKMrCYvWgRUsE2EBzTI2LLYxJMiPttZF3+ODwOVo3ens0nw9Uqo8QiOM6ow9fDzlxbqIVpbCzFZ7CUQvD3LHgfdFM14LxcjmbI0INnfyaQ9m9LinAzwj+l1KRrFe8bMl1eWaRDlKF3371Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVEkce+G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso20300825e9.1;
        Fri, 18 Apr 2025 11:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002046; x=1745606846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lsVVshjn637AMwgDjgZHkcdVY+ABO4wk8AkXQ6EbwA=;
        b=OVEkce+GO97wv2kuXZo/opHxci+3jfs6pKyUskKbqdvHb8HbkdIwZc6Z6qOLoQCcnE
         Yh858WUIjkdCiT4NXonxM3AI+epF0QQ6dOvGE0UmvukS/pbK9BKFpyaaej17z2KizYK0
         dk6gQDtW9zNVVWNT7K5mb73n1XHHvFGqdQ8gSMCCgwbz8XnBpg6OZA0Z1usZUb7DMotQ
         L6aEiIMrFlxkg0O+gF7NRaP2VJv7zqva+jSJa3GrptU7bmsJMM5VaGLeGdbsyY9DkaWz
         WeIOju8Zup5QdPoNeo5DpOUUnUtq50i/XrCA1Xww+VbjcpQ9eD8yAgU01ZeM0bH6S5V6
         +QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002046; x=1745606846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lsVVshjn637AMwgDjgZHkcdVY+ABO4wk8AkXQ6EbwA=;
        b=WBlyNc4wHQp74yE/BATczPZW0N/5WZ132ch7l0t6NFgh+Rcs6/9Dd/2iJTBoH4lBRu
         aZuIZmwObuLYGRfh7/8m6XiyazJ3rX9xAH28a2Na1lyw2cMqTJldHi0cbXo0+n/M4es0
         2YUzfC6KiRbMdb4y9uIs+lQV4Z9+J9xXUkUtj0GsBBfhziko9nXK3B7YVZ9h8lKyHM53
         1M2qKeRBxryHO+JNTcIPVUFLi7aV2AQl57GVX2xVG1flzy/7CAyEVn6m8A+99KXALMib
         nZVhP3CZl9wPQMbnXA6JrPOqD+kZSoZWtXvfxXlCRHlSRXZ5snjLbiCDfqbDCIIoqtCO
         fPCA==
X-Forwarded-Encrypted: i=1; AJvYcCVSNl56VKefbP5UX3HGn/Ze8uDjhPukO0oEYjLX4vmUm9XHkVg9oFxKLAMb3O2bJW2nT9VYWJdb51rKSlImfyNHN/M=@vger.kernel.org, AJvYcCVwPG53jSXAql5WVbKUJaTONoYyrfOaxrihL3JuLcPEsgJKqZCPqT8QCrKXJbg/5DvWT+ayUUZ0cjj9MPlD@vger.kernel.org, AJvYcCXV0G+iEuGouy3amTGee/OzVxJKy/YdmmUIGWhJj/T+VZvzo7cbxHWLwS3Dx+CZBfY0wKp+NyW9zJFh@vger.kernel.org, AJvYcCXz2f9Nm8TsOaMlzTwPt+dmw+VC2XqJQBWYbIq4dW5WE6HZYM4YkyzE+Fte2xLrL0DqHactf99cf0DF@vger.kernel.org
X-Gm-Message-State: AOJu0YydubAv/MMUJ87YJuJMmXWmS82Bxs+CYf81R+da6VI190qLS4H5
	g38Fo8hbohMAPHXh/Ue1wwHL2Wo/662OYluHPZ+x5c35JQhq+Fnr
X-Gm-Gg: ASbGncuNG7X9bX45yYoTwXu/CZnXq+hJ1pEQ7eut7rrW3wOtT2T964OM/VYiIWVT/pG
	ElLdAHf5pRYox+RSVxq9rI+xMF5KutTss7rBVlwRBzz3g6oSDm6P51tpM/VW2shoz7KmbYycw3t
	trapKFtfcVbaJoH4D6t5fYduSloQFQBgZ3/YZ77ndDtBt5WmdPr6Ssg3zhaQHv6TIXsdjTNjqjE
	awfTFMcavXg67LL2mMRkrJ0wbNGcFnIM85CCgrXpmA87RmapI9NSf4X9dbh4jRuCRXWA5W6OSAv
	QN1fta8YprbKETD5iH0SUC3x/YrewMhHwANk9zAe4jR1ikD/FSJhefbVTJdMIvdK1rcEmMPEScK
	j
X-Google-Smtp-Source: AGHT+IGq3eSVxmXrUJUQFABqPX5WhZyelF4HqNf/myefyRzdq+X4avwziEFapnYPHasNOI9EmifFxA==
X-Received: by 2002:a05:600c:3b8c:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-4406abfabc9mr30818445e9.26.1745002046493;
        Fri, 18 Apr 2025 11:47:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 14/15] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
Date: Fri, 18 Apr 2025 19:46:57 +0100
Message-ID: <20250418184658.456398-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in
`rzg2l_mipi_dsi_hw_info` to indicate the need for LPCLK configuration.

On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required
DPHY register configuration, whereas on the RZ/G2L SoC, this clock
is not present. To accommodate this difference, add an `lpclk`
clock handle in `rzg2l_mipi_dsi` and update the probe function to
conditionally acquire LPCLK if the SoC supports it.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 67520bb21dad..133a8f306d47 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -30,6 +30,7 @@
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
+#define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
 struct rzg2l_mipi_dsi;
 
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -788,6 +790,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
+		dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+		if (IS_ERR(dsi->lpclk))
+			return PTR_ERR(dsi->lpclk);
+	}
+
 	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
 		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
 		if (IS_ERR(dsi->rstc))
-- 
2.49.0


