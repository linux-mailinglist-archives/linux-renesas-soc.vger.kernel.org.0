Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEA3508446
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347356AbiDTI7X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245207AbiDTI7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:59:23 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF42275DA;
        Wed, 20 Apr 2022 01:56:36 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B290DFF804;
        Wed, 20 Apr 2022 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650444995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A1ZpvVc669OINgmzFOMlVE6ZA5AVyFUQk0My2ZDMmao=;
        b=EeJ8/SAi7ylcGglnORja3R9O5D99b4qs+V4Piv/rIdbpwsgGKZw6SjuJwsdkL4DJTEvOwB
        2Xt5yh3K2ePGHqdPc8hch1HfvlNqlnH05ld+CKdeiFBGFZRtmu1EurhyPffO8Qvb4EYE9j
        XsS5wWd+BBYT4du38gJBRIkSJgwqgPfpLWq4K1AwcZ9qH8F1hOawj8kDuU8ji6bELaEvUX
        MYtWdSDdmbZnXjGsXJ7hOfW3ebNswmYbjpgd9Bwh7DwJ3OE9wK/GDWZO0Xc+VMDRh3nD0e
        tNqO9y/2dopKHkjxfKfaIwUBzgPGX0QJ3SM/cUHYhaCqVwQYY9m3UYovu9rVZg==
Date:   Wed, 20 Apr 2022 10:56:31 +0200
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
Message-ID: <20220420105631.2bff51c6@xps13>
In-Reply-To: <Ylk8pXKgM3LN1rVS@kroah.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
        <Ylk8pXKgM3LN1rVS@kroah.com>
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

Hi Greg,

gregkh@linuxfoundation.org wrote on Fri, 15 Apr 2022 11:36:37 +0200:

> On Wed, Apr 13, 2022 at 09:51:30AM +0200, Miquel Raynal wrote:
> > Hello,
> >=20
> > Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
> > UART driver with to bring DMA support for this SoC.
> >=20
> > This short series applies on top of the series bringing RZN1 DMA
> > support, currently on its v10, see [1]. Technically speaking, only the =
DT
> > patch needs to be applied after [1]. The other patches can come in at
> > any moment, because if no "dmas" property is provided in the DT, DMA
> > support will simply be ignored.
> >=20
> > [1] https://lore.kernel.org/dmaengine/20220412193936.63355-1-miquel.ray=
nal@bootlin.com/T/#t =20
>=20
> Can you rebase on my tty-next branch please?  This series does not apply
> anymore.

Yes of course.

Thanks,
Miqu=C3=A8l
