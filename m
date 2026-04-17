Return-Path: <linux-renesas-soc+bounces-31365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKCSCABn4mmT5gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 18:59:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFD41D634
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 18:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DF6430B1C26
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 16:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1E12628D;
	Fri, 17 Apr 2026 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuDxMdYV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DAD3451A7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776444907; cv=none; b=BBbSrsrYEakqQA9r+47tllalVPCSfjR4Qs0wJGli+/f832GHg/5/hJEOdgcPY4PyTUeeoAZtURzpivEhnLWfYwaYKJ+91SgEbFwdR5hWF+0ZW0+IKjWhRoY3LpQI0G9Fn0ctSKmKya9TKUIeX9HWK2d1lsiCO01VDfmozXz/AeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776444907; c=relaxed/simple;
	bh=BHigvg6b/xqk90nvVeVuWyZzDRDWyUo7hgBVk2dW4Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7rAlk/9KD6kb5Y/mWOkDSwFiKz5q6wK0mqdJ9crQc4BZlLRIjqpzstX/YnIuLTWRHQq0x54hLaVWQ4Q1CrLE/CBPBH00OYedXS4dFS+aoswM+ugr6SQbhNc82uGdA8slc8AI52f4mCJvtjO90IN2z73MX7ldaeYdyuboidWUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuDxMdYV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso11676595e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776444903; x=1777049703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3d2BGP9irgdfdO8KFh82k9rWglwq3WmMsGPehw78ns=;
        b=VuDxMdYVtZzBo/67l4lB8eWF/i5WlFCHARvM86p8NQKDlqHcb2mSt6rWhhvJW6+s39
         Ku4FLGv7BMt0QYU4S84DNmXk/kNP8SELMteLhBVElnCElM81Fzyww8yfU6cLhH66zDWr
         uXF9I+Y9D0ccZVcw044d73XZ+268+Y3r8yUnZcu8du38LA5e+VzjIFgoNkRH59z9Nn0/
         /EWS303kX7gq4GUndmg3XJ+iH2g8+xt9pMQNGruxyCiuE6qk0+0q4mmhAuUmbGU6pvb5
         Ng3hPjSvq/occ1rfkL+MSnl2Lm5r2bl23LdfFoFGMpNpjNpmHD3ed4duuk5P+Nh/XU0I
         PMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776444903; x=1777049703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3d2BGP9irgdfdO8KFh82k9rWglwq3WmMsGPehw78ns=;
        b=rX7Ebgt7xivL793C1/rKf7C1p/6hz8EJPRJk1AAvaZXJyKTS87+6uQVVUMthEJiCt5
         4qQ9OVs6yOiOWThBjtokmsRHCMLg/W9tZcmWEi9AQNjD76HvrRNaCSb3EuvnHvCUawRT
         wHKQelo/zzvfuWw7fbO8av9J/zzvBWZ1g/tIKrfMBLlZKdDHyJU2osRWaiQi/4rTIBzm
         HG95ARSsU0y9P26APJmM7LPQgdNAJTaB4ILJlIbayB0qJ60gRzBqOs9358acT4HcTq11
         RSAAyQHLJt0SZormjibj+6WrDrvKIhgoj94YN31ReKLe7N0I+lsR3obsf0WkT0yFj1mk
         GdkA==
X-Forwarded-Encrypted: i=1; AFNElJ85YaRFFIVXmoYmTxUXKAKcU7+p96eg1TB0bEvhWpQaWXPWEmMKMwV+hm+6V3NiXVU8g+m+iZrAt+p2M2YhTOFYFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb29LLLuW5jO/GdjuhtelNoDjhy9D9q1GoSWESjaZRC3rKV3Gu
	wq/os5QIdTnhOqXS75Zkztcig6XphRiMJA/rC8n6b56Om2Ja17lBMNgNEmz1pw==
X-Gm-Gg: AeBDiev00/O6KYgc8F2Q+3D6c6fNEuV2qdGXUarK9NEkHHOdxxrX595aWM22xBNARHk
	6ceRxb0mLm2DHiSWL4/CxRj1pfrfhWbmiSOTgeAef6QNCX08zA5U4uf9YUsQl2ZSfm4PsW2Qyxr
	JjKPvE2RLyjpG1/hwge/3HY2oaF+9gTvT8JUgWDCXCsuEkbo9oV1TeZJaCcf6JmmPPDhhcz1HUJ
	q2avpRod4I6q1BdDTbg8ds2s+P7irLIoBjhG5MwqU8Jq8+N6D4rOcexqW+CIxBs9j7maY62OvOB
	HHD8zt+8FgePN2nnAzlsmXDjBg2YFmNdf8hn5oaEtX8xeXzatHmR3yYOh9/t3NFkmsSOpSLLjX8
	fqFLEHLz+xmtnpQPvSP+PA2z4GXoVDOjIYm1d5+RWyTnq4apn2YVjC9mpxqLbz0YbaHwvf7g96i
	le+WH8VHHoZ/zo2QXtOwRTtcIj52tTlmjbN5UXtRE7
