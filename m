Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A939FAFD91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 15:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfIKNSI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 09:18:08 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43211 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIKNSI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 09:18:08 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4FAD93C0016;
        Wed, 11 Sep 2019 15:18:06 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UAAATSfL65o7; Wed, 11 Sep 2019 15:17:59 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 0F2E53C04C0;
        Wed, 11 Sep 2019 15:17:59 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 11 Sep
 2019 15:17:58 +0200
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
Subject: [PATCH v5 2/3] usb: renesas_usbhs: enable DVSE interrupt
Date:   Wed, 11 Sep 2019 15:15:55 +0200
Message-ID: <1568207756-22325-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
References: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
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

[1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common
   code")
[2] commit 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
---
v5: fixed checkpatch warning
v4: https://patchwork.kernel.org/patch/11138201/
v3: https://patchwork.kernel.org/patch/11137693/
v2: https://patchwork.kernel.org/patch/11135109/
v1: https://patchwork.kernel.org/patch/10581485/
 drivers/usb/renesas_usbhs/mod.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 4fbb1d538b82..3384308169f5 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -339,10 +339,6 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 	 *	usbhs_interrupt
 	 */
 
-	/*
-	 * it don't enable DVSE (intenb0) here
-	 * but "mod->irq_dev_state" will be called.
-	 */
 	if (info->irq_vbus)
 		intenb0 |= VBSE;
 
@@ -353,6 +349,9 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
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

