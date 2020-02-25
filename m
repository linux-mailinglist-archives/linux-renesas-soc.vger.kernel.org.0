Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3715D16EE0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 19:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731481AbgBYSbf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 13:31:35 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53558 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbgBYSbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 13:31:35 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E09013C009D;
        Tue, 25 Feb 2020 19:31:31 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XMi49W9SirJX; Tue, 25 Feb 2020 19:31:22 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9D4043C005E;
        Tue, 25 Feb 2020 19:31:22 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 25 Feb
 2020 19:31:22 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Lee, Chiasheng" <chiasheng.lee@intel.com>,
        Mathieu Malaterre <malat@debian.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        <scan-admin@coverity.com>
Subject: [PATCH v2] usb: hub: Fix unhandled return value of usb_autopm_get_interface()
Date:   Tue, 25 Feb 2020 19:30:57 +0100
Message-ID: <20200225183057.31953-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.25.1
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

Rather than checking the return value of 'usb_autopm_get_interface()',
switch to the usb_autpm_get_interface_no_resume() API, as per:

On Tue, Feb 25, 2020 at 10:32:32AM -0500, Alan Stern wrote:
 ------ 8< ------
 > This change (i.e. 'ret = usb_autopm_get_interface') is not necessary,
 > because the resume operation cannot fail at this point (interfaces
 > are always powered-up during probe). A better solution would be to
 > call usb_autpm_get_interface_no_resume() instead.
 ------ 8< ------

Fixes: 1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in SMSC hub")
Cc: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reported-by: scan-admin@coverity.com
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---

v2:
 - [Alan Stern] Use usb_autpm_get_interface_no_resume() instead of
   usb_autopm_get_interface()
 - Augment commit description to provide background

v1:
 - Link: https://lore.kernel.org/lkml/20200225130846.20236-1-erosca@de.adit-jv.com
---
 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1d212f82c69b..1105983b5c1c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1866,7 +1866,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
 		hub->quirk_disable_autosuspend = 1;
-		usb_autopm_get_interface(intf);
+		usb_autopm_get_interface_no_resume(intf);
 	}
 
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
-- 
2.25.1

