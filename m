Return-Path: <linux-renesas-soc+bounces-31857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPuXKDlE9GklAAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 08:12:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D194AA976
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 08:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F3B1301014C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 06:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72CF34FF5A;
	Fri,  1 May 2026 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXxovj+H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB61296BD3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 06:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615926; cv=none; b=MXKXacwueY8gCd4IpVzNt6/liJYz618RP+eaLtxCnWztXdW+XSVZC9a08IvgEOnXAEaDFEAfWceNYio1gWt9XDU2qlncU1xOwudSHij24Yn4x4eQ6UrXv+tC+8idmHGGwu9rsMpeWLsChk/r2vCiHVYZ1Edo3omGqkceH6eHNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615926; c=relaxed/simple;
	bh=EE8VLU8ShHoR1jKo2OOzjWof3QngohDcFNVHVdy9Dr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GbAbYqTF1SSvElxhZw4PlYmUaaaIa8qy4NicIZCEBn6SPxNiR+naMwNWU3Lgajr/TKPo8x5pu/t1opDVhHDQD/7/OTusqS2dmk5xp+lVQBfNZIUYsyy/GDXGpqH4HahBue/Zk7Udek0sZKcbU5e82vLPUh/pd2py0bxeqNimPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXxovj+H; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44a74032ff8so296346f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777615924; x=1778220724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4g2jwDnU6jYGeU1BTs0Zin0/2ggkSyypEmuOjuJt9s=;
        b=bXxovj+HF3XpRYh4HwaenUoNchOcGBbaDqHn7zAHXxKySgX8FjlpZH9RljJ7C4VX7m
         WGVr9R60TAdJ7/xBQW0DkhIwd0IyZWVVnNDDxp9CLKIkiDIZJKsXlMqUZq2ALZCHJsyG
         6I3TMv44mLCFWmf5Ll0JONMCCT8IbtupNNFxSb5ru++HIJAm6kg8Ae61VJwxJxArMJn8
         h50YpsGCQQ/7ZiQBfYK0IVmKjGzEoxuV4XvqXxzG+EYPLrlL7RGzGZW7lL1FSMpeh8Ls
         Q1iqyuWgVAjOXxLlTVKfJripoqANsfNLTFK43Np6nrxXlJE4Km9kUDtoe4S0MIvUlh76
         q+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777615924; x=1778220724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4g2jwDnU6jYGeU1BTs0Zin0/2ggkSyypEmuOjuJt9s=;
        b=U3E47r3izYS2pr4reKozgirig0mnA1qSlUlCtaTBEZg7DlZbsH37A9kCvMY5a1yz9m
         qvyxM46Lo6fwq7MzbYiqXBhzzLTzOhOx4I3dDmPZolZhOnNkObZzOs4K3jKedHsmXuYB
         VpalNdEFUpvLWXsBGbTTf0pOyNRk90UO34x8NiWKjwsUJp1zN7SmzMRJoPll99pFb8n7
         UIOXL7N+ysAghIEIkhS+ZHIHS6zZGVtlWpiCjU+6BzlPAU6VEV4yK1ue6OcOz4x4QNRa
         1qt2PUd3bwzahUlRpsMajhXQCpLhL738zF3/bEW28jgR1u/7F9NuxnBNN1p5mT2wg1OJ
         +rnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/toAxcjwIhjiD1p3hDNywehk+xlcCb822OeW0ldfItxOuQOmvdvs5PG4B+oNb89DOHQqtTxkYlvfKwST/M2qRm0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HSO/OBd3kYgtzJ48z5Fh1RqfqZ2pPxD5c1zONcz3fm1y8GAH
	75DllohYna1dfSTKQHHbmD8H+QzpT6O9xRyj2GNWUS70jQLD5yx/Gtqjku14/g==
