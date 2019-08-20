Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D92595E37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfHTMQ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:16:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38393 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbfHTMQ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:16:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so3152119pga.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2019 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=e9VRMZXqyq7sz/0ScIoqDuF79yOjQta9bK1odfunp/I=;
        b=ADi0rULSniY/TMldFtio2giWS40QUvP1v/86i40hpoPA/OagYU02WTzOwnWSSSeaOq
         gRWXj1SZvpgNcKAcvCsnBvDnzmhLRecTuLkjQdZPJaAeQBLWTZP+xbsmMx5vmt6cwbVS
         4puYNXthyOGfMLQ7Xu4MOv0F/Ln40yLOiG4lpBzJF2q5SBjX2+zzA4mkUUndjyR/m/2F
         ltCczvcmDbZFPBq9vLOIMFZOowCeJ3MObxQRe/ilWUSSHQFyb4fz5M37zqpdeEuzOcb6
         /+tZM7ujE0VZ/N2x1Zo1NuAFDGHhjMBGQCK8CbbgkaTxb5KUDo0sZUoZJZ+HPJuAb64/
         zQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=e9VRMZXqyq7sz/0ScIoqDuF79yOjQta9bK1odfunp/I=;
        b=haKhcacIV+JNsg/lAEB1GhKFsddw2IVzxGuuOk216AY7C+x4flciTzkFJSHRaZxRfa
         NP/qmbBIxfPj4QV0vPHPY+8IFgZXwo9udKQdYak3ba903ssiQnIUczwg1qeRWbFGFsua
         SmIEuoI+zYBCmVKCpGDcN3piWAzC5geC05YslO4U5OhwrajfA/IWJuhsn+EfT2RA7GHI
         tDnJGHGCWiXNF7u7j5mFVFgIrqZjgB0SH4IURFTeM3kuDrGyKewuUSUsHl3+g2MeEXof
         1pPTMw18HSswydYtjYoNJphZj+5DSFFCtanFC07vkLR2OcRD2SVeppRp845VY3UGesyh
         +arg==
X-Gm-Message-State: APjAAAUvVl6WFzeH1iuKfrQ5onvf/viXkTv//RD26b8LQEOixUw2ONDC
        eqOn1zSY+Uy2JbO5MD/bWTIMqaTl
X-Google-Smtp-Source: APXvYqzSftPMoc9Hf5dA/6hTeCLMowVU8PbqaGSblpUgz+OkGzHJicenVMg2ehTLG6gL1pXCffJ/GA==
X-Received: by 2002:a63:f304:: with SMTP id l4mr17031851pgh.66.1566303415829;
        Tue, 20 Aug 2019 05:16:55 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id e6sm32279702pfl.37.2019.08.20.05.16.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:16:54 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>, geert@glider.be
Date:   Tue, 20 Aug 2019 21:18:35 +0900
Message-Id: <156630351537.24954.2550542042474735517.sendpatchset@octo>
Subject: [PATCH/RFC] serial: sh-sci: Update uartclk based on selected clock
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

I noticed that uartclk never gets updated as it is today.

This compile tested patch makes sure uartclk is in sync with
whatever clock is selected during sci_set_termios(). Exposing
the actual value to user space seems like a good plan to me.

Another semi-related issue:

The ->termios() callback in the SCIF driver seems to enable clocks using
runtine pm in sci_port_enable() followed by register accesses and
a before returnng sci_port_enable() disables clocks as well.

The ->pm() callback will enable the port again later on however
on SoCs where the SCIF is in a power domain it looks like the
register contents might get lost due to power down between ->termios()
and ->pm()?

Perhaps the power domain use case is known to be busted?

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/tty/serial/sh-sci.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--- 0001/drivers/tty/serial/sh-sci.c
+++ work/drivers/tty/serial/sh-sci.c	2019-08-20 20:32:17.680030451 +0900
@@ -129,6 +129,7 @@ struct sci_port {
 	/* Clocks */
 	struct clk		*clks[SCI_NUM_CLKS];
 	unsigned long		clk_rates[SCI_NUM_CLKS];
+	int			sel_clk;
 
 	int			irqs[SCIx_NR_IRQS];
 	char			*irqstr[SCIx_NR_IRQS];
@@ -542,7 +543,11 @@ static void sci_port_enable(struct sci_p
 		clk_prepare_enable(sci_port->clks[i]);
 		sci_port->clk_rates[i] = clk_get_rate(sci_port->clks[i]);
 	}
-	sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
+
+	if (sci_port->sel_clk >= 0)
+		sci_port->port.uartclk = sci_port->clk_rates[sci_port->sel_clk];
+	else
+		sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
 }
 
 static void sci_port_disable(struct sci_port *sci_port)
@@ -2472,6 +2477,7 @@ done:
 		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
 			s->clks[best_clk], baud, min_err);
 
+	s->sel_clk = best_clk;
 	sci_port_enable(s);
 
 	/*
@@ -2785,6 +2791,8 @@ static int sci_init_clocks(struct sci_po
 	struct clk *clk;
 	unsigned int i;
 
+	sci_port->sel_clk = -1; /* invalid */
+
 	if (sci_port->cfg->type == PORT_HSCIF)
 		clk_names[SCI_SCK] = "hsck";
 
