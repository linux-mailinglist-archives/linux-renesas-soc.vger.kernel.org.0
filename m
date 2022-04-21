Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F68509C59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351798AbiDUJd5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387075AbiDUJd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:33:56 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FDA1572E;
        Thu, 21 Apr 2022 02:31:01 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 53F1B10000B;
        Thu, 21 Apr 2022 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650533460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jOpmszXJ3iMBh6cFK7wZsIpou04C1QcGJL7xJN3BljE=;
        b=pBQaEf5T44X6oAlSN9VWd08NlLGZoVeMs0LuD/aOQwRt736+GTxU5N4eRjaUzbN2tMybeu
        H0ZrtaiHB63tZW5e/vl7KUgyOV3NRYQJmxxlG1UUL7wWf2CR7BsIEZ4/4h8vV/U/SZKued
        eLUWFbiLSZiij6NW2711pXdGHdqv0ETXgDu1Gqa1OGR2yMbL3FQKqLJVrDd88CBQaqDM2e
        AwlzMQAIRleIpexHM/2RboV5rNbnLYnJoGdSiWSQjGdr3vOSUXH18K8eFreDkHT9Rc6JKN
        pKHEtta3pYo+pr/r5WjiLx0IRqkEjCSyTOYiwXtdGM9TDF95ueU9B0Qq9d50Fg==
Date:   Thu, 21 Apr 2022 11:30:57 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 00/11] serial: 8250: dw: RZN1 DMA support
Message-ID: <20220421113057.7a8ea5d1@xps13>
In-Reply-To: <20220420105631.2bff51c6@xps13>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
        <Ylk8pXKgM3LN1rVS@kroah.com>
        <20220420105631.2bff51c6@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

miquel.raynal@bootlin.com wrote on Wed, 20 Apr 2022 10:56:31 +0200:

> Hi Greg,
>=20
> gregkh@linuxfoundation.org wrote on Fri, 15 Apr 2022 11:36:37 +0200:
>=20
> > On Wed, Apr 13, 2022 at 09:51:30AM +0200, Miquel Raynal wrote: =20
> > > Hello,
> > >=20
> > > Support for the RZN1 DMA engine allows us adapt a little bit the 8250=
 DW
> > > UART driver with to bring DMA support for this SoC.
> > >=20
> > > This short series applies on top of the series bringing RZN1 DMA
> > > support, currently on its v10, see [1]. Technically speaking, only th=
e DT
> > > patch needs to be applied after [1]. The other patches can come in at
> > > any moment, because if no "dmas" property is provided in the DT, DMA
> > > support will simply be ignored.
> > >=20
> > > [1] https://lore.kernel.org/dmaengine/20220412193936.63355-1-miquel.r=
aynal@bootlin.com/T/#t   =20
> >=20
> > Can you rebase on my tty-next branch please?  This series does not apply
> > anymore. =20
>=20
> Yes of course.

Actually the conflict comes from the fact that I was asked to
rebase this series on top of a couple of changes for supporting a
Starfive controller (jh7100-hsuart) which impacted the same area as I
was touching.

It turns out this series was not merged during the last merge cycle as
expected. It seems to be because it received comments that were raised
when reviewing my own series and which I actually fixed.

Anyway, I've dropped the commit adding jh7100 support but squashed the
patch bringing platform data to 8250_dw.c so that this series can now
stand alone (see v6). It will be very easy to rebase the series from
Emil on top of this one.

Thanks,
Miqu=C3=A8l
