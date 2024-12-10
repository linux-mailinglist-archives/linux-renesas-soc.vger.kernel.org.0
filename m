Return-Path: <linux-renesas-soc+bounces-11152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E39EB305
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050EE188D16F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 14:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0791BBBC4;
	Tue, 10 Dec 2024 14:19:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB41B2190
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840348; cv=none; b=oP4ZHSJwl6AKGglrPg+0zMLhdsQtyQUjgLg+QouJY9xqLBNpbAjOSWNCk5A8xTHTOJfB9+VdMCJoHDpq8j7MiZfAacdpYAec5jLQCD3uCG1/G/wikaTvdVJ8ithw4PpLuxnmOr6dcqP+oVS4IHyWospd7Pn5hufXwu6vfyhjsxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840348; c=relaxed/simple;
	bh=XyDoA+ncHBDc11pytHnx1nGF7Oi1lcXIhydNIHqgz44=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FZlsxFxJZzb8rL7E4yqbhRwgbpvIslh+D9hPo7JIUgqUM2b6MouGaJNKpi70JXJPM+cMonsRGJdBqq+ywQUdLqmBiJt2S0ypv5locbm4lot0C5rwS+m7pR553Mx/yk78WINsXSq9jc/CXhM3F4T90kYfQsqcPBDVNDp7Lv+0ORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:bf13:4c3:373e:7260])
	by laurent.telenet-ops.be with cmsmtp
	id n2Jp2D00h3K2VbF012JpoX; Tue, 10 Dec 2024 15:19:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tL14a-000fT8-G4;
	Tue, 10 Dec 2024 15:18:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tL14b-00AXmu-Mf;
	Tue, 10 Dec 2024 15:18:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Douglas Anderson <dianders@chromium.org>,
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
	Linus Walleij <linus.walleij@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
Date: Tue, 10 Dec 2024 15:18:46 +0100
Message-Id: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
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

Fix this by using a unique instance ID per bridge instance.  The
instance ID is derived from the I2C adapter number and the bridge's I2C
address, to support multiple instances on the same bus.

Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
On the White Hawk development board:

    /sys/bus/auxiliary/devices/
    |-- ti_sn65dsi86.aux.1068
    |-- ti_sn65dsi86.aux.4140
    |-- ti_sn65dsi86.bridge.1068
    |-- ti_sn65dsi86.bridge.4140
    |-- ti_sn65dsi86.gpio.1068
    |-- ti_sn65dsi86.gpio.4140
    |-- ti_sn65dsi86.pwm.1068
    `-- ti_sn65dsi86.pwm.4140

Discussion after v1:
  - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be

Notes:
  - While the bridge supports only two possible I2C addresses, I2C
    translators may be present, increasing the address space.  Hence the
    instance ID calculation assumes 10-bit addressing.  Perhaps it makes
    sense to introduce a global I2C helper function for this?

  - I think this is the simplest solution.  If/when the auxiliary bus
    receives support à la PLATFORM_DEVID_AUTO, the driver can be
    updated.

v2:
  - Use I2C adapter/address instead of ida_alloc().
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9e31f750fd889745..fb452d1b46995673 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -480,6 +480,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 				       const char *name)
 {
 	struct device *dev = pdata->dev;
+	const struct i2c_client *client = to_i2c_client(dev);
 	struct auxiliary_device *aux;
 	int ret;
 
@@ -488,6 +489,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 		return -ENOMEM;
 
 	aux->name = name;
+	aux->id = (client->adapter->nr << 10) | client->addr;
 	aux->dev.parent = dev;
 	aux->dev.release = ti_sn65dsi86_aux_device_release;
 	device_set_of_node_from_dev(&aux->dev, dev);
-- 
2.34.1


