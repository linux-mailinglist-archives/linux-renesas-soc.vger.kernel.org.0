Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 562BB4FF0F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiDMHyf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiDMHyZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:25 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B78B2AE2C;
        Wed, 13 Apr 2022 00:52:04 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 10782FF810;
        Wed, 13 Apr 2022 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ztyJne0y0/TSy9v0FjT+fUaJtw1cqvrXX9p35RiGCYo=;
        b=VeOjEjQH9ot6v49H2REcBEl9xmHBbVoYPnsZqGvRouMMm+6giFano1gTlPfrqQnP5GBF/G
        ZRwDC+8PS5vJiAxto/j4YfF65r7lQYnEpuPvGt8PqlsJNcHv5ET5XxPS/O3+8jSjyqdB9G
        XFhYorCHwgIwq0ecJv+3WuMRaBLgzcOOWJMafONYuTsSK7DiWZym1tfQVx5oq6BnQMTMYg
        /0OYiR3F5Dg4qO+2CUiBTQEDmeXCbBDttGYixWinVpn1A11FPyXnnx4NueZO0XoK8pS8zd
        m0simKkmyQE6pIlHyJGtzvum6g8N2jzsX68zI8JFO7saFJ1D9dzk8dCgI0mAiA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v5 10/11] serial: 8250: dw: Improve RZN1 support
Date:   Wed, 13 Apr 2022 09:51:40 +0200
Message-Id: <20220413075141.72777-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220413075141.72777-1-miquel.raynal@bootlin.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

Renesas RZ/N1 SoC features a slightly modified DW UART.

On this SoC, the CPR register value is known but not synthetized in
hardware. We hence need to provide a CPR value in the platform
data. This version of the controller also relies on acting as flow
controller when using DMA, so we need to provide the
"is dma flow controller" quirk.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index f8e762e3ef0f..a4f46456677c 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -761,6 +761,8 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_IS_DMA_FC,
+	.cpr = 0x00012f32,
 };
 
 static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
-- 
2.27.0

