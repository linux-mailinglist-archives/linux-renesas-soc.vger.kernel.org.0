Return-Path: <linux-renesas-soc+bounces-31318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLGDNfSd4GlhkQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 10:29:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B340B8D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 10:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F854300E1BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B82391517;
	Thu, 16 Apr 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHZWdLuI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079238F656
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328174; cv=none; b=UNMVPazgFD0mFV8OzF9hc5Ry/A1rWojhSffoKhBGprqfPbeYcCwJJmrZbnCtkc+Rimx0EdcEtBKs2B987whIuQmD3/mE3flWEHNS5P++VGDsm+vTZL7IEzNdtkI5FGhtxou5w2CTBIGUXc0QIdonfkeldFM9nuuZikq6kSY5Nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328174; c=relaxed/simple;
	bh=iWDbdaRjeQipAEFM/Boy5viigqE6jeEkGju2KVnnxAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvfgGdfAxS+A/NbH0ZP2Hge+3wG/zpvahoOCm++n4YEz8AelZX+/oKqeFzGBxIkPyK5UVz6l+382rg6LztAKzCfJRRi575zO/6b8KM7dv8+a5nBU8Qj2HvG5RGj8wGjPIJ4IbwLgEkbJlqWfTeNhb4y6ipKgJv8RnE7gcSlNJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHZWdLuI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso71561335e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776328172; x=1776932972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxfxNFJlvGuF2Od+yfnihIdQvBKtTrOm36dg4RbUpAM=;
        b=iHZWdLuI1YAIWSNsOLoJ9b9PPoRXksquynxo8uAOFsAmBqpyQrHzgurU3Hq44XLgNL
         ZYeQwYwV260Sd77rngxtZ1flEbyZHzHSrnRrCYiBhYCxyc5QnxUP90piI+WG+MqJbBRE
         HnX0YH84THhm1DbjiLyfjEhl1NT7CKL+B8DWoKGdhKY/W9leG/beIxVaOF5LKqDYgmV8
         WhNSa1GSh3wpRKLFsNQ/AsewWWXD/4mTnOAf3TZJWnj59RnREZ6EBiW8BHjHf89mHSxA
         CV+rqrfGUl5fewRMvDDy8EpiJM+z8M3Pk2SyzgiUoyKZaTf8ylFFMA3HWWhAot8Z3it/
         FGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328172; x=1776932972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxfxNFJlvGuF2Od+yfnihIdQvBKtTrOm36dg4RbUpAM=;
        b=tBGk7z+PVBra+9fVyan4Ch7l1o+f7+H5U05+g03QlCVAklyuYcjH1jepZ9qkEbtwUT
         Lztc5CrWxcicET/hRiOijJ4VO9zsvJLrUhTqY7tsS3WmIVsDaBVDlsyqU8X/LvhKfFno
         eS4zQUvdeT+GpEAgz70PtQNkGB1ON0nmwIEoUkhiBREdFotA0/9aZxblhAWxR/f2FARu
         pVaOELo4vRZRRvnzGgyGXc0IgcPQftZqAXXGXcaMMMR8yimxnMr7OTngHq+Yrd90pbci
         5quWcl5RAzfcWkJaV0OwUPOXvstDST+SNwMYo32dcv+QVyCKASCGagNXqJ9eoIyOmJDT
         3MqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fRdMBZV3BWBfl+Ez6iS6aUIQF7wVyZ2yBBstGyRcl8UCeU6gbBKt02hxUL9b1aHfoZmhZh3FmkDIITkQs5x91wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfapjGnYvCKIl73D1XlWy2HrnNhCmFmOl2dLLTZUVdATaAArzT
	NkbRSn8WEc0Jf4jOcH1SVkjhczniuwGG406s82zRvUNsClGEidYsGAGZuVR6JA==
X-Gm-Gg: AeBDiet/5etVrwInyV8/l3slAQjD+AUZuu8v+5M6SXVKLf/+5VIFhuHt+zhTzm1HUAh
	2fdjBV3jATq2v6AeWw36U0bOYi1URESWF3c04dthmMPLisj33Uz+jKrcSIm3FY6st2Y1YJHq2ji
	0L+Ge6MSe1GnKpFec0H9BALw+puyzYZlkISSqRCnZlvgUzlLNHKeRJa4i8VeE4bqvhccx5L4QPb
	Ih+X8NSAea9lTGtQuv19evS6f654ByrMhCOmOn2pFQ5sI4j4R10UxOguIKBdX37hkyjoo6E0exB
	9v+Pfc9ipeMESJzaG6qwsAEj2hf5J7yBHEmrtuFOVWTJuPzxiu5PBWBf/XX9y5qhnbGFOj9/RWS
	YGx/4rsLkWUSZ6wHCcO2MgrZfU+apwi5BjlAU7Mr6GlOj5nlPAx5VkNCLlVMQm28D27TyzxG+SK
	mHxiZkn6rzCzAeBW1q9Lbt8agFRRj+mBv7Hu/UkptxQWC9T+CVHGiRNKsxEg==
X-Received: by 2002:a05:600c:a404:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488d67b8d97mr295243195e9.2.1776328171424;
        Thu, 16 Apr 2026 01:29:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:b39:3660:ce8b:3f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f582048bsm34597475e9.7.2026.04.16.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:29:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Date: Thu, 16 Apr 2026 09:29:25 +0100
