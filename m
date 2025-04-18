Return-Path: <linux-renesas-soc+bounces-16164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A336A93DCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8EC4683F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EDF2475E8;
	Fri, 18 Apr 2025 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKMSoxSR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA82417F2;
	Fri, 18 Apr 2025 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002041; cv=none; b=Ik0HouAOkd17pCxZ3/JmOb9debeR49vj6O89Le4KDiuc6yusSGnASzwwcJNZ8ziNyWT36bkHpY+4rnzHo3NV5fg611tQVEQ+2Asp1ChEDGRdGQlkZ7z+JhmkMKnziZsVWV/fKvuovXBnNqN55vaugTKGFe27IlR78LrWttQCd8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002041; c=relaxed/simple;
	bh=S/mLdgUdTG5nxFOn6mQiUO/9NrMyLL3d2ujL96+ETs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BocRxj/AGLMthTaPWtCaJUs0gbobIu8PIIqzHzh6yGHpHuJ2/PlM2O2mANtqOMI2OVUokjroDeN1go63y5fiIf0xcrgK2YNJ9XCQh0bgm+/fDoMdWRpJq0g4g8l/xo8kysRzsFQVyVNm7j7+rykjgvVUZ0c0+HZy7De61I+Qy/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKMSoxSR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso14352695e9.1;
        Fri, 18 Apr 2025 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002036; x=1745606836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTNEXdavel8/vpubDiQKjXEe8EbRKVx9/bnL5+H0328=;
        b=cKMSoxSRzGA3ro8Qs/unjFNptNm5+u4Gw328aoW1Z7bZkMbS1JHOGJm/EPKL8rHuee
         gW9qlWmsSEXcttSb67/fOfJlH9RUrTh40qJVx7hWGrzmZ0t4UU9ZvacmsbkcgjpwwlkW
         bDYOZVT1sROUrRmfePJ/5GF+JbjyrQOrgt0YHedZRdLWsT/ZPXoRMZlE/8Pqs8MlcbKA
         9rlPxG1LvP3lrve+0SMSQzpddFcix3uvtaeOXr40o3ctXB4gLeyUEWtl9mVIy0w/hkK1
         DSQWlnVUkql8NKsaGtHf2faSHDBl7oV7otknPUPE2Zhyj2BDS+jSzdNSjHKOZtXCRFVn
         pRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002036; x=1745606836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTNEXdavel8/vpubDiQKjXEe8EbRKVx9/bnL5+H0328=;
        b=LC/r6z8Yvcj9aTIdtMeRu4Q+FFrZ5eT+FkUAn0vcYPdhTrZ6eHl/XX5VH9OiPJ0i0G
         m3y2njnCgjbAt0zXRAIxG7zIsWV/7mF8D2yriNJsyIDQiEsOfuJgnsUNLq5QhKLk6AUl
         hnAG4Ku28Pj6JejXpEPnSKJwMOixmfvV906q+ol8nc7viJRedJ6xdr+6+GL8qZ8zbtcZ
         46Cz4g+FbDhwA35SfVom/jzVL3Wg7Z89COqmdkdiM0AsfcW7E6IUVB57tt8AMbvZhLUt
         AvUlO8mOU7D7dlLK1vHflsYrvxWSdcq8Mzu1bVcLGp+QkJ1y6HzXBRvzRCwoeND/xpgg
         kxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVYCTQ+QatHr/6tQ/9ivedM3LhoqjHh6pPD4Z2nqmrUP7oo0f/PCFil80DJapCOGyZpeZby6QB9eEgpTit@vger.kernel.org, AJvYcCVGLwc3AGqbuNfRoyUEM4myvQ3Fl36cUXMMtIWnAorPiti8nOzY5RraULWylMVGJ2HkQs2W35c9OeWR@vger.kernel.org, AJvYcCWnqnh0SDfkIu4JMO1p1sSaAdnKyGlJjb78FfbNE/G97bjNFsKGdH+7TvCxiF9iJrJ9pjZAaM6lo9GO@vger.kernel.org, AJvYcCXr3xiCv3IT4U1ZsVq8IpGKa7sAfcId/BIZuU21pfn+Il2OjTq3Xe7JeAHqBzDyN3kH3JKX00oRrgHrR6y1DpzkjqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwglmzfSNlNxhpjyW7E/HrhKYxdqgdduX6RguqfKPfETJkDfs//
	Wt91scsW66zUzjY5+tHaeKzu581U8hfNc6cMyzVcIU29NgfOJtDn
X-Gm-Gg: ASbGncvTEbSiXGHKgwIt9giyUP2gBM3E22RFB36ODdELPbfWZqQGjxn6B9ihAh9d2LP
	h8cEYHjuELQi9tPf1ol4luYPCWB43umfaH6JdsjK9ipUvKTTiyJ/CYv26ITvkESLyNXRuX5RXQo
	Ej/0KvaLGCrz/aD70+1IDpsGBEovP4Rzhj1XCDUcHTagEdLsLsjXLYFsWBdDs1CCEDpgAz2LWt5
	TX7kva2l7geCAXv5S5b0XtjYzjSaoSt2qu+8mtqndPNGzt0zIUV0Zk8Vazk9soyNGv9Ks5WA3HW
	2X8r+5V4ht6jPEsSz8deQQ37FHwv4/fSbiTr2CTKKhLb7OmFCT8fJtW5Ugp2wY6+NTzfTaMRLZ6
	b
X-Google-Smtp-Source: AGHT+IHLNwX1tMI/YGMuExRRpoPK3Z1dH7iRYyCehXiPk1akwv6jtSV9sHiaV+vtCzbBE7ulWs579Q==
X-Received: by 2002:a05:6000:40dd:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39efba6d50bmr3192738f8f.33.1745002036337;
        Fri, 18 Apr 2025 11:47:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:15 -0700 (PDT)
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
Subject: [PATCH v3 07/15] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Fri, 18 Apr 2025 19:46:50 +0100
Message-ID: <20250418184658.456398-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ec8baecb9ba5..c5f698cd74f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0


