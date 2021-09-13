Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289B04082EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 04:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbhIMCsr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Sep 2021 22:48:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57175 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235364AbhIMCsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Sep 2021 22:48:46 -0400
X-IronPort-AV: E=Sophos;i="5.85,288,1624287600"; 
   d="scan'208";a="93730201"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Sep 2021 11:47:30 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 71D25400966A;
        Mon, 13 Sep 2021 11:47:30 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: legacy: audio: add c_sync parameter
Date:   Mon, 13 Sep 2021 11:47:23 +0900
Message-Id: <20210913024723.1334206-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The commit 40c73b30546e ("usb: gadget: f_uac2: add adaptive sync
support for capture") supported 'c_sync' for configfs file.
To configure the 'c_sync' via legacy audio driver, add c_sync
parameter. And then, we can change the 'c_sync' to 'ADAPTIVE' like
below:

    modprobe g_audio c_sync=8

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/legacy/audio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index a748ed0842e8..f9765bf63006 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -49,6 +49,11 @@ MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
 static int c_ssize = UAC2_DEF_CSSIZE;
 module_param(c_ssize, uint, S_IRUGO);
 MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
+
+/* Capture Default ASYNC */
+static int c_sync = UAC2_DEF_CSYNC;
+module_param(c_sync, uint, S_IRUGO);
+MODULE_PARM_DESC(c_sync, "Capture Sync Type");
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
 #include "u_uac1.h"
@@ -268,6 +273,8 @@ static int audio_bind(struct usb_composite_dev *cdev)
 	uac2_opts->c_chmask = c_chmask;
 	uac2_opts->c_srate = c_srate;
 	uac2_opts->c_ssize = c_ssize;
+	if (c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
+		uac2_opts->c_sync = c_sync;
 	uac2_opts->req_number = UAC2_DEF_REQ_NUM;
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
-- 
2.25.1

