Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964644CBE2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbiCCMvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiCCMvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:51:08 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EE2184B63
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:50:23 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6495:14e6:1343:3ecb])
        by albert.telenet-ops.be with bizsmtp
        id 1oqN2700f5ER6nL06oqN8W; Thu, 03 Mar 2022 13:50:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPkuU-002XtG-4z; Thu, 03 Mar 2022 13:50:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPkuT-008DMq-KE; Thu, 03 Mar 2022 13:50:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: Drop commas after SoC match table sentinels
Date:   Thu,  3 Mar 2022 13:50:21 +0100
Message-Id: <5cae409f647272a5679291ebc0000bfeccc14160.1646311762.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It does not make sense to have a comma after a sentinel, as any new
elements must be added before the sentinel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 drivers/usb/host/xhci-rcar.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 601829a6b4badd7f..648be3fd476a5038 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2730,7 +2730,7 @@ static const struct soc_device_attribute renesas_usb3_quirks_match[] = {
 		.soc_id = "r8a7795", .revision = "ES1.*",
 		.data = &renesas_usb3_priv_r8a7795_es1,
 	},
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const unsigned int renesas_usb3_cable[] = {
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 9888ba7d85b6a7ad..aef0258a7160d1be 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -82,7 +82,7 @@ static const struct soc_device_attribute rcar_quirks_match[]  = {
 		.soc_id = "r8a7795", .revision = "ES1.*",
 		.data = (void *)RCAR_XHCI_FIRMWARE_V2,
 	},
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static void xhci_rcar_start_gen2(struct usb_hcd *hcd)
-- 
2.25.1

