Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62D369AAA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 12:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjBQLnX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjBQLnU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:43:20 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EEE15BDBD;
        Fri, 17 Feb 2023 03:43:19 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,304,1669042800"; 
   d="scan'208";a="153224482"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2023 20:43:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.177])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 085854002630;
        Fri, 17 Feb 2023 20:43:15 +0900 (JST)
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
Subject: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Date:   Fri, 17 Feb 2023 11:42:54 +0000
Message-Id: <20230217114255.226517-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
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

UART_FCR shares the same offset with UART_IIR. We cannot use
UART_FCR in serial8250_em_serial_in() as it overlaps with
UART_IIR.

This patch introduces a macro UART_FCR_EM with a high value to
avoid overlapping with existing UART_* register defines.

This will help us to use UART_FCR_EM consistently in serial8250_em_
serial{_in/_out} function to read/write FCR register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v4:
 * New patch. Used UART_FCR_EM for read/write of FCR register.
---
 drivers/tty/serial/8250/8250_em.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 499d7a8847ec..4165fd3bb17a 100644
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
@@ -29,12 +36,14 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 	case UART_TX: /* TX @ 0x00 */
 		writeb(value, p->membase);
 		break;
-	case UART_FCR: /* FCR @ 0x0c (+1) */
 	case UART_LCR: /* LCR @ 0x10 (+1) */
 	case UART_MCR: /* MCR @ 0x14 (+1) */
 	case UART_SCR: /* SCR @ 0x20 (+1) */
 		writel(value, p->membase + ((offset + 1) << 2));
 		break;
+	case UART_FCR_EM:
+		writel(value, p->membase + (UART_FCR_EM_HW << 2));
+		break;
 	case UART_IER: /* IER @ 0x04 */
 		value &= 0x0f; /* only 4 valid bits - not Xscale */
 		fallthrough;
@@ -54,6 +63,8 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
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

