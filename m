Return-Path: <linux-renesas-soc+bounces-16163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDCEA93DD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E1E9202C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D26124397B;
	Fri, 18 Apr 2025 18:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpSwcXGu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A880922CBD0;
	Fri, 18 Apr 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002039; cv=none; b=sETmHDKqseMyodgQZeRlQ6Ft/RtADq8Kim4uKZUMshFMo93y2yOZaRLSC+bZyyoPyC3UoWJgRoh+6aHAWUFi2k0c4ltNB49+yiLR3Qq/rXVmqAX2nokhYq31wZbgG5BzIIX8eWuqp+UWbasUgtTGLg6DB5Wcp5OksNQPP9bE0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002039; c=relaxed/simple;
	bh=80YTMCS1QmvcArczoMfguVtCBZRLaBmBIIrKarGFGcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKu0ImcuilGoGlVRGfcc64DDmPQUNGY/pQVkCuJenwcbiww5a7TEhjjF5Qr4mCqEIVJbrzjRkMniQon79zNdrXZCcH0oKmTHIEnmU2UTglfstt5IlOX40gmT/ggSk+E8X6Mqi/YElVjO6Igl4mLvbh6vgUkbT+oLnJqRGr3pGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpSwcXGu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39efc1365e4so401749f8f.1;
        Fri, 18 Apr 2025 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002035; x=1745606835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+95RTDXC74PC89KcMLnAbGqS5LYJGQCka2uPYYp6JLM=;
        b=ZpSwcXGu+9h+BFWbCrU+5WNuZEDaTineVJ6FmJlrnJmyucOd9WkE42aWFgen/rGXlS
         95N6orBW8z6Rt7iDMHjOoouLiZ64GvIv5nyo+VmEvzzk7ynpSmD37JnTE3rOONj9ZcAx
         coV0ztKGCXJIwkLFSqwbqpTVgXmvSs8S8qI0IH1TH8jnY/IsjDX5KxmG+4CquNC6mJyG
         tCgxBvgZKDmhMDi+G4j2BMDJ6WKOZgnQQUoJSamhl7TdtjrK+fdJ1/pmCiAnXUfIQtj3
         TTUxpNSAi2Nw/QRDhN/RcON7fWmYezWMghxZVZyuJfwhZK8I7sqNhYvGTAPLlULOojws
         r0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002035; x=1745606835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+95RTDXC74PC89KcMLnAbGqS5LYJGQCka2uPYYp6JLM=;
        b=urHfaD2Wx/8C+jHUGR5fkl5KQ03zURkOJOP5wc2OCRp4VVH7cJv0hocbd8aXmhcmcb
         Y/OtFiVfzATBzNOgHsqVhyoi/K7wiUG9YR6XIqrFvNTOcbLrLJXuX7tmxUeelwPBwfjT
         sLB0v4uaq8ihVAFsciS4dH752b5nL+MuvnKADKWj3I75S8D1o8xTdH7FNMLSnR1RwL5c
         EZvobO0GCM9nQb6bdWN917mtAYQtw7cydmKkg3jea6ycso+nJSIAmodCzxiN6wNsXS4x
         xHHUAXKc5AJ7UY2ckaL9+xytEVw/k3iABmjh9vL4ORVNupuzxdzFXZ3aQUYjY7uzCMxH
         pE1g==
X-Forwarded-Encrypted: i=1; AJvYcCUTrm5tLfdS0rvFe74QdJBASBNnHTPSFyuRnp8k2+iOn8pNtol5WsgSj2Cn8ObPpEVVkdP9wwaonrzv@vger.kernel.org, AJvYcCV/AaVAMTL3DViOiiJ5bt9b9ZrHQd0DiyWpY5Z+nuDT/8zEhnMOrS1mv9Cy3Hr4fIWYrfoofAUfoU8hmITn@vger.kernel.org, AJvYcCVsMm7PDalmnMdQoxsfH6XLwqI9YPhef13ckz99m8PBfgaL2gVgUxtpHX+D14z2KzdLl/AVyN5CtcoGNts7FY7gvrI=@vger.kernel.org, AJvYcCWmo0zPVPNv6pvwmME8WKpNxQ+ZdApCk4TQPi+xZIVePwKLK2EpoGupNVnohpje0jO0j14wQ9SVtvLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RYy0wNaufqChjpbBP2fL/87LZ0oInUbngHN7BudQc2wgwUqN
	CxV0uEJYZQVaVyVhe1QTs5NdLwhxwJq1gKXqiZpT80bKdAQbfiaY
X-Gm-Gg: ASbGnctC4wCqyvBFG8pF1TiY+UlxK1E8/3FzmTa9Q85GrVAYmpUD64/olYMj/VVQjf8
	yYkRekacRSB2qbeMJLCmst3w179LepA7ZgwEQr7b5H5GMb/WyNtgCxgz9g/FwYmW5IBVfEdq7kU
	CmF83G1GpnZ8LtW8gCATtfYelZ0GPUuq3KRE/CEAuYp5bIg4rkR1dTdboTG0TREu1RB0yavDiL7
	BXGqffT/YgcyJtQ/rOduEYyrolW9SiO8WsjpTTvji5RBPlU7UoxP/YB4CYuKvSbdRp6WN8dkupy
	lA384S3uwSUTpzzfZp79c7LUFGTLJKD+gGKmTn73qAH3nzsbeug25FqApwxM/eAg0Q==
X-Google-Smtp-Source: AGHT+IHwpmosrhJ80ZwpOiqZD+/pdcgM7gyuPqXB6SgIePk3fMcj/ZMOWh1Y9WtUx1n3TFw8Hw7uZQ==
X-Received: by 2002:a05:6000:2204:b0:39c:1f04:bb4a with SMTP id ffacd0b85a97d-39efba37ca6mr3012730f8f.10.1745002034821;
        Fri, 18 Apr 2025 11:47:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:13 -0700 (PDT)
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
Subject: [PATCH v3 06/15] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Fri, 18 Apr 2025 19:46:49 +0100
Message-ID: <20250418184658.456398-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..ec8baecb9ba5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0


