Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987C3313D3E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 19:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbhBHSWF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 13:22:05 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:58371 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbhBHSU4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 13:20:56 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2AFF8200008;
        Mon,  8 Feb 2021 18:19:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] media: i2c: Kconfig: Make MAX9271 a module
Date:   Mon,  8 Feb 2021 19:20:06 +0100
Message-Id: <20210208182006.178740-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With the introduction of the RDACM21 camera module support in
commit a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
the symbols defined by the max9271 library were exported twice
if multiple users of the library were compiled in at the same time.

In example:
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module:
'max9271_set_serial_link' exported twice. Previous export was in
drivers/media/i2c/rdacm20-camera_module.ko

Fix this by making the rdacm21 file a module and have the driver
using its functions select it.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/Kconfig  | 5 +++++
 drivers/media/i2c/Makefile | 7 +++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2d3dc0d82f9e..84645f751da3 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1240,12 +1240,16 @@ config VIDEO_NOON010PC30

 source "drivers/media/i2c/m5mols/Kconfig"

+config VIDEO_MAX9271
+	tristate
+
 config VIDEO_RDACM20
 	tristate "IMI RDACM20 camera support"
 	depends on I2C
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
+	select VIDEO_MAX9271
 	help
 	  This driver supports the IMI RDACM20 GMSL camera, used in
 	  ADAS systems.
@@ -1259,6 +1263,7 @@ config VIDEO_RDACM21
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
+	select VIDEO_MAX9271
 	help
 	  This driver supports the IMI RDACM21 GMSL camera, used in
 	  ADAS systems.
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 6bd22d63e1a7..c34a7de3158b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -125,10 +125,9 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
-rdacm20-camera_module-objs	:= rdacm20.o max9271.o
-obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
-rdacm21-camera_module-objs	:= rdacm21.o max9271.o
-obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
+obj-$(CONFIG_VIDEO_MAX9271)	+= max9271.o
+obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
+obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o

 obj-$(CONFIG_SDR_MAX2175) += max2175.o
--
2.30.0

