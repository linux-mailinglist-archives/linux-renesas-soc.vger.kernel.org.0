Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED5E6A4117
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 12:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjB0LmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjB0LmU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:42:20 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D62B917CDB;
        Mon, 27 Feb 2023 03:42:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,331,1669042800"; 
   d="scan'208";a="150917523"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2023 20:42:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D25EE422F022;
        Mon, 27 Feb 2023 20:42:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 6/7] serial: 8250_em: Use pseudo offset for UART_FCR
Date:   Mon, 27 Feb 2023 11:41:51 +0000
Message-Id: <20230227114152.22265-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
References: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

UART_FCR shares the same offset with UART_IIR. We cannot use UART_FCR
in serial8250_em_serial_in() as it overlaps with UART_IIR.

Define UART_FCR_EM macro with a high value to avoid overlapping
with existing UART_* register defines and define another macro
UART_FCR_EM_HW for the real offset.

Use these macros in serial8250_em_serial{_in/_out} function to
read/write FCR register.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
 * Retained UART_FCR in serial8250_em_serial_out() and is removed
   from next patch.
v4:
 * New patch. Used UART_FCR_EM for read/write of FCR register.
---
 drivers/tty/serial/8250/8250_em.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index dcf1761e8ef5..7614ced9377e 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -19,6 +19,13 @@
 #define UART_DLL_EM 9
 #define UART_DLM_EM 10
 
+/*
+ * A high value for UART_FCR_EM avoids overlapping with existing UART_*
+ * register defines. UART_FCR_EM_HW is the real HW register offset.
+ */
+#define UART_FCR_EM 0x10003
+#define UART_FCR_EM_HW 3
+
 struct serial8250_em_priv {
 	int line;
 };
@@ -29,12 +36,15 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 	case UART_TX: /* TX @ 0x00 */
 		writeb(value, p->membase);
 		break;
-	case UART_FCR: /* FCR @ 0x0c (+1) */
 	case UART_LCR: /* LCR @ 0x10 (+1) */
 	case UART_MCR: /* MCR @ 0x14 (+1) */
 	case UART_SCR: /* SCR @ 0x20 (+1) */
 		writel(value, p->membase + ((offset + 1) << 2));
 		break;
+	case UART_FCR:
+	case UART_FCR_EM:
+		writel(value, p->membase + (UART_FCR_EM_HW << 2));
+		break;
 	case UART_IER: /* IER @ 0x04 */
 		value &= 0x0f; /* only 4 valid bits - not Xscale */
 		fallthrough;
@@ -55,6 +65,8 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
 	case UART_MSR: /* MSR @ 0x1c (+1) */
 	case UART_SCR: /* SCR @ 0x20 (+1) */
 		return readl(p->membase + ((offset + 1) << 2));
+	case UART_FCR_EM:
+		return readl(p->membase + (UART_FCR_EM_HW << 2));
 	case UART_IER: /* IER @ 0x04 */
 	case UART_IIR: /* IIR @ 0x08 */
 	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
-- 
2.25.1

