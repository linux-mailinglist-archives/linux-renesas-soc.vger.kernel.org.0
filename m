Return-Path: <linux-renesas-soc+bounces-15592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B8A81688
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F8E420379
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D0F256C7F;
	Tue,  8 Apr 2025 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGElkrQu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1272566E7;
	Tue,  8 Apr 2025 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142983; cv=none; b=fRIECC8dSbwrr4+sWDN/9kosQ57QCs8+iEtbK4ViDCTXG0pHmMwsPdOo1DOdLTQAeh31U/DkvjzDPO8D4OLNWoxqoiUo4PGgThFh1AYmZknyl4Lzy4XkSgcQ0yjNoVYesV/vaNl2r8DMRaeZ51dnvrmNZ/Tj9kc8w6hi3lHBtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142983; c=relaxed/simple;
	bh=eV4aqIbqVEhgsdONjjvBnJbmQqsoAryUEW7RRHYC2qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9VUt8/t7R39EvZiqzX5fP3bGATVmhNMpWj9UhDmLLyZe48tAfcH9EhqAjqMpnUKMmj0VmD602JvtjZbT8ez863TXIwgMbwqX0FYDbxOD51sIiTS8mJRHy1bseVoChSOrhvyo1J90hkjbVd9/DTwt4dOh8pa5QBV30TEuDQRwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGElkrQu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso377965e9.0;
        Tue, 08 Apr 2025 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142980; x=1744747780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGZ50Xr51SGn6u7jCMMxqvFxPeQ3g15zcJ94HJ4rlGg=;
        b=QGElkrQuUY+x/FKGST59jwJKzwsr4pw8UFfiQ6T7Z1qv7ARDPu9B3EzyVNQ11ZefwP
         ooYjo7lrh5PUXMcUoyAS/9nxBYQ5/7b0jelheMT6tJqAXfm7QUZGQ8eKG9Pu7SQ6t6QT
         dbZIbq5o1yPD5+DWHNFhtIOGlYHN+iAu1S30f9ItmEuT3Wu0egeyNocTuuDRLhrm4Q8e
         zP+j4XISo1HlotD3mz1W4xoMXHGMgR3XyBanZM8v3Men/ymTk0HIK/6Q+lvLq++U7K4m
         cgMqPSTMOeENpmzT1zRR/lqNveSFEMoLromkClSRC+XnTqev6mgVMU08EgU5aF6IkUsa
         v1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142980; x=1744747780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGZ50Xr51SGn6u7jCMMxqvFxPeQ3g15zcJ94HJ4rlGg=;
        b=iJV53fy+nSbk8iFuJG9J1Cx1BnUQooi3GAnm26/i1luXq8JxLopTY7wqzVYNPaCTdK
         VK2H8VxBXpNHT0EtjUZuItDMAaoAV7vVuDW4zhjjrk1UgdRVhhQFtbY2w7rKOBbdsD6n
         PaK2tRGQ5kd8TNEBsaTmlKWdu4qfg8AX9QQg/VswqdlqLb01Ah0qPHg2dlYWZ+85AqAI
         ckN4ieyfaHoek0YHpbB1bw2c3GblsRyivOyF/bs0xatBFviIwcY090hCYAJW8j3UGTNA
         Z4tRq+Hus8mho/Eofw3taM+3elCfpzdJi84iKyqG2D9jb1QxOw40/QGYpGtwwt3vi4rf
         4Plg==
X-Forwarded-Encrypted: i=1; AJvYcCV5FnXVQXGz5xqQsDED4TsoUverkyfcnyRC10AusPRlcq34x8xSQoDbhHZXFihNK1b1509mRIQcVbN+@vger.kernel.org, AJvYcCVh86VYZFYqqB7YFQDorvqniUNIMjez6NUKAaTQ25rUNQAXi7NJ3FGpZ+Ak0SGeb1p6Oi5W+hfOjdzF351X@vger.kernel.org, AJvYcCXsXpTXabx1NiFYXgmwv1jjt3qyMcCFHvhFedLO7sYeCQDVUuqqMyC8qh71alvQKzTuojgEZGy8Wzjv@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGtC3Dh2vX8g5QMlH5cRPNPMZB3lqbtimYYy88lWqXy3+5knU
	Lw37uGTLtqlE4oGs8JEsCkDc3OzcEsEGbnsb6VtwO9JmwFq7/HsD
X-Gm-Gg: ASbGncsh6k3bOfWKC/QMLf/W+khjFR7t/7V45+eMi0QuXzD0GMDzoT5gi3/hB5X7y+R
	0Wew4P6a3VX3WHOxRzMxHfN2a6cV1alCeLYx6tgQIFrMPwI8eio1k1uUQ9JfEvqQN4zaMNRTp0h
	vdaL7J4PckrWgYAcUB8dpzafoQViREDR64EtwZHNR69RnhBsobQ4HHMq32NLX87Q9hzDTOZQpna
	Xi8HJupAZOZz3+VI58/U8Wv5Nks89LiOeQ7qzCzwTCT5fBVYmDbAruv2vvp8X4IP/3YxHWpUW0P
	vZYs2jsk/RIjIc/Rk1qHSzhZ0cefru1+uRL1/9dQK1YW8WNl7MFAWsOBcbxvez3AwbTI
X-Google-Smtp-Source: AGHT+IGki6NA2FUQBimcJPXZNnQt7DmTRS9ENOQFLkz0yxolmxFVHpYm2Ybbty8ovxNJyneAyxIrBw==
X-Received: by 2002:a05:600c:5102:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43f1f02822amr2405575e9.13.1744142980292;
        Tue, 08 Apr 2025 13:09:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:39 -0700 (PDT)
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
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Tue,  8 Apr 2025 21:09:08 +0100
Message-ID: <20250408200916.93793-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4a8fe52e9752..c8be7428c4d7 100644
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


