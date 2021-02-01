Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD030A7EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 13:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhBAMsM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 07:48:12 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:42688 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229707AbhBAMsL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 07:48:11 -0500
X-IronPort-AV: E=Sophos;i="5.79,392,1602514800"; 
   d="scan'208";a="70972009"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Feb 2021 21:47:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5684D427BD12;
        Mon,  1 Feb 2021 21:47:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Clear pipe running flag in usbhs_pkt_pop()
Date:   Mon,  1 Feb 2021 21:47:20 +0900
Message-Id: <1612183640-8898-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Should clear the pipe running flag in usbhs_pkt_pop(). Otherwise,
we cannot use this pipe after dequeue was called while the pipe was
running.

Reported-by: Tho Vu <tho.vu.wh@renesas.com>
Fixes: 8355b2b3082d ("usb: renesas_usbhs: fix the behavior of some usbhs_pkt_handle")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index ac9a81a..e6fa137 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -126,6 +126,7 @@ struct usbhs_pkt *usbhs_pkt_pop(struct usbhs_pipe *pipe, struct usbhs_pkt *pkt)
 		}
 
 		usbhs_pipe_clear_without_sequence(pipe, 0, 0);
+		usbhs_pipe_running(pipe, 0);
 
 		__usbhsf_pkt_del(pkt);
 	}
-- 
2.7.4

