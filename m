Return-Path: <linux-renesas-soc+bounces-16545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D07AA55EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F64189781B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF67B2D26B9;
	Wed, 30 Apr 2025 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qq3lSl6Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B022D2691;
	Wed, 30 Apr 2025 20:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045694; cv=none; b=gGtQKGscVCnToun9pNhCh7F8mhesSet5rJFdN9nZzDPrVwpPNIzmm7QvhMIOowAsIfe+AOjQJVPV7aunJ+sGts5pTBcjeDeULiZDuod/8GCri4FDTTT9nH++X84Lgp498qG9ayamcSuobY6yY//3B0kAvcgg0TagdQycnxSTyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045694; c=relaxed/simple;
	bh=UCoz0MtvAKMfDVwyQT6bBeR1YcYMU0rVSKiqil9gQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkJneqNp40AP//z8YxMoRR08iy2aUyi9Jf9smlS6KFDmzBK8P6S5zTpudDvgZW6CoJJpWFIFrmn/X8tPxD7/4LhhPfU7zel7DMR/ygvPv1uSMBZmF88bcNeFfzouZK92F68aXZ0YOzEbbIlzifR4jUBI2wbkSJNDO5Bz4sAHL/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qq3lSl6Y; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913d129c1aso230051f8f.0;
        Wed, 30 Apr 2025 13:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045691; x=1746650491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeIimSTGkxAiQACuV5flhhZMsgNREPFEsZ2/L02ocZU=;
        b=Qq3lSl6YQbxz+6hmyI9Er6mSgjtIzH2s1Y8kOHEM/cyg3poGMenU5oUVgbEYD1epFZ
         oi8BRmuxhOVDaNw6zc5J8UVzO12RIMgedI6ogKxSWWiFHxVHJUbOfreOqfpmAVl7p87d
         OlDhTApF4Q23QFB95rwm2cufFIx+L0dg6IOTCiY3x6rCG82oIvWmQJVpX9zZit0b8yyy
         rbQh5lsiolM9qM2nZgwd9jlLFR07BdXh+pPega9r3jLnSypbUKHnCq8zhsLj2QPDI7uW
         /hzXYV2qpAtuDAHE1Gpx2zPBsU7wo4cuNzsHFvdmdGP3HNHuJ/dh7aaVm99sYkMxQK//
         JBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045691; x=1746650491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeIimSTGkxAiQACuV5flhhZMsgNREPFEsZ2/L02ocZU=;
        b=O6td/isckLEDundX1W06uf/4tWmOuTPtKnYlOYv34YzC+1Lgz0L0GPJpYOKwAtm6/u
         pt3TLMBsrNz0bElScVasnivRu1N/B5IPJIeCNW19qAgLs+++b3hTt8LSnDuWGRG0z9fR
         WLytFeANqwwNO0YFoyMxxLyPbrpHhDwuxjdxaiRG6gPgRZ6QsxqLJZGOZJsJRYnP4kGq
         ISwlhpE4rwlZ2FEryYM+ZvO5j8eE+p4Gk3QCg576tnjRCulF6vJSpKN85gzKTJLPLoMi
         nXb4/uRsJi4ailVm7fy+y1GFnIcrFogs8Onqk6Fp1Ow/+tKlzAjzsp9c7FT47K16+DOv
         ohnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4BjnQ277wFkQGORoimpgKKbXw4QxM8qUBkG7zZoew0DaiTR6b/hswke+JZW7E8FhiqiPtQy3WRuVxBllx@vger.kernel.org, AJvYcCULpL0cHA45yG1itYfg5bOhFVmQFiRfjmMW010/cOKKUtKPlOZqpAPKqPuBHybGvZTHG+7+xaidYBx5@vger.kernel.org, AJvYcCVKrUVLhLrbXitAovqrf6jwTC9Fn1+YHYRrFVJjy0sl+2nM34eIDyonraMIBEnyZDg8C7ea4sahz36r@vger.kernel.org, AJvYcCXef86mpNh1gM9wpoLBxLQ3bvgHme06AVJ5jJBjl3RK2Hzu2oin+Axw5aPo5uaLuILJeiG+TfH3alvH9Z2CHXVUxZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPKlsIklx96Oc6R8y1hbp1W5Gwe59+rlEX7wYi8df0omdyonb
	yWFmogJZY4Ho1dXQFicG2qTG263x3sG4QUy17UnkVWtQ33CFmUPl
X-Gm-Gg: ASbGncsJiIrVFYTV0VQP+hk0tHVNSdK1X2TE5PQUq5IUmoGNMF7ImaJVzjqw6kXGZn2
	3RZQ825/bT8zAbH4I5SNRZbB+Jn7RWEXXBn2IifKvbOZY/tTl8NKL6kka59ofT1WGZygo2hJoi0
	6NQ4Br5Qh07sIV6UPoj9+8M/XHg6RAWmYCssdAvEUaN2UoKCJtCUrQ6HRkmXX6kxesBKD9SGuuu
	XecZy61zpaSP+dKRk0uepCvenGVtbehe7i4hX2n8ddmiBFlmmcGgv10eIbmmIyHukf6AluK41CO
	Avv2rj6yF+SgZZFQzP5oSp3JyIiQIQdds2kn249A8jE8lp0A4MUoR78g0Bkt3knHFadKkcyNFzU
	=
X-Google-Smtp-Source: AGHT+IGXi9gEHMu2kkOiJyeElS9pMvis5d/bb/bWjaAFc2lIThqPQuTspcq9AFbQpjJeQQy6eLr92g==
X-Received: by 2002:a5d:4d0c:0:b0:3a0:7cbd:ffb7 with SMTP id ffacd0b85a97d-3a092cf7e96mr629197f8f.16.1746045691125;
        Wed, 30 Apr 2025 13:41:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:30 -0700 (PDT)
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
Subject: [PATCH v4 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Wed, 30 Apr 2025 21:41:08 +0100
Message-ID: <20250430204112.342123-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a4c0dbae4a46..8c7384b95411 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -29,6 +29,7 @@
 #include "rzg2l_mipi_dsi_regs.h"
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -643,8 +644,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0


