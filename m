Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEBB43E910
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Oct 2021 21:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhJ1TsI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Oct 2021 15:48:08 -0400
Received: from www.zeus03.de ([194.117.254.33]:45704 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230293AbhJ1TsH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 15:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=wxlD5013LNiQQgL/tzZDr2AT9RRh
        MDI50vtSZ0v/UHs=; b=gexUEuKOY4sHapxE4n8lS1vobMFQiSqoHJ6ascCKzybP
        KBSiUgQIMPWXKUNVNPfHbr2+N5CIHbmtxpQDlqtYhZEhA+QPbMQEjVAzpXXtppf1
        BvwoDW4TdXTkzU6no8YoTW4kmcZPESkyPIBwqkibq9cjN71jcK6/p4Bnl8UZqC8=
Received: (qmail 1839090 invoked from network); 28 Oct 2021 21:45:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2021 21:45:38 +0200
X-UD-Smtp-Session: l3s3148p1@HrHK827PjsUgAwDPXw4yADGDI0jlsL8i
Date:   Thu, 28 Oct 2021 21:45:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Message-ID: <YXr91sKve3pmY+yj@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
 <YXK7AfUYxuFWl3rl@ninjato>
 <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592212E593522E4E72BEAFCA86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592273BA2B117BE67B108BDF86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iuKUPiXlsmQ10vsO"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592273BA2B117BE67B108BDF86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--iuKUPiXlsmQ10vsO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

> Finally found the issue. There is one more patch for host->reset in tmio_=
mmc_core.c. please see below.
> If you add this code, then it works.

Thanks for finding the culprit! To get this hopefully into v5.15 still,
I will simply add this chunk like you suggested. However, I really
wonder if we shouldn't just replace this:

>                 /* For R-Car Gen2+, we need to reset SDHI specific SCC */
>                 if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
>                         host->reset(host);
> =20
>                 if (host->native_hotplug)
>                         tmio_mmc_enable_mmc_irqs(host,
>                                 TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_IN=
SERT);
> =20

with a simple call to

	tmio_mmc_reset(host)

(with tmio_mmc_reset() still updated to set the card interrupts, of
course)? I have to admit I haven't checked all paths for side-effects
yet, but maybe you can already test if this change also works (instead
of adding the second chunk)? If so, we could change it incrementally for
5.16.

Anyhow, will send the patch for 5.15 in some minutes.

Thanks and all the best,

   Wolfram


--iuKUPiXlsmQ10vsO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF6/dIACgkQFA3kzBSg
KbZBrBAAnaeiiizNoOrKqelxHX3gVsvl7snYr3dgntCL0Qaeu7qnRRZVXqXlA8AL
GnCSyXmI8urj0ZNypaRqvruiH7bJv8oNfKlv9ihMGIjCPRL4x6ymzXnSYE0Zsyw1
KSUTHZ/W3q/V0rf+RVhIVkNOgdkf32oDQoYi113LsGxz74hRC6L4+V4okyrGleuX
0B/zI/A0F/nVCgErriyP2p2Y3C3GNBB8Z/LESZhQ0e70L7xasoGVW73kDAwEs7hC
6bUnLB+BJ98bSK6xNNbgFiLs/pwuzG9QBzCqN/s0QJQM3gFi4qd6mjrPRiRKlN6d
NkjxkY38iUHP/Y/eivG4s9fhnEZc56+vXZyzbmEM/oo9r2BwzphHAahGeFWKEjhO
7d7vjOdPj2OIFxUGu6ByP1D274ixErgKggaoaJkC7Lqlb3DhhgCd91EvN75vUarb
rQsGRJDFPO0peUMNtsoRr+EqcnUk1TkPyKCHEE8tivKq/OrPUOKXa7sC4pkwlmVh
W83TAOxadsvTG4+KdRdot0NGOpaYHYgI2CP6BkXAnXf8zCHYkGXHCa755rhi3czG
/qj6w506FaOmwiiHdmqJzDjTAp9Fn4KpgGhN8vRZVa6ymU5wONxxA4Y08/sIDQ2M
Kahik9Pv7Xjuj5k3xGEYZ+DpZtPeklGbDqAgrRQLLLawlpscZbc=
=3J98
-----END PGP SIGNATURE-----

--iuKUPiXlsmQ10vsO--
