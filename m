Return-Path: <linux-renesas-soc+bounces-16548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB64AA55F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A989C4E03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCA22D3A88;
	Wed, 30 Apr 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RU5nAZPJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E62D1F42;
	Wed, 30 Apr 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045698; cv=none; b=UohbaLLQEd33+srxX+JtUSPxcUPTEFAiLEDc11Nf27FBRIRvLmJQBd58gM4uHeEUQkOzcW3TfNoTiX+A+blSRDuGwbke+qML0bIRTw9XLiGwL2FEYw02ATsToOGx96UujoUaaofWOPQqau53xsznXCrnd5aJ6Alz807qNnJwjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045698; c=relaxed/simple;
	bh=Sz2skzXhVthG1Z+7MrnpvHGzpTfhIvgUb6omDw22uhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJacah72GhNabNWVD8KcmP+xz46qhPCbdWk1+yLz6cJ48hvNWCcCyhDK8HiqIhOORr5op2QMRla7gvn3039GleE2Xb0t7pwTvhHmpsntwtvCA2OtWG/pR70v3czMDQUM8TA+pGQPLcLP8HsQTHmJoyduNLfZ2pQAFhjFRY9Q+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RU5nAZPJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso2222415e9.0;
        Wed, 30 Apr 2025 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045695; x=1746650495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO0gGQ8XJg55vakvgacq+nstPR//vJTN3SM+V+tV6y8=;
        b=RU5nAZPJl63rqaD4mrk+FEjiR8Bh6rNl2wN3z7ZMydx8qSoat1m+QuGWJJrC9B1SuO
         tb2ZOw37bzR4UjJnQW1RODF2mR3TJNY/NIffw/RXdnaWjRblfIInQW9ZbqAjJqTDTRS0
         2SMMWsp0f8hV7i612t3uuZ+CjKPhdVYZDraj7ybI/rr4gBYjFza6B5rZJgnlwbZVH/Ld
         07NYvo69yyQi22DLn/JoO7zgeMaS64nFvUhhmtd8GYLKLfhfd5zBxPvtwXBCxBSk8mVn
         ShQ1j8v8GmCvxiItimH7oaIwikgAGxo1Zs7Oi6ssdJw/UcC56vTCidS5pZfC9nU6YlXH
         oDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045695; x=1746650495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AO0gGQ8XJg55vakvgacq+nstPR//vJTN3SM+V+tV6y8=;
        b=W9DNKaQvYvngVhN5GzuyKbNQomawJGD2eHTc9b7h57D44jUp+t730+MOKFSfFUng/h
         7iecOggHMqR11yCtJa2X87XcscU7TapJ4wcjND+3A1PiVD1pwoIJCjjxMBROyl1bVQj/
         j65dpIsdY/ZsGZUs+ZC6h0OtVrSE+9nk0lnA5+cu4ICBco4oHvDEs5B7yfkPt6v6b2y+
         uRkcuL+qqrV6Sh3Q0b6m6Ev22ospCDj/7cSN7DpBXga6WUJVoVTaY8/lVm06YrAG+XBD
         KaV8fqKK9tt132r94hLlwfDBrGgKrcylgMAc/BLz0xmm0eTb9xo2hhkOYttZi8uWNEwC
         ArmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBl2Of13vvQiuMiHo5cVRBKUyAIiN8JeqZs3VnjaMsZ2aDc8KyULDEPWiKhRNwQTYnY1qN/7nEfTsD@vger.kernel.org, AJvYcCUZoLBXBUyZVEh/Erw5Bu4nRYYdsUZdP8+3DopbpOn9W4xzkr8nT3gG9bny5Nvd8oY1D1FTM8ox3OaGBGbJq3gz6r0=@vger.kernel.org, AJvYcCXBUxfJuNr53ky/3/A01Sajg0juvD69nyLK1YGv6Drpy7SR3fcIMLJI0ueRHgEO5JIcsVLyzU8SvIr9@vger.kernel.org, AJvYcCXwn3v7wjqyyKyh+pSIhnry6AGUlr7bhZwPtH6+NhttJprkD3qw8suNowHGJmQXKKO4dTeFHAhWz2z4Q4BK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24v5NXsETsa49NABWkaUySi81iC4vzLzlTDi5xJZDqf8DHX1E
	NA38HC1+93jBsrLVzR8O8Zx7TX17BRziWoSEGYdFmfGV/hwYVG03
X-Gm-Gg: ASbGncv8p7Agz+VKai/kTu39vzT5dG/xUCvyOuZbFkmEiYLkgQNRFnpiX4SByWRaNM3
	guIXgxU59rv9XodCCeUnx0Dy1Ax7YXI0ditEtUybu/mXcSEL+dWnOUwnZgDq5JV37NfYzOl4PSX
	j7qnmPEE4q3Zucmu8/cW+wdF8zkbHj+qmP00VQQMCghsh3KZsuDrWANR3zj7WMEJMXPgzLR0Huu
	DJDOQD0TnGKSWcjlhhsrGcbUktSK6FFsHCKG2kLC7Hax6cIfGqbj5hC3drPf7au6I6x+fNbWafm
	LPvd8RCWxNYdGEscG8tpTZLfvV158rzGlpQ5U6NQntan+su7XNePn9CRlqNsl3iC/t/RD/4hn+o
	mM9/jfxMjuA==
X-Google-Smtp-Source: AGHT+IHsecdyrGlNtI82mqkkhJLEKR/PshNRP/65SFVobBGuVGxd9oW8pr0BSn7ldq8EinhadMpN0g==
X-Received: by 2002:a05:6000:2284:b0:3a0:830a:3d63 with SMTP id ffacd0b85a97d-3a08f753ce9mr4332262f8f.9.1746045695308;
        Wed, 30 Apr 2025 13:41:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
Date: Wed, 30 Apr 2025 21:41:11 +0100
Message-ID: <20250430204112.342123-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- No changes

v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index df43ff59e08e..22a386ca8ae3 100644
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


