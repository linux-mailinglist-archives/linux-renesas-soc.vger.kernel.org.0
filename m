Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D115C2E7AEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgL3QHL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:07:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:50922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbgL3QHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:07:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BF7622209;
        Wed, 30 Dec 2020 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344390;
        bh=I4tfRKit1PL7y46nyJZKEZ5kkb43YJ9BVJDfODwLLkQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rJxjSFUATK2ZCXtogJHydUBYSRjzWOj9cIIPH0iEWZyZZqGkuctTc07GF2WiRiLZv
         /ou5iiqkOefb2stLtR6MZ+ky1CloOyvOylOlrLsX1RBQmIIh7UywDOXl3Z2welx6si
         9MuLs78iIAqijXdPIO8ACnqNQAr5neWjnR4/cYuLq85nPJ5cOij5rJDM4/CLVNB/Yh
         spXt/ufMgR1GTDbz2xwQcqTUugbnTtGemzfGTmLa5fYq6rJtZK5lRfB8tw2IHV7RnF
         BwRj/9xlAAsvGQDaSo5M25ndSj0+nHZXcFhUbV54/ng7vtPULA5AYdKZji1MNuWSgn
         /tQYKcm6kpTog==
Date:   Wed, 30 Dec 2020 17:06:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH/RFC v2 2/2] gpio: rcar: Add R-Car V3U (R8A7799A) support
Message-ID: <20201230160628.GG23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
References: <20201030081522.2297074-1-geert+renesas@glider.be>
 <20201030081522.2297074-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hTiIB9CRvBOLTyqY"
Content-Disposition: inline
In-Reply-To: <20201030081522.2297074-3-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hTiIB9CRvBOLTyqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 09:15:22AM +0100, Geert Uytterhoeven wrote:
> Add support for the GPIO controller block in the R-Car V3U (R8A779A0)
> SoC, which is very similar to the block found on other R-Car Gen3 SoCs.
> However, this block has a new General Input Enable Register (INEN),
> whose reset state is to have all inputs disabled.
>=20
> Enable input for all available pins in probe and resume, to support the
> use of the General Input Register (INDT) for reading pin state at all
> times.  This preserves backwards compatibility with other R-Car Gen3
> SoCs, as recommended by the Hardware Manual.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hTiIB9CRvBOLTyqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spYQACgkQFA3kzBSg
KbZzMxAAoxbmH2qTZsY2jwmEHRhSvdjuikPZytwiI/gw2adtAPIKR/mdUNcK60x2
uUGif0QMIWbaFXoNvnHZzc/9nJq876XQM6Si82RstXK9wkvpHvEBa4N9/VkDgai7
hy8hYi155GJ9sgBnnzgUKJvKWoeZFEJsYRw/4239sxgtO4XL6WkBoekP3gE9zWBP
ruwHwnJhwWmzSWGzOM91XI1cw4mdw/7G0njU/DJCmyZh4mPnXxfy+2zX6PDMjsNU
Xiz05wZNqxeIO6ELcNs5dn0Ksy1renotGGLPju0g1if4sIykGk1Awl1jJXBBOnd1
lOPBtTsnjHnE11UL9B9RcuH4sSZo23wlVpeJzrgC8mWt2o0paI2BWWLjz/Bb6wwA
IIQ1RSwV944lJ/z0Ke9GJxWO1z2mfFlu/fIJ7DRkYl7tUhVPikI1yDc2mlVmNJJA
tGP1TKYmoctctkk070DuP+s2tHY6P82AIkh6vQIY10Yfr7PyTEKaGU7ns79cxKMG
quuzjPTCG65O8CHGhLhTKNe10XLZhxtnfS03XiubTYWf0pDU4kKeheM5Sqe5jHrz
XuyqjsObsM/FsIftIK9gDcxADADQ5jpX/Xq/5S1eq3W+sH0zBcG1h5PrOJbxRbKc
yqwy/gHMGSzvHia8uUj3JrUBO9Am0ld9Yzb4aP0WGyF3KhwxiKI=
=qPE4
-----END PGP SIGNATURE-----

--hTiIB9CRvBOLTyqY--
