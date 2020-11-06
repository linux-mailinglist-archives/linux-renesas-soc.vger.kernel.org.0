Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D402A94BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 11:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgKFKwJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 05:52:09 -0500
Received: from www.zeus03.de ([194.117.254.33]:42738 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgKFKwJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 05:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=kW7jcQSeh8KMLetp28cKRk+j585r
        hCI11GvwBBmB3/8=; b=kI+AOGA5BUJRlVCx+d7p4EFmN4WRvYwAZPuMh7R1316K
        F6jYFbBMld5rHCZADc6vL92zVdORiEK9D8hBGUySXF9mQW0lZmrzb5hr7LLpkxOj
        E/s5pRO9wxv/vNJgn8ANvHC6M7lMavaHKqr/EsTR4woS5LbXmk6h+WEOOLjCH68=
Received: (qmail 920005 invoked from network); 6 Nov 2020 11:52:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 11:52:07 +0100
X-UD-Smtp-Session: l3s3148p1@4wXvAG6zwO0gAwDPXwt7AM2DJu0qMDpA
Date:   Fri, 6 Nov 2020 11:52:06 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, kuninori.morimoto.gx@renesas.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: host: renesas_sdhi_core: Missing
 tmio_mmc_host_free() in renesas_sdhi_remove()
Message-ID: <20201106105206.GC3343@ninjato>
References: <1604654730-29914-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <1604654730-29914-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2020 at 06:25:30PM +0900, Yoshihiro Shimoda wrote:
> The commit 94b110aff867 ("mmc: tmio: add tmio_mmc_host_alloc/free()")
> added tmio_mmc_host_free(), but missed the function calling in
> the sh_mobile_sdhi_remove() at that time. So, fix it. Otherwise,
> we cannot rebind the sdhi/mmc devices when we use aliases of mmc.
>=20
> Fixes: 94b110aff867 ("mmc: tmio: add tmio_mmc_host_alloc/free()")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested on my Salvator-XS (R-Car M3-N):

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lKtYACgkQFA3kzBSg
KbZPag//e8nuRSqILARungh4l4ZRMFCV7MMWqtf5JYxhIUBLs9PWoSYOYlWxZfPx
KQKlxDfDDIgAF208ljRQjvUohBhiq7/aozDbIZgWSMTyz8QP+EfzkyBX3I++YsGp
eOYkTAvYNq5gEBxwvA5EquD+f0o5smoEoWKzAsDGE7Y0VLN//jAqajBK3L9Xw62H
/oh2priwxKY3zGrSmUr5trgRw17E7fE7eJgL7ZfxDIPdCQUhikBYk3t6ki38AVH+
P3GxxaSsoCmGfUf8jRQuVjgLyKyK8LFYLpB4HtPjguCFwBS/ktyTTm34x9DVEV/j
ACpYwgGrW0Uh2+C84xN1hChhTDvAI/yIhJ3o6eqP9gip1qJzFEIFySwYd7WANUsG
RIaPmAK8QZepeQdjT1YG4ZIGjFUuzZLtaC3DzJ2/Gc3XxpQ0jvBlAoBA6fM6YT9S
Bw5qqXQiJMWM3x7GqzB0k42dTaVPyDp/o80iZovEr6fSnZHoZsb39AQME2ccmLkT
XBrQ2Y7qc0OsQj+DMWiP4v6r46cK1A8WT5LNY5TPdAmrVak1X2Z7VUDetxEKz/SC
2r3lBdnmQvoacpjq7y2vy0BXtOVjafrIY5PKjQVOue4qD9JDsGtz5GyaoYdFczv9
Gq1kHAxUkGWmbfefhdEvLrtC78iguawLu6SeHTdypS3hN4l7Um4=
=oZXa
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
