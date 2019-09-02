Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22963A5576
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 14:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731194AbfIBMD2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 08:03:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58665 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731197AbfIBMD1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 08:03:27 -0400
X-IronPort-AV: E=Sophos;i="5.64,459,1559487600"; 
   d="scan'208";a="25317515"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Sep 2019 21:03:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A036D4006DF3;
        Mon,  2 Sep 2019 21:03:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/3] usb: host: xhci-plat: add quirks member into struct xhci_plat_priv
Date:   Mon,  2 Sep 2019 21:01:36 +0900
Message-Id: <1567425698-27560-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567425698-27560-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1567425698-27560-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To simplify adding xhci->quirks instead of the .init_quirk()
function, this patch adds a new parameter "quirks" into
the struct xhci_plat_priv.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-plat.c | 4 +++-
 drivers/usb/host/xhci-plat.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index a1e5ce4..1843b69 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -66,12 +66,14 @@ static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
 
 static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
+	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
+
 	/*
 	 * As of now platform drivers don't provide MSI support so we ensure
 	 * here that the generic code does not try to make a pci_dev from our
 	 * dev struct in order to setup MSI
 	 */
-	xhci->quirks |= XHCI_PLAT;
+	xhci->quirks |= XHCI_PLAT | priv->quirks;
 }
 
 /* called during probe() after chip reset completes */
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index ae29f22..5681723 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -12,10 +12,12 @@
 
 struct xhci_plat_priv {
 	const char *firmware_name;
+	unsigned long long quirks;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
+#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
 #endif	/* _XHCI_PLAT_H */
-- 
2.7.4

