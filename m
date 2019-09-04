Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C1DA7D96
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 10:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfIDIWb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 04:22:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16592 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726045AbfIDIWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 04:22:31 -0400
X-IronPort-AV: E=Sophos;i="5.64,465,1559487600"; 
   d="scan'208";a="25713191"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Sep 2019 17:22:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8167B41D31B0;
        Wed,  4 Sep 2019 17:22:24 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RESEND v7 2/3] usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
Date:   Wed,  4 Sep 2019 09:15:40 +0100
Message-Id: <1567584941-13690-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver for TI HD3SS3220 USB Type-C DRP port controller.

The driver currently registers the port and supports data role swapping.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 V7 --> V7 RESEND 
  *  Added Heikki's Acked-by tag
     (https://patchwork.kernel.org/patch/10969911/)
 V6-->V7
  * Rebased on below patch
    (https://patchwork.kernel.org/patch/10966313/)
  * Removed Heikki's reviewed by tag,since there is a rework.
 V5-->V6
   * No change
 V4-->V5
   * Incorporated Heikki's review comment
     (https://patchwork.kernel.org/patch/10902531/)
   * Added Heikki's Reviewed-by tag
 V3-->V4
   * Incorporated Chunfeng Yun's review comment
   * Used fwnode API's to get usb role switch handle.
 
 V2-->V3
   * Used the new api "usb_role_switch by node" for getting
     remote endpoint associated with Type-C USB DRP port
     controller devices.
 V1-->V2
   * Driver uses usb role class instead of extcon for dual role switch
     and also handles connect/disconnect events.
---
 drivers/usb/typec/Kconfig     |  10 ++
 drivers/usb/typec/Makefile    |   1 +
 drivers/usb/typec/hd3ss3220.c | 259 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 drivers/usb/typec/hd3ss3220.c

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 895e241..aceb2af 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -50,6 +50,16 @@ source "drivers/usb/typec/tcpm/Kconfig"
 
 source "drivers/usb/typec/ucsi/Kconfig"
 
+config TYPEC_HD3SS3220
+	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
+	depends on I2C
+	help
+	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
+	  controller driver.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called hd3ss3220.ko.
+
 config TYPEC_TPS6598X
 	tristate "TI TPS6598x USB Power Delivery controller driver"
 	depends on I2C
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 6696b72..7753a5c3 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -4,5 +4,6 @@ typec-y				:= class.o mux.o bus.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
+obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
new file mode 100644
index 0000000..b8f247e
--- /dev/null
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * TI HD3SS3220 Type-C DRP Port Controller Driver
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/usb/role.h>
+#include <linux/irqreturn.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/usb/typec.h>
+#include <linux/delay.h>
+
+#define HD3SS3220_REG_CN_STAT_CTRL	0x09
+#define HD3SS3220_REG_GEN_CTRL		0x0A
+#define HD3SS3220_REG_DEV_REV		0xA0
+
+/* Register HD3SS3220_REG_CN_STAT_CTRL*/
+#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK	(BIT(7) | BIT(6))
+#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP		BIT(6)
+#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP		BIT(7)
+#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY		(BIT(7) | BIT(6))
+#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS		BIT(4)
+
+/* Register HD3SS3220_REG_GEN_CTRL*/
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK		(BIT(2) | BIT(1))
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT	0x00
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK	BIT(1)
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC	(BIT(2) | BIT(1))
+
+struct hd3ss3220 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct usb_role_switch	*role_sw;
+	struct typec_port *port;
+	struct typec_capability typec_cap;
+};
+
+static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
+{
+	return regmap_update_bits(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL,
+				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK,
+				  src_pref);
+}
+
+static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
+{
+	unsigned int reg_val;
+	enum usb_role attached_state;
+	int ret;
+
+	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
+			  &reg_val);
+	if (ret < 0)
+		return ret;
+
+	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
+	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
+		attached_state = USB_ROLE_HOST;
+		break;
+	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
+		attached_state = USB_ROLE_DEVICE;
+		break;
+	default:
+		attached_state = USB_ROLE_NONE;
+		break;
+	}
+
+	return attached_state;
+}
+
+static int hd3ss3220_dr_set(const struct typec_capability *cap,
+			    enum typec_data_role role)
+{
+	struct hd3ss3220 *hd3ss3220 = container_of(cap, struct hd3ss3220,
+						   typec_cap);
+	enum usb_role role_val;
+	int pref, ret = 0;
+
+	if (role == TYPEC_HOST) {
+		role_val = USB_ROLE_HOST;
+		pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC;
+	} else {
+		role_val = USB_ROLE_DEVICE;
+		pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK;
+	}
+
+	ret = hd3ss3220_set_source_pref(hd3ss3220, pref);
+	usleep_range(10, 100);
+
+	usb_role_switch_set_role(hd3ss3220->role_sw, role_val);
+	typec_set_data_role(hd3ss3220->port, role);
+
+	return ret;
+}
+
+static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
+{
+	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+
+	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
+	if (role_state == USB_ROLE_NONE)
+		hd3ss3220_set_source_pref(hd3ss3220,
+				HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
+
+	switch (role_state) {
+	case USB_ROLE_HOST:
+		typec_set_data_role(hd3ss3220->port, TYPEC_HOST);
+		break;
+	case USB_ROLE_DEVICE:
+		typec_set_data_role(hd3ss3220->port, TYPEC_DEVICE);
+		break;
+	default:
+		break;
+	}
+}
+
+irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
+{
+	int err;
+
+	hd3ss3220_set_role(hd3ss3220);
+	err = regmap_update_bits_base(hd3ss3220->regmap,
+				      HD3SS3220_REG_CN_STAT_CTRL,
+				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
+				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
+				      NULL, false, true);
+	if (err < 0)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t hd3ss3220_irq_handler(int irq, void *data)
+{
+	struct i2c_client *client = to_i2c_client(data);
+	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
+
+	return hd3ss3220_irq(hd3ss3220);
+}
+
+static const struct regmap_config config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x0A,
+};
+
+static int hd3ss3220_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct hd3ss3220 *hd3ss3220;
+	struct fwnode_handle *connector;
+	int ret;
+	unsigned int data;
+
+	hd3ss3220 = devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
+				 GFP_KERNEL);
+	if (!hd3ss3220)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, hd3ss3220);
+
+	hd3ss3220->dev = &client->dev;
+	hd3ss3220->regmap = devm_regmap_init_i2c(client, &config);
+	if (IS_ERR(hd3ss3220->regmap))
+		return PTR_ERR(hd3ss3220->regmap);
+
+	hd3ss3220_set_source_pref(hd3ss3220,
+				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
+	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
+	if (IS_ERR(connector))
+		return PTR_ERR(connector);
+
+	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
+	fwnode_handle_put(connector);
+	if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
+		return PTR_ERR(hd3ss3220->role_sw);
+
+	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
+	hd3ss3220->typec_cap.dr_set = hd3ss3220_dr_set;
+	hd3ss3220->typec_cap.type = TYPEC_PORT_DRP;
+	hd3ss3220->typec_cap.data = TYPEC_PORT_DRD;
+
+	hd3ss3220->port = typec_register_port(&client->dev,
+					      &hd3ss3220->typec_cap);
+	if (IS_ERR(hd3ss3220->port))
+		return PTR_ERR(hd3ss3220->port);
+
+	hd3ss3220_set_role(hd3ss3220);
+	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
+	if (ret < 0)
+		goto error;
+
+	if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
+		ret = regmap_write(hd3ss3220->regmap,
+				HD3SS3220_REG_CN_STAT_CTRL,
+				data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
+		if (ret < 0)
+			goto error;
+	}
+
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					hd3ss3220_irq_handler,
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					"hd3ss3220", &client->dev);
+		if (ret)
+			goto error;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
+	if (ret < 0)
+		goto error;
+
+	dev_info(&client->dev, "probed revision=0x%x\n", ret);
+
+	return 0;
+error:
+	typec_unregister_port(hd3ss3220->port);
+	usb_role_switch_put(hd3ss3220->role_sw);
+
+	return ret;
+}
+
+static int hd3ss3220_remove(struct i2c_client *client)
+{
+	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
+
+	typec_unregister_port(hd3ss3220->port);
+	usb_role_switch_put(hd3ss3220->role_sw);
+
+	return 0;
+}
+
+static const struct of_device_id dev_ids[] = {
+	{ .compatible = "ti,hd3ss3220"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, dev_ids);
+
+static struct i2c_driver hd3ss3220_driver = {
+	.driver = {
+		.name = "hd3ss3220",
+		.of_match_table = of_match_ptr(dev_ids),
+	},
+	.probe = hd3ss3220_probe,
+	.remove =  hd3ss3220_remove,
+};
+
+module_i2c_driver(hd3ss3220_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
+MODULE_DESCRIPTION("TI HD3SS3220 DRP Port Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

