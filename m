Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A77B1FF158
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 14:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgFRMLd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 08:11:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34169 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727873AbgFRML1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 08:11:27 -0400
X-IronPort-AV: E=Sophos;i="5.73,526,1583161200"; 
   d="scan'208";a="49805309"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jun 2020 21:11:26 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7F7004231AA8;
        Thu, 18 Jun 2020 21:11:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: getting residue from callback_result
Date:   Thu, 18 Jun 2020 21:11:17 +0900
Message-Id: <1592482277-19563-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This driver assumed that dmaengine_tx_status() could return
the residue even if the transfer was completed. However,
this was not correct usage [1] and this caused to break getting
the residue after the commit 24461d9792c2 ("dmaengine:
virt-dma: Fix access after free in vchan_complete()") actually.
So, this is possible to get wrong received size if the usb
controller gets a short packet. For example, g_zero driver
causes "bad OUT byte" errors.

The usb-dmac driver will support the callback_result, so this
driver can use it to get residue correctly. Note that even if
the usb-dmac driver has not supported the callback_result yet,
this patch doesn't cause any side-effects.

[1]
https://lore.kernel.org/dmaengine/20200616165550.GP2324254@vkoul-mobl/

Reported-by: Hien Dang <hien.dang.eb@renesas.com>
Fixes: 24461d9792c2 ("dmaengine: virt-dma: Fix access after free in vchan_complete()")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 23 +++++++++++++----------
 drivers/usb/renesas_usbhs/fifo.h |  2 +-
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 01c6a48..ac9a81a 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -803,7 +803,8 @@ static int __usbhsf_dma_map_ctrl(struct usbhs_pkt *pkt, int map)
 	return info->dma_map_ctrl(chan->device->dev, pkt, map);
 }
 
-static void usbhsf_dma_complete(void *arg);
+static void usbhsf_dma_complete(void *arg,
+				const struct dmaengine_result *result);
 static void usbhsf_dma_xfer_preparing(struct usbhs_pkt *pkt)
 {
 	struct usbhs_pipe *pipe = pkt->pipe;
@@ -813,6 +814,7 @@ static void usbhsf_dma_xfer_preparing(struct usbhs_pkt *pkt)
 	struct dma_chan *chan;
 	struct device *dev = usbhs_priv_to_dev(priv);
 	enum dma_transfer_direction dir;
+	dma_cookie_t cookie;
 
 	fifo = usbhs_pipe_to_fifo(pipe);
 	if (!fifo)
@@ -827,11 +829,11 @@ static void usbhsf_dma_xfer_preparing(struct usbhs_pkt *pkt)
 	if (!desc)
 		return;
 
-	desc->callback		= usbhsf_dma_complete;
-	desc->callback_param	= pipe;
+	desc->callback_result	= usbhsf_dma_complete;
+	desc->callback_param	= pkt;
 
-	pkt->cookie = dmaengine_submit(desc);
-	if (pkt->cookie < 0) {
+	cookie = dmaengine_submit(desc);
+	if (cookie < 0) {
 		dev_err(dev, "Failed to submit dma descriptor\n");
 		return;
 	}
@@ -1152,12 +1154,10 @@ static size_t usbhs_dma_calc_received_size(struct usbhs_pkt *pkt,
 					   struct dma_chan *chan, int dtln)
 {
 	struct usbhs_pipe *pipe = pkt->pipe;
-	struct dma_tx_state state;
 	size_t received_size;
 	int maxp = usbhs_pipe_get_maxpacket(pipe);
 
-	dmaengine_tx_status(chan, pkt->cookie, &state);
-	received_size = pkt->length - state.residue;
+	received_size = pkt->length - pkt->dma_result->residue;
 
 	if (dtln) {
 		received_size -= USBHS_USB_DMAC_XFER_SIZE;
@@ -1363,13 +1363,16 @@ static int usbhsf_irq_ready(struct usbhs_priv *priv,
 	return 0;
 }
 
-static void usbhsf_dma_complete(void *arg)
+static void usbhsf_dma_complete(void *arg,
+				const struct dmaengine_result *result)
 {
-	struct usbhs_pipe *pipe = arg;
+	struct usbhs_pkt *pkt = arg;
+	struct usbhs_pipe *pipe = pkt->pipe;
 	struct usbhs_priv *priv = usbhs_pipe_to_priv(pipe);
 	struct device *dev = usbhs_priv_to_dev(priv);
 	int ret;
 
+	pkt->dma_result = result;
 	ret = usbhsf_pkt_handler(pipe, USBHSF_PKT_DMA_DONE);
 	if (ret < 0)
 		dev_err(dev, "dma_complete run_error %d : %d\n",
diff --git a/drivers/usb/renesas_usbhs/fifo.h b/drivers/usb/renesas_usbhs/fifo.h
index 7d3700b..039a2b9 100644
--- a/drivers/usb/renesas_usbhs/fifo.h
+++ b/drivers/usb/renesas_usbhs/fifo.h
@@ -50,7 +50,7 @@ struct usbhs_pkt {
 		     struct usbhs_pkt *pkt);
 	struct work_struct work;
 	dma_addr_t dma;
-	dma_cookie_t cookie;
+	const struct dmaengine_result *dma_result;
 	void *buf;
 	int length;
 	int trans;
-- 
2.7.4

