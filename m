Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2F07C20C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfGaMqA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 08:46:00 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:58904 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfGaMqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 08:46:00 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id jQly2000K05gfCL01Qlypx; Wed, 31 Jul 2019 14:45:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsnzS-0000QG-DY; Wed, 31 Jul 2019 14:45:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsnzS-0003kB-B0; Wed, 31 Jul 2019 14:45:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Joe Perches <joe@perches.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Use DEVICE_ATTR_RW() for rx_fifo_trigger
Date:   Wed, 31 Jul 2019 14:45:55 +0200
Message-Id: <20190731124555.14349-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While commit b6b996b6cdeecf7e ("treewide: Use DEVICE_ATTR_RW") converted
the rx_fifo_timeout attribute, it forgot to convert rx_fifo_trigger due
to a slightly different function naming.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d18c680aa64b3427..57638175639e0f3f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1092,9 +1092,8 @@ static void rx_fifo_timer_fn(struct timer_list *t)
 	scif_set_rtrg(port, 1);
 }
 
-static ssize_t rx_trigger_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buf)
+static ssize_t rx_fifo_trigger_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct uart_port *port = dev_get_drvdata(dev);
 	struct sci_port *sci = to_sci_port(port);
@@ -1102,10 +1101,9 @@ static ssize_t rx_trigger_show(struct device *dev,
 	return sprintf(buf, "%d\n", sci->rx_trigger);
 }
 
-static ssize_t rx_trigger_store(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf,
-				size_t count)
+static ssize_t rx_fifo_trigger_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct uart_port *port = dev_get_drvdata(dev);
 	struct sci_port *sci = to_sci_port(port);
@@ -1123,7 +1121,7 @@ static ssize_t rx_trigger_store(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(rx_fifo_trigger, 0644, rx_trigger_show, rx_trigger_store);
+static DEVICE_ATTR_RW(rx_fifo_trigger);
 
 static ssize_t rx_fifo_timeout_show(struct device *dev,
 			       struct device_attribute *attr,
-- 
2.17.1

