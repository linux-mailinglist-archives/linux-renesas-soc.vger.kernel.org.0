Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD679E53F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 12:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbfH0KDv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 06:03:51 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:27292 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729644AbfH0KDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 06:03:51 -0400
X-IronPort-AV: E=Sophos;i="5.64,436,1559487600"; 
   d="scan'208";a="25044204"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2019 19:03:47 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E715E4005E11;
        Tue, 27 Aug 2019 19:03:47 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] usb: host: xhci-rcar: Add a helper macro to set xhci_plat_priv
Date:   Tue, 27 Aug 2019 19:02:05 +0900
Message-Id: <1566900127-11148-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To avoid copy-and-paste setting of xhci_plat_priv for R-Car SoCs,
this patch add a helper macro SET_XHCI_PLAT_PRIV_FOR_RCAR.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 10 ++--------
 drivers/usb/host/xhci-rcar.h |  7 +++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 1843b69..d90cd5e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -105,17 +105,11 @@ static const struct xhci_plat_priv xhci_plat_marvell_armada3700 = {
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
-	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
-	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
-	.resume_quirk = xhci_rcar_resume_quirk,
+	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V1)
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
-	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
-	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
-	.resume_quirk = xhci_rcar_resume_quirk,
+	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
 };
 
 static const struct of_device_id usb_xhci_of_match[] = {
diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index 804b6ab..1f8c225 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -31,4 +31,11 @@ static inline int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 	return 0;
 }
 #endif
+
+#define SET_XHCI_PLAT_PRIV_FOR_RCAR(firmware)				\
+	.firmware_name = firmware,					\
+	.init_quirk = xhci_rcar_init_quirk,				\
+	.plat_start = xhci_rcar_start,					\
+	.resume_quirk = xhci_rcar_resume_quirk,
+
 #endif /* _XHCI_RCAR_H */
-- 
2.7.4

