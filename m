Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822074D6416
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 15:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbiCKOuQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 09:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245729AbiCKOuQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 09:50:16 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB54ADEA22;
        Fri, 11 Mar 2022 06:49:10 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so1225701wme.5;
        Fri, 11 Mar 2022 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6dQdHI9dLytxKLqKgd0flhRQJmBT3Sb7jYe1e8xodHs=;
        b=cbrQ7J7OXrDkMMkI859YK2c4weCQ78c/XwQ8tuTdTcs7SuUmpMO0f0OXChVit9c8Tm
         qsMUyUB8NUNb1UBHBfe13iuSnlTveikXTDUf3kqBIVOynYGbWjyW6R0lSdsPaZ75gvLn
         mHFfbqt28rbaOs+L7Uo2Q39YRNyK9bLzv7vla0nWSOl28vkEQjIeF+q4N6oaVqyWIUe/
         x+LhxJeK9xjphs6z7Avt+Wb1kpuIhuL0SCdoRMkDiP4WKV1LmjOm7lC3x2vzP1ZMuARS
         PEKZN9NIfh7qLe6I2Ne1+NsSnP7SeTO61QJkNCeltqHMsmrEo8A+hnOODlpSRyNHQgpv
         Oavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6dQdHI9dLytxKLqKgd0flhRQJmBT3Sb7jYe1e8xodHs=;
        b=qz3hzrMymnX4/oFOuMSHfWcKAs9h9gt4d+dEHsB9l9NZZOuvrm8PQB2wa9U/YzhG15
         8uwD7+jDuBLj86WKKsaSfW8O6ioUmdjh5VFEHDCInUIgRQA6R9cGFOuydM12XBsVZq2K
         g5XddYFFuTa7hwwrMj/HZaYjifTzyz83hwzqCmBvFnChmrVP3iVoCFGOC0Hy0ATshv5n
         2eg6yeggqkGKX477nCdcKbXrCJ3+MNtVww8EPdlH0QacqZDp05ef0z5QT3AgTwa7h3dX
         a3++zwOhsdCl6dctym6srEoVlsf6Zp0S7aJCRb+6Gun1emO7rdqcdFFOqlYtnt/Uzl+n
         Bc0w==
X-Gm-Message-State: AOAM533PHDpMXY8I6iV47xTEdFCXyJy+Pov0rxo3kGLq7OprFy6eCyN2
        kCuBFCOfYVP1mOLWTNSnTI8=
X-Google-Smtp-Source: ABdhPJx0wr/NwEcnZjDvWXiTlVA1I33XM/WlN2KA1GtVmk91sK+8d/QvMbK3laheSeZllrglBHRilQ==
X-Received: by 2002:a05:600c:2905:b0:381:67e2:3992 with SMTP id i5-20020a05600c290500b0038167e23992mr16073620wmd.182.1647010149211;
        Fri, 11 Mar 2022 06:49:09 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c22cb00b00382a960b17csm10509047wmg.7.2022.03.11.06.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 06:49:08 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] serial: 8250_dw: Use device tree match data
Date:   Fri, 11 Mar 2022 15:48:14 +0100
Message-Id: <20220311144814.21944-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311105934.5827d0d6@xps13>
References: <20220311105934.5827d0d6@xps13>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

..rather than multiple calls to of_device_is_compatible().

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---

Hi Miquel,

> > > > --- a/drivers/tty/serial/8250/8250_dma.c
> > > > +++ b/drivers/tty/serial/8250/8250_dma.c =20
> > > =20
> > > > @@ -501,6 +589,8 @@ static int dw8250_probe(struct platform_device *p=
> dev)
> > > >                 data->msr_mask_off |=3D UART_MSR_TERI;
> > > >         }
> > > >
> > > > +       data->is_rzn1 =3D of_device_is_compatible(dev->of_node, "rene=
> sas,rzn1-uart"); =20
> > >
> > > Explicit checks for compatible values are frowned upon if you have
> > > a match table.
> > > Please handle this through of_device.data, cfr. the various quirks. =20
> >=20
> > Oops, these are not yet upstream, but present in my tree due to including
> > support for StarLight, cfr.
> > https://github.com/esmil/linux/commits/visionfive/drivers/tty/serial/8250=
> /8250_dw.c
> 
> Oh thanks for pointing it! Too bad that these quirks were not
> introduced inside a wider structure, I think it's always a must even if
> there is only one parameter there. Anyway, I'll introduce a wider
> specific structure and use it.

For reference this is the patch I wrote for the StarFive JH7100 tree.
Feel free to use it or do something better as you see fit.

/Emil

 drivers/tty/serial/8250/8250_dw.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1769808031c5..f564a019a7be 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -37,6 +37,11 @@
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
 
+/* Quirks */
+#define DW_UART_QUIRK_OCTEON		BIT(0)
+#define DW_UART_QUIRK_ARMADA_38X	BIT(1)
+#define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 
@@ -389,6 +394,7 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 	struct device_node *np = p->dev->of_node;
 
 	if (np) {
+		unsigned long quirks = (unsigned long)of_device_get_match_data(p->dev);
 		int id;
 
 		/* get index of serial line, if found in DT aliases */
@@ -396,7 +402,7 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		if (id >= 0)
 			p->line = id;
 #ifdef CONFIG_64BIT
-		if (of_device_is_compatible(np, "cavium,octeon-3860-uart")) {
+		if (quirks & DW_UART_QUIRK_OCTEON) {
 			p->serial_in = dw8250_serial_inq;
 			p->serial_out = dw8250_serial_outq;
 			p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
@@ -412,9 +418,9 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 			p->serial_out = dw8250_serial_out32be;
 		}
 
-		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
+		if (quirks & DW_UART_QUIRK_ARMADA_38X)
 			p->serial_out = dw8250_serial_out38x;
-		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+		if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
 			p->set_termios = dw8250_do_set_termios;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
@@ -695,10 +701,10 @@ static const struct dev_pm_ops dw8250_pm_ops = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart" },
-	{ .compatible = "cavium,octeon-3860-uart" },
-	{ .compatible = "marvell,armada-38x-uart" },
+	{ .compatible = "cavium,octeon-3860-uart", .data = (void *)DW_UART_QUIRK_OCTEON },
+	{ .compatible = "marvell,armada-38x-uart", .data = (void *)DW_UART_QUIRK_ARMADA_38X },
 	{ .compatible = "renesas,rzn1-uart" },
-	{ .compatible = "starfive,jh7100-uart" },
+	{ .compatible = "starfive,jh7100-uart",    .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.35.1

