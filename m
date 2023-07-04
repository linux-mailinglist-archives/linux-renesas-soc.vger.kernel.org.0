Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3333B747596
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jul 2023 17:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbjGDPs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jul 2023 11:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjGDPs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 11:48:27 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E65A0E76;
        Tue,  4 Jul 2023 08:48:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,181,1684767600"; 
   d="scan'208";a="166818457"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jul 2023 00:48:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.53])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6D2674001DD4;
        Wed,  5 Jul 2023 00:48:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, stable@kernel.org
Subject: [PATCH] tty: serial: sh-sci: Fix sleeping in atomic context
Date:   Tue,  4 Jul 2023 16:48:18 +0100
Message-Id: <20230704154818.406913-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix sleeping in atomic context warning as reported by the Smatch static
checker tool by replacing disable_irq->disable_irq_nosync.

Reported by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 8749061be196 ("tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support")
Cc: stable@kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7c9457962a3d..8b7a42e05d6d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -590,7 +590,7 @@ static void sci_start_tx(struct uart_port *port)
 	    dma_submit_error(s->cookie_tx)) {
 		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			/* Switch irq from SCIF to DMA */
-			disable_irq(s->irqs[SCIx_TXI_IRQ]);
+			disable_irq_nosync(s->irqs[SCIx_TXI_IRQ]);
 
 		s->cookie_tx = 0;
 		schedule_work(&s->work_tx);
-- 
2.25.1

