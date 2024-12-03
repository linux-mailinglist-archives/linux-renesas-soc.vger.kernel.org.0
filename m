Return-Path: <linux-renesas-soc+bounces-10862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8219E290C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 18:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9081C287919
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 17:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99BF1FA252;
	Tue,  3 Dec 2024 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjhCSu2C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D877D1F8AD2;
	Tue,  3 Dec 2024 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246526; cv=none; b=H6G9/k2uudeAJ/49qYMMa791pvBTP0snj7zEGTqwFWoYHUnMYdGJOh7ooLD4VFOf2FQVQkSTU8lJRZoeQL8P5uHt0s9SCdW3l0alDSPM/7O4liW9bh4ud3fxVTIcE84wiiW1Xu1U/rw0Ik+kmoHi98jSpRyxFoA2ZV4QWJfZ7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246526; c=relaxed/simple;
	bh=bYnawF7oYxeD0CaXeTzycWpuDLj97ZcW8fQr4bvDtls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WdVDEQmwpyNnrMAIuY7RvW6PkcREeRgjmmT6YRIevszs0NTTtUB9xYn6MvMtHeClgLt+CQ4Q2QDjO3BSdsGsvKfE/Mwf7/VfcsX6aYSoxv6954HP/xmyXm3LD63Xaewi3zjQTAMABE3r1faDcSY/Sml1BCmzqosv1z6B9CP0E/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjhCSu2C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4349cc45219so52401025e9.3;
        Tue, 03 Dec 2024 09:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733246523; x=1733851323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDrSaH5SCKXFsRBXZmgdwR2EOhLbo3un31COyXQgzFk=;
        b=OjhCSu2CW+ohDs518kDjp8VEKCNa3AMmUfhQBlGG/I80Q13qRCNoHNnMqXX4AhHx4h
         O+1fyoPgzYjUJbxkOD1WD0asziMXi3P/rgQ87ePz0r+gp5avPQNLnpDbBvhCfkjBdGoX
         wzD7b2X3iSnucep5R2+36pYBFqLVWA69v6KxJsCSrfBbEJLISV2R9cbjXSl2IqL1nIUH
         Nb4RiEZVDFP2b8rksBBEaFJadJa3kKmRiXl8cP1aRrKmoe8qXUOR9vHjknqYgYlTB85n
         U0qU94dzOeSoEvlsLMb6IBNO/fKMU/3vdvvLIb3cDqkpSaH2ppFQdEbqZq4NkH9xZtHC
         qPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246523; x=1733851323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDrSaH5SCKXFsRBXZmgdwR2EOhLbo3un31COyXQgzFk=;
        b=Ec+Ffl2ZOFPmP+GozueXWMJFXvoOYe0p+rT9FsDZYTap1FY61fsWeGQOKIzsUEV0Ko
         H7WH2nPoYRV6M5SoXq7jEmIYyGdygvWuS6k2kuMX6borZBsFMAlGV7Dha7wqS7JBFKvk
         xJSMfwt46fG/sVQtXDMjFUV2iSTKwS9fuie1JxT4M3onr5Udja16v17E710OI4cl+fa6
         xYJjQtbvJGDtIxfg4T33kwrqSsCxUD8nIWI3YRk0FsbAMWG+AU62XrikztmdMr9IEEjh
         o4d4ChCI8mz/qWPe86uHSmgr9HB5x9Z93iykz8zgebjd8pCIQotdM8ngJe6pXLOOznDB
         tIYA==
X-Forwarded-Encrypted: i=1; AJvYcCUW+dEtPdhrVt1Gq1uVFfs1o3y1ocXzFyjKokhtGEfStR5wuTyTpTul6KzJYK+7L2Y5G/3HOxZ9LDVaG30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGWKDc9glJQUbncWIGZIrGOsubp+jkppWkgpg9d2dEMETXZ78P
	D/GMjN8gNHeCvlviN/GsVLxIjGgOUhbsP79kenp7BXUlG6NdM8mJSc8HwQ==
X-Gm-Gg: ASbGnct/D2fRQjoec5uUzPcfI9aRLBGBbUSLHFAsj6qZzP5d3qfLbPhIqvmmf38vWPy
	6TCkSzhs6MVso7PENgbuIvMfOw8ngRxlUwpPko12/S/QPKAnam5NL8hGdHBYHPcOcSOq8IbA1zm
	6ZeL4Ohy+POHyBfLl5zC5i9iurDD2+Pfez/L8++eZ6CMC4hBpp07Ay8kXTOUA3E7UON00L+JPb2
	oiO7dcZO7M5z42lY44s+Ukfeehfvg+Hv1GUCOfRP82kbX/OcQrjMou74KMn10iD1KsyEiLxFz54
	ivZ9FicCeysLZ6kaJPbNVLQQw0ydnl7O1S0goumsO6Z3ig==
X-Google-Smtp-Source: AGHT+IHf2fdYtDx1rwtIPEdB0BycampUt/lo8/MCwVi4A8/NjisEkxdV8VZFFWTSSBwN37r6fxWJqA==
X-Received: by 2002:a5d:5f94:0:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-385fd423b82mr2951236f8f.42.1733246522761;
        Tue, 03 Dec 2024 09:22:02 -0800 (PST)
Received: from tom-desktop.station (net-188-217-53-234.cust.vodafonedsl.it. [188.217.53.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ee2c7559sm7826658f8f.12.2024.12.03.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:22:02 -0800 (PST)
From: tomm.merciai@gmail.com
X-Google-Original-From: tommaso.merciai.xr@bp.renesas.com
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Date: Tue,  3 Dec 2024 18:21:29 +0100
Message-Id: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Introduce it6263_is_input_bus_fmt_valid() and refactor the
it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
format by selecting the LVDS input format based on the LVDS data mapping
and thereby support both JEIDA and VESA input formats.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..83d1db29157a 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -48,6 +48,7 @@
 #define  REG_COL_DEP			GENMASK(1, 0)
 #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
 #define  OUT_MAP			BIT(4)
+#define  VESA				BIT(4)
 #define  JEIDA				0
 #define  REG_DESSC_ENB			BIT(6)
 #define  DMODE				BIT(7)
@@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
 	fsleep(10000);
 }
 
+static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
+{
+	switch (input_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		return true;
+	}
+	return false;
+}
+
 static inline void it6263_lvds_set_interface(struct it6263 *it)
 {
+	u8 fmt;
+
 	/* color depth */
 	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+
+	if (it->lvds_data_mapping == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
+		fmt = VESA;
+	else
+		fmt = JEIDA;
+
 	/* output mapping */
-	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, fmt);
 
 	if (it->lvds_dual_link) {
 		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
@@ -714,14 +733,14 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 
 	*num_input_fmts = 0;
 
-	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
+	if (!it6263_is_input_bus_fmt_valid(it->lvds_data_mapping))
 		return NULL;
 
 	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
 
-	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	input_fmts[0] = it->lvds_data_mapping;
 	*num_input_fmts = 1;
 
 	return input_fmts;
-- 
2.34.1


