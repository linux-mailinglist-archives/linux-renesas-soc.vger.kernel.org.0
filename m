Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F8433DC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 06:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbfFDEOf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 00:14:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:9219 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725267AbfFDEOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:14:35 -0400
X-IronPort-AV: E=Sophos;i="5.60,549,1549897200"; 
   d="scan'208";a="17745271"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2019 13:14:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 97DA4400856D;
        Tue,  4 Jun 2019 13:14:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: renesas_usbhs: remove controlling PWEN/EXTLP support
Date:   Tue,  4 Jun 2019 13:09:35 +0900
Message-Id: <1559621375-5436-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Controlling PWMEN/EXTLP (named as "has_otg") was supported in v3.2,
but was never used by any platform. So, this patch remove it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 4 ----
 include/linux/usb/renesas_usbhs.h  | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index c7c9c5d..a501ea6 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -95,10 +95,6 @@ void usbhs_sys_host_ctrl(struct usbhs_priv *priv, int enable)
 {
 	u16 mask = DCFM | DRPD | DPRPU | HSE | USBE;
 	u16 val  = DCFM | DRPD | HSE | USBE;
-	int has_otg = usbhs_get_dparam(priv, has_otg);
-
-	if (has_otg)
-		usbhs_bset(priv, DVSTCTR, (EXTLP | PWEN), (EXTLP | PWEN));
 
 	/*
 	 * if enable
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index a2481f4d..b2cba7c 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -186,7 +186,6 @@ struct renesas_usbhs_driver_param {
 	/*
 	 * option:
 	 */
-	u32 has_otg:1; /* for controlling PWEN/EXTLP */
 	u32 has_usb_dmac:1; /* for USB-DMAC */
 	u32 runtime_pwctrl:1;
 	u32 has_cnen:1;
-- 
2.7.4

