Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7674333DC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 06:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfFDEOe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 00:14:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:9219 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725933AbfFDEOe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:14:34 -0400
X-IronPort-AV: E=Sophos;i="5.60,549,1549897200"; 
   d="scan'208";a="17745268"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2019 13:14:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7368E4002645;
        Tue,  4 Jun 2019 13:14:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
Date:   Tue,  4 Jun 2019 13:09:34 +0900
Message-Id: <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SUDMAC featurer was supported in v3.10, but was never used by
any platform. So, this patch removes it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c  | 5 +----
 include/linux/usb/renesas_usbhs.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 452b456..53f8e2f 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -325,10 +325,7 @@ static int usbhsf_fifo_select(struct usbhs_pipe *pipe,
 	}
 
 	/* "base" will be used below  */
-	if (usbhs_get_dparam(priv, has_sudmac) && !usbhsf_is_cfifo(priv, fifo))
-		usbhs_write(priv, fifo->sel, base);
-	else
-		usbhs_write(priv, fifo->sel, base | MBW_32);
+	usbhs_write(priv, fifo->sel, base | MBW_32);
 
 	/* check ISEL and CURPIPE value */
 	while (timeout--) {
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 3f53043..a2481f4d 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -187,7 +187,6 @@ struct renesas_usbhs_driver_param {
 	 * option:
 	 */
 	u32 has_otg:1; /* for controlling PWEN/EXTLP */
-	u32 has_sudmac:1; /* for SUDMAC */
 	u32 has_usb_dmac:1; /* for USB-DMAC */
 	u32 runtime_pwctrl:1;
 	u32 has_cnen:1;
-- 
2.7.4