X-Gm-Gg: AeBDiet7czrIB2/DKfiDfohyVEtbDPOUH1wLQc3LCX8ni8Oh2r8fZC/PfCFS+nL+BsL
	eB9fJqSOXqQxaZrqPQSBI6TzsZOnDyaYCtdlW3C1IlCI/c1IXtyFyCRpQ2UwIgXDqGW7yjSBREU
	e3pHXJdjqMK7l3ZofPt9wOdehTiKBgAHJupHgG9c3U7bkjUY5Og3n39FQ2wwOgeN7zFhnOMexUu
	KqfJdBJoDKNQQfWcNoclRzKmz9DW9uUjMKWZOA3rStAzcrRrF7APOC7bawPpTQFPKcEX2w2rXXH
	8nLXCrTcF0QXVKIN/65+Qj6Pn5rhgRFElCfm3HjUuWrb16Y1BIxK9BfGIVw5g2E1sfXs3Cy9z9B
	UXgLZlbN1b5zJ24lIy5LrPahRC4WQPFplT8EAcGXDKTJ5phn7eo871iEhVP71IwzzYpSsnov6sF
	4jEJwmpxHctF5vuCeRN+z5xkJIrGOYBxoDkMInN3ABu33JLOJqMPbevSkz+t0=
X-Received: by 2002:a05:6000:1a8f:b0:441:202e:3d2d with SMTP id ffacd0b85a97d-4493d5fea69mr9958384f8f.19.1777615923505;
        Thu, 30 Apr 2026 23:12:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:11a0:4ba9:d261:6902])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7d035sm2796454f8f.5.2026.04.30.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 23:12:03 -0700 (PDT)
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
Subject: [PATCH v4] drm/bridge: ite-it6263: Move chip initialization code from probe to atomic_enable
Date: Fri,  1 May 2026 07:11:58 +0100
Message-ID: <20260501061200.20129-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5D194AA976
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31857-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

On the RZ/G3L SMARC EVK, suspend to RAM powers down the ITE IT6263 chip.
The display controller driver's system PM callbacks invoke
drm_mode_config_helper_{suspend,resume}, which in turn call the bridge's
atomic_{disable,enable} callbacks to handle suspend/resume for the bridge
without dedicated PM ops.

To support proper reinitialization after power loss, move reset_gpio into
the it6263 struct so it is accessible beyond probe time. Relocate
it6263_hw_reset(), it6263_lvds_set_i2c_addr(), it6263_lvds_config() and
it6263_hdmi_config() from probe to atomic_enable, ensuring the chip is
fully reset and reconfigured on every enable, including after a
suspend/resume cycle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Tested s2idle, s2ram and hotplug on Renesas RZ/G3L SMARC EVK platform.
v3->v4:
 * Updated commit header.
v2->v3:
 * Updated commit header and description.
 * Dropped it6263_bridge_{init,uninit}().
 * Restored regulator_bulk_enable in probe().
 * Dropped the variable powered, supplies and num_supplies from
   struct it6263.
 * Added reset, I2C address configuration, and LVDS/HDMI initialisation to
   the atomic_enable callback so that the hardware is fully reinitialised
   after each power cycle. Correspondingly, remove these steps from probe,
   since they are no longer needed there.
 * Dropped the remove callback as it is not needed.
v1->v2:
 * Dropped system PM callbacks instead using bridge's
   atomic_{disable,enable} callbacks to handle suspend/resume.
---
 drivers/gpu/drm/bridge/ite-it6263.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2ea49245e700..4a8268d0eac2 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -200,6 +200,7 @@ struct it6263 {
 	struct regmap *lvds_regmap;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct gpio_desc *reset_gpio;
 	int lvds_data_mapping;
 	bool lvds_dual_link;
 	bool lvds_link12_swap;
@@ -603,6 +604,15 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
 	bool pclk_high;
 	int i, ret;
 
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
@@ -838,7 +848,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 static int it6263_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct gpio_desc *reset_gpio;
 	struct it6263 *it;
 	int ret;
 
@@ -856,9 +865,9 @@ static int it6263_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
 				     "failed to init I2C regmap for HDMI\n");
 
-	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(it->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
 				     "failed to get reset gpio\n");
 
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
@@ -870,12 +879,6 @@ static int it6263_probe(struct i2c_client *client)
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
@@ -888,9 +891,6 @@ static int it6263_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
 				     "failed to init I2C regmap for LVDS\n");
 
-	it6263_lvds_config(it);
-	it6263_hdmi_config(it);
-
 	i2c_set_clientdata(client, it);
 
 	it->bridge.of_node = dev->of_node;
-- 
2.43.0


