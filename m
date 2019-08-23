Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4229AD57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 12:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731944AbfHWKeQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 06:34:16 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35033 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388983AbfHWKeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 06:34:16 -0400
X-IronPort-AV: E=Sophos;i="5.64,420,1559487600"; 
   d="scan'208";a="24755310"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2019 19:34:13 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 69E5E4224141;
        Fri, 23 Aug 2019 19:34:13 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: host: ohci: fix a race condition between shutdown and irq
Date:   Fri, 23 Aug 2019 19:32:37 +0900
Message-Id: <1566556357-24897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch fixes an issue that the following error is
possible to happen when ohci hardware causes an interruption
and the system is shutting down at the same time.

[   34.851754] usb 2-1: USB disconnect, device number 2
[   35.166658] irq 156: nobody cared (try booting with the "irqpoll" option)
[   35.173445] CPU: 0 PID: 22 Comm: kworker/0:1 Not tainted 5.3.0-rc5 #85
[   35.179964] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   35.187886] Workqueue: usb_hub_wq hub_event
[   35.192063] Call trace:
[   35.194509]  dump_backtrace+0x0/0x150
[   35.198165]  show_stack+0x14/0x20
[   35.201475]  dump_stack+0xa0/0xc4
[   35.204785]  __report_bad_irq+0x34/0xe8
[   35.208614]  note_interrupt+0x2cc/0x318
[   35.212446]  handle_irq_event_percpu+0x5c/0x88
[   35.216883]  handle_irq_event+0x48/0x78
[   35.220712]  handle_fasteoi_irq+0xb4/0x188
[   35.224802]  generic_handle_irq+0x24/0x38
[   35.228804]  __handle_domain_irq+0x5c/0xb0
[   35.232893]  gic_handle_irq+0x58/0xa8
[   35.236548]  el1_irq+0xb8/0x180
[   35.239681]  __do_softirq+0x94/0x23c
[   35.243253]  irq_exit+0xd0/0xd8
[   35.246387]  __handle_domain_irq+0x60/0xb0
[   35.250475]  gic_handle_irq+0x58/0xa8
[   35.254130]  el1_irq+0xb8/0x180
[   35.257268]  kernfs_find_ns+0x5c/0x120
[   35.261010]  kernfs_find_and_get_ns+0x3c/0x60
[   35.265361]  sysfs_unmerge_group+0x20/0x68
[   35.269454]  dpm_sysfs_remove+0x2c/0x68
[   35.273284]  device_del+0x80/0x370
[   35.276683]  hid_destroy_device+0x28/0x60
[   35.280686]  usbhid_disconnect+0x4c/0x80
[   35.284602]  usb_unbind_interface+0x6c/0x268
[   35.288867]  device_release_driver_internal+0xe4/0x1b0
[   35.293998]  device_release_driver+0x14/0x20
[   35.298261]  bus_remove_device+0x110/0x128
[   35.302350]  device_del+0x148/0x370
[   35.305832]  usb_disable_device+0x8c/0x1d0
[   35.309921]  usb_disconnect+0xc8/0x2d0
[   35.313663]  hub_event+0x6e0/0x1128
[   35.317146]  process_one_work+0x1e0/0x320
[   35.321148]  worker_thread+0x40/0x450
[   35.324805]  kthread+0x124/0x128
[   35.328027]  ret_from_fork+0x10/0x18
[   35.331594] handlers:
[   35.333862] [<0000000079300c1d>] usb_hcd_irq
[   35.338126] [<0000000079300c1d>] usb_hcd_irq
[   35.342389] Disabling IRQ #156

The ohci_shutdown() should hold the spin lock while disabling
the interruption and changing the rh_state flag. Note that
io_watchdog_func() also calls the ohci_shutdown() and it
already held the spin lock, so that the patch makes a new
function as _ohci_shutdown().

This patch is inspired by a Renesas R-Car Gen3 BSP patch
from Tho Vu.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 I think I should have added "Fixes:" tag on the patch, but
 I have no idea how to find the suitable commit...

 drivers/usb/host/ohci-hcd.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index b457fda..1fe3dee 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -419,8 +419,7 @@ static void ohci_usb_reset (struct ohci_hcd *ohci)
  * other cases where the next software may expect clean state from the
  * "firmware".  this is bus-neutral, unlike shutdown() methods.
  */
-static void
-ohci_shutdown (struct usb_hcd *hcd)
+static void _ohci_shutdown(struct usb_hcd *hcd)
 {
 	struct ohci_hcd *ohci;
 
@@ -436,6 +435,16 @@ ohci_shutdown (struct usb_hcd *hcd)
 	ohci->rh_state = OHCI_RH_HALTED;
 }
 
+static void ohci_shutdown(struct usb_hcd *hcd)
+{
+	struct ohci_hcd	*ohci = hcd_to_ohci(hcd);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ohci->lock, flags);
+	_ohci_shutdown(hcd);
+	spin_unlock_irqrestore(&ohci->lock, flags);
+}
+
 /*-------------------------------------------------------------------------*
  * HC functions
  *-------------------------------------------------------------------------*/
@@ -760,7 +769,7 @@ static void io_watchdog_func(struct timer_list *t)
  died:
 			usb_hc_died(ohci_to_hcd(ohci));
 			ohci_dump(ohci);
-			ohci_shutdown(ohci_to_hcd(ohci));
+			_ohci_shutdown(ohci_to_hcd(ohci));
 			goto done;
 		} else {
 			/* No write back because the done queue was empty */
-- 
2.7.4

