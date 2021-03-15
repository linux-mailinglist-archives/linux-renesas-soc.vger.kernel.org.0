Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D533B2CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 13:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCOMbp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 08:31:45 -0400
Received: from www.zeus03.de ([194.117.254.33]:60804 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhCOMbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 08:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hyr2anXZBr9wlz34u3sUYM9zb0qk
        Ivb8CxWQ0lYmBnc=; b=KVEhicLcnM6fLrHpxFTA0PYOHU0qjf1rbm17CZ1fTAZP
        TCYYiPlvet35vD6LypeB94fQ3qEAcC6EqZrWfHnscN8kg6+ePkiihJ7GiIXWX/Ty
        g2ba1lXAB017V6NI3NDmd3WvgZ+OxbQQzb09QsgDVn+96u+J6J9LXdk2ax1xIWk=
Received: (qmail 1390144 invoked from network); 15 Mar 2021 13:31:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2021 13:31:19 +0100
X-UD-Smtp-Session: l3s3148p1@C2w+bZK9noggARa4RYTzARykWRFxRPkz
Date:   Mon, 15 Mar 2021 13:31:17 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <20210315123117.GC1182@ninjato>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
 <20210309092332.30705-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692A6D95BD60A17AE698DF3D8919@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20210311131748.GG3566@ninjato>
 <TY2PR01MB3692BAF4BB03CDFE3D904B98D86F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692BAF4BB03CDFE3D904B98D86F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Adding the function itself seems OK. However, I checked the code, and then
> adding hard reset into renesas_sdhi_reset() seems to break the following:
> -----
> commit 5b0739d76227fd5a3f02f014385bfa9c86e0404b
> Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Date:   Thu Aug 20 15:25:37 2020 +0200
>=20
>     mmc: tmio: don't reset whole IP core when tuning fails
>=20
>     SDHI needs to reset the SCC only, not the whole IP core. So, if tuning
>     fails, don't handle specifics in the generic TMIO core, but in the
>     specific drivers. For SDHI, we need to move around the reset routine a
>     bit. It is not modified.
> ------
>=20
> So, perhaps, we have to fix renesas_sdhi_execute_tuning() somehow before
> adding hard reset. But, what do you think?

Thanks for the pointer, Shimoda-san! It seems it gets messy again, so
time for getting clearer, I think. I will introduce a reset_scc funtion
again which is seperate from reset_sdhi, so we have a clear distinction.
Then, I will call reset_scc from renesas_sdhi_execute_tuning() and the
rest stays with reset_sdhi. I have a prototype patch which I will test
some more and  hopefully send out later.


--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBPU5EACgkQFA3kzBSg
KbbIIQ/9GZvkfcgYsJBpmXrnB0Mz3rVRJHujZSAscz0d+p2pFqiw1OI7Z9kvkmgC
HfxPeacaSnIxxUmAfLvtb9vVQ8NxZvlWJYcNXYNHI9yz9+ZQ3R4CnTGpOec5nW4I
L0IZzhtfmJh7n+brRrmAeOMz0wCYn8KG25nFBXLzfnyVUVB/C8Pobd3Je3uDxJX1
evwRJ1GXPXQvUFgKyP5wAi/5/0OmO6S5A3j+K3gjKUYAs7Qcnh86NRox6rpLCjxh
xOrmc3/QsOyFXgUxJ2zTcXr6bTcGmYgAkM0/mo6zMjrJcGfr7VlnMidokG3Eky62
eLfOhLP8S85tqdtJ72b8+vcAUfkGYgEfdsmMySH2/Ry/7wGBxvLBCZ2MCZFPXsMP
zy5uVdxlB0jmoQ1avFQ/wfu2zyLHzaPB5v4LLa2bfEm+LQB+utAsNjnIVhbAu+K2
FbXXFQhU8PSRHZ89Mmoc86hpboQvz9+ILlNVZwpPJPdil5Nmz8UkYll8/kikO1dd
54g4DdvNmM2l3HPSMGuzWJsoa/hdZE77sXXBhIR1aG/fYJ8a9AtvZtmnIeanO2uq
xHmEGwsbSbtY+lnhGlSe5L3u3O69/wZ3CRKsRBmmjm0yIvU2ifr+68M573+l/KIQ
T/8mhZqesNNDJW4gE1rGviA0sUP2dcA7Vr+nCfZeKKTd7vDbMIQ=
=fE9+
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
