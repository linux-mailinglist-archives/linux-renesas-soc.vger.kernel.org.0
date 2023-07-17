Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86021756384
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 14:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjGQM5L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 08:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbjGQM5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 08:57:05 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F38D1985;
        Mon, 17 Jul 2023 05:56:31 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7819024000C;
        Mon, 17 Jul 2023 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1689598586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PnbG2kna/5QHT9EZoNLKAsarfs/yBYCw+wIH6z79yFg=;
        b=L3ynjZzdDrKioO7hJOL+RAxumAMQrd9Qkr6ob1LF2HeIoCuFwpRb7O1zlHkHb5n8/3TLRh
        br4PQlx/DdcCn7fS8gdNR7NPsD4zbBdebrMkuskiiyIJS58fbDJQfaDUl7tcnDidCHeym7
        2za91K0g8bAC0sJ4xb6mL41/uTPEYvm+RfVVj2mQAXrNFiE2GTrc8Zwwpya7z/F8UNff7B
        Ulkvv+2ogRhACcaXBfLKWTd5AbeDIAjGgirFkTGOF3PorGnz0tyvq/fQ2wlDzk0960doBG
        jnlf6utD8cNLFCGYyLfq7M2vyyG+UUSQeWl7SW0rSD918cKMmesEkH5vElAVHw==
Date:   Mon, 17 Jul 2023 14:56:23 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Alexander Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Message-ID: <20230717145623.473cffca@booty>
In-Reply-To: <TYCPR01MB5933389C26B1C2FD6F35D97C863BA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
        <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
        <CAMuHMdUjF-_pX53xaEXJVP1Yvz-o=0bdHLx7ekqbqrGX7ygCLA@mail.gmail.com>
        <TYCPR01MB5933389C26B1C2FD6F35D97C863BA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Biju,

On Mon, 17 Jul 2023 07:46:34 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Geert,
>=20
> Thanks for the review.
>=20
> > Subject: Re: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
> > device_get_match_data()
> >=20
> > Hi Biju,
> >=20
> > On Sun, Jul 16, 2023 at 5:44=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote: =20
> > > The device_get_match_data(), is to get match data for firmware
> > > interfaces such as just OF/ACPI. This driver has I2C matching table as
> > > well. Use
> > > i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> > > matching.

Good point, thanks!

> > > --- a/drivers/clk/clk-versaclock5.c
> > > +++ b/drivers/clk/clk-versaclock5.c
> > > @@ -956,7 +956,9 @@ static int vc5_probe(struct i2c_client *client)
> > >
> > >         i2c_set_clientdata(client, vc5);
> > >         vc5->client =3D client;
> > > -       vc5->chip_info =3D device_get_match_data(&client->dev);
> > > +       vc5->chip_info =3D i2c_get_match_data(client);
> > > +       if (!vc5->chip_info)
> > > +               return -ENODEV; =20
> >=20
> > Can this actually happen? All tables have data pointers. =20
>=20
> It is not needed. I just want to avoid people sending
> patches as this function can return NULL, so add a check.
>=20
> Please let me know, whether I should remove this?
> I am happy to send V2 taking out this check.

I cannot foresee any sensible future use case for adding an entry
without a data pointer as the whole driver is now heavily based on this
data to handle so many variants. Also, the error checking did not exist
before and the i2c match table is not introducing anything new in terms
of .driver_data values.

Thus I vote for not adding any error checking here.

Otherwise looks good.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
