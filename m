Return-Path: <linux-renesas-soc+bounces-14599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE8A6787B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 16:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF99166B1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160FA204C2A;
	Tue, 18 Mar 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Kj1eGtGU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AF18A959
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313378; cv=none; b=Dn8M5YBnViW+dTw0hOECsfZ1ZQqb18gOuXaO1g+xND98GnkLo7FGzPtRf0M/F7rsNAYByIolBtnPwCLmEMKK2an76qZ3k3XStcpwPopLQC7kUHBTn7x932E0dtNj909LAkWepPWRBM6xhNfmpyFo56dy87iGmfNLZ8Sc10iAkP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313378; c=relaxed/simple;
	bh=mVky3SJpD2HfTRntHDj6FiQQe22XLGUp/BC1aAwqcYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T83DSUHYeq1qyCdl4rQ7K9LiPpE8xcnzUXpzXLANoaxQUL1mzFFvHM1FgkY/YJNZWQ5uXAKd56dJyH0Vv5AmbvBeg8cfSOCr5/u3RRJnUDXht/Md7zGQHfvLaab6cJ4BqQlFo+FsOGg9fbxE+xmNVTPHYQ65srCpQIR0R16bm1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Kj1eGtGU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=vJDRpGEiTOtz69
	WUHIA8BQfC3IImuDjtEqTj5d38lPs=; b=Kj1eGtGU3rDgGt4QHLc5y16Skkh6Vs
	+xDZASJtnUsBzlDo/vexwiHXeM7VP2P2OPmH7hqSXaej1v/AIELONd41H9ZNp4Jk
	e+kIZINUPzXrJxJPxwSjrnPRXUlLYA3kKi2a+wKkAvwPljYbiLsJQT76T+9t2b8p
	KCiwxZFpbqYIbVSw1wmEayu7jDPtdaUcl/NMNfROpG56kREtkZ+bOn82QMqa24jl
	P3Pt4aLCOCW1iGA7FW5OmY/IuGgWC/zozPYzpN1932cWs/XoAYlIKSeQhbmN1uja
	w3PE5lHAhWf5UbT9leooirk5fCGN3vf54gkSBHXtQxHZwobRg5h/82TA==
Received: (qmail 3860209 invoked from network); 18 Mar 2025 16:56:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 16:56:00 +0100
X-UD-Smtp-Session: l3s3148p1@eebk8J8wZpsgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection failure
Date: Tue, 18 Mar 2025 16:52:56 +0100
Message-ID: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read out and check the ID registers, so we can bail out if I2C
communication does not work or if the device is unknown. Tested on a
Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
not enabling RuntimePM for the device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* switched to a new approach suggested by Doug (Thanks!). We add a
  dedicated read instead of using the first read. This prevents creating
  the aux devices. As a side-gain, we check now if the chip at the address
  is really the one we want to support.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 87fffaa52bb0..8caa7918933d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -36,6 +36,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#define SN_DEVICE_ID_REGS			0x00	/* up to 0x07 */
 #define SN_DEVICE_REV_REG			0x08
 #define SN_DPPLL_SRC_REG			0x0A
 #define  DPPLL_CLK_SRC_DSICLK			BIT(0)
@@ -1875,6 +1876,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ti_sn65dsi86 *pdata;
+	u8 id_buf[8];
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -1918,6 +1920,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	pm_runtime_get_sync(dev);
+	ret = regmap_bulk_read(pdata->regmap, SN_DEVICE_ID_REGS, id_buf, ARRAY_SIZE(id_buf));
+	pm_runtime_put_autosuspend(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device id\n");
+
+	/* The ID string is stored backwards */
+	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
+		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
-- 
2.47.2


