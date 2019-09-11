Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50C07AFD8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 15:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfIKNSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 09:18:05 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43202 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIKNSF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 09:18:05 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2F9603C0579;
        Wed, 11 Sep 2019 15:18:03 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WvMNAxPdMdPK; Wed, 11 Sep 2019 15:17:56 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 990263C0016;
        Wed, 11 Sep 2019 15:17:56 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 11 Sep
 2019 15:17:56 +0200
From:   Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <external.veeraiyan.c@de.adit-jv.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: [PATCH v5 1/3] usb: renesas_usbhs: simplify usbhs_status_get_device_state()
Date:   Wed, 11 Sep 2019 15:15:54 +0200
Message-ID: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Similar to usbhs_status_get_ctrl_stage(), *_get_device_state() is not
supposed to return any error code since its return value is the DVSQ
bitfield of the INTSTS0 register. According to SoC HW manual rev1.00,
every single value of DVSQ[2:0] is valid and none is an error:

----8<----
Device State
000: Powered state
001: Default state
010: Address state
011: Configuration state
1xx: Suspended state
----8<----

Hence, simplify the function body. The motivation behind dropping the
switch/case construct is being able to implement reading the suspended
state. The latter (based on the above DVSQ[2:0] description) doesn't
have a unique value, but is rather a list of states (which makes
switch/case less suitable for reading/validating it):

100: (Suspended) Powered state
101: (Suspended) Default state
110: (Suspended) Address state
111: (Suspended) Configuration state

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
---
v5: No change
v4: https://patchwork.kernel.org/patch/11138197/
v3: https://patchwork.kernel.org/patch/11137697/
v2: https://patchwork.kernel.org/patch/11135111/
v1: https://patchwork.kernel.org/patch/10581479/

 drivers/usb/renesas_usbhs/mod.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 7475c4f64724..4fbb1d538b82 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -170,17 +170,7 @@ void usbhs_mod_remove(struct usbhs_priv *priv)
  */
 int usbhs_status_get_device_state(struct usbhs_irq_state *irq_state)
 {
-	int state = irq_state->intsts0 & DVSQ_MASK;
-
-	switch (state) {
-	case POWER_STATE:
-	case DEFAULT_STATE:
-	case ADDRESS_STATE:
-	case CONFIGURATION_STATE:
-		return state;
-	}
-
-	return -EIO;
+	return (int)irq_state->intsts0 & DVSQ_MASK;
 }
 
 int usbhs_status_get_ctrl_stage(struct usbhs_irq_state *irq_state)
-- 
2.7.4

