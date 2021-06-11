Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60493A4077
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 12:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhFKK4Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 06:56:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19596 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229969AbhFKK4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 06:56:24 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="84095739"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2021 19:54:25 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 39109401A46E;
        Fri, 11 Jun 2021 19:54:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens after usb_pkt_pop()
Date:   Fri, 11 Jun 2021 19:54:10 +0900
Message-Id: <20210611105411.543008-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This driver has a potential issue which this driver is possible to
cause superfluous interrupts after usb_pkt_pop() is called. So,
after the commit 3af32605289e ("usb: renesas_usbhs: fix error return
code of usbhsf_pkt_handler()") had been applied, the following
error happened when we use g_audio.

    renesas_usbhs e6590000.usb: irq_ready run_error 1 : -22

To fix the issue, disable the tx or rx interrupt in usb_pkt_pop().

Fixes: 2743e7f90dc0 ("usb: renesas_usbhs: fix the usb_pkt_pop()")
Cc: <stable@vger.kernel.org> # v4.4+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index b5e7991dc7d9..a3c2b01ccf7b 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -101,6 +101,8 @@ static struct dma_chan *usbhsf_dma_chan_get(struct usbhs_fifo *fifo,
 #define usbhsf_dma_map(p)	__usbhsf_dma_map_ctrl(p, 1)
 #define usbhsf_dma_unmap(p)	__usbhsf_dma_map_ctrl(p, 0)
 static int __usbhsf_dma_map_ctrl(struct usbhs_pkt *pkt, int map);
+static void usbhsf_tx_irq_ctrl(struct usbhs_pipe *pipe, int enable);
+static void usbhsf_rx_irq_ctrl(struct usbhs_pipe *pipe, int enable);
 struct usbhs_pkt *usbhs_pkt_pop(struct usbhs_pipe *pipe, struct usbhs_pkt *pkt)
 {
 	struct usbhs_priv *priv = usbhs_pipe_to_priv(pipe);
@@ -123,6 +125,11 @@ struct usbhs_pkt *usbhs_pkt_pop(struct usbhs_pipe *pipe, struct usbhs_pkt *pkt)
 		if (chan) {
 			dmaengine_terminate_all(chan);
 			usbhsf_dma_unmap(pkt);
+		} else {
+			if (usbhs_pipe_is_dir_in(pipe))
+				usbhsf_rx_irq_ctrl(pipe, 0);
+			else
+				usbhsf_tx_irq_ctrl(pipe, 0);
 		}
 
 		usbhs_pipe_clear_without_sequence(pipe, 0, 0);
-- 
2.25.1

