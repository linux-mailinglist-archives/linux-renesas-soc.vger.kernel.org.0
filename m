Return-Path: <linux-renesas-soc+bounces-19719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3170B142D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 22:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66CB13BAE4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 20:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2896D27E048;
	Mon, 28 Jul 2025 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg8282ac"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4C253B42;
	Mon, 28 Jul 2025 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733689; cv=none; b=eWFsoWyYU+7spIJ3YqgCS/j0jyduct+zr3eSBNsORn3vbtDdDQ5FlmYolWsglOXoXZOhM6SjrZi61UJQBzl1OknLh+HDNohu7mQRE3SjjI8yEYx6UOs1Kh5viHw4nEtavscHGLrqb2TQce+zGsCDB9U/k6HX0uHDjLYSd5Xc3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733689; c=relaxed/simple;
	bh=VDa6Ww5es21OuXNzuwa838dRcsERyK1kvOe32yrIczI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZHBs8WVVIofzdJEudl6/IIEd0AP3F9FK3nKFqeaFlXChJJKTYHwXCeJOwBHagea6jnocFtiQAQbE87qpoBghOST8XdXTjDVeU661cO4yjtwwlsPJKN2IXHgPdwfmmKZnaUHDdCcNZwg4w+AHOs4plhqQFEewWNOV2yZQO1SL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg8282ac; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45555e3317aso23675085e9.3;
        Mon, 28 Jul 2025 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733685; x=1754338485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxAOjHFcbAscdsMiUqjtn03BhEmL7+9NdefozGvlrp0=;
        b=hg8282ac73gocVa+Cu1H5pEjYAEVD+9re0nnAeHSj+USbC0Xfbx9qjd5xn4ePnrs/Q
         txwaG4YX/s06EXbLGflrZ2okpDFwEpgTWqnYQ/TyNI6EKi11fUt6LNeCpbVp20a9GB+m
         cBx3LkxylWkrc+AtXDY+HukgkLMIWvZ/Globz6Jmb0HA1yTuoTtuwYDEw05p2jQ7hA0o
         tC+8lZ4THnoC2dXlaaErHnj6mHnCURT6H7ZA1Zyf836rmTjRnvD4BGyvmSjUd3FqkWDY
         eosz+P/5bKqaI8ZkSR2rCzIyaYCdei2wf7FI4Mcz9XUVn2SikjwWoCsOB5H+uzIRilnd
         usTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733685; x=1754338485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxAOjHFcbAscdsMiUqjtn03BhEmL7+9NdefozGvlrp0=;
        b=m4lUS/v2zMk6Er4e4JUe5ksy8LPrjvIZh0YRBeP38NC9Z1fMSJ7OE6SKu216f6qzhi
         AeXokk8E5q4Y9tG/0LJ4Fk97C/WjzULur9A9Ys9lOz/Z3GuKVJbrvnZ14/yEloUrabXK
         cSuP8iegh3rcfJCLi82zXbLSRAd9I1LJoxs3A9tf08CBCoAOUMD0cD0wHrBF9aOJoenb
         2rXdnuap4e/3LdoRWE25PbbjBm9IrSIC/cLYZK70/MNqWtV5EYcuxi/+K14kume7+ZPX
         sNyPtYGVHPRX7jI9YZfJlBinf5PQVMdHH2eyazKEXAi5sPD53MjsIVlknWzUGW5rw5Lw
         rKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC6xLXtXN337N1R3PLqbEhe0xg3CIlrbX8JCPiEPwMjM3eU2/RbLsyfWM3yIGJzd5/wn6NbBX7afTJ@vger.kernel.org, AJvYcCV+dGYH3yncuzvWevk6oUS5n7V3eOWZRILj/l5U4UtkyM3ExDleum4FrcniQ6ADgAo+D+KyB5WFSFt8EqFx@vger.kernel.org, AJvYcCWZX5QTGKuVx51JgybsJTF6As6hQSFFFazTU6yuRLLqnRERPWQsjcXZbLJSWXCpKD0FMU4VbmmRcb1GS06ufmw1RjM=@vger.kernel.org, AJvYcCXO2VcEGmL6LzAQrHamgy6JvFivav0xcWi6T6p/S4SDEr4POLMfLHt4rdqfFiG0VJiR6PDws+AGsC/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1hQlUuNACZXGhVfP+E1+nfdOX+V356cdrNub3lJ4uzMh+vY3R
	z4wPsoBr2zXHYfvWFpfUjV8J7q3bnLyHre8jqF6fT1cHbm2U0EAd1NlY
X-Gm-Gg: ASbGncsUtQttizo4alXBC2XfxpqMQlkgnn0X2HP2FMoraaV1pMXoHw4d8aVRCac/mAe
	t1NL+ERYNxzY+79YyEMrHo6voe1g5zzGE5LB58gDGrBHLmF4i4oYrr6myLXznfpCpiAkYf9q8WG
	KOj4suI7+lEgNaMV/XrYcHM3JlHfYITyC8SaenYUqLx3uEiuHyVs8FJoebR6Nb4FEW60BofU2NO
	k1qOdRGV6U1yXxTkPEcTxCfEc4r76Rdv88FIUb7W5ld1hO62zjVh7M8Ag+4bKaQBWLhXF/ngohX
	Te/IsczlSJrROGglwSY2BcYn0tbEYfxQSYNtBJ5kIAOie0DlFYhFFVyPqYPzuRlolqaoY2AtGg3
	2VCWShKVcHUXpwka6jdgHQRi5dBSpUt4qxvVnXVC/EQa0QbHSRhoLytwdsyYYKisoz9v4btXn+L
	9nK1Zogn4=
X-Google-Smtp-Source: AGHT+IHxePFtXzvhlxVqqGYSh8DYWR1LshH8QoaIu397QtTtu7mtUAlEVRDZi3I5WSDEdMuelVhLpg==
X-Received: by 2002:a05:600c:3514:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-4587667a7b4mr89215925e9.33.1753733685270;
        Mon, 28 Jul 2025 13:14:45 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:14:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 5/6] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
Date: Mon, 28 Jul 2025 21:14:34 +0100
Message-ID: <20250728201435.3505594-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
DPHY configuration, whereas it is absent on others like RZ/G2L.

Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
during probe. This allows LPCLK-aware SoCs to pass the clock via device
tree without impacting existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb5..893a90c7a886 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.50.1


