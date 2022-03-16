Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3C34DB380
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Mar 2022 15:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348162AbiCPOmR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Mar 2022 10:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243855AbiCPOmN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Mar 2022 10:42:13 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B592D5F261;
        Wed, 16 Mar 2022 07:40:57 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5F69860006;
        Wed, 16 Mar 2022 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647441653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KZrHkZTxdSaDlw1duqlnaB5GO9gaLPPnJ7VLgxAsVCM=;
        b=Sgy6Uw3Hq4bzryd7jgDrLxnlDuFcQNzwj1Ol0d0ZRL2IKeNetEX12zWFLqe3fxDNHq/Mwl
        lnJRskBlK23oye0baB8eF2Zz3e7H5OInJ9Rm4BIcnXpcAD6N+UaO34Sqtnn07N8/o6vlCy
        Rh0wAh2fPy/Nw0qz05pub9Rd6wUDCj7fJBZsxo0XO6Y5C+HMvjosDIAV60pQe7NfIRnutB
        d3ex+/92laIOVgA/Io8u/1uy45zAkQCUlIc7iZg6kwQuY+jfeaYNsmsLigfhNp86cyjDdN
        Ozh9FDuteZlicqM+Bs1K656LgEBvTZ2naPyx8jNDjPV5V4Erruyn9EKudLUhuQ==
Date:   Wed, 16 Mar 2022 15:40:50 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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
Subject: Re: [PATCH] serial: 8250_dw: Use device tree match data
Message-ID: <20220316154050.317fee11@xps13>
In-Reply-To: <20220311144814.21944-1-kernel@esmil.dk>
References: <20220311105934.5827d0d6@xps13>
        <20220311144814.21944-1-kernel@esmil.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Emil,

kernel@esmil.dk wrote on Fri, 11 Mar 2022 15:48:14 +0100:

> ..rather than multiple calls to of_device_is_compatible().
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>=20
> Hi Miquel,
>=20
> > > > > --- a/drivers/tty/serial/8250/8250_dma.c
> > > > > +++ b/drivers/tty/serial/8250/8250_dma.c =3D20 =20
> > > > =3D20 =20
> > > > > @@ -501,6 +589,8 @@ static int dw8250_probe(struct platform_devic=
e *p=3D =20
> > dev) =20
> > > > >                 data->msr_mask_off |=3D3D UART_MSR_TERI;
> > > > >         }
> > > > >
> > > > > +       data->is_rzn1 =3D3D of_device_is_compatible(dev->of_node,=
 "rene=3D =20
> > sas,rzn1-uart"); =3D20 =20
> > > >
> > > > Explicit checks for compatible values are frowned upon if you have
> > > > a match table.
> > > > Please handle this through of_device.data, cfr. the various quirks.=
 =3D20 =20
> > >=3D20
> > > Oops, these are not yet upstream, but present in my tree due to inclu=
ding
> > > support for StarLight, cfr.
> > > https://github.com/esmil/linux/commits/visionfive/drivers/tty/serial/=
8250=3D =20
> > /8250_dw.c
> >=20
> > Oh thanks for pointing it! Too bad that these quirks were not
> > introduced inside a wider structure, I think it's always a must even if
> > there is only one parameter there. Anyway, I'll introduce a wider
> > specific structure and use it. =20
>=20
> For reference this is the patch I wrote for the StarFive JH7100 tree.
> Feel free to use it or do something better as you see fit.

Thanks for the pointers, I've fetched the three 8250_dw patches from
your tree directly, and will build on top of them!

Cheers,
Miqu=C3=A8l

>=20
> /Emil
>=20
>  drivers/tty/serial/8250/8250_dw.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 1769808031c5..f564a019a7be 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -37,6 +37,11 @@
>  /* DesignWare specific register fields */
>  #define DW_UART_MCR_SIRE		BIT(6)
> =20
> +/* Quirks */
> +#define DW_UART_QUIRK_OCTEON		BIT(0)
> +#define DW_UART_QUIRK_ARMADA_38X	BIT(1)
> +#define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
> +
>  struct dw8250_data {
>  	struct dw8250_port_data	data;
> =20
> @@ -389,6 +394,7 @@ static void dw8250_quirks(struct uart_port *p, struct=
 dw8250_data *data)
>  	struct device_node *np =3D p->dev->of_node;
> =20
>  	if (np) {
> +		unsigned long quirks =3D (unsigned long)of_device_get_match_data(p->de=
v);
>  		int id;
> =20
>  		/* get index of serial line, if found in DT aliases */
> @@ -396,7 +402,7 @@ static void dw8250_quirks(struct uart_port *p, struct=
 dw8250_data *data)
>  		if (id >=3D 0)
>  			p->line =3D id;
>  #ifdef CONFIG_64BIT
> -		if (of_device_is_compatible(np, "cavium,octeon-3860-uart")) {
> +		if (quirks & DW_UART_QUIRK_OCTEON) {
>  			p->serial_in =3D dw8250_serial_inq;
>  			p->serial_out =3D dw8250_serial_outq;
>  			p->flags =3D UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
> @@ -412,9 +418,9 @@ static void dw8250_quirks(struct uart_port *p, struct=
 dw8250_data *data)
>  			p->serial_out =3D dw8250_serial_out32be;
>  		}
> =20
> -		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
> +		if (quirks & DW_UART_QUIRK_ARMADA_38X)
>  			p->serial_out =3D dw8250_serial_out38x;
> -		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
> +		if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
>  			p->set_termios =3D dw8250_do_set_termios;
> =20
>  	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
> @@ -695,10 +701,10 @@ static const struct dev_pm_ops dw8250_pm_ops =3D {
> =20
>  static const struct of_device_id dw8250_of_match[] =3D {
>  	{ .compatible =3D "snps,dw-apb-uart" },
> -	{ .compatible =3D "cavium,octeon-3860-uart" },
> -	{ .compatible =3D "marvell,armada-38x-uart" },
> +	{ .compatible =3D "cavium,octeon-3860-uart", .data =3D (void *)DW_UART_=
QUIRK_OCTEON },
> +	{ .compatible =3D "marvell,armada-38x-uart", .data =3D (void *)DW_UART_=
QUIRK_ARMADA_38X },
>  	{ .compatible =3D "renesas,rzn1-uart" },
> -	{ .compatible =3D "starfive,jh7100-uart" },
> +	{ .compatible =3D "starfive,jh7100-uart",    .data =3D (void *)DW_UART_=
QUIRK_SKIP_SET_RATE },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);


Thanks,
Miqu=C3=A8l
