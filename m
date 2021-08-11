Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062ED3E9524
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 17:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhHKPyz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 11:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233526AbhHKPx1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 11:53:27 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E40C061799
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 08:53:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id gFt12500A1gJxCh01Ft1Kg; Wed, 11 Aug 2021 17:53:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDqXN-00251d-2N; Wed, 11 Aug 2021 17:53:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDqXM-005TLA-BR; Wed, 11 Aug 2021 17:53:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix soc_device_match() abuse
Date:   Wed, 11 Aug 2021 17:52:54 +0200
Message-Id: <760981fb4cd110d7cbfc9dcffa365e7c8b25c6e5.1628696960.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

soc_device_match() is intended as a last resort, to handle e.g. quirks
that cannot be handled by matching based on a compatible value.

As the device nodes for the Renesas USB 3.0 Peripheral Controller on
R-Car E3 and RZ/G2E do have SoC-specific compatible values, the latter
can and should be used to match against these devices.

This also fixes support for the USB 3.0 Peripheral Controller on the
R-Car E3e (R8A779M6) SoC, which is a different grading of the R-Car E3
(R8A77990) SoC, using the same SoC-specific compatible value.

Fixes: 30025efa8b5e75f5 ("usb: gadget: udc: renesas_usb3: add support for r8a77990")
Fixes: 546970fdab1da5fe ("usb: gadget: udc: renesas_usb3: add support for r8a774c0")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index f1b35a39d1ba8712..57d417a7c3e0a687 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2707,10 +2707,15 @@ static const struct renesas_usb3_priv renesas_usb3_priv_r8a77990 = {
 
 static const struct of_device_id usb3_of_match[] = {
 	{
+		.compatible = "renesas,r8a774c0-usb3-peri",
+		.data = &renesas_usb3_priv_r8a77990,
+	}, {
 		.compatible = "renesas,r8a7795-usb3-peri",
 		.data = &renesas_usb3_priv_gen3,
-	},
-	{
+	}, {
+		.compatible = "renesas,r8a77990-usb3-peri",
+		.data = &renesas_usb3_priv_r8a77990,
+	}, {
 		.compatible = "renesas,rcar-gen3-usb3-peri",
 		.data = &renesas_usb3_priv_gen3,
 	},
@@ -2719,18 +2724,10 @@ static const struct of_device_id usb3_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb3_of_match);
 
 static const struct soc_device_attribute renesas_usb3_quirks_match[] = {
-	{
-		.soc_id = "r8a774c0",
-		.data = &renesas_usb3_priv_r8a77990,
-	},
 	{
 		.soc_id = "r8a7795", .revision = "ES1.*",
 		.data = &renesas_usb3_priv_r8a7795_es1,
 	},
-	{
-		.soc_id = "r8a77990",
-		.data = &renesas_usb3_priv_r8a77990,
-	},
 	{ /* sentinel */ },
 };
 
-- 
2.25.1

