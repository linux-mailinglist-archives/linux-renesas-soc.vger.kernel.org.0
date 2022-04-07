Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F1E4F8013
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 15:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343573AbiDGNJk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 09:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343572AbiDGNJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 09:09:38 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FA125B47F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UAAeRw/mrk7O3bhKzq8mX5tt5+Br
        2r8MkovWLITZ4ZU=; b=PLSxKdNR/UqyuJhxxOIvxUZv4rjLLccMXKhgPZfXAl8O
        l4qszW9Ouq81W5W/AmibcTffZ54TIjbwpgrjJWHdImFVPLpjbHkzGjRW3GQFAfHN
        peJfYfwe0nnWHbQGie5h2Y403QcHU9UJG6m+8cUcLUE+ZrKF+SQrK5/mhQubUCM=
Received: (qmail 3188138 invoked from network); 7 Apr 2022 15:07:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2022 15:07:32 +0200
X-UD-Smtp-Session: l3s3148p1@h3g2KRDcAtAgAQnoAEUrAF1rv4rSPqUC
Date:   Thu, 7 Apr 2022 15:07:32 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH] mmc: sh_mmcif: move platform_data header to proper
 location
Message-ID: <Yk7iFM39j+qda5Yz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <20220407063114.1433-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFp6_3_pQTtNpOA56QM6s2tvUKa_gZn=JCYY0kKTAoe49w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oZJj7ygSEM7YQ2pf"
Content-Disposition: inline
In-Reply-To: <CAPDyKFp6_3_pQTtNpOA56QM6s2tvUKa_gZn=JCYY0kKTAoe49w@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--oZJj7ygSEM7YQ2pf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 11:41:45AM +0200, Ulf Hansson wrote:
> On Thu, 7 Apr 2022 at 08:31, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > We have a dedicated directory for platform_data meanwhile, don't spoil
> > the MMC directory with it.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> I can pick this up through my mmc tree, but I need an ack from the
> sh-maintainers to do it.

