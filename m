Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F144640D868
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Sep 2021 13:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbhIPLWm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Sep 2021 07:22:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:59016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235686AbhIPLWl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 07:22:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCE2160F6D;
        Thu, 16 Sep 2021 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631791281;
        bh=SaTDA56yI1Fe/kURWXyTxtc5YQ2b9Q7ApNFqhkQTX90=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RL7m/zvln11z5pmVjdUsguErGqsRCtQFq9KKDhFG3dYGXYbz32rTfdEvkWXk5049Z
         uthsGp4RfpxMYVLiwsTsLNBRdSgShiTOiEdMX/lbvPTjVxkNhnmDi3rxv7Fga3HiHU
         nh27Bj4tCFa7e4U4Ze9VrJxgfdqwaRDlFAiWY3v1P03a4sKBJx9FnS4ZrSQVYqDoAU
         AIQ+Spid7o+a/sCU5QVSlmodBPXRYJQDhu7GeEyufbGzFcfTS5qKYSGiRbqN/g3GpP
         Wj0eUx2YPr3lJPnYaoXsGC1tYbcHrbYj/Rbbb9RnLNEgdNttD7CSnkse6qMJ3vWdwA
         jyQuuEgNEoaEA==
Date:   Thu, 16 Sep 2021 12:20:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mfd: bd9571mwv: Convert to json-schema
Message-ID: <20210916112039.GB5048@sirena.org.uk>
References: <29de13c075b839ed62cee189b6eb262e540c6553.1631707026.git.geert+renesas@glider.be>
 <dbc3f4bf-78cd-fb97-2502-ab87f9881179@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
In-Reply-To: <dbc3f4bf-78cd-fb97-2502-ab87f9881179@fi.rohmeurope.com>
X-Cookie: We've upped our standards, so up yours!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 06:31:45AM +0000, Vaittinen, Matti wrote:

> 'regulator-boot-on' is in many cases used to make the regulator=20
> framework to enable the regulator at start-up. What I _think_ the=20
> 'regulator-boot-on' is intended for is to advertise the regulator=20
> boot-up state for regulators which do not provide a way to get the=20

It's for cases where we can't read the hardware state.

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFDKIcACgkQJNaLcl1U
h9AXOAf/fuL//nbrbFVijR7M54U9xop9z2dRsdf0rO50J5NwEqasgQUjCAW0eK1v
YHlZRVcwwXEjZ05TMV+TIY5CM0VlR5HmOa0+M4YkstEk6sBePHbGIUNI4M7eq9oy
0kOsxFXPKuSUQonfW2YWlKlEsDdnWK/Z1r80xXlMf0skyThEInJDvWYVKExlz5DA
kKV9lnnRE67JKR438TGsq2Em4MBMH8mK4ntW8hMRDUNCtkp84JI5PIB+tlR0Bnlt
nH9UGmy6IN6+uvUcUmoKBqq8VLf5m9on8KTKHrOs4Qpi0dPh+Op8RPjmHuLkT0xd
YBseuWiUxuFaWCtOKmgGOU/ZqdNsvw==
=Zib3
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
