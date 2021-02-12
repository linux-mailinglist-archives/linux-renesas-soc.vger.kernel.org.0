Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5196F31A02A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Feb 2021 14:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhBLN6G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Feb 2021 08:58:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:40208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230249AbhBLN6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 08:58:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 015BE64E57;
        Fri, 12 Feb 2021 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613138244;
        bh=v4zfZkRGfMEsNs46OiyzraGryvAEHvd4MX/NPDSMX4I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=td3De8T9CuymU1OvNXoEQg9Urm1F4nLlbG1Se4Dj17bNJq/A923AY4oS+l9b0L2ma
         turAE+DZPk0Bx7EidvByJmaOivX2g84j2u88jI1B9Z6JaBzi2/SIzCSnBH/hCo4ZED
         bFk3pedUEUsrCdWzNZoVdUQexKXQvX5EtsTLWclDrSQTgOs83e9lXCj2XyCoU+NDue
         j7OJV/AYDdeWb4KAiXp/MxzO8pTQ5mtHpRHEM6VNQkZ7Z2y61DpFUa/+5VeVZQer4b
         9rA1pkSPVd0yorV9R2n8SRu8dAOpBYeJRWUM6J4qlZMcPLP63JUKJFEPAL1K/SAjtp
         J1BnCVeUkd+bg==
Date:   Fri, 12 Feb 2021 13:56:30 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "tj@kernel.org" <tj@kernel.org>,
        "jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 3/7] regulator: IRQ based event/error notification
 helpers
Message-ID: <20210212135630.GF6057@sirena.org.uk>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
 <3daf0531910c25d8b0da3964778ae2a6c9049d43.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
 <6355af19b137fe25d55c33f813b05ba43e2cd41e.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline
In-Reply-To: <6355af19b137fe25d55c33f813b05ba43e2cd41e.camel@fi.rohmeurope.com>
X-Cookie: One size fits all.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 12, 2021 at 09:33:44AM +0000, Vaittinen, Matti wrote:

> There seems to be few drivers which need delayed wq and which implement
> .remove() just to call the cancel_delayed_work_sync().

> I think this might help cleaning up those(?) Or am I completely off
> here?

I can see it being useful, yes.

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAmiQ0ACgkQJNaLcl1U
h9CMuQf9HAhei76oYBLmI/hNxYHgRwXYNE689EdS2oom5KN4iOBmVDDX4Me3G0j/
11aTN8El2PFkjsSMy8og0ckMsHeStFzDEf8w8ebQ3v3fM2XnJQu7ziCo7EYXgDYr
RPBdg0WkR/5DrLwqvZKff5ruOa8VVX5EBkWTg7unmlE3bfvrI/U2/hB4626OlgaG
pKOWECigmK+J3dPiAKDzmhYrcAJ1Uo0ZFOlxJMWIFA8+/mMGAKIi7TCpDP/GqGpb
w83q2T3SrtDUkQ3b/bohpIRuc81GzLxYBu/8SBkpRHlO4lSKUYM8m1h+vNXDbW74
37gH3KhykFPng9eb6BTZyZfrhNtGZA==
=Lycb
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--
