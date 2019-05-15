Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859E41F7F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 17:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfEOPtM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 11:49:12 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:52120 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEOPtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 11:49:12 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x4FFCHJr019290;
        Wed, 15 May 2019 11:21:50 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2sdrjcb6h5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 15 May 2019 11:21:50 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Wed, 15 May 2019 11:21:49 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Wed, 15 May 2019 11:21:48 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v4 06/13] usb: renesas_usbhs: move flags to param
Date:   Wed, 15 May 2019 10:20:41 -0500
Message-ID: <20190515152048.42363-7-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_10:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=996
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150094
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move options from 'flags' field in private structure to param structure
where other options are already being kept.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
 * added reviewed-by
---
 drivers/usb/renesas_usbhs/common.c | 23 +++++++----------------
 drivers/usb/renesas_usbhs/common.h |  2 --
 include/linux/usb/renesas_usbhs.h  |  1 +
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 0ca89de7f842..1de7a44f3415 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -43,15 +43,6 @@
  *			| ....  |	+-----------+
  */
 
-
-#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
-
-/* status */
-#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
-#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
-#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
-#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
-
 /*
  * platform call back
  *
@@ -479,7 +470,7 @@ static void usbhsc_hotplug(struct usbhs_priv *priv)
 		dev_dbg(&pdev->dev, "%s enable\n", __func__);
 
 		/* power on */
-		if (usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL))
+		if (usbhs_get_dparam(priv, runtime_pwctrl))
 			usbhsc_power_ctrl(priv, enable);
 
 		/* bus init */
@@ -499,7 +490,7 @@ static void usbhsc_hotplug(struct usbhs_priv *priv)
 		usbhsc_bus_init(priv);
 
 		/* power off */
-		if (usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL))
+		if (usbhs_get_dparam(priv, runtime_pwctrl))
 			usbhsc_power_ctrl(priv, enable);
 
 		usbhs_mod_change(priv, -1);
@@ -733,7 +724,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	/* FIXME */
 	/* runtime power control ? */
 	if (priv->pfunc.get_vbus)
-		usbhsc_flags_set(priv, USBHSF_RUNTIME_PWCTRL);
+		usbhs_get_dparam(priv, runtime_pwctrl) = 1;
 
 	/*
 	 * priv settings
@@ -807,7 +798,7 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	/* power control */
 	pm_runtime_enable(&pdev->dev);
-	if (!usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL)) {
+	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
 		usbhsc_power_ctrl(priv, 1);
 		usbhs_mod_autonomy_mode(priv);
 	}
@@ -848,7 +839,7 @@ static int usbhs_remove(struct platform_device *pdev)
 	dfunc->notify_hotplug = NULL;
 
 	/* power off */
-	if (!usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL))
+	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
 
 	pm_runtime_disable(&pdev->dev);
@@ -873,7 +864,7 @@ static __maybe_unused int usbhsc_suspend(struct device *dev)
 		usbhs_mod_change(priv, -1);
 	}
 
-	if (mod || !usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL))
+	if (mod || !usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
 
 	return 0;
@@ -884,7 +875,7 @@ static __maybe_unused int usbhsc_resume(struct device *dev)
 	struct usbhs_priv *priv = dev_get_drvdata(dev);
 	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
 
-	if (!usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL)) {
+	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
 		usbhsc_power_ctrl(priv, 1);
 		usbhs_mod_autonomy_mode(priv);
 	}
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index de1a6638bf68..1fbffb7bbc8f 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -260,8 +260,6 @@ struct usbhs_priv {
 
 	spinlock_t		lock;
 
-	u32 flags;
-
 	/*
 	 * module control
 	 */
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 53924f8e840c..17fae6e504cc 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -189,6 +189,7 @@ struct renesas_usbhs_driver_param {
 	u32 has_otg:1; /* for controlling PWEN/EXTLP */
 	u32 has_sudmac:1; /* for SUDMAC */
 	u32 has_usb_dmac:1; /* for USB-DMAC */
+	u32 runtime_pwctrl:1;
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
 };
 
-- 
2.16.1

