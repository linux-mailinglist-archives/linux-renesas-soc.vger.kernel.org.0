Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0DA3A29E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 13:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhFJLK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 07:10:26 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40195 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229961AbhFJLK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 07:10:26 -0400
X-IronPort-AV: E=Sophos;i="5.83,263,1616425200"; 
   d="scan'208";a="83829546"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 20:08:29 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 25EF2421A8A0;
        Thu, 10 Jun 2021 20:08:29 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4] serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
Date:   Thu, 10 Jun 2021 20:08:06 +0900
Message-Id: <20210610110806.277932-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
message is possible output when system enters suspend and while
transferring data, because clearing TIE bit in SCSCR is not able to
stop any dmaengine transfer.

    sh-sci e6550000.serial: ttySC1: Unable to drain transmitter

Note that this driver has already used some #ifdef in the .c file
so that this patch also uses #ifdef to fix the issue. Otherwise,
build errors happens if the CONFIG_SERIAL_SH_SCI_DMA is disabled.

Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
Cc: <stable@vger.kernel.org> # v4.9+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v3:
 - Add a description why the patch need #ifdef.
 - Add Cc: stable ML tag.
 https://lore.kernel.org/linux-renesas-soc/20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com/

 Changes from v2:
 - Don't use a macro.
 - Revise the commit descrption.
 https://lore.kernel.org/linux-renesas-soc/20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com/

 Changes from v1:
 - Don't put #ifdef in the .c file.
 - Update the commit description.
 https://lore.kernel.org/linux-renesas-soc/20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com/

 drivers/tty/serial/sh-sci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4baf1316ea72..2d5487bf6855 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
 	ctrl &= ~SCSCR_TIE;
 
 	serial_port_out(port, SCSCR, ctrl);
+
+#ifdef CONFIG_SERIAL_SH_SCI_DMA
+	if (to_sci_port(port)->chan_tx &&
+	    !dma_submit_error(to_sci_port(port)->cookie_tx)) {
+		dmaengine_terminate_async(to_sci_port(port)->chan_tx);
+		to_sci_port(port)->cookie_tx = -EINVAL;
+	}
+#endif
 }
 
 static void sci_start_rx(struct uart_port *port)
-- 
2.25.1

