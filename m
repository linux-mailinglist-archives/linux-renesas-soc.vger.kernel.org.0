Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0363237A2B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 10:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhEKI44 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 04:56:56 -0400
Received: from www.zeus03.de ([194.117.254.33]:54212 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230465AbhEKI4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 04:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9/r3WR2GJKuGYHB/YuczIJ77GObb
        ztDumERdUwyRs00=; b=z2A7cL+slOUFRcYm4xVBBIjs85MJp0hj1avGvW5w3xNB
        nh/ZeWhM+X9q4Ln0gRFgUGxWpGaHxmHzPPhZp7uzY1drrJnGqXsgwvBqMlfdJ9wQ
        JTS1PNm6KPtkJinUslLTiWckcFOJl/ch/WavcVLQTwokR2jPSaiUblspN8Xp8mQ=
Received: (qmail 83918 invoked from network); 11 May 2021 10:55:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 May 2021 10:55:39 +0200
X-UD-Smtp-Session: l3s3148p1@xu/oDgrCurYgARa4Re6cAYZUKhEpjHpf
Date:   Tue, 11 May 2021 10:55:38 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linh Phung <linh.phung.jy@renesas.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Fix off-by-one error in FIFO threshold
 register setting
Message-ID: <20210511085538.GC1626@ninjato>
References: <5eff320aef92ffb33d00e57979fd3603bbb4a70f.1620648218.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <5eff320aef92ffb33d00e57979fd3603bbb4a70f.1620648218.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 02:07:55PM +0200, Geert Uytterhoeven wrote:
> The Receive FIFO Data Count Trigger field (RTRG[6:0]) in the Receive
> FIFO Data Count Trigger Register (HSRTRGR) of HSCIF can only hold values
> ranging from 0-127.  As the FIFO size is equal to 128 on HSCIF, the user
> can write an out-of-range value, touching reserved bits.
>=20
> Fix this by limiting the trigger value to the FIFO size minus one.
> Reverse the order of the checks, to avoid rx_trig becoming zero if the
> FIFO size is one.
>=20
> Note that this change has no impact on other SCIF variants, as their
> maximum supported trigger value is lower than the FIFO size anyway, and
> the code below takes care of enforcing these limits.
>=20
> Reported-by: Linh Phung <linh.phung.jy@renesas.com>
> Fixes: a380ed461f66d1b8 ("serial: sh-sci: implement FIFO threshold regist=
er setting")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
>=20
> The BSP contains a different patch[1], which masks the value to write by
> 0x7f.  This is IMHO incorrect, as it would set the trigger value to zero
> when 128 is requested.

Makes also sense to me to have the trigger at fifosize-1 to have one
spare byte to handle latencies.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCaRoUACgkQFA3kzBSg
KbZIww/7BCwSz3Jan50yJDGD/Irve955aHy+A1C9i7WCzPLAj9Gmz05HMly79GzJ
rmHLRePPBn838ziBp3D05jCP/UvOVWuaiPEgB9crRCs8Up7zDj+7PgMMxRt8DJaq
2fex2g88hFtll0B+XPLkgXf3ln3h7aa2/cgzoZQx1NdZmlJnfw9sAbq0pitXJFF0
Yml3Yv3bYg5la1Aqb4AlEf6RjYG+iKRiBQzavZsw69GQZK4I3EcPxGUWiz00MJ9g
aL+z9TXfF1Bf1WNErQe3KCLZUQvsv2c5P1synXuwAVU9jMJT+7caoUNt5W1nT97F
5ziiz3UfdMedNZ9yTIxRvqHOhoz4YNcMv4ljCXhhJ1mHtOnPW27On4Xh/pDu997M
k8bkzJ7vk2FyJojOKiXErKm15H/I5riwGAYdLlL/fc5lgnENKQ+ZK21NSzDwH/wY
5i7XLefov9sW5RN451ULhhp7AIaBTEWG+7LTt6c6ZX9VMOgTZJqmB12Kdn9xkjsH
nrtgF/KjnPBEeHbJ2XbIgEA+QIjqNAw+sNIMLgqu4dqqeMTyyb+5dO12xRi+L9f4
zewTpp3tNenw9sZeiLpHuUVNLqEtUqPmuFHVYgRbCBrA5SFR/YJdVArhTEB7y3ll
I7VkUMfMx5u1t8jD1Io73zRQGTaq9Rs6zedvmv3c8sm+DI/9hRc=
=d93D
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
