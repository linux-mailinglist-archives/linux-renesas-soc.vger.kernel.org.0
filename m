Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1B957E178
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jul 2022 14:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbiGVMbs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 08:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiGVMbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 08:31:47 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70B64DF0C;
        Fri, 22 Jul 2022 05:31:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,185,1654527600"; 
   d="scan'208";a="127036849"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Jul 2022 21:31:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.52])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C2FA643C50C4;
        Fri, 22 Jul 2022 21:31:41 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] usb: gadget: udc: renesas_usb3: Add support for RZ/V2M
Date:   Fri, 22 Jul 2022 13:31:07 +0100
Message-Id: <20220722123107.34122-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722123107.34122-1-phil.edworthy@renesas.com>
References: <20220722123107.34122-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/V2M (r9a09g011) has a few differences:
 - The USB3_DRD_CON register has moved, its called USB_PERI_DRD_CON in
   the RZ/V2M hardware manual.
   It has additional bits for host and peripheral reset that need to
   cleared to use usb host and peripheral respectively.
 - The USB3_OTG_STA, USB3_OTG_INT_STA and USB3_OTG_INT_ENA registers
   have been moved and renamed to USB_PERI_DRD_STA, USB_PERI_DRD_INT_STA
   and USB_PERI_DRD_INT_E.
 - The IDMON bit used in the above regs for role detection have moved
   from bit 4 to bit 0.
 - RZ/V2M has an separate interrupt for DRD, i.e. for changes to IDMON.
 - There are reset lines for DRD and USBP
 - There is another clock, managed by runtime PM.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 - Rename r9a09g011 feature to is_rzv2m; use rzv2m compat string,
 - Pass pointer into macros that access is_rzv2m member
---
 drivers/usb/gadget/udc/renesas_usb3.c | 128 ++++++++++++++++++++------
 1 file changed, 101 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 648be3fd476a..81a0ee4dbb71 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -17,6 +17,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -38,16 +39,16 @@
 #define USB3_USB20_CON		0x204
 #define USB3_USB30_CON		0x208
 #define USB3_USB_STA		0x210
-#define USB3_DRD_CON		0x218
+#define USB3_DRD_CON(p)		((p)->is_rzv2m ? 0x400 : 0x218)
 #define USB3_USB_INT_STA_1	0x220
 #define USB3_USB_INT_STA_2	0x224
 #define USB3_USB_INT_ENA_1	0x228
 #define USB3_USB_INT_ENA_2	0x22c
 #define USB3_STUP_DAT_0		0x230
 #define USB3_STUP_DAT_1		0x234
-#define USB3_USB_OTG_STA	0x268
-#define USB3_USB_OTG_INT_STA	0x26c
-#define USB3_USB_OTG_INT_ENA	0x270
+#define USB3_USB_OTG_STA(p)	((p)->is_rzv2m ? 0x410 : 0x268)
+#define USB3_USB_OTG_INT_STA(p)	((p)->is_rzv2m ? 0x414 : 0x26c)
+#define USB3_USB_OTG_INT_ENA(p)	((p)->is_rzv2m ? 0x418 : 0x270)
 #define USB3_P0_MOD		0x280
 #define USB3_P0_CON		0x288
 #define USB3_P0_STA		0x28c
@@ -135,6 +136,8 @@
 #define USB_STA_VBUS_STA	BIT(0)
 
 /* DRD_CON */
+#define DRD_CON_PERI_RST	BIT(31)		/* rzv2m only */
+#define DRD_CON_HOST_RST	BIT(30)		/* rzv2m only */
 #define DRD_CON_PERI_CON	BIT(24)
 #define DRD_CON_VBOUT		BIT(0)
 
@@ -155,7 +158,7 @@
 #define USB_INT_2_PIPE(n)	BIT(n)
 
 /* USB_OTG_STA, USB_OTG_INT_STA and USB_OTG_INT_ENA */
-#define USB_OTG_IDMON		BIT(4)
+#define USB_OTG_IDMON(p)	((p)->is_rzv2m ? BIT(0) : BIT(4))
 
 /* P0_MOD */
 #define P0_MOD_DIR		BIT(6)