Right, I forgot to CC them :( Sato-san, Rich are you OK with the below
change?

> > ---
> >
> > I don't have the HW to test this but the buildbots are happy with this
> > change. I checked that they actually tested the SH builds. To make the
> > patch more readable, I used the -M (rename) feature of git-format-patch.
> >
> >  arch/sh/boards/board-sh7757lcr.c                | 2 +-
> >  arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
> >  arch/sh/boot/romimage/mmcif-sh7724.c            | 2 +-
> >  drivers/mmc/host/sh_mmcif.c                     | 2 +-
> >  include/linux/{mmc =3D> platform_data}/sh_mmcif.h | 2 --
> >  5 files changed, 4 insertions(+), 6 deletions(-)
> >  rename include/linux/{mmc =3D> platform_data}/sh_mmcif.h (99%)
> >
> > diff --git a/arch/sh/boards/board-sh7757lcr.c b/arch/sh/boards/board-sh=
7757lcr.c
> > index c32b4c6229d3..f39c8196efdf 100644
> > --- a/arch/sh/boards/board-sh7757lcr.c
> > +++ b/arch/sh/boards/board-sh7757lcr.c
> > @@ -16,7 +16,7 @@
> >  #include <linux/io.h>
> >  #include <linux/mfd/tmio.h>
> >  #include <linux/mmc/host.h>
> > -#include <linux/mmc/sh_mmcif.h>
> > +#include <linux/platform_data/sh_mmcif.h>
> >  #include <linux/sh_eth.h>
> >  #include <linux/sh_intc.h>
> >  #include <linux/usb/renesas_usbhs.h>
> > diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach=
-ecovec24/setup.c
> > index 4c9522dd351f..674da7ebd8b7 100644
> > --- a/arch/sh/boards/mach-ecovec24/setup.c
> > +++ b/arch/sh/boards/mach-ecovec24/setup.c
> > @@ -19,7 +19,7 @@
> >  #include <linux/memblock.h>
> >  #include <linux/mfd/tmio.h>
> >  #include <linux/mmc/host.h>
> > -#include <linux/mmc/sh_mmcif.h>
> > +#include <linux/platform_data/sh_mmcif.h>
> >  #include <linux/mtd/physmap.h>
> >  #include <linux/gpio.h>
> >  #include <linux/gpio/machine.h>
> > diff --git a/arch/sh/boot/romimage/mmcif-sh7724.c b/arch/sh/boot/romima=
ge/mmcif-sh7724.c
> > index 6595b6b45bf1..d30123d859e0 100644
> > --- a/arch/sh/boot/romimage/mmcif-sh7724.c
> > +++ b/arch/sh/boot/romimage/mmcif-sh7724.c
> > @@ -8,7 +8,7 @@
> >   * for more details.
> >   */
> >
> > -#include <linux/mmc/sh_mmcif.h>
> > +#include <linux/platform_data/sh_mmcif.h>
> >  #include <mach/romimage.h>
> >
> >  #define MMCIF_BASE      (void __iomem *)0xa4ca0000
> > diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> > index 5f9ebf045b1c..dc17bf5bc3b4 100644
> > --- a/drivers/mmc/host/sh_mmcif.c
> > +++ b/drivers/mmc/host/sh_mmcif.c
> > @@ -43,13 +43,13 @@
> >  #include <linux/mmc/host.h>
> >  #include <linux/mmc/mmc.h>
> >  #include <linux/mmc/sdio.h>
> > -#include <linux/mmc/sh_mmcif.h>
> >  #include <linux/mmc/slot-gpio.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of_device.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/platform_data/sh_mmcif.h>
> >  #include <linux/pm_qos.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/sh_dma.h>
> > diff --git a/include/linux/mmc/sh_mmcif.h b/include/linux/platform_data=
/sh_mmcif.h
> > similarity index 99%
> > rename from include/linux/mmc/sh_mmcif.h
> > rename to include/linux/platform_data/sh_mmcif.h
> > index e25533b95d9f..6eb914f958f9 100644
> > --- a/include/linux/mmc/sh_mmcif.h
> > +++ b/include/linux/platform_data/sh_mmcif.h
> > @@ -1,7 +1,5 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >  /*
> > - * include/linux/mmc/sh_mmcif.h
> > - *
> >   * platform data for eMMC driver
> >   *
> >   * Copyright (C) 2010 Renesas Solutions Corp.
> > --
> > 2.30.2
> >

--oZJj7ygSEM7YQ2pf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJO4hQACgkQFA3kzBSg
KbYFrA//f7l5xWdWnvry9xQFLJwJaCzNVgfa6USh6ikDMst92idpDXKEOLWYLkJB
cK7lHXyQ/drlDSRyg6f0aht2MwdcWVdM9tNsQjHFZnydPmxi5ntdynVUlfZwjnWr
SVXan9oD01mCH8MSML/lcl94OrwWfkoj7OUe47t5jISPZVhdhEahlLdvlNXTfclu
npAEWvtrSp93qewDm0jzDZccRx2Hj8D6jACd2PD3CnL/7hfATJE7oD7QxJR2qkfe
gN4FzkTFpNqzWYTz5VXoOGaH1JQDRUhwCsaBlHjwYBlxAknxA85MzaHBvSapmeuu
3pOFOlRTAaFyq5DFSit3Zcy8ydKsAc9PXa2beDkOUNAUqN3F5QYGgz9PNsLq+J9D
Lj9wzMW+1vpGh/rHuqsB9Blf/wQ5qoKsY/BDZyPSDAgVPNR1F9gy3A1zdCcC/L+X
fpTIwRpx0PKRCzP7jA5R5skdVGoNQfb8i0gruW3DhPxRgB4klWGEhMtbUpUGBwTq
RhSoA/ndr/ZeWK3uDg6n8jk0t1xoz+OJib4Y+TWZ7b5Nidocaq8Hgo/okR/MuJ3G
Lyxc8zyMyemlfbkLGv3ntLJNhqubpVj+b6SVxyn5XO1rdsd/rjAn9zzvxxlLLOwk
3yC/LrXX9G5AvD6AvAdv7Rn02BvAUo+GYlDLC9AuYETxrR7MgR4=
=tizf
-----END PGP SIGNATURE-----

--oZJj7ygSEM7YQ2pf--
