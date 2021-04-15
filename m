Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57E43605F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 11:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhDOJga (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 05:36:30 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:19758 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbhDOJg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 05:36:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618479353; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HqFJF53dqlnv+6ca2ohTPNOp0F3B+mW19z6tdzKD4/WBca0MqJjUsNDrIJqSgMydwz
    Mn5UvuXapzrvC4bSXNQxseLvOAnOFKpGyznx1yADbKNmEBe1inAQZ4ZIKadNt4n9JtFU
    naD8TVz7skBDoqfDAaVXTPywWmuv+DIyfpwzYLq40iLdEJsj0mF6XE9VBEWNFCNBwh2h
    ByH3sAJ1SVZBJxDkQ89UfcaBPeOoUVrtqbGvtCFmm5MwTGacnzv8sXrchv1WxHWi44v+
    A5nRN0YUMfUbI6Mo/iFMFh338VsFdQVFTPM0ju4Q6/RUSJ9viLQRZCMkqMEQD7ZLFGkB
    0Zsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618479353;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=UszZM0lxzcT1TucYYh81PlY6CI1II6hKqZ0KtEwG5JI=;
    b=I88GP/dTB8qSBCb6mvoifbfw5nTYB7888Sbo0ZGQ6tZKu3t4qc8d6pitMcE2sp1FRp
    7IXVWd4QoOc8nXcGqIX2QWnvoh+p5XGxMJcbFCuTqQLBhWNoe7UcQakxMIyNtbZKI/4D
    0bBkhh4ZKcCs1G0HGiPHLyWLZggV+awwwmQONk5Bn40pHKVCbdg9v8efFYkaCQbynBC2
    HlhgYN+S5prqTdt7ZcqKrsiTqhfoOAwAfsbXxIwAz29ozPg0tYy2g3p6z+eKbNyStFX9
    BE3ZtxKTpeihn9FBVycOMNtOAl8QyUw5NkGLp8pHEdWDHTzw6kYo7OEYzBHSQMvHx1zK
    8edA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618479353;
    s=strato-dkim-0002; d=fpond.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=UszZM0lxzcT1TucYYh81PlY6CI1II6hKqZ0KtEwG5JI=;
    b=CD6w6g5CaHc2ffT8ZdvpFCXZx5X9SDd8UKDHJta4vKJchYk6fMQECfw3lE+gYcwX9U
    8Ntswg9SrWcoJ2seOFN8cbmwZ+EK/3uhFnSJCamqkq8UOe917Qhe6K8DGtGGue5mRTqw
    IeCe4UG7yMNV0eHR2CrYmjXq1Mhw9BlobdHQmT6wx9HjFaUcBXCRBu1oSG+VkSLFkKkJ
    Ev9f7QXIvQdWDLvpRHbN7G/ry07wa0Q0l39keI59SNLx+EnpEByMB82lkE8jxVctcXzt
    ogVDoA/DjeI6MUuTHq9ePSO7zzbr262bjQYgAGReCy1RN2qexwd2hkaYrkM9RvIUU4Tw
    /quA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82FSd93q"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
    by smtp.strato.de (RZmta 47.24.2 DYNA|AUTH)
    with ESMTPSA id Y0bfddx3F9Zr7wu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 15 Apr 2021 11:35:53 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     wsa@kernel.org, geert@linux-m68k.org,
        yoshihiro.shimoda.uh@renesas.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, linux-kernel@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] serial: sh-sci: remove obsolete latency workaround
Date:   Thu, 15 Apr 2021 11:35:47 +0200
Message-Id: <20210415093547.21639-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the transition to hrtimers there is no more need to set a minimum
RX timeout to work around latency issues.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/tty/serial/sh-sci.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e3af97a59856..ef37fdf37612 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2609,21 +2609,10 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		udelay(DIV_ROUND_UP(10 * 1000000, baud));
 	}
 
-	/*
-	 * Calculate delay for 2 DMA buffers (4 FIFO).
-	 * See serial_core.c::uart_update_timeout().
-	 * With 10 bits (CS8), 250Hz, 115200 baud and 64 bytes FIFO, the above
-	 * function calculates 1 jiffie for the data plus 5 jiffies for the
-	 * "slop(e)." Then below we calculate 5 jiffies (20ms) for 2 DMA
-	 * buffers (4 FIFO sizes), but when performing a faster transfer, the
-	 * value obtained by this formula is too small. Therefore, if the value
-	 * is smaller than 20ms, use 20ms as the timeout value for DMA.
-	 */
+	/* Calculate delay for 2 DMA buffers (4 FIFO). */
 	s->rx_frame = (10000 * bits) / (baud / 100);
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	s->rx_timeout = s->buf_len_rx * 2 * s->rx_frame;
-	if (s->rx_timeout < 20)
-		s->rx_timeout = 20;
 #endif
 
 	if ((termios->c_cflag & CREAD) != 0)
-- 
2.20.1

