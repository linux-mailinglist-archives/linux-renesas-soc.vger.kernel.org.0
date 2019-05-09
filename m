Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302221938E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 22:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfEIUgk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 16:36:40 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:34914 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfEIUgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 16:36:40 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x49KCZiW018120;
        Thu, 9 May 2019 16:14:01 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap01.intersil.com with ESMTP id 2scabqgu1u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 09 May 2019 16:14:01 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Thu, 9 May 2019 16:13:59 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Thu, 9 May 2019 16:13:59 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Date:   Thu, 9 May 2019 15:11:38 -0500
Message-ID: <20190509201142.10543-12-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090115
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/A2 is similar to the R-Car Gen3 with some small differences.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * combined RZA1 and RZA2 for fifo setting
 * added braces to make code easier to read
 * fixed and clean up usbhs_rza2_power_ctrl()
---
 drivers/usb/renesas_usbhs/Makefile |  2 +-
 drivers/usb/renesas_usbhs/common.c | 12 +++++-
 drivers/usb/renesas_usbhs/rza.h    |  1 +
 drivers/usb/renesas_usbhs/rza2.c   | 79 ++++++++++++++++++++++++++++++++++++++
 include/linux/usb/renesas_usbhs.h  |  1 +
 5 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza2.c

diff --git a/drivers/usb/renesas_usbhs/Makefile b/drivers/usb/renesas_usbhs/Makefile
index 5c5b51bb48ef..a1fed56b0957 100644
--- a/drivers/usb/renesas_usbhs/Makefile
+++ b/drivers/usb/renesas_usbhs/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_USB_RENESAS_USBHS)	+= renesas_usbhs.o
 
-renesas_usbhs-y			:= common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.o
+renesas_usbhs-y			:= common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.o rza2.o
 
 ifneq ($(CONFIG_USB_RENESAS_USBHS_HCD),)
 	renesas_usbhs-y		+= mod_host.o
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 820636fc4dc9..35d2298c03a0 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -582,6 +582,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rza1-usbhs",
 		.data = (void *)USBHS_TYPE_RZA1,
 	},
+	{
+		.compatible = "renesas,rza2-usbhs",
+		.data = (void *)USBHS_TYPE_RZA2,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
@@ -614,7 +618,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
 	}
 
-	if (dparam->type == USBHS_TYPE_RZA1) {
+	if (dparam->type == USBHS_TYPE_RZA1 ||
+	    dparam->type == USBHS_TYPE_RZA2) {
 		dparam->pipe_configs = usbhsc_new_pipe;
 		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
 	}
@@ -688,6 +693,11 @@ static int usbhs_probe(struct platform_device *pdev)
 	case USBHS_TYPE_RZA1:
 		priv->pfunc = usbhs_rza1_ops;
 		break;
+	case USBHS_TYPE_RZA2:
+		priv->pfunc = usbhs_rza2_ops;
+		usbhsc_flags_set(priv, USBHSF_HAS_CNEN);
+		usbhsc_flags_set(priv, USBHSF_CFIFO_BYTE_ADDR);
+		break;
 	default:
 		if (!info->platform_callback.get_id) {
 			dev_err(&pdev->dev, "no platform callbacks");
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
index ca917ca54f6d..073a53d1d442 100644
--- a/drivers/usb/renesas_usbhs/rza.h
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -2,3 +2,4 @@
 #include "common.h"
 
 extern const struct renesas_usbhs_platform_callback usbhs_rza1_ops;
+extern const struct renesas_usbhs_platform_callback usbhs_rza2_ops;
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
new file mode 100644
index 000000000000..a1d9eb2d40cf
--- /dev/null
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas USB driver RZ/A2 initialization and power control
+ *
+ * Copyright (C) 2019 Chris Brandt
+ * Copyright (C) 2019 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include "common.h"
+#include "rza.h"
+
+
+static int usbhs_rza2_hardware_init(struct platform_device *pdev)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+
+	if (IS_ENABLED(CONFIG_GENERIC_PHY)) {
+		struct phy *phy = phy_get(&pdev->dev, "usb");
+
+		if (IS_ERR(phy))
+			return PTR_ERR(phy);
+
+		priv->phy = phy;
+		return 0;
+	}
+	return -ENXIO;
+}
+
+static int usbhs_rza2_hardware_exit(struct platform_device *pdev)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+
+	if (priv->phy) {
+		phy_put(priv->phy);
+		priv->phy = NULL;
+	}
+
+	return 0;
+}
+
+static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
+				void __iomem *base, int enable)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+	int retval = 0;
+
+	if (!priv->phy)
+		return -ENODEV;
+
+	if (enable) {
+		retval = phy_init(priv->phy);
+		usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
+		udelay(100);	/* Wait for PLL to become stable */
+		if (!retval)
+			retval = phy_power_on(priv->phy);
+	} else {
+		usbhs_bset(priv, SUSPMODE, SUSPM, 0);
+		phy_power_off(priv->phy);
+		phy_exit(priv->phy);
+	}
+
+	return retval;
+}
+
+static int usbhs_rza2_get_id(struct platform_device *pdev)
+{
+	return USBHS_GADGET;
+}
+
+const struct renesas_usbhs_platform_callback usbhs_rza2_ops = {
+	.hardware_init = usbhs_rza2_hardware_init,
+	.hardware_exit = usbhs_rza2_hardware_exit,
+	.power_ctrl = usbhs_rza2_power_ctrl,
+	.get_id = usbhs_rza2_get_id,
+};
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 53924f8e840c..39604c8b1eed 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -196,6 +196,7 @@ struct renesas_usbhs_driver_param {
 #define USBHS_TYPE_RCAR_GEN3		2
 #define USBHS_TYPE_RCAR_GEN3_WITH_PLL	3
 #define USBHS_TYPE_RZA1			4
+#define USBHS_TYPE_RZA2			5
 
 /*
  * option:
-- 
2.16.1

