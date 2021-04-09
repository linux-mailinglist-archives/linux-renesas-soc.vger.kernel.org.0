Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5C13597E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 10:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhDIIcB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 04:32:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:18199 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbhDIIcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 04:32:00 -0400
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Apr 2021 04:31:59 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1617956734; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Vm0qmiTK1P4wWH5hHjDgZqjcmJWDVPPt47lVWMr95JnSAPa1leZxszzLG4Ezj0P0Zy
    q50lDAqbtlmoB6uWdRfb6wrbgrrz2suOlbVIiQ77gTjqsTJPw4sKGxAvCB5TI4XObKiH
    uDUlCNhT4lkbQfIaoalndxhT5ZsdA6pjcmiEq0cjtqfMmRr/lrFHKxq2YEohfdvh+nuo
    ydcWNIglcVm8mXzytCoc6195PHOjDQFyOUDnydyDaI0uXHf22kfpjMqlaRa7uG+NGdm0
    vI1mZNUZeCKxIN8kFynXZsjDQiR09Tl2xlrwDx7aN1amm/7ccRUUoX2nxlFMeRazY3cU
    TLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617956734;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=JA9ZhVIdO85h5dHltv/PyTiSB821MbxMWNA8kf6Yh4A=;
    b=iQNL7wsKsGBYl5yYI6xn59JTR4VvE7TM2N63yK2hBJdcov9OAXf9Fm+4SngYMWdMdq
    suLkjiJseUFC5rk/NEtrNJjrfdhLx6YKKzUX9Lv6dPEtDc8+kxsG3+p5oldyy/1SVGAD
    vfL0KyANbrumN3vdQVXmEvsTwMC1NkOkHug2I4IF6UWljXs2wd7G9rL5A+ptzd80jd1P
    xGUl+sqEVWfj4A+fcf+DMk0D0kWjZ2cUs8qgaESUcGuT0FzTXhyy4AGpVyXigqFpAtQF
    Gtd33nBQe6IGAd+M4Bp7HFc7MKk0nzK6OMu0ewbkipsPZSpMcM1sW2/rv5cWcaIpxpJP
    R/sA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617956734;
    s=strato-dkim-0002; d=fpond.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=JA9ZhVIdO85h5dHltv/PyTiSB821MbxMWNA8kf6Yh4A=;
    b=dL0T53naQkdlO1wcpWGrEXivVKPcJRtBT1/oNbMcih+S/0R6vBTBrXK59d0Qvi3EEo
    TssgxZl+N7gdK+9UNCA8hqYzmzc0gNY/816sFdiHhNnBEHpk2iIXPhi05HhR/hCFex/F
    B1xx31HeVbF/qVWlSYHhUp8Y1HVyB6CjC5Ve3/VmhD3GOpP7u9W18kjhARRSQbwABe5E
    az+JQEY1E5p5sgknsFAPtvphkhAHQ7aMikslfjVPih9UvbvGpwOm33IMHj32OIU12uej
    UPS1fssQjQ0uP7mJrimsfHExuB8TmB9vbEyUcvXfijnl9A7BgNFTnU2EBJEk7Qq9qTwN
    kKPA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82Zed8oDWqA="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
    by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
    with ESMTPSA id m01edax398PY8WT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 9 Apr 2021 10:25:34 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     wsa@kernel.org, geert@linux-m68k.org,
        yoshihiro.shimoda.uh@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] serial: sh-sci: correct units in comment about DMA timeout
Date:   Fri,  9 Apr 2021 10:25:24 +0200
Message-Id: <20210409082524.3480-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the transition to hrtimers, the calculation does not involve jiffies
any longer, which has led to confusion. State the times in ms instead.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/tty/serial/sh-sci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e3af97a59856..c4ce4cd120ba 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2613,11 +2613,11 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * Calculate delay for 2 DMA buffers (4 FIFO).
 	 * See serial_core.c::uart_update_timeout().
 	 * With 10 bits (CS8), 250Hz, 115200 baud and 64 bytes FIFO, the above
-	 * function calculates 1 jiffie for the data plus 5 jiffies for the
-	 * "slop(e)." Then below we calculate 5 jiffies (20ms) for 2 DMA
-	 * buffers (4 FIFO sizes), but when performing a faster transfer, the
-	 * value obtained by this formula is too small. Therefore, if the value
-	 * is smaller than 20ms, use 20ms as the timeout value for DMA.
+	 * function calculates 4ms for the data plus 20ms for the "slop(e)."
+	 * Then below we calculate 20ms for 2 DMA buffers (4 FIFO sizes),
+	 * but when performing a faster transfer, the value obtained by this
+	 * formula is too small. Therefore, if the value is smaller than
+	 * 20ms, use 20ms as the timeout value for DMA.
 	 */
 	s->rx_frame = (10000 * bits) / (baud / 100);
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
-- 
2.20.1

