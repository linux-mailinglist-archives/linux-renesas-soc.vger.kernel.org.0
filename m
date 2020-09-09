Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69C92623C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 02:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgIIABi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 20:01:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:50338 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726605AbgIIABf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 20:01:35 -0400
X-IronPort-AV: E=Sophos;i="5.76,407,1592838000"; 
   d="scan'208";a="56716876"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Sep 2020 09:01:34 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 86E22412FB92;
        Wed,  9 Sep 2020 09:01:34 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] usb: gadget: u_serial: clear suspended flag when disconnecting
Date:   Wed,  9 Sep 2020 09:01:32 +0900
Message-Id: <1599609692-17967-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The commit aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume
callbacks") set/cleared the suspended flag in USB bus suspend/resume
only. But, when a USB cable is disconnected in the suspend, since some
controllers will not detect USB bus resume, the suspended flag is not
cleared. After that, user cannot send any data. To fix the issue,
clears the suspended flag in the gserial_disconnect().

Fixes: aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume callbacks")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Linh Phung <linh.phung.jy@renesas.com>
Tested-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
---
 Changes from v1:
 - Fix typo in the subject.

 drivers/usb/gadget/function/u_serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 127ecc2..2caccbb 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1391,6 +1391,7 @@ void gserial_disconnect(struct gserial *gser)
 		if (port->port.tty)
 			tty_hangup(port->port.tty);
 	}
+	port->suspended = false;
 	spin_unlock_irqrestore(&port->port_lock, flags);
 
 	/* disable endpoints, aborting down any active I/O */
-- 
2.7.4