@@ -255,7 +258,7 @@
 #define USB3_EP0_SS_MAX_PACKET_SIZE	512
 #define USB3_EP0_HSFS_MAX_PACKET_SIZE	64
 #define USB3_EP0_BUF_SIZE		8
-#define USB3_MAX_NUM_PIPES		6	/* This includes PIPE 0 */
+#define USB3_MAX_NUM_PIPES(p)		((p)->is_rzv2m ? 9 : 6)	/* This includes PIPE 0 */
 #define USB3_WAIT_US			3
 #define USB3_DMA_NUM_SETTING_AREA	4
 /*
@@ -326,10 +329,13 @@ struct renesas_usb3_priv {
 	int num_ramif;
 	int ramsize_per_pipe;		/* unit = bytes */
 	bool workaround_for_vbus;	/* if true, don't check vbus signal */
+	bool is_rzv2m;			/* if true, RZ/V2M SoC */
 };
 
 struct renesas_usb3 {
 	void __iomem *reg;
+	struct reset_control *drd_rstc;
+	struct reset_control *usbp_rstc;
 
 	struct usb_gadget gadget;
 	struct usb_gadget_driver *driver;
@@ -363,6 +369,7 @@ struct renesas_usb3 {
 	bool forced_b_device;
 	bool start_to_connect;
 	bool role_sw_by_connector;
+	bool is_rzv2m;
 };
 
 #define gadget_to_renesas_usb3(_gadget)	\
@@ -467,7 +474,7 @@ static void usb3_disable_pipe_irq(struct renesas_usb3 *usb3, int num)
 
 static bool usb3_is_host(struct renesas_usb3 *usb3)
 {
-	return !(usb3_read(usb3, USB3_DRD_CON) & DRD_CON_PERI_CON);
+	return !(usb3_read(usb3, USB3_DRD_CON(usb3)) & DRD_CON_PERI_CON);
 }
 
 static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
@@ -674,10 +681,17 @@ static void renesas_usb3_role_work(struct work_struct *work)
 
 static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 {
+	if (usb3->is_rzv2m) {
+		if (host)
+			usb3_clear_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
+		else
+			usb3_clear_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
+	}
+
 	if (host)
-		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON(usb3));
 	else
-		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON(usb3));
 }
 
 static void usb3_set_mode_by_role_sw(struct renesas_usb3 *usb3, bool host)
@@ -693,9 +707,9 @@ static void usb3_set_mode_by_role_sw(struct renesas_usb3 *usb3, bool host)
 static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
 {
 	if (enable)
-		usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+		usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON(usb3));
 	else
-		usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+		usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON(usb3));
 }
 
 static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
@@ -716,7 +730,7 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
 
 static bool usb3_is_a_device(struct renesas_usb3 *usb3)
 {
-	return !(usb3_read(usb3, USB3_USB_OTG_STA) & USB_OTG_IDMON);
+	return !(usb3_read(usb3, USB3_USB_OTG_STA(usb3)) & USB_OTG_IDMON(usb3));
 }
 
 static void usb3_check_id(struct renesas_usb3 *usb3)
@@ -739,8 +753,8 @@ static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 	usb3_set_bit(usb3, USB_COM_CON_PN_WDATAIF_NL |
 		     USB_COM_CON_PN_RDATAIF_NL | USB_COM_CON_PN_LSTTR_PP,
 		     USB3_USB_COM_CON);
-	usb3_write(usb3, USB_OTG_IDMON, USB3_USB_OTG_INT_STA);
-	usb3_write(usb3, USB_OTG_IDMON, USB3_USB_OTG_INT_ENA);
+	usb3_write(usb3, USB_OTG_IDMON(usb3), USB3_USB_OTG_INT_STA(usb3));
+	usb3_write(usb3, USB_OTG_IDMON(usb3), USB3_USB_OTG_INT_ENA(usb3));
 
 	usb3_check_id(usb3);
 	usb3_check_vbus(usb3);
