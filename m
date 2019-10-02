Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBABDC491B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 10:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfJBICa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 04:02:30 -0400
Received: from sauhun.de ([88.99.104.3]:56604 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfJBICa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 04:02:30 -0400
Received: from localhost (p54B33447.dip0.t-ipconnect.de [84.179.52.71])
        by pokefinder.org (Postfix) with ESMTPSA id 846092C3720;
        Wed,  2 Oct 2019 10:02:28 +0200 (CEST)
Date:   Wed, 2 Oct 2019 10:02:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Do not use platform_get_irq() to
 count interrupts
Message-ID: <20191002080225.GA1388@ninjato>
References: <20191001180703.910-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20191001180703.910-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 08:07:03PM +0200, Geert Uytterhoeven wrote:
> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
>=20
>     renesas_sdhi_internal_dmac ee140000.sd: IRQ index 1 not found
>=20
> Fix this by using the platform_irq_count() helper to avoid touching
> non-existent interrupts.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")

We will see this fixes line a lot :/

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Have to admit, though, the new code looks much better. Tested on a
Renesas R-Car M3-N:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2UWY0ACgkQFA3kzBSg
Kbbu/Q/7BJHrrJMsb89JaYmOqiJQHsO2CvYEyzPFP17WQExQ2jxYjsILSTqWe0hW
+TvsDMcZ4FSoceakPqdsdm+J0m0qDs6seN4jll4LRAhHz3KYN9CXlyly9xnaPt94
HpcfzFHy2DGlewIororso78IuY4eMlogf5fsh/U8gimj4I4w7U8onDsUcGqAkHwt
spb7AjjZVGl9fCWSuSrHg0KvilQ2WvZGIi1grJayYWDRU5JEy5CbxJJx+BUrWOuD
g/kUjyXXUqCluSq4A9jQkETP/vQfLABmeQ1N32RWeQNmQGY0BN9jMmE4R4scOsyt
2rdxlgWKXzNx16xdASVvxth17gfv0paVu5FLA8Z/2XnV5loN3XASRPzdr7ULyKXK
iRg3o53B82xVbiyMMMhvxwQ1XDKRh2MN/ouyWH/hoO9YD83x2SGy9Fln8ayK6rCW
dAjHSBXsU9RuDAq6PuWZN+NbNt3a/99U2UugvcALABcNkr4qccgboW41ga9Otbah
KAq5bfwywi8xYex1sNAW4HmSYpfbdM1lOEWJfHzgYSYIr10Gqv7en7zKkDpZK8gl
iC7zpqhy7Mjz31FtBz1hWDskTQfg2TnB+YWmCDGNpKYxI0cF8po9AHWIiEuWF3af
/qqfpT+frtN2dGACSDBFvDq0k9ncc1oEDSvs4/CI+gjSi19dzkI=
=+hQN
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
