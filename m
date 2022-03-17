Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC8B4DCCCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiCQRsI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237084AbiCQRr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:47:56 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35CC1EE8EC;
        Thu, 17 Mar 2022 10:46:39 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E27A5FF80A;
        Thu, 17 Mar 2022 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ujaBaGXFtDM/NjNrc3TChSe0Mm8wiA7Xo0TOjO6Y0E=;
        b=PonD/FVUmYjHrLWWSt+10OKtIOi4AmiSobWLhobkIxZ8KHqdb6s+9xxJnzPQdtAaPjCccu
        /dL4y1zUbXKpLn6yGFXVUeXa0CaMRVjxNoPYy4s6UrVeA99TuIDPT9R4aAjP7er17gjrkv
        EQwKajp9aYxOV9NKzScvc44EB1TsHOjas7g+EkA1dDXMGqKKkoqCXjf5llw/hKWwUCSuow
        d4HV/zH5AJceoaCoZeHqb6XbWKGsR1AedQj4KqgsDf3lSXNfISWyWA1fSm25xS2kHzfsby
        A/+8r0wkSj5Vczgu1wgvSzgvPgGxsKKaGqk1Io80HvWkGT7KgfgpdR85DdWRYA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-serial@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 04/10] serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
Date:   Thu, 17 Mar 2022 18:46:21 +0100
Message-Id: <20220317174627.360815-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317174627.360815-1-miquel.raynal@bootlin.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
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

DW UART controllers can be synthesized without the CPR register.
In this case, allow to the platform information to provide a CPR value.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 4 ++++
 drivers/tty/serial/8250/8250_dwlib.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 622d3b0d89e7..cef20ca3ad61 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -5,6 +5,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 
@@ -90,6 +91,7 @@ EXPORT_SYMBOL_GPL(dw8250_do_set_termios);
 void dw8250_setup_port(struct uart_port *p)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
+	const struct dw8250_platform_data *pdata = device_get_match_data(up->port.dev);
 	u32 reg;
 
 	/*
@@ -116,6 +118,8 @@ void dw8250_setup_port(struct uart_port *p)
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_CPR);
+	if (!reg && pdata)
+		reg = pdata->cpr;
 	if (!reg)
 		return;
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 766f80799d13..704ba91ab09f 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -22,6 +22,7 @@ struct dw8250_port_data {
 
 struct dw8250_platform_data {
 	unsigned long quirks;
+	u32 cpr;
 };
 
 struct dw8250_data {
-- 
2.27.0

