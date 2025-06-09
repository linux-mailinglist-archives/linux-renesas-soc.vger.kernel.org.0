Return-Path: <linux-renesas-soc+bounces-18006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4251AD2A22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D64188E33C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972B322CBD5;
	Mon,  9 Jun 2025 22:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywb7Dwco"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740422B8A8;
	Mon,  9 Jun 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509818; cv=none; b=Xvz0UgLOaAY/uLqHDkfwQUTYAz5xGNhC7KB1v+c+iZk4IpKjs1y5NQgQKA2mrO9mI+2yERe0YME+oH1kerfPqcjKzzVATb8x0g+J61OVJhgoMhUntjskbiS6+vaiun+lF7KgwtqGZaCuVUOUcyQG0R8LHnVnFfcvKBLHN0QdfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509818; c=relaxed/simple;
	bh=d/302PcyxZnD9AJi+vTzf9twWAbD/8oen19otpWBG8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7d2BYuOLgIfpsql5F4HcArDZiQtl2+i2jVW94b0rQ5WDWgxf7FLr73UjZEZlDuZaPuMZdnKft+vzM/T4lCc6WB18smtoWBYuzdQoqm4rf4kVpKmCrofWxAAEvjdS/k8EX8rE4Ekb4TUFtzejociy2OR8LEzl2MKBaOFe/mQVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywb7Dwco; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so50007875e9.3;
        Mon, 09 Jun 2025 15:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509815; x=1750114615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mJ04kIY50S4a/oCwlKLWoQlfyGZTGJpeZDyun/CaLg=;
        b=Ywb7Dwcokh+hjGRCSo8gkc9DSR8LlkWkDTuTGFOHYMX+4cc+6vtzrUYbsnog6nW0xc
         ejB4B4lu/p+zykci0I482EnuUVDcKIpgy9wL17E0i84pF1DgTnNsSG+nSvAtCAKd/PCv
         3BWV5fqcFXz6Y569h930xe4QF6x5kwYy3Kgvnoz0lP9CA7EtltmibAL7Kc3ZrinvCZMV
         6ZSRy/QWs/LbRgLXIRVHcDlgTg+M1Rro6iC1DZ32S9aIW7L9bOgo2EwzQDYdN5VEExrd
         x4DOsqaLeZJzM1/DFN2aQalUnB0iuBiXyahqVa2gktkNMDq/xPRA6cWjKqdUvsgaJTHg
         vQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509815; x=1750114615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mJ04kIY50S4a/oCwlKLWoQlfyGZTGJpeZDyun/CaLg=;
        b=w9/SWmN/JTSOizD4528m+WkeNU58lsPDcXHj7vGYd9u1J/+AFMEdEmpiwbIhpUMM4t
         L21Md/s1a5oDyG/SPt3yUzwK2G7HvcAq1LJx3W0+0HfwV/u7veXZZ3fKiB/e3Q8gpB45
         yrhu/IYowTmFMeRzVo9JbjfYBzJR9943kc7FtE0Ls5dmdw8d7Y9Dt1Hv88xf9W8/dglP
         l3l7+EJwOMfm9oHkn8Apfzyd4p+JYpqkHlcrzalMpqBJDNdFU0JYxqO5MXMA8Ja9ntfH
         Yrxty4sPF3BKI+/qCsNKKU7Pz7iNwrUUNWtRSrNx60xySgU2KfNAIJ0+S3kQjdZZALRe
         xPhA==
X-Forwarded-Encrypted: i=1; AJvYcCVNB9cAnHQ9ml/0TdKKa/vBgbGRMxQJunX2FbP4SVilLLum1InNtZnNyO45Sqg60j51Vvf/MoIdEJTh050=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdb6qJbhcn6y3gSZWrUKB6q8in/LlKfYXPlzf+DFSEn1VVpkHh
	NiMyuVUVykLDgLdci5J7CiduQ6z9MsUeqnviln+2tYnU83J7iht526R9
X-Gm-Gg: ASbGnct5MiF+J3mm7UAarfPxDHXHc0/r7se8/jse3h6Yotm1+JsctIuzpyMWshqobP9
	iYMFx/BVUhauPHaWEaXVoVPWnOWVp/RweP0XYMM2OJrcYP/OSR9ku06roaNpLIekYfVu1J5lvIF
	oeKcTU8+DTRNb44In28ttOQb7O8+Ud6tsk6LG0Ygvcu8u/pITfOb5k3VHsIfyijzvz4gzZYlIAY
	Un7vGRTdgZRAYGrNkDMFQDybefpJV+h/oidK7vmRAMsAtMuDYCoLHNr2hB/OTNir0v8Z9fHF4Ql
	47O2E2Y+X0lJ/Ht1pV//rmbti4yGBqe2l6KScrnXr+o2E0cPGOYR/Ekn5nwL9UIiAnFVqDsp5pI
	muZtnEiDqB1QxC2UAiL8=
X-Google-Smtp-Source: AGHT+IGWs2mxydO6AyZh32szGvoE+Z5bEw/CSpjmczATv545WPvvStrl0U5S/ZYeJpRamOQYcH101w==
X-Received: by 2002:a05:6000:188d:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3a5522ddb60mr288540f8f.51.1749509814907;
        Mon, 09 Jun 2025 15:56:54 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 8/9] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Mon,  9 Jun 2025 23:56:29 +0100
Message-ID: <20250609225630.502888-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Renamed dphy_late_init to dphy_startup_late_init
- Added Reviewed-by tag from Laurent

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index afb427e678bd..12cb9f0d32fa 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -40,6 +40,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -331,6 +332,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_startup_late_init)
+		dsi->info->dphy_startup_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0


