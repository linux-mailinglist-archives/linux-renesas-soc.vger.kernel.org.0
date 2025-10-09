Return-Path: <linux-renesas-soc+bounces-22844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77ABCA1B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 18:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237BD3E562A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 16:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937642EE607;
	Thu,  9 Oct 2025 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg1Spka+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2C2ED165
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026069; cv=none; b=AJghQMsrDdBfiSeYHOwz3bVWbzc/lT/yT2qReLJhl/spdHfdhzGhn3tnMY0hZagkGzJGTpuIKypHZcsSBg/MPB2p6jZEhZu+SfogSTkRCS3PhRXwBXB5HHqKM0aejxrb6ATtkMVcOk/yHRncUBXGTyJRPgy0wpACENICF6pvr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026069; c=relaxed/simple;
	bh=DN8j9z4swmPbzPKIBHWy+/B/9Ha7pzPEWaFFp7dlByY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRpCRYKnxOS/ehmXu5DH0bplnwr4u9eoIaiSeJUTlx4OAaDskpA6Ch+SesnYz6wZuwOCreIQCX26SFpivmh4aQEgZGxFOep9YselQ88+mpqwPDolpJ9eZm2qNOBxt6IlmcoWzodf+Uw2Js+lrMHayaFqhfgf4Xd98rzaOKLTQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg1Spka+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1372694f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760026066; x=1760630866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2af5ZWbBC/9OLhW/nzoY8CDCHerUl/T+QhinKzjtT78=;
        b=kg1Spka+DkfnNTj7fMU627kvccVJRI7UH8z4Wi844jfWh8gRFO1bfEQntouqlu59B5
         yRkikEgtDSzy2HPae3wswkfiXKIl67CER2o1eswT/gTcOixM8OuW5gvyM1bC23j3cCHO
         KuywFcZnzqU64EQeOMs7p323ce5L0kPcPhv9SMNhUzaUVGkswzAePN9rYeNvTALgckjH
         Ii9lt0exT0JX8GMfS8Scj7MBGM02XJVLRp20BDjIjvX1jNdbGBAYh+r4giBkvWn2Ab90
         PeU8rfqSgcJkGYGekXwlCB6mXyUYT2p1GFs5lkA81H9/hvlBJwvCchKSGPjKMPpqGeMU
         zraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026066; x=1760630866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2af5ZWbBC/9OLhW/nzoY8CDCHerUl/T+QhinKzjtT78=;
        b=TGxVfeE3dBY6NGsDWiCZvIO+5xNRgh8roSPcbnhu4ejekc2VMHzP/PUZcDkKVL+tRN
         HLMKxjrAn3URxm3eNk0gPf+E+4gQcLPRr7aSjm7C7VzR/DAAmLqKdRR1nHd8TmwzhecG
         AxBwbHCya9WvN+QY89SScajVxSILaosz/uvdirFa1W4ctf6C/n0uj4+AROUI08sZRCE9
         N0PmectEmA5bo8ibwdaWSKe5jScnj+pxzwG9ylJZPjQEhBPRDy0McjlM0dc0AS/uCpm1
         3csdHYobE4nqfUcbTOD0dDxPsR3D3JXz/62Se6nN3bfnGhol/RNqyvl/JZXEX2gHA6X7
         1YbA==
X-Forwarded-Encrypted: i=1; AJvYcCXqI17E6+Sf+S6YPDCTRreiawSYvVS+wRgzYvGYwIJ/dyQvXa+Px+G1uYxuIJEaSisMS4TnrD5GnffA8+i0wbvoCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhx81dYsUhMV6Q89x+GasO+uoGYpgp/+qnG6+dKSdniOKdj7hf
	nY8xdcnBEazXyyeaBmd3Aow4scn0uV9bZoZDFMlgLUhoV9OS0oUu5y/v
X-Gm-Gg: ASbGnctqjluxnagZqFN6WI76oj+foLNx5g8F5zJL/3FmMoJniSnoLodUQCbHgzmRZ0H
	quXXfMrYC/eCcvSZtqwSPW1gQfxDE7x1PtsLlT+2n7dZwhekSvfuiHd2eeAQmw9pq9Y3X0XYExj
	y0D7BCSZ7AAs9dvu2WDLjIqAhcblua8v419DL4HT3DQxqSvcTLeiYBPU+1SM+Y85R8sXjTWqNAa
	XXTtnOGYRCygutxgfh33Q4k/eE5VQfOcWPLFbJw6Uc6ShDzH0p5I/4Cn+BykKHeO7kjj31eD6BM
	kWD0k9Pjm1cf9bHTngihbeUH+Aym4ZYoYWxxDopC7xWx335mhyqwklwSSJqnJihN7O6VzxtK94r
	K/p3KKcBVB3lc8X4dMt0rovbP3ysyKRzLhjZOL3TjQo1cMFHTxj0Miou0bRc6KpuFvyYUaTJVAm
	BJMlXlAuejc1cf6kA=
X-Google-Smtp-Source: AGHT+IE0KMq3ZsTbgVRvE9ZWmsGn0SaVRn1OTKWCKWyaqHw5jxmXzidd2ULsjc4Dgmp2DbpJwZm9eg==
X-Received: by 2002:a05:6000:24ca:b0:3f3:3c88:505e with SMTP id ffacd0b85a97d-4266e7dfcb8mr5595946f8f.29.1760026065423;
        Thu, 09 Oct 2025 09:07:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:480c:edeb:2884:a92a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426cd93e45fsm94632f8f.4.2025.10.09.09.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:07:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Thu,  9 Oct 2025 17:07:31 +0100
Message-ID: <20251009160732.1623262-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
v9->v10:
- No changes.

v8->v9:
- Added reviewed-by tag from Tomi

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


