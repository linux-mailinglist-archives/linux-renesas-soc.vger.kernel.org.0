Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3384F182A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 17:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378198AbiDDPWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 11:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378000AbiDDPWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:22:37 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09693C4A6;
        Mon,  4 Apr 2022 08:20:38 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 56E106000E;
        Mon,  4 Apr 2022 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649085637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pf3BDr9pTmMgLASkcEQPq8RGMyR6nbtEmBoI0sglVBE=;
        b=AEe0Scdk1GqT8csFlplS0nBzAozBaESPovht4Q0ySx59ES/dte0X0Izqs/LZtPQW7PYC0L
        D2APvpJV9J7SWrlZ83Jybh8UW9KK6St9m/w7LvKsNyeB7A8Y3qAYJKv/HSlu61CpZ5oVlN
        6ysdjgKHnt3NvYNioIN7y28gLe3hwStYMhv6m6qXsFQRYs+3L8KxUDf0zzovByGpH3owip
        7ZOG+3Sz+j8DyXg1lKt9e84LBObiu0UigOCj5pBzw9+OV5IOo/XI3NFxbOv2LLqidiPpFi
        bi15ria7VlkeLriBybQ0xfKMes/qf0jyeS6HhQqNNnc6j1Lutr0infE9o28SEA==
Date:   Mon, 4 Apr 2022 17:20:33 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-serial <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v4 7/9] serial: 8250: dw: Add support for DMA flow
 controlling devices
Message-ID: <20220404172033.56c55a37@xps13>
In-Reply-To: <Ykc4kGLEnwdoUqZ6@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
        <20220330132038.808679-8-miquel.raynal@bootlin.com>
        <24becf8-82c5-5a12-690-5b9e067ec1c@linux.intel.com>
        <Ykc4kGLEnwdoUqZ6@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy, Ilpo,

andriy.shevchenko@linux.intel.com wrote on Fri, 1 Apr 2022 20:38:24
+0300:

> On Fri, Apr 01, 2022 at 01:56:49PM +0300, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 30 Mar 2022, Miquel Raynal wrote: =20
>=20
> ...
>=20
> > > +			writel(0, p->membase + RZN1_UART_RDMACR);
> > > +			writel(1, p->membase + DW_UART_DMASA); =20
> >=20
> > Currently there is serial_out(), dw8250_writel_ext(), and a few writel(=
)s=20
> > too for writing to registers. It would be nice to move towards more=20
> > homogeneous approach rather than adding more writel()s. =20
>=20
> Actually a good catch!
>=20
> > I suggest dw8250_writel_ext() is moved to dwlib.h. Then it could be use=
d=20
> > here (and dw8250_readl_ext() too should be moved but IIRC there wasn't=
=20
> > any reads added by this series). =20
>=20
> I agree that for the sake of symmetry it's good to move both.

I moved them both to dwlib.h as suggested.

I had a look at the current uses of readb/l and writeb/l in dw.c but
converting all these function calls is not as straightforward as I
initially thought so I decided to limit myself to moving these helpers
and using them in my additions, I hope this is fine.

Thanks,
Miqu=C3=A8l
