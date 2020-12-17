Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7422DCCD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 08:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgLQHKF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 02:10:05 -0500
Received: from www.zeus03.de ([194.117.254.33]:48106 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgLQHKE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 02:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=eZ5+fqJjIA36/HtcF5585SwV7RNX
        nBX8SbNYHwWYs/w=; b=I8BzGtieU5BWRY5958PB/AHh0DrQG8GqrHIyMNHGSz+X
        BJ7zNtJAsE5/BWiHddrPqW/nvjELrylYUoalfPvcKzmVS/eV0cLwhEhIFkol+FmW
        zGA4Z1Tc/akAOUXto/wRvNsftEv7rLsPux9z6eKTxFtLce2TTcBeElkhUELvrhE=
Received: (qmail 3342654 invoked from network); 17 Dec 2020 08:09:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2020 08:09:21 +0100
X-UD-Smtp-Session: l3s3148p1@r7iVq6O2eIFUsz2I
Date:   Thu, 17 Dec 2020 08:09:18 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi_internal_dmac: Fix DMA buffer
 alignment from 8 to 128-bytes
Message-ID: <20201217070918.GA1076@ninjato>
References: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608114572-1892-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <1608114572-1892-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 07:29:31PM +0900, Yoshihiro Shimoda wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>=20
> According to the latest datasheet, the internal DMAC buffer alignment
> R-Car Gen3 SDHI HW should be 128-bytes. So, fix it.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [shimoda: revise commit description, rebase]
> Fixes: 2a68ea7896e3 ("mmc: renesas-sdhi: add support for R-Car Gen3 SDHI =
DMAC")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/bBBoACgkQFA3kzBSg
KbZI6hAAjvhCtOEugg+dpbmpY650yLNBskQYV/Y4jcxpSpJVeGiaOfxIyWpxvrfN
ZwPvqLoBR2phcmZOgbPAQDQuGAdbvHwk78/7I/zThdNReLoUzn8dRIigWQsLqNJc
EuFicadJTsimPXfS8zbDa296fP1Ezs6SJJn6oUbxoFZJdSrwh8XfjKQI0XT3XFxr
U4qV6Y4PUE537vlaXCD1HohYG74R/b795lSEXobD9qWKi5hQMvcMbKmEBxIC0LzC
3Ukn09sbVg8CwMo/SAiNkCv8kd34Hb9XTyB/CqMs6pwVuWJZpb2tqhygaSDMHrvS
PzGD0u2F4GMbgrzQYSSReNMknQEVFaZXmpJ4X/z/jA1eK4+82EsJpp66xGEYDw00
B0873/ZNqBGm8Yw0uUmxnlY8hz9T6BL9GSewd3EGmjmM0yvgSWfvfVnb5kB2h1sr
mlorD3OUyWqGjQ7q62fNo5kxME0TmnH1A9N/aXoc2Kj5coCX1tnMGo5Rlxo/HD2W
2CfZ/599TqE0frS1KRY7GPA8YWlJ2vAdSjsbwGQnSXkVDU+Fho2/FGgNQ1j70IXX
7/EMpZ2JOjFl+DVd7Fy+vVO7Zjoi8/BiGWK7GQG9ujcm6R2cTdqtvt4zSbTVarDj
olLeQboKyBzImp1/QOBZrVHxY5AfiAbcOnfLpsx80AeEzofI14c=
=bxgT
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
