Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A00387A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 12:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfFGKHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 06:07:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8546 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbfFGKHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 06:07:17 -0400
X-IronPort-AV: E=Sophos;i="5.60,562,1549897200"; 
   d="scan'208";a="17872329"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2019 19:07:14 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6582640065C6;
        Fri,  7 Jun 2019 19:07:14 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com
Cc:     geert+renesas@glider.be, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
Date:   Fri,  7 Jun 2019 19:02:14 +0900
Message-Id: <1559901734-23540-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The powered flag should be set for any other phys anyway. Also
the flag should be locked by the channel. Otherwise, after we have
revised the device tree for the usb phy, the following warning
happened during a second system suspend. And if the driver doesn't
lock the flag, enabling the regulator is possible to be imbalance
during system resume. So, this patch fixes the issues.

< The warning >
[   56.026531] unbalanced disables for USB20_VBUS0
[   56.031108] WARNING: CPU: 3 PID: 513 at drivers/regulator/core.c:2593 _regula
tor_disable+0xe0/0x1c0
[   56.040146] Modules linked in: rcar_du_drm rcar_lvds drm_kms_helper drm drm_p
anel_orientation_quirks vsp1 videobuf2_vmalloc videobuf2_dma_contig videobuf2_me
mops videobuf2_v4l2 videobuf2_common videodev snd_soc_rcar renesas_usbhs snd_soc
_audio_graph_card media snd_soc_simple_card_utils crct10dif_ce renesas_usb3 snd_
soc_ak4613 rcar_fcp pwm_rcar usb_dmac phy_rcar_gen3_usb3 pwm_bl ipv6
[   56.074047] CPU: 3 PID: 513 Comm: kworker/u16:19 Not tainted 5.2.0-rc3-00001-
g5f20a19 #6
[   56.082129] Hardware name: Renesas Salvator-X board based on r8a7795 ES2.0+ (
DT)
[   56.089524] Workqueue: events_unbound async_run_entry_fn
[   56.094832] pstate: 40000005 (nZcv daif -PAN -UAO)
[   56.099617] pc : _regulator_disable+0xe0/0x1c0
[   56.104054] lr : _regulator_disable+0xe0/0x1c0
[   56.108489] sp : ffff0000121c3ae0
[   56.111796] x29: ffff0000121c3ae0 x28: 0000000000000000
[   56.117102] x27: 0000000000000000 x26: ffff000010fe0e60
[   56.122407] x25: 0000000000000002 x24: 0000000000000001
[   56.127712] x23: 0000000000000002 x22: ffff8006f99d4000
[   56.133017] x21: ffff8006f99cc000 x20: ffff8006f9846800
[   56.138322] x19: ffff8006f9846800 x18: ffffffffffffffff
[   56.143626] x17: 0000000000000000 x16: 0000000000000000
[   56.148931] x15: ffff0000112f96c8 x14: ffff0000921c37f7
[   56.154235] x13: ffff0000121c3805 x12: ffff000011312000
[   56.159540] x11: 0000000005f5e0ff x10: ffff0000112f9f20
[   56.164844] x9 : ffff0000112d3018 x8 : 00000000000001ad
[   56.170149] x7 : 00000000ffffffcc x6 : ffff8006ff768180
[   56.175453] x5 : ffff8006ff768180 x4 : 0000000000000000
[   56.180758] x3 : ffff8006ff76ef10 x2 : ffff8006ff768180
[   56.186062] x1 : 3d2eccbaead8fb00 x0 : 0000000000000000
[   56.191367] Call trace:
[   56.193808]  _regulator_disable+0xe0/0x1c0
[   56.197899]  regulator_disable+0x40/0x78
[   56.201820]  rcar_gen3_phy_usb2_power_off+0x3c/0x50
[   56.206692]  phy_power_off+0x48/0xd8
[   56.210263]  usb_phy_roothub_power_off+0x30/0x50
[   56.214873]  usb_phy_roothub_suspend+0x1c/0x50
[   56.219311]  hcd_bus_suspend+0x13c/0x168
[   56.223226]  generic_suspend+0x4c/0x58
[   56.226969]  usb_suspend_both+0x1ac/0x238
[   56.230972]  usb_suspend+0xcc/0x170
[   56.234455]  usb_dev_suspend+0x10/0x18
[   56.238199]  dpm_run_callback.isra.6+0x20/0x68
[   56.242635]  __device_suspend+0x110/0x308
[   56.246637]  async_suspend+0x24/0xa8
[   56.250205]  async_run_entry_fn+0x40/0xf8
[   56.254210]  process_one_work+0x1e0/0x320
[   56.258211]  worker_thread+0x40/0x450
[   56.261867]  kthread+0x124/0x128
[   56.265094]  ret_from_fork+0x10/0x18
[   56.268661] ---[ end trace 86d7ec5de5c517af ]---
[   56.273290] phy phy-ee080200.usb-phy.10: phy poweroff failed --> -5

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 549b6b55b005 ("phy: renesas: rcar-gen3-usb2: enable/disable independent irqs")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Add mutex lock to avoid enabling the regulator imbalance during resume.
 - I got Geert-san's Tested-by, but I didn't add the tag because
   v1 still has the imbalance issue above.
 https://patchwork.kernel.org/patch/10976299/

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 1322185..a9a36ef 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -106,6 +107,7 @@ struct rcar_gen3_chan {
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
 	struct work_struct work;
+	struct mutex lock;
 	enum usb_dr_mode dr_mode;
 	bool extcon_host;
 	bool is_otg_channel;
@@ -437,15 +439,16 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
 	u32 val;
-	int ret;
+	int ret = 0;
 
+	mutex_lock(&channel->lock);
 	if (!rcar_gen3_are_all_rphys_power_off(channel))
-		return 0;
+		goto out;
 
 	if (channel->vbus) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	val = readl(usb2_base + USB2_USBCTR);
@@ -454,7 +457,10 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	val &= ~USB2_USBCTR_PLL_RST;
 	writel(val, usb2_base + USB2_USBCTR);
 
+out:
+	/* The powered flag should be set for any other phys anyway */
 	rphy->powered = true;
+	mutex_unlock(&channel->lock);
 
 	return 0;
 }
@@ -465,14 +471,18 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 	struct rcar_gen3_chan *channel = rphy->ch;
 	int ret = 0;
 
+	mutex_lock(&channel->lock);
 	rphy->powered = false;
 
 	if (!rcar_gen3_are_all_rphys_power_off(channel))
-		return 0;
+		goto out;
 
 	if (channel->vbus)
 		ret = regulator_disable(channel->vbus);
 
+out:
+	mutex_unlock(&channel->lock);
+
 	return ret;
 }
 
@@ -639,6 +649,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (!phy_usb2_ops)
 		return -EINVAL;
 
+	mutex_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
 							phy_usb2_ops);
-- 
2.7.4

