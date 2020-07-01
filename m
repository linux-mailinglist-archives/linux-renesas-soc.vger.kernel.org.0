Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCB3210F8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 17:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731645AbgGAPmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Jul 2020 11:42:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34032 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731441AbgGAPmG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Jul 2020 11:42:06 -0400
X-IronPort-AV: E=Sophos;i="5.75,300,1589209200"; 
   d="scan'208";a="50853456"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2020 00:42:04 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2F082400CE8B;
        Thu,  2 Jul 2020 00:42:01 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] serial: sh-sci: Initialize spinlock for uart console
Date:   Wed,  1 Jul 2020 16:41:40 +0100
Message-Id: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

serial core expects the spinlock to be initialized by the controller
driver for serial console, this patch makes sure the spinlock is
initialized, fixing the below issue:

[    0.865928] BUG: spinlock bad magic on CPU#0, swapper/0/1
[    0.865945]  lock: sci_ports+0x0/0x4c80, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[    0.865955] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc1+ #112
[    0.865961] Hardware name: HopeRun HiHope RZ/G2H with sub board (DT)
[    0.865968] Call trace:
[    0.865979]  dump_backtrace+0x0/0x1d8
[    0.865985]  show_stack+0x14/0x20
[    0.865996]  dump_stack+0xe8/0x130
[    0.866006]  spin_dump+0x6c/0x88
[    0.866012]  do_raw_spin_lock+0xb0/0xf8
[    0.866023]  _raw_spin_lock_irqsave+0x80/0xa0
[    0.866032]  uart_add_one_port+0x3a4/0x4e0
[    0.866039]  sci_probe+0x504/0x7c8
[    0.866048]  platform_drv_probe+0x50/0xa0
[    0.866059]  really_probe+0xdc/0x330
[    0.866066]  driver_probe_device+0x58/0xb8
[    0.866072]  device_driver_attach+0x6c/0x90
[    0.866078]  __driver_attach+0x88/0xd0
[    0.866085]  bus_for_each_dev+0x74/0xc8
[    0.866091]  driver_attach+0x20/0x28
[    0.866098]  bus_add_driver+0x14c/0x1f8
[    0.866104]  driver_register+0x60/0x110
[    0.866109]  __platform_driver_register+0x40/0x48
[    0.866119]  sci_init+0x2c/0x34
[    0.866127]  do_one_initcall+0x88/0x428
[    0.866137]  kernel_init_freeable+0x2c0/0x328
[    0.866143]  kernel_init+0x10/0x108
[    0.866150]  ret_from_fork+0x10/0x18

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ae8463a..2d3169f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3298,6 +3298,9 @@ static int sci_probe_single(struct platform_device *dev,
 		sciport->port.flags |= UPF_HARD_FLOW;
 	}
 
+	if (sci_uart_driver.cons->index == sciport->port.line)
+		spin_lock_init(&sciport->port.lock);
+
 	ret = uart_add_one_port(&sci_uart_driver, &sciport->port);
 	if (ret) {
 		sci_cleanup_single(sciport);
-- 
2.7.4