X-Received: by 2002:a05:600c:31a9:b0:489:95:3dd2 with SMTP id 5b1f17b1804b1-48900953e9bmr183645e9.8.1776444903017;
        Fri, 17 Apr 2026 09:55:03 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:528c:590:5bef:9bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc189f2esm95735645e9.7.2026.04.17.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:55:02 -0700 (PDT)
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
Subject: [PATCH v3] drm/bridge: ite-it6263: Support power cycle in runtime
Date: Fri, 17 Apr 2026 17:54:58 +0100
Message-ID: <20260417165501.213681-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31365-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71AFD41D634
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

On the RZ/G3L SMARC EVK using PSCI, suspend to RAM powers down the ITE
IT6263 chip. The display controller driver's system PM callbacks invoke
drm_mode_config_helper_{suspend,resume}, which in turn call the bridge's
atomic_{disable,enable} callbacks can handle suspend/resume for the
bridge without dedicated PM ops.

Switch from devm_regulator_bulk_get_enable() to devm_regulator_bulk_get()
so that regulators can be explicitly enabled and disabled across power
cycles. Move reset_gpio and regulator state into the it6263 struct so they
are accessible beyond probe time.

Move it6263_supplies[] to the top of the file, before the it6263 struct
definition, as it is now referenced by ARRAY_SIZE() within the struct.

Add reset, I2C address configuration, and LVDS/HDMI initialisation to the
atomic_enable callback so that the hardware is fully reinitialised after
each power cycle. Correspondingly, remove these steps from probe, since
they are no longer needed there.

Add regulator_bulk_disable() to the atomic_disable callback to power down
the supplies on bridge disable, completing the power cycle support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Tested s2idle, s2ram and hotplug on Renesas RZ/G3L SMARC EVK platform.
v2->v3:
 * Updated commit header and description.
 * Moved it6263_supplies above struct it6263.
 * Replaced *supplies with supplies[] in struct it6263 and removed the
   num_supplies variable from struct it6263, as ARRAY_SIZE already
   provides this information.
 * Dropped it6263_bridge_{init,uninit}().
 * Added reset, I2C address configuration, and LVDS/HDMI initialisation to
   the atomic_enable callback so that the hardware is fully reinitialised
   after each power cycle. Correspondingly, remove these steps from probe,
   since they are no longer needed there.
 * Dropped the remove callback as it is not needed.
 * Dropped the variable powered from struct it6263.
v1->v2:
 * Dropped system PM callbacks instead using bridge's
   atomic_{disable,enable} callbacks to handle suspend/resume.
---
 drivers/gpu/drm/bridge/ite-it6263.c | 49 +++++++++++++++++------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 4f3ebb7af4d4..10bf4cc89eb6 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -192,6 +192,11 @@
  */
 #define MAX_HDMI_TMDS_CHAR_RATE_HZ	225000000
 
+static const char * const it6263_supplies[] = {
+	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
+	"avcc", "anvdd", "apvdd"
+};
+
 struct it6263 {
 	struct device *dev;
 	struct i2c_client *hdmi_i2c;
@@ -200,6 +205,8 @@ struct it6263 {
 	struct regmap *lvds_regmap;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(it6263_supplies)];
 	int lvds_data_mapping;
 	bool lvds_dual_link;
 	bool lvds_link12_swap;
@@ -344,11 +351,6 @@ static const struct regmap_config it6263_lvds_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
-static const char * const it6263_supplies[] = {
-	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
-	"avcc", "anvdd", "apvdd"
-};
-
 static int it6263_parse_dt(struct it6263 *it)
 {
 	struct device *dev = it->dev;
@@ -587,6 +589,8 @@ static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
 	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
 	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
 		     AFE_DRV_RST | AFE_DRV_PWD);
+
+	regulator_bulk_disable(ARRAY_SIZE(it->supplies), it->supplies);
 }
 
 static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -603,6 +607,19 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
 	bool pclk_high;
 	int i, ret;
 
+	ret = regulator_bulk_enable(ARRAY_SIZE(it->supplies), it->supplies);
+	if (ret)
+		dev_err(it->dev, "failed to enable power supplies\n");
+
+	it6263_hw_reset(it->reset_gpio);
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret)
+		dev_err(it->dev, "failed to set I2C addr\n");
+
+	it6263_lvds_config(it);
+	it6263_hdmi_config(it);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
@@ -840,7 +857,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 static int it6263_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct gpio_desc *reset_gpio;
 	struct it6263 *it;
 	int ret;
 
@@ -858,13 +874,15 @@ static int it6263_probe(struct i2c_client *client)
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
+	for (unsigned int i = 0; i < ARRAY_SIZE(it->supplies); i++)
+		it->supplies[i].supply = it6263_supplies[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(it->supplies), it->supplies);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get power supplies\n");
 
@@ -872,12 +890,6 @@ static int it6263_probe(struct i2c_client *client)
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
@@ -890,9 +902,6 @@ static int it6263_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
 				     "failed to init I2C regmap for LVDS\n");
 
-	it6263_lvds_config(it);
-	it6263_hdmi_config(it);
-
 	i2c_set_clientdata(client, it);
 
 	it->bridge.of_node = dev->of_node;
-- 
2.43.0


