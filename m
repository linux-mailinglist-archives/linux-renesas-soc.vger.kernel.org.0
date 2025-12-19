Return-Path: <linux-renesas-soc+bounces-25914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3DCCF729
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 11:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD9C830131CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 10:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDF41991CB;
	Fri, 19 Dec 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfCHFKPD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A8774BE1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141225; cv=none; b=POvjDpqmEAYWXNBgQor/IhZXdWRwzRYr81MpuWeU3dTMmmZ1ivQWYI8On/bNxZDRQjPtBAuF6PqcIihpKKErJyxqQi/tTXgunVOUOqbDEWayUcstp8F0W0IFaQXYqKnKNV7usyR+t4opmpdnMUz8W3cHPASGFVxXZ0H9UxqBimg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141225; c=relaxed/simple;
	bh=u/Z2j17DBr7IuXG72i7Uds2nTv8OCNRhbkhFXvxMv8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPsI/KdtwDt1dsHkOyKqtwkFqEBOopkAWJCGkVh4RwfaXERCFeYYcObvaCBn5A2x6Q4wPiKtB/TzM1YGaUw3+KLMOL+jaxNnzn4dOFg46Yq+T2CTeDc9ZVyuq+VATXzHMHigamNAatpnkJGaBQofzEx3AWi0RnTpO/5ygzNgd6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfCHFKPD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so2746612a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 02:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766141222; x=1766746022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZuP9fxqbC47wIOaRN1HrOQmWsV0+mnLZdGYsf33OB0=;
        b=KfCHFKPDVex0gg/tHs3yyKwXpIA9T+AyS2HCmEca91Hc4Jd6FeQdCvjsa6lVr4/vr2
         KZMJxnmgTF5hN6yEK9WDyuRTImXez3ZFRuUsNSPKmDU16mjQAPmGkVw2OB//12fuK0Ge
         U7ydX2yjw8e8k53mnVdWdKwqw8PbXZX3TRaVL5+WXLlujlRo5M9f9xmma5PVMNrzljjE
         ESIzmKS6UuRse/5B01IRquu2sNqXBKT3NVBt0T/9dx0fd4NwsE5hdb0Sl82xAld4M+nM
         wfbOIs1rpk08SRTcLpEE8cAATLGbhgaeadP308EM0oLOCFkLXvu6GP/Ie4UnY823NKGA
         RGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766141222; x=1766746022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZuP9fxqbC47wIOaRN1HrOQmWsV0+mnLZdGYsf33OB0=;
        b=m68+6TBMUFl9IX64pPTL6Oen2rHZcWPWtAjYFOmMJ5RBxI2mhTRNIQAk/g3t7S5y6j
         gSVGbeSejZIhwuq4/7nOXvY8l6V3s+2pZse8VP6rLq4BOfFrbXAMNppsR0PolEE5PFWc
         jmAsBQ8TMGp2dilpedlyjSCN8g7SHYf/A5oZgEDbQ4g+EZ4joL3EU28EIo6Afo9krobS
         KENGGZmdOgANg/NrbgCNOL7Ua1LdHETIHXCWd8LgD/aFUQkSF2amVis0kAdSjOmjwW6Y
         IifSncL+9tMTpbCdzLO8bXaPWO+LP8KRUhugZfL185yDW9mAUx2Ab+OKYZyfL5FgbmhQ
         vAdg==
X-Forwarded-Encrypted: i=1; AJvYcCUKsJXWsaJbtvEtEAlVwkPPe5Ymxw6RAu5Ntur56rCPv3C7CbyVvH4iR71u8dAjz/zdaNZzhzRJiKigifxtLprUiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJRzVwgh2lYrQYKNI8XP9YRVWPtUadV++/Hk1auE9+v/Hb+pb
	FN5BfyjOdqJ8KBNMEjD3wiLnf9UfDXolC8sEljHPaNWk1tb0NPTY1EM8
