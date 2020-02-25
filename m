Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A916E16C1BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 14:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbgBYNJo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 08:09:44 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:50832 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbgBYNJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 08:09:44 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id EE9543C0579;
        Tue, 25 Feb 2020 14:09:40 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oALL3uPy91rv; Tue, 25 Feb 2020 14:09:32 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id C24EA3C005E;
        Tue, 25 Feb 2020 14:09:32 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 25 Feb
 2020 14:09:32 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Lee, Chiasheng" <chiasheng.lee@intel.com>,
        Mathieu Malaterre <malat@debian.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        <scan-admin@coverity.com>
Subject: [PATCH] usb: hub: Fix unhandled return value of usb_autopm_get_interface()
Date:   Tue, 25 Feb 2020 14:08:46 +0100
Message-ID: <20200225130846.20236-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Address below Coverity complaint (Feb 25, 2020, 8:06 AM CET):

*** CID 1458999:  Error handling issues  (CHECKED_RETURN)
/drivers/usb/core/hub.c: 1869 in hub_probe()
1863
1864            if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
1865                    hub->quirk_check_port_auto_suspend = 1;
1866
1867            if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
1868                    hub->quirk_disable_autosuspend = 1;
 >>>     CID 1458999:  Error handling issues  (CHECKED_RETURN)
 >>>     Calling "usb_autopm_get_interface" without checking return value (as is done elsewhere 97 out of 111 times).
1869                    usb_autopm_get_interface(intf);
1870            }
1871
1872            if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
1873                    return 0;
1874

Fixes: 1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in SMSC hub")
Cc: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reported-by: scan-admin@coverity.com
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/usb/core/hub.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1d212f82c69b..ff04ca28970d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1865,8 +1865,12 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		hub->quirk_check_port_auto_suspend = 1;
 
 	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
-		hub->quirk_disable_autosuspend = 1;
-		usb_autopm_get_interface(intf);
+		int r = usb_autopm_get_interface(intf);
+
+		if (!r)
+			hub->quirk_disable_autosuspend = 1;
+		else
+			dev_dbg(&intf->dev, "disable autosuspend err=%d\n", r);
 	}
 
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
-- 
2.25.0

