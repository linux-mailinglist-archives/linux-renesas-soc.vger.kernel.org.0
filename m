Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7B86A4111
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 12:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjB0LmV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjB0LmO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:42:14 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0089F16337;
        Mon, 27 Feb 2023 03:42:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,331,1669042800"; 
   d="scan'208";a="150917511"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2023 20:42:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 78786422D85C;
        Mon, 27 Feb 2023 20:42:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 4/7] serial: 8250_em: Add missing break statement
Date:   Mon, 27 Feb 2023 11:41:49 +0000
Message-Id: <20230227114152.22265-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
References: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add missing break statement in serial8250_em_serial_out().

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/tty/serial/8250/8250_em.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 045a2110b5c5..621abca93694 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -42,6 +42,7 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
 	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
 		writel(value, p->membase + (offset << 2));
+		break;
 	}
 }
 
-- 
2.25.1

