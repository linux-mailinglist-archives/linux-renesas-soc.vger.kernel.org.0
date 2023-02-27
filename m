Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF46A4108
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 12:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjB0LmD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjB0LmC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:42:02 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A4C2166C2;
        Mon, 27 Feb 2023 03:42:00 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,331,1669042800"; 
   d="scan'208";a="154220822"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2023 20:41:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3198E422D85C;
        Mon, 27 Feb 2023 20:41:54 +0900 (JST)
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
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/7] Update Renesas {EMMA mobile, RZ/V2M} UART Port type
Date:   Mon, 27 Feb 2023 11:41:45 +0000
Message-Id: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas {EMMA mobile, RZ/V2M} UART compatible with the general-purpose
16750 UART chip. This patch updates Renesas {EMMA mobile, RZ/V2M} UART type
from 16550a->16750 and also enables 64-bytes fifo.

This patch series also simplifies 8250_em_probe() and also updates the
register handling for the below restriction mentioned in the hardware
manual.

40.6.1 Point for Caution when Changing the Register Settings:

When changing the settings of the following registers, a PRESETn master
reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
re-initialize them.

Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.

v4->v5:
 Ref: https://lore.kernel.org/linux-renesas-soc/20230217114255.226517-1-biju.das.jz@bp.renesas.com/T/#t 
 
 * Added fixes tag and reordered the patch (from patch#4 to patch#1) to make
   it easier for applying it to stable branches.
 * Updated commit header and descriptions.
 * Removed UPF_BOOT_AUTOCONF from flags.
 * Created a new patch for adding missing break statement in
   serial8250_em_serial_out().
 * On patch#6, retained UART_FCR in serial8250_em_serial_out().
 * Dropped UART_FCR from serial8250_em_serial_out_helper() as it is handled in
   serial8250_em_serial_out().
 * Fixed code alignment in serial8250_em_reg_update()
 * Added missing break statements.
v3->v4:
 * Split patch#1 to 3 patches and removed Rb tags.
 * Replaced dev_err->dev_err_probe() in probe()
 * Added a local variable 'dev' to replace '&pdev->dev' in probe().
 * Patch#2 removes unused header file slab.h.
 * Patch#3 simplifies clk handling in probe()/remove()
 * Removed sclk from struct serial8250_em_priv instead used local
   variable in probe()
 * Replaced devm_clk_get->devm_clk_get_enabled() and removed
   clk_prepare_enable/clk_disable_unprepare from probe()/remove().
 * Both {RZ/V2M, EMMA mobile} SoC is Register-compatible
   with the general-purpose 16750 UART chip. So started using
   generic compatible and removed struct serial8250_em_hw_info.
 * Introduced pseudo offset for UART_FCR(UART_FCR_EM) and used
   UART_FCR_EM in serial8250_em_serial{_in/_out} function to read/write
   FCR register.
 * Updated register update restriction to EMMA mobile SoC as well.
 * Replaced readl->serial8250_em_serial_in() for reading fcr register
   in serial8250_em_reg_update().
 * Added serial8250_em_serial_out_helper() to simplify the
   code and used for register writes in serial8250_em_reg_update().
v2->v3:
 * Dropped sclk from priv.
 * Dropped unneeded clk_disable_unprepare from remove().
 * Retained Rb tags from Geert,Andy and Ilpo as the changes are trivial.
 * Replaced of_device_get_match_data->device_get_match_data
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

Biju Das (7):
  serial: 8250_em: Fix UART port type
  serial: 8250_em: Simplify probe()
  serial: 8250_em: Drop unused header file
  serial: 8250_em: Add missing break statement
  serial: 8250_em: Use devm_clk_get_enabled()
  serial: 8250_em: Use pseudo offset for UART_FCR
  serial: 8250_em: Add serial8250_em_{reg_update(),out_helper()}

 drivers/tty/serial/8250/8250_em.c | 117 +++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 25 deletions(-)

-- 
2.25.1

