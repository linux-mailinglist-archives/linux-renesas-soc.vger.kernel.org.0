Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F1A6909D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 14:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjBIN0u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 08:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjBIN0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 08:26:48 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4D6755E49;
        Thu,  9 Feb 2023 05:26:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,283,1669042800"; 
   d="scan'208";a="149040862"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Feb 2023 22:26:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 047C54334957;
        Thu,  9 Feb 2023 22:26:35 +0900 (JST)
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
Subject: [PATCH 0/3] Add Identification and 64 bit fifo support to Renesas RZ/V2M 16750 UART
Date:   Thu,  9 Feb 2023 13:26:27 +0000
Message-Id: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add identification and 64 bit fifo support to Renesas RZ/V2M 16750 UART.
This patch series also simplifies 8250_em_probe() and also updates the
RZ/V2M specific register handling for the below restriction mentioned in
hardware manual

40.6.1 Point for Caution when Changing the Register Settings:

When changing the settings of the following registers, a PRESETn master
reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
re-initialize them.

Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.

Biju Das (3):
  serial: 8250: Identify Renesas RZ/V2M 16750 UART
  serial: 8250_em: Use dev_err_probe()
  serial: 8250_em: Add serial8250_rzv2m_reg_update()

 drivers/tty/serial/8250/8250_em.c   | 70 +++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_port.c | 27 +++++++++++
 2 files changed, 84 insertions(+), 13 deletions(-)

-- 
2.25.1