@@ -750,7 +764,7 @@ static void renesas_usb3_stop_controller(struct renesas_usb3 *usb3)
 {
 	usb3_disconnect(usb3);
 	usb3_write(usb3, 0, USB3_P0_INT_ENA);
-	usb3_write(usb3, 0, USB3_USB_OTG_INT_ENA);
+	usb3_write(usb3, 0, USB3_USB_OTG_INT_ENA(usb3));
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_1);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_2);
 	usb3_write(usb3, 0, USB3_AXI_INT_ENA);
@@ -2005,9 +2019,15 @@ static void usb3_irq_idmon_change(struct renesas_usb3 *usb3)
 	usb3_check_id(usb3);
 }
 
-static void usb3_irq_otg_int(struct renesas_usb3 *usb3, u32 otg_int_sta)
+static void usb3_irq_otg_int(struct renesas_usb3 *usb3)
 {
-	if (otg_int_sta & USB_OTG_IDMON)
+	u32 otg_int_sta = usb3_read(usb3, USB3_USB_OTG_INT_STA(usb3));
+
+	otg_int_sta &= usb3_read(usb3, USB3_USB_OTG_INT_ENA(usb3));
+	if (otg_int_sta)
+		usb3_write(usb3, otg_int_sta, USB3_USB_OTG_INT_STA(usb3));
+
+	if (otg_int_sta & USB_OTG_IDMON(usb3))
 		usb3_irq_idmon_change(usb3);
 }
 
@@ -2015,7 +2035,6 @@ static void usb3_irq_epc(struct renesas_usb3 *usb3)
 {
 	u32 int_sta_1 = usb3_read(usb3, USB3_USB_INT_STA_1);
 	u32 int_sta_2 = usb3_read(usb3, USB3_USB_INT_STA_2);
-	u32 otg_int_sta = usb3_read(usb3, USB3_USB_OTG_INT_STA);
 
 	int_sta_1 &= usb3_read(usb3, USB3_USB_INT_ENA_1);
 	if (int_sta_1) {
@@ -2027,11 +2046,8 @@ static void usb3_irq_epc(struct renesas_usb3 *usb3)
 	if (int_sta_2)
 		usb3_irq_epc_int_2(usb3, int_sta_2);
 
-	otg_int_sta &= usb3_read(usb3, USB3_USB_OTG_INT_ENA);
-	if (otg_int_sta) {
-		usb3_write(usb3, otg_int_sta, USB3_USB_OTG_INT_STA);
-		usb3_irq_otg_int(usb3, otg_int_sta);
-	}
+	if (!usb3->is_rzv2m)
+		usb3_irq_otg_int(usb3);
 }
 
 static void usb3_irq_dma_int(struct renesas_usb3 *usb3, u32 dma_sta)
@@ -2085,6 +2101,15 @@ static irqreturn_t renesas_usb3_irq(int irq, void *_usb3)
 	return ret;
 }
 
