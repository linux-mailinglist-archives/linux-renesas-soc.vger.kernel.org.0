Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE3135C70E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 15:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241745AbhDLNJx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 09:09:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241738AbhDLNJx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 09:09:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B5B26128A;
        Mon, 12 Apr 2021 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618232975;
        bh=XwUFNbernxh8G9/2E7N7iYvMgYs7Tdv6Yd/vyKkupO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TfmW5LCEW4g0sWTGoOukXeLL8xBJwEkwCHSo38bx+pGmx19rTlWOLldHs+WpCEdgR
         J1g1xsMcHFF1l9twWuibhyUtcgSHLtJFiEEE4KvxVXyLUAT810RQYm9TUZpWYhHoVv
         43+I6EMXDqGPpvwYmgmiFYbP86y7xtPuOisWNzmktOTH2Pz0na754W7lAsPMkvlf15
         QL1wVLVoIE0oLx1qtTcy6vePW/486nnNFZlt6caMHweNYl/Q+8H7q6jMspTyx69wXN
         0oR1/ZQ0s1RTupXPTxt6XohGYQX+tqE0oxIblHY0Wn4Rl3j5h8H/h1RGwGjqCl6fHj
         rJPGezzJm9Epg==
Date:   Mon, 12 Apr 2021 14:09:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
Message-ID: <20210412130914.GA5379@sirena.org.uk>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
 <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
 <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
 <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
 <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
 <CAHp75VeX8H5E6GfVHxgu_6R+zbvmFV8fT9tO-nsm1nB3N4NF_A@mail.gmail.com>
 <202104082015.4DADF9DC48@keescook>
 <dbd6a71b1b907de004d23d2ea4b15045320f1ae1.camel@fi.rohmeurope.com>
 <882c4561ebc20313098312bb9cfae60736d69475.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <882c4561ebc20313098312bb9cfae60736d69475.camel@fi.rohmeurope.com>
X-Cookie: Air is water with holes in it.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 12, 2021 at 03:24:16PM +0300, Matti Vaittinen wrote:

> Maybe this 'hardware protection, in-kernel, emergency HW saving
> shutdown' - logic, should be pulled out of thermal_core.c (or at least
> exported) for (other parts like) the regulators to use?

That sounds sensible.

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB0RnkACgkQJNaLcl1U
h9Beggf/diaDjvhkVAUMvzAA1oX7AadNx6lHCjXXbm+NhdqiqkwQL1Vggq68u1ia
FxDab79iVpDTE8OMzcVaPak2NUweYBKnzO27jZTgeGvmPuYJgCPym/KaEMYrJ2bi
WJ/iu6qhoZtNEvvtzuNUG/MmKWsTmsSSVsHRdh9qrMX5X1DJMmSK/wLifS/oaFHu
4XYZomClBkP/KtOcPiceEwZiMouGDMyA8jxGYonD+HbLc8mFObkWDdIwdop7oP/u
idX7TwA+ZzDvwHtsBghyeebRJm3Itbm05wGRw3g+mwVH9DdQBDXvQG2BRA7lv38U
oqnNZSLTsIgmnLutP117InScnrXWGQ==
=g1QC
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
