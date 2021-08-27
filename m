Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB93F946F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Aug 2021 08:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244285AbhH0Gdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Aug 2021 02:33:36 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:62285 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229611AbhH0Gdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Aug 2021 02:33:35 -0400
X-IronPort-AV: E=Sophos;i="5.84,355,1620658800"; 
   d="scan'208";a="92067838"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2021 15:32:46 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1FA0C4013514;
        Fri, 27 Aug 2021 15:32:46 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: host: xhci-rcar: Don't reload firmware after the completion
Date:   Fri, 27 Aug 2021 15:32:27 +0900
Message-Id: <20210827063227.81990-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the datasheet, "Upon the completion of FW Download,
there is no need to write or reload FW.". Otherwise, it's possible
to cause unexpected behaviors. So, adds such a condition.

Fixes: 4ac8918f3a73 ("usb: host: xhci-plat: add support for the R-Car H2 and M2 xHCI controllers")
Cc: stable@vger.kernel.org # v3.17+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-rcar.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 1bc4fe7b8c75..9888ba7d85b6 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -134,6 +134,13 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 	const struct soc_device_attribute *attr;
 	const char *firmware_name;
 
+	/*
+	 * According to the datasheet, "Upon the completion of FW Download,
+	 * there is no need to write or reload FW".
+	 */
+	if (readl(regs + RCAR_USB3_DL_CTRL) & RCAR_USB3_DL_CTRL_FW_SUCCESS)
+		return 0;
+
 	attr = soc_device_match(rcar_quirks_match);
 	if (attr)
 		quirks = (uintptr_t)attr->data;
-- 
2.25.1

