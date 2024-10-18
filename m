Return-Path: <linux-renesas-soc+bounces-9835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A79A3872
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 10:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7171C204FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 08:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECAF18C937;
	Fri, 18 Oct 2024 08:24:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BEC18DF90
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239860; cv=none; b=sRnht1GNsORQj/KQ1+CZ5MJbqUCfnzQf6fnkQ32u8BIlenT7wYZQqWe6joTvVHC5NGrcSOs76PPwxy2kqiDdN80aupx16oNsbAs65tnA2zo9T2YRs6OHkVy2ypRxbC1WPdfpMpz8Z3vJp10GhueF1b445gyXAh/YVuVo5OZ2Udg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239860; c=relaxed/simple;
	bh=R5cU84TPT7r1VaOViovx6defGvz0a3fCLbklI+vGE5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NiyIDT2OPgdH/TaEPRf5yFA9tekEU/FPUg5DwaA6uZWCZTmQAaWUQUEORMNlJGNV4mSBkZpgoOswt+JFXudVDWnTM9RaDkzZdiqqK4zllGf+55RPfp2/7mVKD0LKoBQNMLro1yupqJ849ujiA7B30jCjjVTFXqgUe77jAkuOeAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by baptiste.telenet-ops.be with cmsmtp
	id RkQ32D00D1MdCM201kQ38B; Fri, 18 Oct 2024 10:24:10 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1iGy-003z14-3v;
	Fri, 18 Oct 2024 10:24:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1hgJ-005rH0-4Y;
	Fri, 18 Oct 2024 09:45:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Douglas Anderson <dianders@chromium.org>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Date: Fri, 18 Oct 2024 09:45:52 +0200
Message-Id: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each bridge instance creates up to four auxiliary devices with different
names.  However, their IDs are always zero, causing duplicate filename
errors when a system has multiple bridges:

    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'

Fix this by using a unique instance ID per bridge instance.

Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
/sys/bus/auxiliary/devices
├── ti_sn65dsi86.gpio.0
├── ti_sn65dsi86.pwm.0
├── ti_sn65dsi86.aux.0
├── ti_sn65dsi86.bridge.0
├── ti_sn65dsi86.gpio.1
├── ti_sn65dsi86.pwm.1
├── ti_sn65dsi86.aux.1
└── ti_sn65dsi86.bridge.1
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9e31f750fd889745..8f6ac48aefdb70b3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
+#include <linux/idr.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
@@ -168,6 +169,7 @@
  * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
  * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
  * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
+ * @id:           Unique instance ID
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		*bridge_aux;
@@ -202,8 +204,11 @@ struct ti_sn65dsi86 {
 	atomic_t			pwm_pin_busy;
 #endif
 	unsigned int			pwm_refclk_freq;
+	int				id;
 };
 
+static DEFINE_IDA(ti_sn65dsi86_ida);
+
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
 	{ .range_min = 0, .range_max = 0xFF },
 };
@@ -488,6 +493,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 		return -ENOMEM;
 
 	aux->name = name;
+	aux->id = pdata->id;
 	aux->dev.parent = dev;
 	aux->dev.release = ti_sn65dsi86_aux_device_release;
 	device_set_of_node_from_dev(&aux->dev, dev);
@@ -1889,6 +1895,13 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
 				       pdata->supplies);
 }
 
+static void ti_sn65dsi86_devm_ida_free(void *data)
+{
+	struct ti_sn65dsi86 *pdata = data;
+
+	ida_free(&ti_sn65dsi86_ida, pdata->id);
+}
+
 static int ti_sn65dsi86_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1903,6 +1916,17 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
+
+	ret = ida_alloc(&ti_sn65dsi86_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	pdata->id = ret;
+
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_devm_ida_free, pdata);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
-- 
2.34.1


