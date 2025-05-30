Return-Path: <linux-renesas-soc+bounces-17729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 887FBAC9446
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2581884087
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F18A23BD0F;
	Fri, 30 May 2025 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeWanXor"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3923A993;
	Fri, 30 May 2025 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624369; cv=none; b=ImY1PqvyQ3qLbMJItbFz1BFva/DZhZGNs7DW2WWEPXh/G7RJeF5B1sbsIgyRSdl0VNW/SbL4/vZm0uZOWj/h2HhHBfbwGXPBD2RhMVzSi8sxJkW3TrA6SWYo6VUPvoAIMD0ng/UMC1PTa1mJEenmJxVSYH/NL9UTONywzjv5ZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624369; c=relaxed/simple;
	bh=FwSwMOjYbghaowUD9yiDgSeBs9yDcQBlGlKq7Dlkguk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtOi3JEdG2VnhWBDe9CS9ho0YziHvAvjadtOVS/6mUNu0grSCvqugD7DJJcwxU+vMR/p+86v9OP+ETHsc1+jY2ZDvOUCM0YCBtDf7tC7ruWCuudTQP3RATv1D78O4r0z92+jM1ZpiuKApSsbuDZlCFeYMJHMn+RoPf+hFJx2Pyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeWanXor; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a363d15c64so1524918f8f.3;
        Fri, 30 May 2025 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624366; x=1749229166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wyTGUJmJGL2WGesM8nfuqYiVpu2gtlcpHv+BHufplk=;
        b=WeWanXoreL67afh/FKG4MjrIUIL4ZGvU0SfVXeAoCCaocQvmI6gH12rkuSIsuYC1rd
         RcudOYghT5Eb6A0iVZdFv4FEV++AajQX+tLyOeXa6DGuxkOGqAOvYQtdrz2mTHd4JiXA
         34+yct92U66plAQ1px/4IQDCGLHb5IITb/AXWj/aqS9F3W3A2NQ/+FbXkofghsk8e1aj
         SQkiaQ09FDzvpibhY1JVLy8D6LWlDF8CedNPdpckPhZZKguBa+OvivSC8bn59fgJACbK
         KwYf9Pd6/Yj3f4iWaH9xtYkwtWruCIm3Dvw1LFE+ebV6gDTqcc9yYmKtE2ydz/I69PAh
         yHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624366; x=1749229166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wyTGUJmJGL2WGesM8nfuqYiVpu2gtlcpHv+BHufplk=;
        b=h+Gk6/8l2rbaAykCWKAT2yF6mNJi2QzWprACvg9NJRWX+yAAxue/1seVejm53jVb5R
         vaapQF2grKYN6ND4acvlrpAc1tGasmkpxHy9w2b2r0vZmG22/qO/Nht4cZhn0aT84rSa
         20/MnKqqGbhO9giT9c+Ll/voVB0BaD68W+WgonKgGZIST/PdCVDpK37kpGgJVGPnU8p+
         162KtnNuf2CffETgzoxrfEeXzFJG8Vzjjq5IxDK16oLli557IDsVlMLdfyT9zN0lDxon
         nhGQbjDdyxPE4NqLtRdAtaeGyII3MW90e2l611+u3CeHKiLXfn67W1oktNkgzVK1h0Ox
         zZCw==
X-Forwarded-Encrypted: i=1; AJvYcCV9HQ5FW4kBNvsSAJUbQxhO7z2o/J7CtBvPmOsskV7pYEJubVdF4crxwpDqPX6No8aiUIque5McpDgr@vger.kernel.org, AJvYcCVe7fscPbJZAOWYg/PbqMwLSf3IfidOIPrMT3zjbOeFfB5I1zelG5AzV2ORiFTUPrdnw/YH0AYK0zFvJAD3Fgm8OrE=@vger.kernel.org, AJvYcCXFETsmPb92hBriEc+6zOY+nIjSy2oXZ+Zm3NJmRDSDVV0no/kpOwlXWd+zGxkjifR/ACvgrRN/kMR404yA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Mgj7MmdNE5mWfg7IBbDpUr2LL+vXmmr9G27ng6/ZhMwYAL0V
	Cc0UjycX9eO8n4gqHzwlFcGzfZ0bnKAZhy/NM6GLmhG2e5r0MkZGc7IY
X-Gm-Gg: ASbGncso9eIt3B3zKMlSlpKvDgKV/paJzhiifY4Gxe8ip1VCMFQMc81Yzaa4qVadfcU
	gjxXyp3bB65sPCCvZM0uBBSA8s1X3lCF1GYySBLvcGWz7lV9n5pNBZA6dUR+CXj4jotQK4Oe05v
	xk/XpqPDfcS8ci9ymMiameOj8OCACOBATzUDvDisIqt3u+hOgBp3/AaK4Qnxaw29t1oYxsmF879
	scbXpTIEVBgQEfJirRgkqxq8ZGr7pLBi+StXUD3ODnsCMcZwrbqfT1I8Z/7pEI9l1h6cIP2kcDk
	2TO8STd7yrLIRCVhoYK8m8ybnJGBtpSOZ19VjLZwgGQkVsC+9cYYYlwo2FvXcAFdoGCQTAyttg1
	zysiS/g7XpP2QaZRUrk5I
X-Google-Smtp-Source: AGHT+IEj2mWFq52WxYW2XdXtwquiylRquF3NdO7m5fCF7V+mYsPLNiAhphxn1nLPPWljA/scPh/SBQ==
X-Received: by 2002:a05:6000:220b:b0:3a4:d0c7:312b with SMTP id ffacd0b85a97d-3a4f7a35918mr3340221f8f.26.1748624365743;
        Fri, 30 May 2025 09:59:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 12/12] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
Date: Fri, 30 May 2025 17:59:06 +0100
Message-ID: <20250530165906.411144-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v5->v6:
- No changes

v4->v5:
- Made use of devm_clk_get_optional() for lpclk
- Added Reviewed tag from Biju

v3->v4
- No changes

v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f9f2d883c40d..a31f9b6aa920 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -62,6 +62,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -791,6 +792,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
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
2.49.0


