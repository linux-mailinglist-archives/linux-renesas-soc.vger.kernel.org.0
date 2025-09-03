Return-Path: <linux-renesas-soc+bounces-21295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F6B42698
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 18:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12DC37B89E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE4E2C2359;
	Wed,  3 Sep 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9P+hzvA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7002C158A;
	Wed,  3 Sep 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916257; cv=none; b=jG9Xv8GFUEJVNsRakF8EzBdSBdlr2BSltUxaCeuWSunWfucjYRRLrCaDp1xavyJbJpxDaOPWdJq43+JHPjRWCIua4QNdiopPGlqxZtC0uW8/erWYkwCQCOnSi8l80eg8p1MFpkxYAEUxMsHc79687jgFXVeRXmM8NyhGcO+1otY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916257; c=relaxed/simple;
	bh=hzs5MMdEa63rQmotreKQ/MI7EuD2U8Ur6DKtKqZnLis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJxcdjcRP9XOvOVQakpZZ8FezoCiIt4SAWB8I4cETTZqyUmPTDoFM/YbOiRTb4k2Mw0ks13C2qDcu0QYn7jv5QyCDGE53Aebq6/g7IYBB2zHXzsjn1E1ogTzM3ILZgDtMSF7RXBvF/wHa5xfnIfiDHWLTNlmDuajKJyIABYNwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9P+hzvA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso993745e9.2;
        Wed, 03 Sep 2025 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916253; x=1757521053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSjM+a/UtCOs+KeC+1Mwe43tHaErZzo30UMBBl9ALYI=;
        b=H9P+hzvAVRGZO2kt0swPvnQU+hB5mdxctEzfEU9NfL8ye7dqe5T4e1VWoYNyY1wscy
         aBU6IhTNTZ040TTmACxywmWFv02gy3vAfX12APJT2wJ9uOcnwJnHB/c1CbyZp7OhLuMI
         seui/nK10wkhmtnumr1u+JG0DfRZKuFQurRi9c+FS6Xnvzc2oy5roplsYo/pDpPavQET
         hECN/m0thgu/IlG3Ct8Gi1MVeqm5m7vb6MiBg4HeTNuezwqgZRs0E6dDEdOjPJcP13mM
         g/sBulAIkjx3lGwjtn4haA6pH/skOD/eecqja+UBRNZlZmLm+ITH4hsrFCIupyflxLh9
         ffQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916253; x=1757521053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSjM+a/UtCOs+KeC+1Mwe43tHaErZzo30UMBBl9ALYI=;
        b=kosUPLWjVZT2zhZvhoLUDd/Z9MUYenjfaBHEqY/f793mQNS1+PZMFrjkkDXcaaqe6t
         qrRLVF1Q8X7ZqC41he/wm0BhYB7wVD29oKR2KiY0KRh8nDq/QMg5ZnJbArAzL1kyaYoe
         e8UCUzUNKB3qWyfTRWLGzKKWmfpdns5k63A993VGDv/1MiQ/sYeBHLLBQ9unnhGJW9vd
         nk8V8wCWKVlI7JHcu3H3PyP+c6Z3IAA76SKy74cAY9qOJQiqrGd1Tsm3kF1+k5K23tAM
         qw4Ki3Na7ghbq0Bp7LtbgX2Z2WUw6ne5r8PutmvVIezKJ+VBUq6amiuCMDboNX2QbLAX
         GIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8YQyUcZSXRMXElYN57AcIqMEtOUI5HSx7dlbSEr/v71c/vr5LkEy6Viuxe3pscsMWpBFVXhu/tqPGFbk1@vger.kernel.org, AJvYcCUUYKlizvG1oUn++z11mPsIEpzdsIICbISDncKcvGLCRXYp63nJx6Ysb1uzplCmwS12PSeuaDqqDaSg5MtvB2XZTJU=@vger.kernel.org, AJvYcCXMXPcTpa1j7shuayEskxx+6CcsEytxrszEOz18QpvXm2mII7xZEr5EFykdE9VOyw0+2uSw1ehe4vGf@vger.kernel.org, AJvYcCXwN9h3lGodidP4FKY8VDGUHo1qCMPjKjIgnvBX6O3RioPjdSfOtv6UhAo6q87pDTIDl7CYXstO9ks+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tUNdklRw6OyMaTSJ1XLJzeOCCV8ZmB3uqM9S4nyQgezSPv90
	HRDtwN96fJ7YRQBfdBkhCO+2k1YCi3CJVOw7x6DvS1OMz8eXAP/4bX5y
X-Gm-Gg: ASbGncsisqPG06NZBmP119iFlCyeRvojNX31l7buv1jAR3SVETMENRxPTIivbouPJkM
	rv5ZjVOI5mFAOwnooCK0/HNiNTpfvYi8G+dhp5Pr2nmxlmsiyqjURKUtTIFvGohHtAlKOSAQtmR
	k11/Z0zI1QwTlL9PKHAGDxiQTmVN2alFLfi5pT7vhsUhsHT1qQES8U+mLznHOFfQ3XD/vTALDlV
	QQzQZyObaDepSndMFzSQM6GWUL/DtGj9oKRK7rK9A7qBThrapyo33/qCva/xFFNpinIivdkd7sk
	T2Y5hdb5CCVX7yQgdavAI5lHFVFns2B1UdkbkhIbqVsNg+hveNLmk2/ONzerntMtWL6S9MEzgcj
	RDVQ6dJBQiOQ8SdqebTaCXDNR08IXRGfUDEZLSbRMlt+zXC4RH/l7O8hg
X-Google-Smtp-Source: AGHT+IH2Pu4JhVqS/UbbYXuRvueIRTHUHdGhkRCEOOqAyE1x3zxd/y+K9oiLsym8FuhfUcGJ4iZqig==
X-Received: by 2002:a05:6000:24c3:b0:3d0:ef30:d332 with SMTP id ffacd0b85a97d-3d1dea8dda6mr14556634f8f.46.1756916253425;
        Wed, 03 Sep 2025 09:17:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:17:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v8 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Wed,  3 Sep 2025 17:17:17 +0100
Message-ID: <20250903161718.180488-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
rate to configure the DSI timing parameter ULPSEXIT.

Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
the "lpclk" clock during probe to enable lpclk rate-based timing
calculations on RZ/V2H while maintaining compatibility with RZ/G2L.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
- Updated commit message
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.

v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..bb03b49b1e85 100644
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
 
+	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.51.0


