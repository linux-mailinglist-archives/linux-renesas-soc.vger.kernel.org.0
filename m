Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEFFD9E85B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 14:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfH0MvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 08:51:16 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:60512 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfH0MvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 08:51:15 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id uCrD2000205gfCL06CrDR9; Tue, 27 Aug 2019 14:51:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2awL-0003ni-3g; Tue, 27 Aug 2019 14:51:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2awL-0003BN-1C; Tue, 27 Aug 2019 14:51:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: host: xhci: rcar: Fix typo in compatible string matching
Date:   Tue, 27 Aug 2019 14:51:12 +0200
Message-Id: <20190827125112.12192-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It's spelled "renesas", not "renensas".

Due to this typo, RZ/G1M and RZ/G1N were not covered by the check.

Fixes: 2dc240a3308b269a ("usb: host: xhci: rcar: retire use of xhci_plat_type_is()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 8616c52849c6d2a8..2b0ccd150209fe3a 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -104,7 +104,7 @@ static int xhci_rcar_is_gen2(struct device *dev)
 	return of_device_is_compatible(node, "renesas,xhci-r8a7790") ||
 		of_device_is_compatible(node, "renesas,xhci-r8a7791") ||
 		of_device_is_compatible(node, "renesas,xhci-r8a7793") ||
-		of_device_is_compatible(node, "renensas,rcar-gen2-xhci");
+		of_device_is_compatible(node, "renesas,rcar-gen2-xhci");
 }
 
 static int xhci_rcar_is_gen3(struct device *dev)
-- 
2.17.1

