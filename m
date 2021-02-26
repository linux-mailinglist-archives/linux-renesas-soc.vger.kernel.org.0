Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959E4325F75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Feb 2021 09:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhBZIwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Feb 2021 03:52:23 -0500
Received: from www.zeus03.de ([194.117.254.33]:36996 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBZIwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Feb 2021 03:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9+cm6ZeElC8MQVLgjwbYMABdcI9W
        9UU7naI/i4nlMjw=; b=f2T2M48C38tdHHfSfjcHR6K7E0wBPcR58Sc/phRIAiHt
        RHoM1+ma+A7bw1133oXUUMDhyWCpn46Gorky9KttEDwf4tCc0ipE1QrYHUySYV3k
        r1bfUONA8UjjdX4cagmo5b9TSscFGRp3aDPUcUZbhAvVv/shvOfWNhDF7fW4vOo=
Received: (qmail 3727257 invoked from network); 26 Feb 2021 09:51:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2021 09:51:40 +0100
X-UD-Smtp-Session: l3s3148p1@KwgzYDm83qggAwDPXwklALhYvQZ7ym2x
Date:   Fri, 26 Feb 2021 09:51:35 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: use custom mask for TMIO_MASK_ALL
Message-ID: <20210226085135.GA1014@ninjato>
References: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
 <20210223100830.25125-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36926EB1E0E6C0BE6978E725D89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36926EB1E0E6C0BE6978E725D89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -#define TMIO_MASK_INIT_RCAR2	0x8b7f031d /* Initial value for R-Car Gen=
2+ */
> > +#define TMIO_MASK_ALL_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2=
+ */
>=20
> nit: Perhaps, we also have to change the comment "Initial value"?

Good point, I will fix it. Thank you!


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA4tpMACgkQFA3kzBSg
KbbJFQ/+KN/bfwmfWmYmaMN5aPrbsrkT7VlzrXPDYkyNe8mm2iahBqInWsKmp1zT
prFWcqAqAVut7kpghK7Ek1/RUiv6R7YXx9yYPTsdWnlbwZifiMzI7Km02n0pdF8l
iYySkU0phKBe7IphAPvy9JhrJwLcxxpMZx/SE3R/4hlheiiLk9+3aBmhsxbqryuZ
jOoigXDtJZcP61My4JksdLERUYveRnSCbKvDhcF+U7MlChcvSNQvwnSLTWndhJ77
teyRxcNknjLUZxT5jEfotlfHOBC7z1U49TcnZowiIpWXdApjNtyLIq2+4/439b/f
w4sUKKzBKjwOlRN2Qhyux0BAF0umfYyyQ22VQAjuVwotTEMbo2tW7Pgja1Fd4D26
dN02eft5w/y1QucOZpb4KF+6oAaX7gRTkbsjVCvtNt/tjIurOTavoLU1KYXJSkH7
FP63seRj+cgR8Itf79WCx32jR1PnnaN3jUr1gvJjLb2g9kfn5hjmlkqLC1xBq635
5MNK0FUkCCxO50kkNi71wqcODz+eoTiVgdFaeMGd6hnlcR8JszhdKhtLwcR2tV2h
mxsLNRIhLxLWZTqSZehNqzmpvABbjUUn5ffT5ipP07CeXwMX/5C/aXzecJuRsN3F
KHmMmo6+VkDaD+1cwE3QR0yDsxSrYvLoRFb4pvDuLDgznszEoQ4=
=pFh9
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