Message-ID: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31318-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN_FAIL(0.00)[4.211.64.104.asn.rspamd.com:server fail];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 361B340B8D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

On the RZ/G3L SMARC EVK using PSCI, suspend to RAM powers down the ITE
IT6263 chip. The display controller driver's system PM callbacks invoke
drm_mode_config_helper_{suspend,resume}, which in turn call the bridge's
atomic_{disable,enable} callbacks can handle suspend/resume for the
bridge without dedicated PM ops.

Introduce it6263_bridge_init() and it6263_bridge_uninit() helpers to
consolidate power sequencing, hardware reset, I2C address setup, and
LVDS/HDMI configuration. These replace the open-coded init sequence in
probe() and are hooked into atomic_enable/atomic_disable respectively,
guarded by a powered flag to avoid redundant re-initialisation.

Switch from devm_regulator_bulk_get_enable() to devm_regulator_bulk_get()
so that regulators can be explicitly enabled and disabled across power
cycles. Move reset_gpio and regulator state into the it6263 struct so they
are accessible beyond probe time.

Add a remove() callback to cleanly power down the bridge on driver unbind
via it6263_bridge_uninit().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped system PM callbacks instead using bridge's
   atomic_{disable,enable} callbacks to handle suspend/resume.
---
 drivers/gpu/drm/bridge/ite-it6263.c | 88 ++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 4f3ebb7af4d4..1954bb11f7f4 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -200,9 +200,13 @@ struct it6263 {
 	struct regmap *lvds_regmap;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+	unsigned int num_supplies;
 	int lvds_data_mapping;
 	bool lvds_dual_link;
 	bool lvds_link12_swap;
+	bool powered;
 };
 
 static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
@@ -578,6 +582,41 @@ static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
 	return 0;
 }
 
+static int it6263_bridge_init(struct it6263 *it)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(it->num_supplies, it->supplies);
+	if (ret) {
+		dev_err(it->dev, "failed to enable power supplies\n");
+		return ret;
+	}
+
+	it6263_hw_reset(it->reset_gpio);
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret) {
+		dev_err(it->dev, "failed to set I2C addr\n");
+		regulator_bulk_disable(it->num_supplies, it->supplies);
+		return ret;
+	}
+
+	it6263_lvds_config(it);
+	it6263_hdmi_config(it);
+
+	it->powered = true;
+
+	return 0;
+}
+
+static int it6263_bridge_uninit(struct it6263 *it)
+{
+	regulator_bulk_disable(it->num_supplies, it->supplies);
+	it->powered = false;
+
+	return 0;
+}
+
 static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
@@ -587,6 +626,8 @@ static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
 	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
 	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
 		     AFE_DRV_RST | AFE_DRV_PWD);
+
+	it6263_bridge_uninit(it);
 }
 
 static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -603,6 +644,9 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
 	bool pclk_high;
 	int i, ret;
 
+	if (!it->powered)
+		it6263_bridge_init(it);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
@@ -840,7 +884,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 static int it6263_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct gpio_desc *reset_gpio;
 	struct it6263 *it;
 	int ret;
 
@@ -858,13 +901,21 @@ static int it6263_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
 				     "failed to init I2C regmap for HDMI\n");
 
-	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(it->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
 				     "failed to get reset gpio\n");
 
-	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
-					     it6263_supplies);
+	it->num_supplies = ARRAY_SIZE(it6263_supplies);
+	it->supplies = devm_kcalloc(dev, it->num_supplies,
+				    sizeof(*it->supplies), GFP_KERNEL);
+	if (!it->supplies)
+		return -ENOMEM;
+
+	for (unsigned int i = 0; i < it->num_supplies; i++)
+		it->supplies[i].supply = it6263_supplies[i];
+
+	ret = devm_regulator_bulk_get(dev, it->num_supplies, it->supplies);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get power supplies\n");
 
@@ -872,12 +923,6 @@ static int it6263_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	it6263_hw_reset(reset_gpio);
-
-	ret = it6263_lvds_set_i2c_addr(it);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
-
 	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
 						 LVDS_INPUT_CTRL_I2C_ADDR);
 	if (IS_ERR(it->lvds_i2c))
@@ -890,8 +935,9 @@ static int it6263_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
 				     "failed to init I2C regmap for LVDS\n");
 
-	it6263_lvds_config(it);
-	it6263_hdmi_config(it);
+	ret = it6263_bridge_init(it);
+	if (ret)
+		return ret;
 
 	i2c_set_clientdata(client, it);
 
@@ -903,7 +949,18 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
 
-	return devm_drm_bridge_add(dev, &it->bridge);
+	ret = devm_drm_bridge_add(dev, &it->bridge);
+	if (ret)
+		it6263_bridge_uninit(it);
+
+	return ret;
+}
+
+static void it6263_remove(struct i2c_client *i2c)
+{
+	struct it6263 *it = i2c_get_clientdata(i2c);
+
+	it6263_bridge_uninit(it);
 }
 
 static const struct of_device_id it6263_of_match[] = {
@@ -920,6 +977,7 @@ MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
 
 static struct i2c_driver it6263_driver = {
 	.probe = it6263_probe,
+	.remove = it6263_remove,
 	.driver = {
 		.name = "it6263",
 		.of_match_table = it6263_of_match,
-- 
2.43.0


