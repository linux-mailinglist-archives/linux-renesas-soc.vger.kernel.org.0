Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A400FAB7AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 14:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391715AbfIFMEc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 08:04:32 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:47512 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391708AbfIFMEc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 08:04:32 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 979863C04C1;
        Fri,  6 Sep 2019 14:04:30 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ccUzNFQQk540; Fri,  6 Sep 2019 14:04:25 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 22C543C005E;
        Fri,  6 Sep 2019 14:04:25 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 6 Sep 2019
 14:04:24 +0200
From:   Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <external.veeraiyan.c@de.adit-jv.com>
Subject: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Date:   Fri, 6 Sep 2019 14:03:49 +0200
Message-ID: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Commit [1] enabled the possibility of checking the DVST (Device State
Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
the irq_dev_state() handler if the DVST bit is set. But neither
commit [1] nor commit [2] actually enabled the DVSE (Device State
Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
Register 0). As a consequence, irq_dev_state() handler is getting
called as a side effect of other (non-DVSE) interrupts being fired,
which definitely can't be relied upon, if DVST notifications are of
any value.

Why this doesn't hurt is because usbhsg_irq_dev_state() currently
doesn't do much except of a dev_dbg(). Once more work is added to
the handler (e.g. detecting device "Suspended" state and notifying
other USB gadget components about it), enabling DVSE becomes a hard
requirement. Do it in a standalone commit for better visibility and
clear explanation.

[1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
[2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
v2: No change
v1: https://patchwork.kernel.org/patch/10581479/

 drivers/usb/renesas_usbhs/mod.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 7475c4f64724..87e08b1512ad 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -349,10 +349,6 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 	 *	usbhs_interrupt
 	 */
 
-	/*
-	 * it don't enable DVSE (intenb0) here
-	 * but "mod->irq_dev_state" will be called.
-	 */
 	if (info->irq_vbus)
 		intenb0 |= VBSE;
 
@@ -363,6 +359,9 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 		if (mod->irq_ctrl_stage)
 			intenb0 |= CTRE;
 
+		if (mod->irq_dev_state)
+			intenb0 |= DVSE;
+
 		if (mod->irq_empty && mod->irq_bempsts) {
 			usbhs_write(priv, BEMPENB, mod->irq_bempsts);
 			intenb0 |= BEMPE;
-- 
2.7.4

