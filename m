Return-Path: <linux-renesas-soc+bounces-10935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E989E4F2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 09:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B2B2856CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 08:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6956A1CF7B8;
	Thu,  5 Dec 2024 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgRMFmRm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AAD1CEEB4;
	Thu,  5 Dec 2024 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385770; cv=none; b=CBDoPlbMBV6wbj/KHnaDlTSDfxnFEqGDAPS2bWhwFk6QO4QsC7OPjE1y42Wy//Do45FhfPRCxJ/bgACE1LoFYs+lTJ2e9glDfSuyiGjCeVAwueDzAsMnpdR+7hjGwzeAiJ1uoKzkLBTgLYTv5VEr6eoonbgi8S86cqSVP8vVszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385770; c=relaxed/simple;
	bh=DcmPtCHdaiYgYTo7ALXMKlBmcv717TQc+18nf9VkoLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=krtvGZfJNAKLPa5IQhxtOUNZBoHjVV4Ys917F1Y+DWn3Thstb3ps0Ho5VJxCRQxROWw08H9NyHgy/K+UUN7Wmdkg+zZiidMhuKR28fjZyvXZ34Z/hyJRbwNmObnIvYs8em7IZhwIVzQSSFNRVPoTQYSfX3vM1uITP40f9Hn0z+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgRMFmRm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a10588f3so3756695e9.1;
        Thu, 05 Dec 2024 00:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733385766; x=1733990566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2poFn90IvIGBtzG2EWAUZGpuEmS5DRhKZhsmpRGoplA=;
        b=PgRMFmRm2SsntQrqto7hB2XGjQW/A3ZJDLskk/LpPsgb5mw8/MH+LURJFctEcZbqia
         ceMPto1UYcYBmYN14NrpxocWnVhom/iqDiNdL6STPmvf26jIc0ZXoIYhMC2iyFLWMazF
         q2MIIk8HhIKnEWZ7ueSKszfCDbofFv4yGYJqMQPbmAA6idOSUAXv8gVqrCNH16Ii0zv0
         3RrEfQlmOdmJBMVvP0wg9AwPK196KUqQQ+TRtTwto9L/SbI4NkCiitiqibU9CD8oqbSp
         8Lg+J9weLfvSNetjk1v9Tru1JIUEC9r14Lj1J3DwbVF6P37ZPzymi172adI1aYGUTx4z
         TpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385766; x=1733990566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2poFn90IvIGBtzG2EWAUZGpuEmS5DRhKZhsmpRGoplA=;
        b=XE51qgyv9NY0sHWrqtrmUV+iVBiICsENysOKtCtv13fGXx28Y9vl1JGszNv6McAFYT
         k6RiNrLIKA/4kPN4LmzP//3g9gDRLAbhL5JU8iY1L+PqXwGmuryuf6I58bs5fe9unuXz
         xKlxNayU/C9s2Xws5NhX09N7BEraVIqAPG0kX67nVkgGBrrYNFMp/eSnsZ0eCBTYqZ/d
         h4ZKNpvvMloQEDRkbkTiGu1w42KvF8v8oHDGe3spglDI2FOtIacbgP3uamrKhRpBWMRm
         98p+uKo0YH2lPJEFWkwUQkY1LEMQNtQRryEgCPj+zbypnGBGjBF3dUfOQeNQWzPvWZkA
         6soA==
X-Forwarded-Encrypted: i=1; AJvYcCXO26+dvFcVMMw50Ii8YERNvvSIfeHYMRuRXgC5tZx7xMdhnOmKT6K6oIG8D+dhEqGwmqHeNG/U+b9q7t8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpvo4yxaXv4duj23xV3REUBgCS/EkUNAGxttRNUM3S+/Q5ZXdJ
	AsAQ50LwjJMu8Ssf8U3N9WdamWpQG4OiM/AII2+k5JyMP6L8i/c3
X-Gm-Gg: ASbGnctwzrW/CSVTIE3yLwcsQMwfQ0B0UXZQeBu8RJ300R2K1KBjf9HShovYjdr+DoS
	v1F2wtJRBxGBazxhrR4cdSQoSW96AH20rNDjKrQC0Ia6Ugpvh9QBROGv7ivd2ICf5v+J3tC/Ld0
	62VZTyus5uiXNkn4gPA8la1DuvsB/zoxWPeerYWqY9AxP9V5KQ0pOUtUWxWRrjYA2sqXv6RnX9N
	/v1yHduQax+xnZpwUYwuRzc8MB8lcomtY6A9ctnSw5aot46chmHFcsZqfXvpLv8PnSlmR1jj5cu
	FuFkAN6UnxBpydiFzclia8LNqgELC9Vd+lLbhTCSyAXE+g==
X-Google-Smtp-Source: AGHT+IEpIcsbkEUIxoJSGurHGX79hiCXl10cyrZAo8yPKXdRyxTQFUbRSJ2mng7AM2ZpzwvZtyJ6KQ==
X-Received: by 2002:a05:600c:358e:b0:431:5187:28dd with SMTP id 5b1f17b1804b1-434d3fe3393mr48299055e9.28.1733385766264;
        Thu, 05 Dec 2024 00:02:46 -0800 (PST)
Received: from tom-desktop.station (net-188-217-53-234.cust.vodafonedsl.it. [188.217.53.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527395csm51843075e9.17.2024.12.05.00.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 00:02:45 -0800 (PST)
From: tomm.merciai@gmail.com
X-Google-Original-From: tommaso.merciai.xr@bp.renesas.com
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Subject: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Date: Thu,  5 Dec 2024 09:02:10 +0100
Message-Id: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
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
it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
format by selecting the LVDS input format based on the LVDS data mapping
and thereby support both JEIDA-24 and VESA-24 input formats.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Inline it6263_is_input_bus_fmt_valid() as suggested by LYing
 - Fixed it6263_is_input_bus_fmt_valid() param from u32 to int as suggested by LYing
 - Fixed commit msg as suggested by LYing
 - Fixed commit body as suggested by LYing
 - Collected DBaryshkov tag

 drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..3fc5c6795487 100644
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
 
+static inline bool it6263_is_input_bus_fmt_valid(int input_fmt)
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


