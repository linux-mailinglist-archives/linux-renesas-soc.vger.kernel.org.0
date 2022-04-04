Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C0F4F16DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 16:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377046AbiDDOXB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 10:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377032AbiDDOWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 10:22:51 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0AA35853;
        Mon,  4 Apr 2022 07:20:54 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1CDE5C000C;
        Mon,  4 Apr 2022 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649082053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y/De117MjQvOk+3gquVgz6vJxb7QWdOy8z9u8I7zKpY=;
        b=bkVv2oFSzuZdZ2UhjPx04SAf3wKHfq24uiH+VPlUTok9eAcm3fZw4FeEwH4+NrDIRjyIAz
        xtcDoh1cRfjDFgFL+jw/Xc8XXvuq/9nzDBYV8xaJZyr7JZ58eAZAuDMKslBeStH4nqPkIt
        QnsYhx6nJ40oa/gxPNMCJ1TynZh56bKwg6mWG559A7itzp58D9ETdyPMkEPl2ofDr2ScaK
        ySZaVv/jXSSw8VAy532srQ4ZJU/IDHYlSsSaxMtDT/yUnsudCVn5BcpHkM6gYOP2FUM1ps
        z1Xublr/+o32LZ3luhWSvKW3TtwcyZuXxu9l6eCJHVneqx6rXV/hakBDHfIJXw==
Date:   Mon, 4 Apr 2022 16:20:50 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v4 0/9] serial: 8250: dw: RZN1 DMA support
Message-ID: <20220404162050.7831ebfe@xps13>
In-Reply-To: <YkRlfGUM/lb1fKC6@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
        <YkRlfGUM/lb1fKC6@smile.fi.intel.com>
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

Hello,

andriy.shevchenko@linux.intel.com wrote on Wed, 30 Mar 2022 17:13:16
+0300:

> On Wed, Mar 30, 2022 at 03:20:29PM +0200, Miquel Raynal wrote:
> > Hello,
> >=20
> > Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
> > UART driver with to bring DMA support for this SoC.
> >=20
> > This short series applies on top of the series bringing RZN1 DMA
> > support, currently on its v5, see [1]. Technically speaking, only the DT
> > patch needs to be applied after [1]. The other patches can come in at
> > any moment, because if no "dmas" property is provided in the DT, DMA
> > support will simply be ignored.
> >=20
> > [1] https://lore.kernel.org/dmaengine/20220315191255.221473-1-miquel.ra=
ynal@bootlin.com/T/#m0ef3323abce3eec961e142bf2fb35e95b9045fc5 =20
>=20
> Couple of versions ago I have asked you to Cc the series to Ilpo (Cc'ed).
> I hope you will not forget it in v5.

Sorry I forgot to re-add manually Ilpo in the recipients.

Anyway, if Ilpo really needs to be Cc'ed, then there is something to do
on MAINTAINER's side.

Thanks,
Miqu=C3=A8l
