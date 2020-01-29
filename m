Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F7A14CE21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 17:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgA2QUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 11:20:48 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:52933 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgA2QUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 11:20:48 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 074393C0579;
        Wed, 29 Jan 2020 17:20:46 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Azz6qmwHLR9N; Wed, 29 Jan 2020 17:20:40 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 12EE53C009E;
        Wed, 29 Jan 2020 17:20:40 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 29 Jan
 2020 17:20:39 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-serial@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "George G . Davis" <george_davis@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH] serial: sh-sci: Support custom speed setting
Date:   Wed, 29 Jan 2020 17:19:55 +0100
Message-ID: <20200129161955.30562-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Torii Kenichi <torii.ken1@jp.fujitsu.com>

This patch is necessary to use BT module and XM module with DENSO TEN
development board.

This patch supports ASYNC_SPD_CUST flag by ioctl(TIOCSSERIAL), enables
custom speed setting with setserial(1).

The custom speed is calculated from uartclk and custom_divisor.
If custom_divisor is zero, custom speed setting is invalid.

Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
[erosca: rebase against v5.5]
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/tty/serial/sh-sci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 87ca6294de0e..dd468909b2c4 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2405,6 +2405,10 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (!baud)
 		goto done;
 
+	if (baud == 38400 && (port->flags & UPF_SPD_MASK) == UPF_SPD_CUST &&
+	    port->custom_divisor)
+		baud = port->uartclk / port->custom_divisor;
+
 	/*
 	 * There can be multiple sources for the sampling clock.  Find the one
 	 * that gives us the smallest deviation from the desired baud rate.
-- 
2.25.0

