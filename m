Return-Path: <linux-renesas-soc+bounces-14396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35DA620B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 23:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A79B8460707
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 22:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE801917E4;
	Fri, 14 Mar 2025 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H7s7nSuD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41C1547E2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 22:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741992138; cv=none; b=pdqUP4XGuFRJYZhY4pAWEDuYYCul1tuYDpi8DHByZ/RyYtzeRFnLhsvjfuUlxQAnvYlCfkxJnll6ZraAKY4in3qwxZA0knkFl6JkwB/lAMdt8Yfunmp/XyZuzzKViwxJ/6rGdT+tRwzrRyrafa3EaOzthz69ZaOpcUKzuOCrKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741992138; c=relaxed/simple;
	bh=kuCW4933/TqH1/Xf1JMrcEfdXWpcvUm+ubJXMZrNeZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0HkQvj5V4EinOTb2wE5RhWbSp3wtZ6xf8fC/ojn8Jy6hC0vfIcaeXsqIjkqN5K0oe0AEfAx8bSXJ6C5PNoNkuerYfiXf4na1je5hgu6S/zaRK78Nt4mveVcVJCavFarJES4BdEQxCwcRhCbtDNijnWfLmnFr9+HRsl/WUnsI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H7s7nSuD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=QqlpOM47T0J7hj
	rktmlQ8XwpoSBAcP6JW1h4M9FywSc=; b=H7s7nSuDp/1eUK1avAkm0y8etmb/oX
	39q+707zmi6Q4xLKfyvtSyGQPA/UBjCsvmB+S8lpp/VmAJ4QIrFLb4puXUsxbe3O
	6AZW3x710KbO50blfG3WqXNMK/DjeHWnVbuyc2i9D+DWmB5kP6al7RwiKhTQTKnG
	nohy/zJ3UvhSF9KcXcsYrle6c6yuDAwiOV6DX3qYUch5rscIeQGuAIduz49+rAD+
	eGmi+7biEFH3e7w9B/rzVJ14/mL0WugllECGfulbPxScjbrtYs2rt2nR7Cq0LIfs
	rkLPmjZzIAXVkNdI7+o0I7F2v/xbCAX0Wm/InOe9CQR8+UeHK1CIPhxw==
Received: (qmail 2190072 invoked from network); 14 Mar 2025 23:42:11 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Mar 2025 23:42:11 +0100
X-UD-Smtp-Session: l3s3148p1@HgAiJlUw/o0ujnuL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Phong Hoang <phong.hoang.wz@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Douglas Anderson <dianders@chromium.org>,
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
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection failure
Date: Fri, 14 Mar 2025 23:39:05 +0100
Message-ID: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Phong Hoang <phong.hoang.wz@renesas.com>

Add a check to the very first register access function when attaching a
bridge device, so we can bail out if I2C communication does not work.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only!

Changes since v1:

* rebased to v6.14-rc6
* add Laurent's tag (Thanks!)
* update patch description according to Tomi's suggestions (Thanks!)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1..59508e82a991 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 
 static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
 {
+	int ret;
 	int val;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
@@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
-	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
+	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
 	pm_runtime_put_autosuspend(dev);
+	if (ret)
+		return ret;
+
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-- 
2.47.2


