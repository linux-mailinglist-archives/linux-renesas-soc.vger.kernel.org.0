Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CFD3EDAD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Aug 2021 18:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhHPQWy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Aug 2021 12:22:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:14360 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhHPQWy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 12:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629130933;
    s=strato-dkim-0002; d=fpond.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=C/0nH6ifDkBh3BoEywEeuFHDG3Pap+r2x1iLKRjufJY=;
    b=WBHN1wfnxzhSul4MSrFgFpTK6ZD20uOL8Fwepb6IsX+WpTP7SqlfEfcSZBdrVKs20e
    bHtiipPQw+NH5XOG759rOCR/xO/Au3oLSCEPQptB62JCYJzn5r/sDpdH/qWXHiC+KhAe
    LRadz4ElN3PbzZtz14K1xKEKMpeES+EX+mCZTfjoehHDQUA82vEKCAWaKtkRoJoOG1rN
    g1v/6RUQsL73xdiCfoKSteFjq8KkOCSlAdcByk9vuYcdbr4TkjiCXGtwJ1neO+NTQLjy
    GQRQUse9WKoQuZkBUWVSsLLHrDU0C37BNnmw0BPjne0O+cMBBOb1sM1VLHVBJX00BqzP
    4bBA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR92tEa+WwYg=="
X-RZG-CLASS-ID: mo00
Received: from gummo.local
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id v006c2x7GGMCmQO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 16 Aug 2021 18:22:12 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     wsa@kernel.org, geert@linux-m68k.org,
        yoshihiro.shimoda.uh@renesas.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, linux-kernel@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] serial: sh-sci: fix break handling for sysrq
Date:   Mon, 16 Aug 2021 18:22:01 +0200
Message-Id: <20210816162201.28801-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This fixes two issues that cause the sysrq sequence to be inadvertently
aborted on SCIF serial consoles:

- a NUL character remains in the RX queue after a break has been detected,
  which is then passed on to uart_handle_sysrq_char()
- the break interrupt is handled twice on controllers with multiplexed ERI
  and BRI interrupts

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/tty/serial/sh-sci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 07eb56294371..89ee43061d3a 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1758,6 +1758,10 @@ static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 
 	/* Handle BREAKs */
 	sci_handle_breaks(port);
+
+	/* drop invalid character received before break was detected */
+	serial_port_in(port, SCxRDR);
+
 	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
 
 	return IRQ_HANDLED;
@@ -1837,7 +1841,8 @@ static irqreturn_t sci_mpxed_interrupt(int irq, void *ptr)
 		ret = sci_er_interrupt(irq, ptr);
 
 	/* Break Interrupt */
-	if ((ssr_status & SCxSR_BRK(port)) && err_enabled)
+	if (s->irqs[SCIx_ERI_IRQ] != s->irqs[SCIx_BRI_IRQ] &&
+	    (ssr_status & SCxSR_BRK(port)) && err_enabled)
 		ret = sci_br_interrupt(irq, ptr);
 
 	/* Overrun Interrupt */
-- 
2.20.1

