Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469B04EB157
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 18:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbiC2QIS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 12:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239272AbiC2QHz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 12:07:55 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD5A5B3F2;
        Tue, 29 Mar 2022 09:06:10 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 26BBAFF803;
        Tue, 29 Mar 2022 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648569969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WUgYSGzOWFCCd4P9cjAhT7kyGNE175q53uCC0IIFfkY=;
        b=bhRuPQgTmEI6+Fhep27eq6V09wtFDXEWZUGyvROgOP8LMZLzzPrbb6bxxwbM+84GI+EcZn
        ooN/vK3bX2QAlViRmTQFcaEVmxkyAguULpbQkJnHkilhzr1EDs+ERv1eE4O+hDsxz0TOuM
        eHPhtlXFkO+awV0kqN+wQK8Mwpor8L1OTjAHDCDJmuEoLIFBQPS6sI0BJ6avvUeTUY/I9n
        k7PWE1NwzZq0wI9aeqlKzggPKpn/olrempcXMrVwwW0jD/4M4UtrbZWpQNeeUILrBXTH4a
        u0gsSrxwpjK60p9C/qZZBeB/BPMHSdgExy+CGuSf/Wu4cu++XcGp8bK780Jr9Q==
Date:   Tue, 29 Mar 2022 18:06:06 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v3 03/10] serial: 8250: dw: Change the quirks type to
 unsigned int
Message-ID: <20220329180606.3321f193@xps13>
In-Reply-To: <CAMuHMdXh-6YWvQUJ957PNB_fv+3+L-GbGg3dYDCZhp5+g7fcSQ@mail.gmail.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
        <20220329152430.756947-4-miquel.raynal@bootlin.com>
        <CAMuHMdXh-6YWvQUJ957PNB_fv+3+L-GbGg3dYDCZhp5+g7fcSQ@mail.gmail.com>
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

geert@linux-m68k.org wrote on Tue, 29 Mar 2022 17:58:40 +0200:

> Hi Miquel,
>=20
> On Tue, Mar 29, 2022 at 5:24 PM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> > Unsigned int is better than unsigned long as its size does not change
> > between setups and we don't really need this variable to be more than a
> > few bits wide for now.
> >
> > Suggested-by: Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.in=
tel.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -376,7 +376,7 @@ static bool dw8250_idma_filter(struct dma_chan *cha=
n, void *param)
> >  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *dat=
a)
> >  {
> >         struct device_node *np =3D p->dev->of_node;
> > -       unsigned long quirks =3D (unsigned long)device_get_match_data(p=
->dev);
> > +       unsigned int quirks =3D (unsigned int)device_get_match_data(p->=
dev); =20
>=20
> "(uintptr_t)" (or "(unsigned long)" ;-), else you'll get a "cast from
> pointer to integer of different size" warning on 64-bit builds.

Actually as I'm changing that quirks entry from being the entire device
data to be a member of a wider structure, I'll change its type when
doing the switch to avoid such a warning.

Thanks,
Miqu=C3=A8l
