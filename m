Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DE61F3B05
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgFIMqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbgFIMqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AB7C05BD1E;
        Tue,  9 Jun 2020 05:46:33 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2A9F18DB;
        Tue,  9 Jun 2020 14:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706792;
        bh=4//tYS7h1eeHKXDB8pvKQKTZW/4D6PifWzVG1mI1mXw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aZGKXShJKzKrdfWUePwrRQYjx3qGsI8ynhIjEY0lbZf1fh7WYu8GBw4+D2dvJe00Y
         qYWE4K2PUqCzneNsa+CoHYd70+tG3bSPdAbZWWLjNgwb0d+qk7NpdMAm3oq0I4srcn
         yYR07JNKvCTHnilbUsrH1xZuMMT3gVF+fxZ8ZoYA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <trivial@kernel.org>,
        linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/17] drivers: usb: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:46:00 +0100
Message-Id: <20200609124610.3445662-8-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/usb/core/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 651708d8c908..617e92569b2c 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -45,7 +45,7 @@ EXPORT_SYMBOL_GPL(usb_of_get_device_node);
  *
  * Determine whether a USB device has a so called combined node which is
  * shared with its sole interface. This is the case if and only if the device
- * has a node and its decriptors report the following:
+ * has a node and its descriptors report the following:
  *
  *	1) bDeviceClass is 0 or 9, and
  *	2) bNumConfigurations is 1, and
-- 
2.25.1

