Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EB23305B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 02:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhCHB4F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Mar 2021 20:56:05 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:8779 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232302AbhCHBzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Mar 2021 20:55:44 -0500
X-IronPort-AV: E=Sophos;i="5.81,231,1610377200"; 
   d="scan'208";a="74141289"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Mar 2021 10:55:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3D2E34009BE9;
        Mon,  8 Mar 2021 10:55:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Clear PIPECFG for re-enabling pipe with other EPNUM
Date:   Mon,  8 Mar 2021 10:55:38 +0900
Message-Id: <1615168538-26101-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the datasheet, this controller has a restriction
which "set an endpoint number so that combinations of the DIR bit and
the EPNUM bits do not overlap.". However, since the udc core driver is
possible to assign a bulk pipe as an interrupt endpoint, an endpoint
number may not match the pipe number. After that, when user rebinds
another gadget driver, this driver broke the restriction because
the driver didn't clear any configuration in usb_ep_disable().

Example:
 # modprobe g_ncm
 Then, EP3 = pipe 3, EP4 = pipe 4, EP5 = pipe 6
 # rmmod g_ncm
 # modprobe g_hid
 Then, EP3 = pipe 6, EP4 = pipe 7.
 So, pipe 3 and pipe 6 are set as EP3.

So, clear PIPECFG register in usbhs_pipe_free().

Fixes: dfb87b8bfe09 ("usb: renesas_usbhs: gadget: fix re-enabling pipe without re-connecting")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/pipe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/pipe.c b/drivers/usb/renesas_usbhs/pipe.c
index e7334b7..75fff2e 100644
--- a/drivers/usb/renesas_usbhs/pipe.c
+++ b/drivers/usb/renesas_usbhs/pipe.c
@@ -746,6 +746,8 @@ struct usbhs_pipe *usbhs_pipe_malloc(struct usbhs_priv *priv,
 
 void usbhs_pipe_free(struct usbhs_pipe *pipe)
 {
+	usbhsp_pipe_select(pipe);
+	usbhsp_pipe_cfg_set(pipe, 0xFFFF, 0);
 	usbhsp_put_pipe(pipe);
 }
 
-- 
2.7.4