X-Gm-Gg: AY/fxX4rayD6V1TQQ8JIIACYMVJ4qnEwCuwhl94kZP8m68BZnTJpWEosBKIHszJRF2U
	/WyCutDSn9OWK1GCAYWbngFYHZRgjLElte8BEqD858HobC/5GQl1R6ArAaUx237gIe020tDXgIv
	pbCHAXNBAGda4MRhhcB9TQMO5u7Vze4W1AEARftwAao7THZheff0gRIQTTFkXO40jVuSI3SLfUn
	HWY+P61Az90NSQKXmXl3O1JDlNT7/dXZmAup5ZJwtbBOfTOr974whdORwGHJK+tlZ0jzn3RDwmC
	vCFM/MO600W1U8YCeHM1f4GnGGsT6G1neo5GAt94f3LJK7HTjSMZLmZWMwTQiXb6O0J+7mgnkgW
	lWLW6xiGxAm8w0wgvtOGBxFqkK0V37eqcBsL3AUdqxPrZUtgmCAvXl0VD9u/aMcbhCyvmeqJ/sg
	amGCirtpWqyhhiNLAjxuncbhhOTGd9WEu1zCvW3RapZyDV
X-Google-Smtp-Source: AGHT+IHwuwvzqHzv3YMY8ZAQIYTi19GvZ1+m5b+3UDEb7/afa4beA//voJQ0rhzXT+DjKoSFreo3oQ==
X-Received: by 2002:a05:6402:34c5:b0:649:230e:ec52 with SMTP id 4fb4d7f45d1cf-64b8e935a65mr1838951a12.1.1766141222122;
        Fri, 19 Dec 2025 02:47:02 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bb1:f7ee:1376:35e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b910601c7sm1900781a12.14.2025.12.19.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:47:01 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jesse Van Gavere <jesseevg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on device during resume()
Date: Fri, 19 Dec 2025 10:46:53 +0000
Message-ID: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing ADV7535
IRQ configured as edge-triggered interrupt on RZ/G3E SMARC EVK shows that
it is missing HPD IRQ during system resume, as the status change occurs
before the IRQ/pincontrol resume. Once the status bit is set, there won't
be any further IRQ unless the status bit is cleared.

Clear any pending HPD IRQs before powering on the ADV7535 device to
deliver HPD interrupts after resume().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 32 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 8be7266fd4f4..03aa23836ca4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -393,6 +393,7 @@ struct adv7511 {
 	bool cec_enabled_adap;
 	struct clk *cec_clk;
 	u32 cec_clk_freq;
+	bool suspended;
 };
 
 static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be86541307..8d9467187d7c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -790,6 +790,25 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 
+	if (adv->i2c_main->irq && adv->suspended) {
+		unsigned int irq;
+
+		/*
+		 * If ADV7511 IRQ is configured as edge triggered interrupt, it
+		 * will miss the IRQ during system resume as the status change
+		 * occurs before IRQ/pincontrol resume. Once the status bit is
+		 * set there won't be any further IRQ unless the status bit is
+		 * cleared. So, clear the IRQ status bit for further delivery
+		 * of HPD IRQ.
+		 */
+		regmap_read(adv->regmap, ADV7511_REG_INT(0), &irq);
+		if (irq & ADV7511_INT0_HPD)
+			regmap_write(adv->regmap, ADV7511_REG_INT(0),
+				     ADV7511_INT0_HPD);
+
+		adv->suspended = false;
+	}
+
 	adv7511_power_on(adv);
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
@@ -1407,6 +1426,16 @@ static void adv7511_remove(struct i2c_client *i2c)
 	i2c_unregister_device(adv7511->i2c_edid);
 }
 
+static int adv7511_suspend(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
+
+	adv7511->suspended = true;
+
+	return 0;
+}
+
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
 	.name = "ADV7511",
@@ -1439,6 +1468,8 @@ static const struct adv7511_chip_info adv7535_chip_info = {
 	.hpd_override_enable = true,
 };
 
+static DEFINE_SIMPLE_DEV_PM_OPS(adv7511_pm_ops, adv7511_suspend, NULL);
+
 static const struct i2c_device_id adv7511_i2c_ids[] = {
 	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
 	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
@@ -1467,6 +1498,7 @@ static struct i2c_driver adv7511_driver = {
 	.driver = {
 		.name = "adv7511",
 		.of_match_table = adv7511_of_ids,
+		.pm = pm_sleep_ptr(&adv7511_pm_ops),
 	},
 	.id_table = adv7511_i2c_ids,
 	.probe = adv7511_probe,
-- 
2.43.0


