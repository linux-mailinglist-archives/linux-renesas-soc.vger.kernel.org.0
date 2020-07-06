Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1CD215A04
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgGFOv2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:51:28 -0400
Received: from www.zeus03.de ([194.117.254.33]:55658 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729229AbgGFOv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=61hoY3qnEMwuZ3wvs/Cbls6eGHK3
        TP78kJ9iA1FUg/Q=; b=gv2mo5ZibbBD3XZBuUKPJsD8WU3O4o63LjBVgh0U2l/0
        Nf8FT5vlUvybCusl81mMkC0b7s60WmTzCUerF0snXc8219Qzlq3pTCsSSjoIa+lE
        5euOZ43/I2vTTCAb0A7J8icuZUnptF5vRT074I2NrjAoudVk+R+2UaXTD+xJ6/o=
Received: (qmail 2131813 invoked from network); 6 Jul 2020 16:51:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2020 16:51:25 +0200
X-UD-Smtp-Session: l3s3148p1@46xMAsepyoggAwDPXwSPAD3C42NrtmEM
Date:   Mon, 6 Jul 2020 16:51:25 +0200
From:   "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Message-ID: <20200706145125.GG1046@ninjato>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200602125131.GA1318@ninjato>
 <TY2PR01MB36926A830866FEA2C49735E0D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFpzZG-LFbCDZYZx7J9sH536dcyHvoatCD4F-AvzM1kaZw@mail.gmail.com>
 <20200706140008.GD1046@ninjato>
 <CAPDyKFoUdJLc+CzXNjQa7Er1oYmC-bqNszhPYya9ov=-THcfEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Content-Disposition: inline
In-Reply-To: <CAPDyKFoUdJLc+CzXNjQa7Er1oYmC-bqNszhPYya9ov=-THcfEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2020 at 04:49:20PM +0200, Ulf Hansson wrote:
> On Mon, 6 Jul 2020 at 16:00, wsa+renesas@sang-engineering.com
> <wsa+renesas@sang-engineering.com> wrote:
> >
> >
> > > Just wanted to check if this is ready to go or more tests are needed?
> >
> > From my tests, this patch series fixes the issue. I'd just like to avoid
> > the extra callback. However, my tries to do that failed so far. And now
> > I'll be away for two weeks.
> >
> > Dunno, maybe we merge the series and if I come up with something else
> > that works, we can add it incrementally?
>=20
> Sounds reasonable to me.
>=20
> So, applied for next, thanks!

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8DOm0ACgkQFA3kzBSg
KbaCshAAhz/pIZbGpU4hIfe9xTdaTDtCzRr14phma5+/sSioudWi4WFCOOR01cqX
JmHSs8UEKq9NV7CyIAEMzhXp+uYQ4kvHqVaN8zLiTBdXtqOqchJB8P8Ja+EALxRd
A3wVz8rYs9alYHy8qvFi7BiA6KaoJ7TQ5W2tU0PsSQfY3yG8HaUkEXTUVL8fGN2g
Hre6Ofw4WxkASE+dxtxsvPbZAprZb1guXHd/La9BXlsS4v49ILwYUQh/GT3XigUj
h4Q68LyJ6kszLPOv+u4x+vF7b6qqK2nRZYyVtB/tC+hERjP7qJxq1BeMkrj7IhPI
f6uRJ5bEOuT0ZUck1JAwnW5OFZRgv4MKsZFf88zx+olnfrvVWFQ61/RWlE2yzXjS
5elhl5NKZiR0a10e8m3ayMViBq1iKHTT/pGH5/aRr5ci00Nd+Wn4QelFH0UQSNUM
s0Q8M27R0Bqmv4X+AbeRc7I58jVpUrJfkzP/3tQcFmeATBC5fm6NMflIbGShZ1pt
3DUEq3Nh3gQ0B9yNdLJjcDeu9j+y6Bh9/dzrdlRFjcN6ji0n8wT8FpnGSpZxphsY
3pb6Vjw2qUueMCdv09PceK2j+2kucnFm5ebesbRqnhRoXEqeGWCzhOy5MYH4gDw1
R9LukeCFBKxTvOu7LwO/Z4cUYWaqUnynu3NqkIl3vuUSn8GTuCY=
=dFY2
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--
