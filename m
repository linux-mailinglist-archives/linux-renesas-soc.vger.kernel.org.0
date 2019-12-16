Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B467512027D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfLPK3p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:45 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D84CB18;
        Mon, 16 Dec 2019 11:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492176;
        bh=4RpJ3bE4pj4Pu0tFqVNEkjDIl1PHOcfrVMJv8bj2eKs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LPuz/jGyB8bJf7gGEb5dcIkwojUN9Ayvdm/inrHtl4enzcp0zpKr0lcpVn8PMshve
         ULUoy3VT71MVmFLADGBOYafGZZbOpvBksfi0pCPlylqN6IzX5MMSyxRh+4dd+9EGuV
         c0xn38u3rHduwG4YoUGLZKXvxnYRDZluvi7CvVWY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 10/13] media: i2c: max9286: Introduce a debugfs layer
Date:   Mon, 16 Dec 2019 10:29:27 +0000
Message-Id: <20191216102930.5867-11-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The MAX9286 provides several read-only status registers for observing
the system state of the device.

Provide error statistics and link status through debugfs files.
These files will be free-form and should not be considered as part
of any userspace API

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

Please consider this a starting point for adding useful debug. I don't
necessarily expect this code to make it to the final driver, but it
could be very useful to process and expose this information internally
in the driver.

Alternatively - we could move this all to max9286_debugfs.c or such.

Watch out for a lot of the error counters which reset to 0 when read.
We should handle those by adding the value to a local store on every
read.

v2:
 - Cleanup debugfs in error path of probe()

v6:
 - Fix a bogus (h << 0) check
---
 drivers/media/i2c/max9286.c | 127 ++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index df77871e603c..6e1dfc518e03 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -10,6 +10,7 @@
  * Copyright (C) 2015 Cogent Embedded, Inc.
  */
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/fwnode.h>
@@ -148,6 +149,7 @@ struct max9286_priv {
 	struct v4l2_subdev sd;
 	struct media_pad pads[MAX9286_N_PADS];
 	struct regulator *regulator;
+	struct dentry *dbgroot;
 	bool poc_enabled;
 
 	struct gpio_chip gpio;
@@ -225,6 +227,124 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
 	return ret;
 }
 
+/* -----------------------------------------------------------------------------
+ * DebugFS
+ */
+
+#define DEBUGFS_RO_ATTR(name)						\
+static int name##_open(struct inode *inode, struct file *file)		\
+{									\
+	return single_open(file, name, inode->i_private);		\
+}									\
+static const struct file_operations name##_fops = {			\
+	.owner = THIS_MODULE,						\
+	.open = name##_open,						\
+	.llseek = seq_lseek,						\
+	.read = seq_read,						\
+	.release = single_release,					\
+}
+
+static int max9286_config_video_detect(struct max9286_priv *priv,
+				       struct seq_file *s)
+{
+	int reg_49 = max9286_read(priv, 0x49);
+	unsigned int i;
+
+	if (reg_49 < 0)
+		return reg_49;
+
+	seq_puts(s, "                  :  0   1   2   3\n");
+	seq_puts(s, "Configuration Link:");
+	for (i = 0; i < 4; i++) {
+		int link = (reg_49 & BIT(i + 4));
+
+		seq_printf(s, " %3s", link ? " O " : "xxx");
+	}
+	seq_puts(s, "\n");
+
+	seq_puts(s, "Video Link        :");
+	for (i = 0; i < 4; i++) {
+		int link = (reg_49 & BIT(i));
+
+		seq_printf(s, " %3s", link ? " O " : "xxx");
+	}
+	seq_puts(s, "\n");
+
+	return 0;
+}
+
+static int max9286_vs_period(struct max9286_priv *priv, struct seq_file *s)
+{
+	int l, m, h;
+	unsigned int frame_length;
+
+	l = max9286_read(priv, 0x5b);
+	m = max9286_read(priv, 0x5c);
+	h = max9286_read(priv, 0x5d);
+
+	if (l < 0 || m < 0 || h < 0)
+		return -ENODEV;
+
+	frame_length = (h << 16) + (m << 8) + l;
+
+	seq_printf(s, "Calculated VS Period (pxclk) : %u\n", frame_length);
+
+	return 0;
+}
+
+static int max9286_master_link(struct max9286_priv *priv, struct seq_file *s)
+{
+	int reg_71 = max9286_read(priv, 0x71);
+	unsigned int link = (reg_71 >> 4) & 0x03;
+
+	if (reg_71 < 0)
+		return reg_71;
+
+	seq_printf(s, "Master link selected : %u\n", link);
+
+	return 0;
+}
+
+static int max9286_debugfs_info(struct seq_file *s, void *p)
+{
+	struct max9286_priv *priv = s->private;
+
+	max9286_config_video_detect(priv, s);
+	max9286_vs_period(priv, s);
+	max9286_master_link(priv, s);
+
+	return 0;
+}
+
+DEBUGFS_RO_ATTR(max9286_debugfs_info);
+
+static int max9286_debugfs_init(struct max9286_priv *priv)
+{
+	char name[32];
+
+	snprintf(name, sizeof(name), "max9286-%s",
+		 dev_name(&priv->client->dev));
+
+	priv->dbgroot = debugfs_create_dir(name, NULL);
+	if (!priv->dbgroot)
+		return -ENOMEM;
+
+	/*
+	 * dentry pointers are discarded, and remove_recursive is used to
+	 * cleanup the tree. DEBUGFS_RO_ATTR defines the file operations with
+	 * the _fops extension to the function name.
+	 */
+	debugfs_create_file("info", 0444, priv->dbgroot, priv,
+			    &max9286_debugfs_info_fops);
+
+	return 0;
+}
+
+static void max9286_debugfs_remove(struct max9286_priv *priv)
+{
+	debugfs_remove_recursive(priv->dbgroot);
+}
+
 /* -----------------------------------------------------------------------------
  * I2C Multiplexer
  */
@@ -1094,6 +1214,9 @@ static int max9286_probe(struct i2c_client *client)
 	 */
 	max9286_configure_i2c(priv, false);
 
+	/* Add any userspace support before we return early. */
+	max9286_debugfs_init(priv);
+
 	ret = max9286_init(&client->dev);
 	if (ret < 0)
 		goto err_regulator;
@@ -1104,6 +1227,7 @@ static int max9286_probe(struct i2c_client *client)
 	regulator_put(priv->regulator);
 	max9286_i2c_mux_close(priv);
 	max9286_configure_i2c(priv, false);
+	max9286_debugfs_remove(priv);
 err_free:
 	max9286_cleanup_dt(priv);
 	kfree(priv);
@@ -1115,6 +1239,9 @@ static int max9286_remove(struct i2c_client *client)
 {
 	struct max9286_priv *priv = i2c_get_clientdata(client);
 
+	/* Remove all Debugfs / sysfs entries */
+	max9286_debugfs_remove(priv);
+
 	i2c_mux_del_adapters(priv->mux);
 
 	fwnode_handle_put(priv->sd.fwnode);
-- 
2.20.1

