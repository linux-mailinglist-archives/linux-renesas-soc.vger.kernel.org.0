Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B6039DF04
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 16:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFGOpo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 10:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhFGOpm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 10:45:42 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A38EC061787
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 07:43:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2826:1cc7:8a57:d8e9])
        by laurent.telenet-ops.be with bizsmtp
        id EEjo250042r2Z3l01Ejo9i; Mon, 07 Jun 2021 16:43:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqGTj-00E2sI-JA; Mon, 07 Jun 2021 16:43:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqGTj-006xDj-52; Mon, 07 Jun 2021 16:43:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Remove unused STEPFN() macro
Date:   Mon,  7 Jun 2021 16:43:45 +0200
Message-Id: <970387d104dea5bb7ea674bb89229641467e629b.1623076891.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The last user of the STEPFN() macro was removed in commit
d5cb1319a91d4f13 ("serial: sh-sci: Remove manual break debouncing").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4baf1316ea729931..946c4bd920f48960 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -840,9 +840,6 @@ static void sci_transmit_chars(struct uart_port *port)
 
 }
 
-/* On SH3, SCIF may read end-of-break as a space->mark char */
-#define STEPFN(c)  ({int __c = (c); (((__c-1)|(__c)) == -1); })
-
 static void sci_receive_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
-- 
2.25.1

