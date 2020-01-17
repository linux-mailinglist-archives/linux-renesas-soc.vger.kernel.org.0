Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F345C140869
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 11:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgAQKyJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 05:54:09 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:13132 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726362AbgAQKyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 05:54:09 -0500
X-IronPort-AV: E=Sophos;i="5.70,329,1574089200"; 
   d="scan'208";a="36733500"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2020 19:54:07 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC77F400C722;
        Fri, 17 Jan 2020 19:54:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux@prisktech.co.nz, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: host: ehci-platform: add a quirk to avoid stuck
Date:   Fri, 17 Jan 2020 19:54:07 +0900
Message-Id: <1579258447-28135-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
be getting stuck very rarely after a full/low usb device was
disconnected. To detect/recover from such a situation, the controllers
require a special way which poll the EHCI PORTSC register and changes
the OHCI functional state.

So, this patch adds a polling timer into the ehci-platform driver,
and if the ehci driver detects the issue by the EHCI PORTSC register,
the ehci driver removes a companion device (= the OHCI controller)
to change the OHCI functional state to USB Reset once. And then,
the ehci driver adds the companion device again.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/ehci-platform.c | 104 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 769749c..fc6bb06 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/timer.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ehci_pdriver.h>
@@ -44,6 +45,9 @@ struct ehci_platform_priv {
 	struct clk *clks[EHCI_MAX_CLKS];
 	struct reset_control *rsts;
 	bool reset_on_resume;
+	bool quirk_poll;
+	struct timer_list poll_timer;
+	struct work_struct poll_work;
 };
 
 static const char hcd_name[] = "ehci-platform";
@@ -118,6 +122,88 @@ static struct usb_ehci_pdata ehci_platform_defaults = {
 	.power_off =		ehci_platform_power_off,
 };
 
+static bool ehci_platform_quirk_poll_check_condition(struct ehci_hcd *ehci)
+{
+	u32 port_status = ehci_readl(ehci, &ehci->regs->port_status[0]);
+
+	if (!(port_status & PORT_OWNER) &&	/* PO == 0b */
+	    port_status & PORT_POWER &&		/* PP == 1b */
+	    !(port_status & PORT_CONNECT) &&	/* CCS == 0b */
+	    port_status & GENMASK(11, 10))	/* LS != 00b */
+		return true;
+
+	return false;
+}
+
+static void ehci_platform_quirk_poll_rebind_companion(struct ehci_hcd *ehci)
+{
+	struct device *companion_dev;
+	struct usb_hcd *hcd = ehci_to_hcd(ehci);
+
+	companion_dev = usb_of_get_companion_dev(hcd->self.controller);
+	if (!companion_dev)
+		return;
+
+	device_release_driver(companion_dev);
+	if (device_attach(companion_dev) < 0)
+		ehci_err(ehci, "%s: failed\n", __func__);
+
+	put_device(companion_dev);
+}
+
+static void ehci_platform_quirk_poll_start_timer(struct ehci_platform_priv *p)
+{
+	mod_timer(&p->poll_timer, jiffies + msecs_to_jiffies(1000));
+}
+
+static void ehci_platform_quirk_poll_work(struct work_struct *work)
+{
+	struct ehci_platform_priv *priv =
+		container_of(work, struct ehci_platform_priv, poll_work);
+	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
+					     priv);
+	int i;
+
+	usleep_range(4000, 8000);
+
+	for (i = 0; i < 2; i++) {
+		udelay(10);
+		if (!ehci_platform_quirk_poll_check_condition(ehci))
+			goto out;
+	}
+
+	ehci_dbg(ehci, "%s: detected getting stuck. rebind now!\n", __func__);
+	ehci_platform_quirk_poll_rebind_companion(ehci);
+
+out:
+	ehci_platform_quirk_poll_start_timer(priv);
+}
+
+static void ehci_platform_quirk_poll_timer(struct timer_list *t)
+{
+	struct ehci_platform_priv *priv = from_timer(priv, t, poll_timer);
+	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
+					     priv);
+
+	if (ehci_platform_quirk_poll_check_condition(ehci))
+		schedule_work(&priv->poll_work);
+	else
+		ehci_platform_quirk_poll_start_timer(priv);
+}
+
+static void ehci_platform_quirk_poll_init(struct ehci_platform_priv *priv)
+{
+	INIT_WORK(&priv->poll_work, ehci_platform_quirk_poll_work);
+	timer_setup(&priv->poll_timer, ehci_platform_quirk_poll_timer, 0);
+	ehci_platform_quirk_poll_start_timer(priv);
+}
+
+static void ehci_platform_quirk_poll_end(struct ehci_platform_priv *priv)
+{
+	del_timer_sync(&priv->poll_timer);
+	flush_work(&priv->poll_work);
+}
+
 static int ehci_platform_probe(struct platform_device *dev)
 {
 	struct usb_hcd *hcd;
@@ -176,6 +262,10 @@ static int ehci_platform_probe(struct platform_device *dev)
 					  "has-transaction-translator"))
 			hcd->has_tt = 1;
 
+		if (of_property_read_bool(dev->dev.of_node,
+					  "needs-polling-to-avoid-stuck"))
+			priv->quirk_poll = true;
+
 		for (clk = 0; clk < EHCI_MAX_CLKS; clk++) {
 			priv->clks[clk] = of_clk_get(dev->dev.of_node, clk);
 			if (IS_ERR(priv->clks[clk])) {
@@ -247,6 +337,9 @@ static int ehci_platform_probe(struct platform_device *dev)
 	device_enable_async_suspend(hcd->self.controller);
 	platform_set_drvdata(dev, hcd);
 
+	if (priv->quirk_poll)
+		ehci_platform_quirk_poll_init(priv);
+
 	return err;
 
 err_power:
@@ -273,6 +366,9 @@ static int ehci_platform_remove(struct platform_device *dev)
 	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
 	int clk;
 
+	if (priv->quirk_poll)
+		ehci_platform_quirk_poll_end(priv);
+
 	usb_remove_hcd(hcd);
 
 	if (pdata->power_off)
@@ -297,9 +393,13 @@ static int ehci_platform_suspend(struct device *dev)
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct usb_ehci_pdata *pdata = dev_get_platdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
+	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
 	bool do_wakeup = device_may_wakeup(dev);
 	int ret;
 
+	if (priv->quirk_poll)
+		ehci_platform_quirk_poll_end(priv);
+
 	ret = ehci_suspend(hcd, do_wakeup);
 	if (ret)
 		return ret;
@@ -331,6 +431,10 @@ static int ehci_platform_resume(struct device *dev)
 	}
 
 	ehci_resume(hcd, priv->reset_on_resume);
+
+	if (priv->quirk_poll)
+		ehci_platform_quirk_poll_init(priv);
+
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP */
-- 
2.7.4

