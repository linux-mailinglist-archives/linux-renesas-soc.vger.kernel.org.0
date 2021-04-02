Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35857352E27
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 19:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbhDBRUT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 13:20:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234759AbhDBRUP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 13:20:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E859610FC;
        Fri,  2 Apr 2021 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617384009;
        bh=/oRfrKwnEXtm1WjEs1TPW0ewxxpL+FhjrN/lk72ZiNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i4GU/2nqt1EtROfjvsIeUyBLEUDeYtv/j6ySZ0GajtCquos2Pti5rRnOV0FzbZScr
         36PPZe4ruIe6ompT22NcHPTJg9l4DSiUQYsicXJ5jvDkCWe53pICXaFAsh+EoiWXs2
         Iy0vWWNxhC5aNUs/1xbEfUaBiuAFg4W37FeeLCfrsUPBGImUI1+KQZoMuwWzDUUGjg
         BRpqsBQhAtPcrbXU+McB7IPdMMJeJ79Cj7HFpE98vqUrykMW4Z8+v0vW4BwuWqjVYh
         XMjc2bgpb3zvc1N+cVcR7wFeAjpoWVfLG6WXLYSrEAVRja5Z7SCZU7JlZn/on2q6KJ
         O9lzdHR0FA76Q==
Date:   Fri, 2 Apr 2021 18:19:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/7] Extend regulator notification support
Message-ID: <20210402171955.GE5402@sirena.org.uk>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline
In-Reply-To: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 12:21:01PM +0200, Matti Vaittinen wrote:
> Extend regulator notification support
>=20
> This is an RFC series for getting feedback on extending the regulator
> notification and error flag support. Initial discussion on the topic can
> be found here:

This looks good apart from the fairly minor comments I sent on a couple
of the patches and the schema problem Rob reported.

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBnUjsACgkQJNaLcl1U
h9AhKQf/W7QuRVe/0/sKZkuNszOyVEdPTk2N9XpAhKywK3wzOMA1WORcvxMcVTnu
gP48Yd3p7CuMdJp6OQH/uCkOUuDFiGDNHyJ0VRPGs09/sG1XFMS5K6hM0Z9ZY+Ap
sf8w4BQqi5H74hpnu42GKssJIzWD7odykSKRzScjs/MiNc7iZ3G6lw9gPdSV9M+C
FMKdy/XaMBNvJ9O6yCDuC8nsYhjUoreaYmCJh0kmr2yRRexrHcquOQWR6Fi6PHTf
lMASUcqcTOse9l9Tmx2C8gwZJmh/Gqziumgqm4vcldO5e4sgdVuOQAkNNUScoGHg
UEv7JqQGhaonqP9WxYw1odTAFPdc0Q==
=Vooh
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