+static irqreturn_t renesas_usb3_otg_irq(int irq, void *_usb3)
+{
+	struct renesas_usb3 *usb3 = _usb3;
+
+	usb3_irq_otg_int(usb3);
+
+	return IRQ_HANDLED;
+}
+
 static void usb3_write_pn_mod(struct renesas_usb3_ep *usb3_ep,
 			      const struct usb_endpoint_descriptor *desc)
 {
@@ -2571,6 +2596,8 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 	usb_role_switch_unregister(usb3->role_sw);
 
 	usb_del_gadget_udc(&usb3->gadget);
+	reset_control_assert(usb3->usbp_rstc);
+	reset_control_assert(usb3->drd_rstc);
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
@@ -2589,8 +2616,8 @@ static int renesas_usb3_init_ep(struct renesas_usb3 *usb3, struct device *dev,
 	usb3->num_usb3_eps = priv->ramsize_per_ramif * priv->num_ramif * 2 /
 			     priv->ramsize_per_pipe + 1;
 
-	if (usb3->num_usb3_eps > USB3_MAX_NUM_PIPES)
-		usb3->num_usb3_eps = USB3_MAX_NUM_PIPES;
+	if (usb3->num_usb3_eps > USB3_MAX_NUM_PIPES(usb3))
+		usb3->num_usb3_eps = USB3_MAX_NUM_PIPES(usb3);
 
 	usb3->usb3_ep = devm_kcalloc(dev,
 				     usb3->num_usb3_eps, sizeof(*usb3_ep),
@@ -2707,6 +2734,13 @@ static const struct renesas_usb3_priv renesas_usb3_priv_r8a77990 = {
 	.workaround_for_vbus = true,
 };
 
+static const struct renesas_usb3_priv renesas_usb3_priv_rzv2m = {
+	.ramsize_per_ramif = SZ_32K,
+	.num_ramif = 1,
+	.ramsize_per_pipe = SZ_4K,
+	.is_rzv2m = true,
+};
+
 static const struct of_device_id usb3_of_match[] = {
 	{
 		.compatible = "renesas,r8a774c0-usb3-peri",
@@ -2717,6 +2751,9 @@ static const struct of_device_id usb3_of_match[] = {
 	}, {
 		.compatible = "renesas,r8a77990-usb3-peri",
 		.data = &renesas_usb3_priv_r8a77990,
+	}, {
+		.compatible = "renesas,rzv2m-usb3-peri",
+		.data = &renesas_usb3_priv_rzv2m,
 	}, {
 		.compatible = "renesas,rcar-gen3-usb3-peri",
 		.data = &renesas_usb3_priv_gen3,
@@ -2748,7 +2785,7 @@ static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
 static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
-	int irq, ret;
+	int irq, drd_irq, ret;
 	const struct renesas_usb3_priv *priv;
 	const struct soc_device_attribute *attr;
 
@@ -2762,10 +2799,18 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (priv->is_rzv2m) {
+		drd_irq = platform_get_irq_byname(pdev, "drd");
+		if (drd_irq < 0)
+			return drd_irq;
+	}
+
 	usb3 = devm_kzalloc(&pdev->dev, sizeof(*usb3), GFP_KERNEL);
 	if (!usb3)
 		return -ENOMEM;
 
+	usb3->is_rzv2m = priv->is_rzv2m;
+
 	usb3->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(usb3->reg))
 		return PTR_ERR(usb3->reg);
@@ -2787,6 +2832,14 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	if (usb3->is_rzv2m) {
+		ret = devm_request_irq(&pdev->dev, drd_irq,
+				       renesas_usb3_otg_irq, 0,
+				       dev_name(&pdev->dev), usb3);
+		if (ret < 0)
+			return ret;
+	}
+
 	INIT_WORK(&usb3->extcon_work, renesas_usb3_extcon_work);
 	usb3->extcon = devm_extcon_dev_allocate(&pdev->dev, renesas_usb3_cable);
 	if (IS_ERR(usb3->extcon))
@@ -2817,10 +2870,27 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		goto err_add_udc;
 	}
 
+	usb3->drd_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
+								"drd_reset");
+	if (IS_ERR(usb3->drd_rstc)) {
+		ret = PTR_ERR(usb3->drd_rstc);
+		goto err_add_udc;
+	}
+
+	usb3->usbp_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
+								 "aresetn_p");
+	if (IS_ERR(usb3->usbp_rstc)) {
+		ret = PTR_ERR(usb3->usbp_rstc);
+		goto err_add_udc;
+	}
+
+	reset_control_deassert(usb3->drd_rstc);
+	reset_control_deassert(usb3->usbp_rstc);
+
 	pm_runtime_enable(&pdev->dev);
 	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
 	if (ret < 0)
-		goto err_add_udc;
+		goto err_reset;
 
 	ret = device_create_file(&pdev->dev, &dev_attr_role);
 	if (ret < 0)
@@ -2858,6 +2928,10 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 err_dev_create:
 	usb_del_gadget_udc(&usb3->gadget);
 
+err_reset:
+	reset_control_assert(usb3->usbp_rstc);
+	reset_control_assert(usb3->drd_rstc);
+
 err_add_udc:
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
-- 
2.34.1

