Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13925356EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 08:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFEGVY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 02:21:24 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:7955 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726502AbfFEGVY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 02:21:24 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17858265"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2019 15:21:20 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4138440062C7;
        Wed,  5 Jun 2019 15:21:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] usb: renesas_usbhs: remove sudmac support
Date:   Wed,  5 Jun 2019 15:16:21 +0900
Message-Id: <1559715382-28390-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559715382-28390-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559715382-28390-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SUDMAC feature was supported in v3.10, but was never used by
any platform. So, this patch removes it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/usb/renesas_usbhs/fifo.c  | 6 +-----
 include/linux/usb/renesas_usbhs.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 452b456..e84d2ac2 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -12,7 +12,6 @@
 #include "pipe.h"
 
 #define usbhsf_get_cfifo(p)	(&((p)->fifo_info.cfifo))
-#define usbhsf_is_cfifo(p, f)	(usbhsf_get_cfifo(p) == f)
 
 #define usbhsf_fifo_is_busy(f)	((f)->pipe) /* see usbhs_pipe_select_fifo */
 
@@ -325,10 +324,7 @@ static int usbhsf_fifo_select(struct usbhs_pipe *pipe,
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

