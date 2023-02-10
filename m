Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C8B692868
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 21:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbjBJUgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 15:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233858AbjBJUex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 15:34:53 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 241FF57775;
        Fri, 10 Feb 2023 12:34:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,287,1669042800"; 
   d="scan'208";a="149208010"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Feb 2023 05:34:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B08504002652;
        Sat, 11 Feb 2023 05:34:41 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] Update Renesas RZ/V2M UART Port type
Date:   Fri, 10 Feb 2023 20:34:36 +0000
Message-Id: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RZ/V2M UART compatible with the general-purpose 16750 UART chip.
This patch updates Renesas RZ/V2M UART type from 16550a->16750 and also
enables 64-bytes fifo.

This patch series also simplifies 8250_em_probe() and also updates the
RZ/V2M specific register handling for the below restriction mentioned in
hardware manual

40.6.1 Point for Caution when Changing the Register Settings:

When changing the settings of the following registers, a PRESETn master
reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
re-initialize them.

Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.

v2->v3:
 * Dropped sclk from priv.
 * Dropped unneeded clk_disable_unprepare from remove().
 * Retained Rb tags from Geert,Andy and Ilpo as the changes are trivial.
 * Replaced of_device_get_match_data()->device_get_match_data().
 * Replaced of_device.h->property.h
 * Dropped struct serial8250_em_hw_info *info from priv and started
   using a local variable info in probe().
 * Retained Rb tag from Ilpo as changes are trivial.
 * Replaced readl/writel()->serial8250_em_serial_in/out() in serial8250_rzv2m_
   reg_update() to avoid duplication of offset trickery.
 * Added support for HCR0 read/write in serial8250_em_{serial_in, serial_out}
 * Added UART_LCR macro support in serial8250_em_serial_in() to read LCR
 * Reordered serial8250_em_{serial_in, serial_out} above serial8250_rzv2m_
   reg_update().
 * Replaced priv->info->serial_out to info->serial_out.
v1->v2:
 * Dropped patch#1 from previous series
 * Replaced devm_clk_get->devm_clk_get_enabled() and updated clk
   handling in probe().
 * Added Rb tag from Geert.
 * Added patch for updating Renesas RZ/V2M UART type from 16550a->16750
   and also enables 64-bytes fifo.
 * Used .data for taking h/w differences between EMMA mobile and RZ/V2M UART.
 * Added serial_out() to struct serial8250_em_hw_info for the write register
   differences between EMMA mobile and RZ/V2M UART.
Biju Das (3):
  serial: 8250_em: Use dev_err_probe()
  serial: 8250_em: Update RZ/V2M port type as PORT_16750
  serial: 8250_em: Add serial_out() to struct serial8250_em_hw_info

 drivers/tty/serial/8250/8250_em.c | 128 ++++++++++++++++++++++++------
 1 file changed, 102 insertions(+), 26 deletions(-)

-- 
2.25.1

