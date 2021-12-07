Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556E946B118
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 03:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhLGC5z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 21:57:55 -0500
Received: from lists.levonline.com ([217.70.32.42]:46693 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbhLGC5z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 21:57:55 -0500
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id DE6A23A0DC5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Dec 2021 03:48:22 +0100 (CET)
X-SA-score: -1
X-Halon-ID: fb484dcd-5708-11ec-a618-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id fb484dcd-5708-11ec-a618-0050568168d4;
        Tue, 07 Dec 2021 03:54:22 +0100 (CET)
Received: from [127.0.0.1] (g1-27-253-251-253.bmobile.ne.jp [27.253.251.253])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 1B72sIp5004314;
        Tue, 7 Dec 2021 03:54:19 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-serial@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, jirislaby@kernel.org
Date:   Tue, 07 Dec 2021 11:02:20 +0900
Message-Id: <163884254093.18109.2982470198301927679.sendpatchset@octo>
Subject: [PATCH] serial: sh-sci: Remove BREAK/FRAME/PARITY/OVERRUN printouts
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update the SCIF serial driver to remove printouts for break, frame, parity
and overrun errors. This reduces the amount of console printouts generated
by the defconfig kernel on R-Car Gen3 for certain use cases. To retrieve
more information about such errors the user may inspect counters. Also these
errors are fed into the TTY layer for further application specific handling.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies to v5.16-rc4

 Previous version sent as:
 [PATCH] serial: sh-sci: Use dev_dbg() for frame and parity errors

 drivers/tty/serial/sh-sci.c |   12 ------------
 1 file changed, 12 deletions(-)

--- 0001/drivers/tty/serial/sh-sci.c
+++ work/drivers/tty/serial/sh-sci.c	2021-12-07 10:37:45.974123374 +0900
@@ -895,11 +895,9 @@ static void sci_receive_chars(struct uar
 				if (status & SCxSR_FER(port)) {
 					flag = TTY_FRAME;
 					port->icount.frame++;
-					dev_notice(port->dev, "frame error\n");
 				} else if (status & SCxSR_PER(port)) {
 					flag = TTY_PARITY;
 					port->icount.parity++;
-					dev_notice(port->dev, "parity error\n");
 				} else
 					flag = TTY_NORMAL;
 
@@ -939,8 +937,6 @@ static int sci_handle_errors(struct uart
 		/* overrun error */
 		if (tty_insert_flip_char(tport, 0, TTY_OVERRUN))
 			copied++;
-
-		dev_notice(port->dev, "overrun error\n");
 	}
 
 	if (status & SCxSR_FER(port)) {
@@ -949,8 +945,6 @@ static int sci_handle_errors(struct uart
 
 		if (tty_insert_flip_char(tport, 0, TTY_FRAME))
 			copied++;
-
-		dev_notice(port->dev, "frame error\n");
 	}
 
 	if (status & SCxSR_PER(port)) {
@@ -959,8 +953,6 @@ static int sci_handle_errors(struct uart
 
 		if (tty_insert_flip_char(tport, 0, TTY_PARITY))
 			copied++;
-
-		dev_notice(port->dev, "parity error\n");
 	}
 
 	if (copied)
@@ -990,8 +982,6 @@ static int sci_handle_fifo_overrun(struc
 
 		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
 		tty_flip_buffer_push(tport);
-
-		dev_dbg(port->dev, "overrun error\n");
 		copied++;
 	}
 
@@ -1013,8 +1003,6 @@ static int sci_handle_breaks(struct uart
 		/* Notify of BREAK */
 		if (tty_insert_flip_char(tport, 0, TTY_BREAK))
 			copied++;
-
-		dev_dbg(port->dev, "BREAK detected\n");
 	}
 
 	if (copied)
