Return-Path: <linux-renesas-soc+bounces-31452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HLPKPRX52nz6gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 12:56:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B78439D12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 12:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E49E3021599
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 10:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C349D3B8D4B;
	Tue, 21 Apr 2026 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0e9WaKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821A34846D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768820; cv=none; b=ZNVMUT5CQTLo+Hbh6Q84QqrOB2PvlCIiVHHC+obNS01QjD4G5ACZPNDeRp5yLEGTN5ZDoFAO9XW8KfQh8IyjwTOaUNpQA2BG29ZP1GPVWP51bVvJ5Xu25udFAU8gpxqNV4HAklITMxh9BAXG65q0ig125O7CHrRqhTGKwl0vrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768820; c=relaxed/simple;
	bh=4arHkBK/QG1CKack3ghyB/MW0B/BiaIGWmuPw9wirKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Flnqr0VkqLstpayXWfUAJrqybc9Xb2l1eo3CFU7R5ABPfvJj/QCHtsxHRdf9FI/MIViOiNWKL3SVvP8EFATW4XVeNt5msELr2QifHwfDNI1xOTy31rHiYun7NCfwzdKNZMRyEdDwESGeJKm8k2cOa0us7jsHCDakEOWpEEWfzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0e9WaKO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso15618365e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776768818; x=1777373618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaPuNs+tJR3dOut9FEswGyzi6MZaKkaW/JljGXmpchI=;
        b=a0e9WaKOdiiZpRfLqLHqMkUSuob7NugBegoVQja/gH3nYRp4g75trXO7SYl2I5SirS
         fdDY3LA6iHavMfRFvf3pNJS5IZjA8jgPWFv7ArigTha4l8PbcPsHvTXY9gU22cRgCL1Y
         uY6OHNuEvrebRKvfqOIj7Q/Ad3tXv3UlWNHTThHyAMZGeaFnSlRYmTQ/QH5OsHxVB3dd
         XytNiBwR+T+xkuT/HRJZT0SPIGJx7FPkX8uj5YtXyfRl1Ow2kl6j+Q8KIIQ6vHatlVdK
         JtCRwIto40dFTOUyYVXYvShX1y79Rcwoi+xtovbpAfRON4QIapRl9fvb/UMgHY8/2cu8
         8JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768818; x=1777373618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaPuNs+tJR3dOut9FEswGyzi6MZaKkaW/JljGXmpchI=;
        b=QLV6FmAaYvRLm3bEMKUJFiPAzlFkZFKGXf1OHkaxSexrvhbHfcjx6bnZ2Osz5H6/u9
         tmzIHgfO2oAM/hlXAdTEszeG1XJZ1rrVSLqwaiRGJfV7pJsNbrAbs/S5iBVhmng6kuVp
         oXFqCuql1G1W1da560hFH9ANrENF/wu3AWipf8FglVaWAgutdqLikCErSSgsZ/BFLNgf
         pI+zkeQy76h698kRbuGesqSOwG/6m3zzeRrVmPD5RJW9IrG7xADrwwPV/mEIUP5KIJOR
         w7CttDpgx8M0lCn4AUhyWyXbwcRC1rKe6dThma4S2lUF6qilxPZekQD6CzsNPFbixMzm
         nDOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uE8q9CwkzsaTl5JcPps893UBhTSgpEqi9C0ytWOaPApbhKrTDe7oXYP1XFp84v+wLdT7jal+ta8MXbPnXhq72Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrR2vZYN4viP3zqqDOBAibbSfgWueq1z9ZjB+P2Hy6vrC4yEl
	A9QELH9cwx7CufyuE/mpWBxyMl1BC5EoVKUaLKmpkA/Rxe/t3iErJjU8
X-Gm-Gg: AeBDiesQSL2NiKSExOKQPElk3ySO5zw/OOY8ap/kBHW6qL8AikveXlJ2s9jFH60OZ4P
	IR0ih3C2nb6ofY5zffebrg2KujE2j62QtBczjD11HLAs670L458foHooQbHVEU5FrUp+iNDVN6n
	InxxCSaG58TYZ9GHanL5E/c0fqHLIe+VtUCqGscHo/ai3RNMp8YnDq4Lq2rDh5RVbyIzTqN9ob8
	JdyNpxKYlt+dN2eb0mzxVeInWcbM5exDSc1Nlzo1yB3L4BGQlisYsUUIA/P44WF2j0jkTB/ZTm7
	x6xfDnprUoz8TBOByXMpYOZqTzrUThAP5aHJn/qBfizQVz6VUjCSPj6yafstqI7ObE5zYOqpd4/
	cf39e2tEGMSDjXefxMAtoxvCXE3U8qHk6Vdh3Q1OFeSNRWlrgMDwQkbI9pGA7AzGgXX7DhmhjVm
	WBzTOBd4FA+XN9PWF0eu4W/cv0/ad54hKaar8rIAOGbRcTP/vZIGxLUxMf0qU=
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr240117025e9.25.1776768817358;
        Tue, 21 Apr 2026 03:53:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:de57:c37d:677b:c772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm403219355e9.12.2026.04.21.03.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:53:36 -0700 (PDT)
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
Date: Tue, 21 Apr 2026 11:53:32 +0100
Message-ID: <20260421105334.43411-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31452-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13B78439D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 4f3ebb7af4d4..efb8aacef8ff 100644
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
@@ -840,7 +850,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 static int it6263_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct gpio_desc *reset_gpio;
 	struct it6263 *it;
 	int ret;
 
@@ -858,9 +867,9 @@ static int it6263_probe(struct i2c_client *client)
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
@@ -872,12 +881,6 @@ static int it6263_probe(struct i2c_client *client)
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
@@ -890,9 +893,6 @@ static int it6263_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
 				     "failed to init I2C regmap for LVDS\n");
 
-	it6263_lvds_config(it);
-	it6263_hdmi_config(it);
-
 	i2c_set_clientdata(client, it);
 
 	it->bridge.of_node = dev->of_node;
-- 
2.43.0


