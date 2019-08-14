Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069278CF72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 11:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfHNJ2G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 05:28:06 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:38304 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNJ2G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 05:28:06 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id oxTy2001705gfCL06xTyTT; Wed, 14 Aug 2019 11:28:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpZW-0003Up-QA; Wed, 14 Aug 2019 11:27:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpZW-0003aS-P4; Wed, 14 Aug 2019 11:27:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Richard Genoud <richard.genoud@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] serial: mxs-auart: Don't check for mctrl_gpio_to_gpiod() returning error
Date:   Wed, 14 Aug 2019 11:27:56 +0200
Message-Id: <20190814092757.13726-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814092757.13726-1-geert+renesas@glider.be>
References: <20190814092757.13726-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
routine"), mctrl_gpio_init() returns failure if the assignment to any
member of the gpio array results in an error pointer.
Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
!CONFIG_GPIOLIB case.
Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
returning an error value.  A simple NULL check is sufficient.

This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/mxs-auart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4c188f4079b3ea68..e3452597068292f9 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -969,10 +969,8 @@ static int mxs_auart_dma_init(struct mxs_auart_port *s)
 
 }
 
-#define RTS_AT_AUART()	IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(s->gpios,	\
-							UART_GPIO_RTS))
-#define CTS_AT_AUART()	IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(s->gpios,	\
-							UART_GPIO_CTS))
+#define RTS_AT_AUART()	!mctrl_gpio_to_gpiod(s->gpios, UART_GPIO_RTS)
+#define CTS_AT_AUART()	!mctrl_gpio_to_gpiod(s->gpios, UART_GPIO_CTS)
 static void mxs_auart_settermios(struct uart_port *u,
 				 struct ktermios *termios,
 				 struct ktermios *old)
-- 
2.17.1

