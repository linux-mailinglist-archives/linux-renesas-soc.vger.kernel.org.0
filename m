Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFFD8CF84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 11:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfHNJ3d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 05:29:33 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37476 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHNJ3d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 05:29:33 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id oxVS2000505gfCL01xVSG2; Wed, 14 Aug 2019 11:29:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpaw-0003VL-38; Wed, 14 Aug 2019 11:29:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpaw-0003cH-0F; Wed, 14 Aug 2019 11:29:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Richard Genoud <richard.genoud@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] serial: Don't check for mctrl_gpio_to_gpiod() returning error
Date:   Wed, 14 Aug 2019 11:29:21 +0200
Message-Id: <20190814092924.13857-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814092757.13726-1-geert+renesas@glider.be>
References: <20190814092757.13726-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Greg, Jiri,

Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
routine"), mctrl_gpio_init() returns failure if the assignment to any
member of the gpio array results in an error pointer.
Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
!CONFIG_GPIOLIB case.
Hence there is no longer a need to check in serial drivers if
mctrl_gpio_to_gpiod() returns an error value.  A simple NULL check is
sufficient.

This series follows the spirit of commit 445df7ff3fd1a0a9 ("serial:
mctrl-gpio: drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.

Thanks!

Geert Uytterhoeven (3):
  serial: atmel: Don't check for mctrl_gpio_to_gpiod() returning error
  serial: mxs-auart: Don't check for mctrl_gpio_to_gpiod() returning
    error
  serial: sh-sci: Don't check for mctrl_gpio_to_gpiod() returning error

 drivers/tty/serial/atmel_serial.c | 12 ++++--------
 drivers/tty/serial/mxs-auart.c    |  6 ++----
 drivers/tty/serial/sh-sci.c       | 12 +++++-------
 3 files changed, 11 insertions(+), 19 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
