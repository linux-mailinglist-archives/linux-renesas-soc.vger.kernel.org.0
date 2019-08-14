Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A90A8CF74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 11:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfHNJ2H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 05:28:07 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:60222 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNJ2H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 05:28:07 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id oxTy2000p05gfCL01xTyH5; Wed, 14 Aug 2019 11:28:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpZW-0003Um-PV; Wed, 14 Aug 2019 11:27:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpZW-0003aP-OG; Wed, 14 Aug 2019 11:27:58 +0200
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
Subject: [PATCH 1/3] serial: atmel: Don't check for mctrl_gpio_to_gpiod() returning error
Date:   Wed, 14 Aug 2019 11:27:55 +0200
Message-Id: <20190814092757.13726-2-geert+renesas@glider.be>
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
 drivers/tty/serial/atmel_serial.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 19a85d6fe3d20541..e9620a81166b7dc1 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -303,32 +303,28 @@ static unsigned int atmel_get_lines_status(struct uart_port *port)
 
 	mctrl_gpio_get(atmel_port->gpios, &ret);
 
-	if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
-						UART_GPIO_CTS))) {
+	if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS)) {
 		if (ret & TIOCM_CTS)
 			status &= ~ATMEL_US_CTS;
 		else
 			status |= ATMEL_US_CTS;
 	}
 
-	if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
-						UART_GPIO_DSR))) {
+	if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_DSR)) {
 		if (ret & TIOCM_DSR)
 			status &= ~ATMEL_US_DSR;
 		else
 			status |= ATMEL_US_DSR;
 	}
 
-	if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
-						UART_GPIO_RI))) {
+	if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_RI)) {
 		if (ret & TIOCM_RI)
 			status &= ~ATMEL_US_RI;
 		else
 			status |= ATMEL_US_RI;
 	}
 
-	if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
-						UART_GPIO_DCD))) {
+	if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_DCD)) {
 		if (ret & TIOCM_CD)
 			status &= ~ATMEL_US_DCD;
 		else
-- 
2.17.1

