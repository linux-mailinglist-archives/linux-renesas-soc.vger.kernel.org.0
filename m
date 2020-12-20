Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47772DF485
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Dec 2020 09:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgLTIzh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Dec 2020 03:55:37 -0500
Received: from www.zeus03.de ([194.117.254.33]:44206 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727421AbgLTIzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Dec 2020 03:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=wJQoBUp1mgAd3Co482i9ctcSZZvC
        2S4b3g+jMsNJGFU=; b=GbXkSuU+O6rs1k7s4Q3udg/cdTo+w2453YcIJAE7s0Xp
        dQdLPvA5FvOS4NYB/CpuVGHTlzYzjiDMWUN5Cq8uySK+lDm/3YH8ImpAjoGfXCC4
        B1nhvcngaTmqrWtvEeroaWfmoMWDKOayamewTdOEEEqdm+k7BvCvt1EAh+KXbR8=
Received: (qmail 149028 invoked from network); 20 Dec 2020 09:54:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2020 09:54:55 +0100
X-UD-Smtp-Session: l3s3148p1@mmCdfuG2SMogAwDPXzUOAGQnDyZSaHuO
Date:   Sun, 20 Dec 2020 09:54:51 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Documentation: kernel-parameters: add missing '<'
Message-ID: <20201220085451.GA918@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20201116215711.2291-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20201116215711.2291-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:57:11PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Can this go in via the doc-tree? Or is there a better one?

Thanks!

> ---
>  Documentation/admin-guide/kernel-parameters.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentat=
ion/admin-guide/kernel-parameters.rst
> index 6d421694d98e..3addfe0963bb 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -60,7 +60,7 @@ Note that for the special case of a range one can split=
 the range into equal
>  sized groups and for each group use some amount from the beginning of th=
at
>  group:
> =20
> -	<cpu number>-cpu number>:<used size>/<group size>
> +	<cpu number>-<cpu number>:<used size>/<group size>
> =20
>  For example one can add to the command line following parameter:
> =20
> --=20
> 2.28.0
>=20

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/fEVcACgkQFA3kzBSg
Kbb35g//QY142lZCNM+AIlXnRIieUv9yFP2jVW5M+NGIv5uGBDnsO9+HNe6kUvKB
sf+/wkty7S6a6bQkrKnNs3trMzCb8e5Ni7H7MxHNTBE1UgH06J2ZZkXSx+CXHPEU
o68DatP27m3XRwh6paxddcdawOAnuk+cOUqZTDSlNEl7mc5TPBl4V1Dfhnwk/91u
IxzDLWGj+ocXJYa/6wtAXTS0J3BJi50xWTJGOpOVg5yJvNIkWXpRWPaluFXr9KWu
ueYdJ09/Pt5ZyUjcEaGU5D9FuQgc8igWYk/w+1Ej5y0M2+U9pzmmK3K7yFtS6HwQ
xAboQ+igU52Xb1SsTHHlKuOCPSBJkoQRDiHU1i++rfGwPfOWvHVL7XyO/lrKLglC
NCAnBpsARH10EHdcG37kdEyBOK646IXruG+JyjqrIC39iNinPbUe7lUHtiS1aXSZ
TM7Ss2dROiHC6Al6cDY9NQApku08LoIUSCdY7wYIYl9o5pBB5zYODIZ5pd8RK5bs
+k9CoqUG1aYlk1f83LXP9QhRM8T3CxoFCFtNT2S5rPOviDRP1f4ZZ4ztrARNAF0D
nMBjSZMFaNjNKJbkgFw1PUxW9fGkwqRJXFAyjm9JmHad7DYl/QJn5ZwH/ICU3dix
fnuT+avxaCtrVx4mkk2k7AGycj3tz19yPnPbzmMF9g8vLLfYCIA=
=CRVS
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
