Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF09356E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 08:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFEGVW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 02:21:22 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62280 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726263AbfFEGVW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 02:21:22 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17654997"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jun 2019 15:21:20 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4D5E140062C7;
        Wed,  5 Jun 2019 15:21:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] usb: renesas_usbhs: remove controlling PWEN/EXTLP support
Date:   Wed,  5 Jun 2019 15:16:22 +0900
Message-Id: <1559715382-28390-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559715382-28390-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559715382-28390-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Controlling PWMEN/EXTLP (named as "has_otg") was supported in v3.2,
but the last user (kzm9g) was removed by the commit 30f8925a57d8ad49
("ARM: shmobile: Remove legacy board code for KZM-A9-GT"). So, this
patch remove it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
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

