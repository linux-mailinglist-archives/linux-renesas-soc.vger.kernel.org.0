Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA56352E1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 19:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235419AbhDBRSs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 13:18:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234759AbhDBRSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 13:18:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2648610FC;
        Fri,  2 Apr 2021 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617383926;
        bh=qRViIDtMdjeHpcLwGsNEWtbhJMS3plMZQpORW2GTlp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Za6t8yhHKL3/XrJEgrXnsVUPYVL6Sba0QrJNBi37A2l9nW3ait0ssPax5CgrPZ0Lj
         Bji0vESEFGs6WwBem9xr5MF+wfS1uuOWheX/Q8151xZKAlBZHia/RT4qfcCCLn+GnT
         ZfSQp7j4byrHKY7epmkCqMZHYK2qqxd2EsS3lTG+9W4+ONjkqIvi0x2i8VZfUNFE1m
         nf5g/imTkLGFasBuALyGchBQwV4iEebpStwbkzsDqw2zXPOyYMAvp6MwB1ciIX1cvV
         sE4oYLvyxXENE+rDZoe5ECCFd+5dhZ69AiffgsYPRng2GR3LXb9ulf+p/+SXFLRjwx
         dn3sYiVzdQteg==
Date:   Fri, 2 Apr 2021 18:18:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v3 4/7] regulator: add property parsing and callbacks
 to set protection limits
Message-ID: <20210402171832.GC5402@sirena.org.uk>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
 <b949e8131ffd8775e46fc51d3a7558586a9a4be1.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
In-Reply-To: <b949e8131ffd8775e46fc51d3a7558586a9a4be1.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 12:23:02PM +0200, Matti Vaittinen wrote:

> +	/*
> +	 * Existing logic does not warn if over_current_protection is given as
> +	 * a constraint but driver does not support that. I think we should
> +	 * warn about this type of issues as it is possible someone changes

The "existing logic" bit here is for a changelog, not the code - as soon
as the patch is applied the comment becomes inaccurate.  This also seems
like a separate patch.

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBnUecACgkQJNaLcl1U
h9Cp1Qf/Tzo9fwunOUHYhV5M9LcRlngHJ/qE9Wnk7ACDOaB2N/PzYWABcxPHQqLv
lLf11Qs9QKr/5m5Od0reAZ96KcFLJUaDvLq1N1gHH9pWexn8JRt2kmpAJp6hJwoz
ZS3QI3GCIjOxitwVZ824imKOQnRwgjQtwvPsvTrB2m4yq/kKhJg9JJVc/05UW8zl
1aVAiAsOIzWv438tLYG9vkozrpY0W+CxHKZwWNBvP2ibSyIWr/WVh3TnW+Rj3TEl
gB9yXRizoU1Zwye8rkqILPBPhKvL5RBraGEMyIDk1SusNi45Uwec2ACcEB2mTVtq
KVl2yvrzLEYxEUdkycD+FMt1mZ1DCQ==
=cAkm
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
