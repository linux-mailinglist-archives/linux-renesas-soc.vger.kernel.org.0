Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9566515693
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 01:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfEFXsU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 19:48:20 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:51926 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfEFXsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 19:48:20 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x46NiZQY013618;
        Mon, 6 May 2019 19:48:12 -0400
Received: from pbmxdp01.intersil.corp (pbmxdp01.pb.intersil.com [132.158.200.222])
        by pbmsgap02.intersil.com with ESMTP id 2s94wdt005-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 06 May 2019 19:48:12 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 6 May 2019 19:48:10 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Mon, 6 May 2019 19:48:10 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Date:   Mon, 6 May 2019 18:46:27 -0500
Message-ID: <20190506234631.113226-7-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-06_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060179
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/A2 is similar to the R-Car Gen3 with some small differences.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/usb/renesas_usbhs/Makefile |  2 +-
 drivers/usb/renesas_usbhs/common.c | 27 +++++++++----
 drivers/usb/renesas_usbhs/common.h | 13 ++++++
 drivers/usb/renesas_usbhs/fifo.c   |  8 +++-
 drivers/usb/renesas_usbhs/rza.h    |  1 +
 drivers/usb/renesas_usbhs/rza2.c   | 82 ++++++++++++++++++++++++++++++++++++++
 include/linux/usb/renesas_usbhs.h  |  1 +
 7 files changed, 124 insertions(+), 10 deletions(-)
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
index 249fbee97f3f..8293f34b964a 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -44,13 +44,6 @@
  */
 
 
-#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
-
-/* status */
-#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
-#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
-#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
-#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
 
 /*
  * platform call back
@@ -123,6 +116,12 @@ void usbhs_sys_function_ctrl(struct usbhs_priv *priv, int enable)
 	u16 mask = DCFM | DRPD | DPRPU | HSE | USBE;
 	u16 val  = HSE | USBE;
 
+	/* CNEN bit is required for function operation */
+	if (usbhsc_flags_has(priv, USBHSF_HAS_CNEN)) {
+		mask |= CNEN;
+		val  |= CNEN;
+	}
+
 	/*
 	 * if enable
 	 *
@@ -583,6 +582,10 @@ static const struct of_device_id usbhs_of_match[] = {
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
@@ -620,6 +623,11 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
 	}
 
+	if (dparam->type == USBHS_TYPE_RZA2) {
+		dparam->pipe_configs = usbhsc_new_pipe;
+		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+	}
+
 	return info;
 }
 
@@ -689,6 +697,11 @@ static int usbhs_probe(struct platform_device *pdev)
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
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 3777af848a35..5978c30c9993 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -104,6 +104,7 @@ struct usbhs_priv;
 
 /* SYSCFG */
 #define SCKE	(1 << 10)	/* USB Module Clock Enable */
+#define CNEN	(1 << 8)	/* Single-ended receiver operation Enable */
 #define HSE	(1 << 7)	/* High-Speed Operation Enable */
 #define DCFM	(1 << 6)	/* Controller Function Select */
 #define DRPD	(1 << 5)	/* D+ Line/D- Line Resistance Control */
@@ -339,4 +340,16 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
 #define usbhs_priv_to_dev(priv)		(&priv->pdev->dev)
 #define usbhs_priv_to_lock(priv)	(&priv->lock)
 
+/*
+ * flags
+ */
+#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
+#define USBHSF_HAS_CNEN		(1 << 1) /* Single-ended receiver */
+#define USBHSF_CFIFO_BYTE_ADDR	(1 << 2) /* Byte addressable */
+
+#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
+#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
+#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
+#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
+
 #endif /* RENESAS_USB_DRIVER_H */
diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 39fa2fc1b8b7..9b8220c2c9cc 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -543,8 +543,12 @@ static int usbhsf_pio_try_push(struct usbhs_pkt *pkt, int *is_done)
 	}
 
 	/* the rest operation */
-	for (i = 0; i < len; i++)
-		iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
+	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
+		for (i = 0; i < len; i++)
+			iowrite8(buf[i], addr + (i & 0x03));
+	else
+		for (i = 0; i < len; i++)
+			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
 
 	/*
 	 * variable update
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
index 000000000000..c0b5dfa4b85d
--- /dev/null
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -0,0 +1,82 @@
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
+	int retval = -ENODEV;
+
+	if (priv->phy) {
+		if (enable) {
+			retval = phy_init(priv->phy);
+			if (enable) {
+				usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
+				/* Wait 100 usec for PLL to become stable */
+				udelay(100);
+			} else {
+				usbhs_bset(priv, SUSPMODE, SUSPM, 0);
+			}
+			if (!retval)
+				retval = phy_power_on(priv->phy);
+		} else {
+			phy_power_off(priv->phy);
+			phy_exit(priv->phy);
+			retval = 0;
+		}
+	}
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

