Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2416C2445B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Aug 2020 09:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgHNHPQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Aug 2020 03:15:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:38676 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgHNHPF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Aug 2020 03:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZU9imafoyARZmgeI5Co4yxGTIOME
        Q58g8rPkUCvXOJM=; b=3JdRCJ0CIvT1IxfewxkarbtZMzRmDGd5VBj315vRh1cZ
        Kuep6UoeHklQgwNBimPhgdVrPVK8i1CslyOhAQcLGqeK1QyZO/Cf67pRSAk4DhVj
        gSmvvRmTu1GO2+8zOYkkWp4oEC482UkGt8497e3ss0Jt1NZI8Wsb39cFrr4b0zQ=
Received: (qmail 1671220 invoked from network); 14 Aug 2020 09:15:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2020 09:15:03 +0200
X-UD-Smtp-Session: l3s3148p1@6HX9LdGskI0gAwDPXwkTAFunKC2j/yWQ
Date:   Fri, 14 Aug 2020 09:15:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Message-ID: <20200814071500.GA9410@ninjato>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36923A1D7091431CE3F73195D8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200608212702.GD917@ninjato>
 <TY2PR01MB3692310754A6B4D6A05DADF0D8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692310754A6B4D6A05DADF0D8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,tftp 0x58000000 r8a77965-salvator-xs.dtb; tftp 0x50000000 Im=
age-m3n-wsa; booti 0x50000000 - 0x58000000

> > > > +	/* Tuning done, no special handling for SCC clock needed anymore =
*/
> > > > +	priv->keep_scc_freq =3D false;
> > > > +
> > >
> > > Setting keep_scc_freq to false is only here. But, I'm thinking
> > > we should set it in some error paths like below somehow too:
> > >  - error paths before hs400_complete() in mmc_select_hs400().
> > >  - error path of mmc_execute_tuning() in mmc_retune().
> >=20
> > Hmm, I guess you are right. That would kind of spoil my approach taken
> > here. Maybe we need another flag in the core like 'doing_tune' to
> > supplement 'doing_retune', so or driver knows when any kind of tuning is
> > going on?
>=20
> Adding such a new flag is better, I think.

So, I added a flag to the MMC core and I think it should work. However,
I can't test it currently because, sadly, the issue disappeared again :(

I even can't reproduce the issue with the same codebase and config which
I used when I was working last time on it. And back then, the issue was
happening. I am at a loss currently what really triggers this hang.

I added some code to enforce reading something from the SCC with the
hclk disabled. However, that reading works fine today here, no hang.

So, it seems that keeping hclk enabled will fix the hang. However, it
doesn't look like it will hang just when we allow to disable it. Seems
something else is part of the equation, too...

I kept trying to figure this out for the last two days, but no success
so far. Will keep you updated.

Thanks,

   Wolfram


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl82OfAACgkQFA3kzBSg
KbZMMg/+L33xWIdwYP0gtUMpfnMOY54bVtzTaJ4pswSVDxBR9CHlfNA4kd/L+7xe
F02p3fXegQA15o42aescBFnp/xp8fgupq9WbI7cwFHxsKTRIAbL5zvd/D5hwTz9c
Hcf/6XCYE0S0DlnuwT/+osVy60erd5jYUHcA5NS9L/Q7o8mhjmy/sH/PKmztPWOq
PfApraWyi90CZwKe1eG7nDvuI65GZEi89gZxViyvzDdbFQRXENqQZZ2zLXHza72R
dU3eGGYd8v3aybnuLGoJgNNLP41GVobIdC6NHAkLqoTjoCaLR8BQ5aoJtOmOMB24
PWdGyO75uDPGHV4inMF+4f80UrxO6KbxxhSBWQ3AcVo/zt9rwgRjSgQ9ReA1Gm3/
YWVHFN6zW4CdLL8dUkGW1KW9ahqGWtZhUhHusp+B+ZA0/DLTAFlid4bv1RK+NNDT
pfDd1Wuxtex/HCsN09RoSjAly1eCY7KnWqMMrTCp2zQ9+oth0WhzVKATTvntnBsT
/xlek8laql6urGt1M4+h4IUL/SBE/FzR/zm5jmhlmC1/uUCCSz2vHHJ5XRIdfpQj
HDvVXf1B/GAQP3S2erasOKvtbpdhmAGsd7Zjrk1xR1QMfXKPIidWUEBGzs2eL7VU
3mS9ESTrsvovvYvEbPzZD5IipJvUOjY/6rMzkGZgXyOh+uW2RFc=
=LzUq
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
