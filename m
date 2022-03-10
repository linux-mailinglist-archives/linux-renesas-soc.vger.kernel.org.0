Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8EB4D51F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 20:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242456AbiCJTPA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 14:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244574AbiCJTO7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 14:14:59 -0500
X-Greylist: delayed 10615 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Mar 2022 11:13:57 PST
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B9A15AF05;
        Thu, 10 Mar 2022 11:13:56 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 09D26200006;
        Thu, 10 Mar 2022 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646939634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rNWUlF3J3Y7QCOrJ7rQ51fHYeANAtSbSKKib8Msuhho=;
        b=IUoUKL/ZCJFG8q1yIKGFbdEzSah4UwCLz71g/XjqkaGTTK88I4Y5uRt94yoO0TO6RVMJhz
        MCFBX+z271NSWANTqRrFobhm19V38r8G/z98yiD+xygIEmdRmVB5YHfFCHzrWH3aLdXHB/
        UsSPrbasZGBZXgeCMf5zhOdC+0BadDZCUaqdpIWKmKvsrjh7vJzatrVjBs+Nhr9TYHCzKz
        QYEyXCF5E3rDA3f+E1LqoQ7ZabJrsrOGAws0yBS4Z0Ej5IraBHV0lv9/kZt9i2GHmWji0f
        bDaEeapr01UpJuQ8b65qhcKJRk+Y6IEWF4izoTy2/3vcl727dYYJxLrYD2109A==
Date:   Thu, 10 Mar 2022 20:13:51 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH 5/7] serial: 8250_dw: Add a dma_capable bit to the
 platform data
Message-ID: <20220310201351.1f15bf7e@xps13>
In-Reply-To: <Yio+IdeWn+G7xcNv@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
        <20220310161650.289387-6-miquel.raynal@bootlin.com>
        <Yio+IdeWn+G7xcNv@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

andriy.shevchenko@linux.intel.com wrote on Thu, 10 Mar 2022 20:06:25
+0200:

> On Thu, Mar 10, 2022 at 05:16:48PM +0100, Miquel Raynal wrote:
> > From: Phil Edworthy <phil.edworthy@renesas.com>
> >=20
> > The CPR register can give the information whether the IP is DMA capable
> > or not. Let's extract this information and use it to discriminate when
> > the DMA can be hooked up or not. =20
>=20
> ...
>=20
> > +	/* If we have a valid fifosize and DMA support, try hooking up DMA */
> > +	if (p->fifosize && data->dma_capable) { =20
>=20
> > +	if (reg & DW_UART_CPR_DMA_EXTRA)
> > +		data->dma_capable =3D 1; =20
>=20
> How many designs will be broken by this change?

My understanding was that CPR registers where always synthesized until
now even though it was not mandatory and that the RZN1 SoC was the
first one to not embed it. My hope was that people using this driver
would have brought "external" CPR support earlier if they needed it,
but I understand this assumption might be wrong.

Anyway, I also hesitated to do something more custom for the RZN1 I'll
try something else.

>=20
> ...
>=20
> > +	unsigned int		dma_capable:1; =20
>=20
> Note, we use up->dma =3D=3D NULL for no-DMA, no additional flag is needed.
> Just make sure that for your platform you enable DMA by filling that.

dma_capable is just a capability the SoC has. It was discovered at
probe time and should be saved to know, later, if DMA can be hooked up
or not. At the time we look at the CPR register we don't yet have DMA
fields populated so its too early to set up->dma to NULL.

Thanks,
Miqu=C3=A8l
