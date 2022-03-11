Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1744F4D5F0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 11:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240968AbiCKKAs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 05:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237881AbiCKKAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 05:00:47 -0500
X-Greylist: delayed 53915 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Mar 2022 01:59:44 PST
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED7464BCD;
        Fri, 11 Mar 2022 01:59:43 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 63ED810000C;
        Fri, 11 Mar 2022 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646992782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JyarCos91loX1PtLquN+7zDMcXGRHqdS3/mBa9eLFas=;
        b=XltjhA9YtwcdwJXvgw8veFNyUOssgFGJfbDgbGbm2L9NB4vG1cSIgCyxrXxksKEnrDxG8j
        TFXdbeZhBLEWQUlYBDSBdpUBPRklhGzyFJRm1dhoAVK4+n6JahhJKO+fnyKlFulrOPSVVU
        q40/x0IHJgTNrWuiYdMukyObGKHCTyv+gkSktXuFhRnWfDB+HOXrLXz4h5N0bbEE79pKsQ
        J7bp6uIreScuhMYp2fEV/Fc/pf0R7SO9yjyFnzbJJmyjFviosALmgsuHY6BqeySk2ICMX9
        XC3og6E7FGEFO45qnreFua06/K+u0oVq8D8G+7lT2JeiI8cNF7BvV3P2QnwmAg==
Date:   Fri, 11 Mar 2022 10:59:34 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
        Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH 6/7] serial: 8250_dw: Add support for RZ/N1 DMA
Message-ID: <20220311105934.5827d0d6@xps13>
In-Reply-To: <CAMuHMdXUC2ndMJr1DhPxsg6JX2o0Bh9odq3rvpfzHN+T9miuQg@mail.gmail.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
        <20220310161650.289387-7-miquel.raynal@bootlin.com>
        <CAMuHMdW0VZsx-zAFr__PPBqKBVyu4v7sAU_yV-ROcTLq10fE6g@mail.gmail.com>
        <CAMuHMdXUC2ndMJr1DhPxsg6JX2o0Bh9odq3rvpfzHN+T9miuQg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Fri, 11 Mar 2022 10:51:53 +0100:

> Hi Miquel,
>=20
> CC esmil
>=20

> > > --- a/drivers/tty/serial/8250/8250_dma.c
> > > +++ b/drivers/tty/serial/8250/8250_dma.c =20
> > =20
> > > @@ -501,6 +589,8 @@ static int dw8250_probe(struct platform_device *p=
dev)
> > >                 data->msr_mask_off |=3D UART_MSR_TERI;
> > >         }
> > >
> > > +       data->is_rzn1 =3D of_device_is_compatible(dev->of_node, "rene=
sas,rzn1-uart"); =20
> >
> > Explicit checks for compatible values are frowned upon if you have
> > a match table.
> > Please handle this through of_device.data, cfr. the various quirks. =20
>=20
> Oops, these are not yet upstream, but present in my tree due to including
> support for StarLight, cfr.
> https://github.com/esmil/linux/commits/visionfive/drivers/tty/serial/8250=
/8250_dw.c

Oh thanks for pointing it! Too bad that these quirks were not
introduced inside a wider structure, I think it's always a must even if
there is only one parameter there. Anyway, I'll introduce a wider
specific structure and use it.

> But you do already have:
>=20
> +       { .compatible =3D "renesas,rzn1-uart", .data =3D &rzn1_pdata },
>=20
> since "[PATCH 4/7] serial: 8250_dw: Provide the RZN1 CPR register value".
>=20
> > Please rename "is_rzn1" to something that describes the feature.
> > =20
> > > +
> > >         /* Always ask for fixed clock rate from a property. */
> > >         device_property_read_u32(dev, "clock-frequency", &p->uartclk)=
; =20
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert


Thanks,
Miqu=C3=A8l
