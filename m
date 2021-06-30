Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBF43B7CCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 06:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhF3EoN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 00:44:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:37898 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232836AbhF3EoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 00:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UXXFznD90qL7iDvgVLruj1D7BeFI
        zon+M5vVdJOgFtQ=; b=o1jdGEG1kUln0/kwlEjB8aCoVE4hFbHm5D6ROkJb8bUK
        v7uKUfko4pBU38yMLPKfCiAV6U86rKShL/mbkYQ7C3uryjS3klZ5mhQnNFHfc8nK
        vTdCihhJIf2PmqHlRbHTuVieljEEkfycv99GaAAoiq72yztnF1dlRwv9WjiSuUQ=
Received: (qmail 725774 invoked from network); 30 Jun 2021 06:41:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2021 06:41:35 +0200
X-UD-Smtp-Session: l3s3148p1@xn9kVvTFJNUgAwDPXwaiAGDoJRk6bv4I
Date:   Wed, 30 Jun 2021 06:41:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH/RFC v2] mmc: host: renesas_sdhi: Refactor
 of_device_id.data
Message-ID: <YNv1/9WsdYu3ZwVv@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210629102033.847369-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2YCy4zVG6KX+RefL"
Content-Disposition: inline
In-Reply-To: <20210629102033.847369-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2YCy4zVG6KX+RefL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

thank you for taking care of this!

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reported-by: kernel test robot <lkp@intel.com>

I think this Rep-by can go. Test bot mentioned one build error of v1,
but it didn't report that we should refactor this code.

>  -- should I make step-by-step patches to ease review?

I'd think this is good enough.

>  -- should I rename the current renesas_sdhi_of_data (e.g. renesas_sdhi_param)?
>     (renesas_sdhi_of_data and renesas_sdhi_of_data_with_quirks seem strange
>      a little?)

Yes, this may be a little better. I'd think the current naming is good
enough, though.

>  - I tested this patch on r8a77951 (ES3.0), r8a77960 (ES1.0) and r8a77965.

I also tested this on r8a77965.

>  - Also I tested this patch on r8a7791 [2].

I'll check r8a7790 later.

>  static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
>  	.hs400_4taps = true,
>  	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
>  	.hs400_calib_table = r8a7796_es13_calib_table,
>  };

You leave the quirk handling of different ES versions still in
renesas_sdhi_core. I'd think this should also be moved to
renesas_sdhi_internal_dmac? Then we have all the handling in one place.

> +static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
> +	.of_data	= &of_data_rcar_gen3,
> +	.quirks		= &sdhi_quirks_bad_taps2367,
> +};

I'd suggest only a single space (and not a tabulator) before the "=".

Rest looks good so far!

All the best,

   Wolfram


--2YCy4zVG6KX+RefL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDb9fsACgkQFA3kzBSg
KbaX1g/+PIpEmQqrerI8oTCNf5m0ERfVxrO20XlZj210b0oYPfDwg0OQDQCtoyJg
x/Qha+G6wJZmyUxUsq16tlI7QgQiI7smidY1tDe4eIGq88wNMKef7WDWLq6BWVeT
OgjAzB2GF1LmjLCiE4ZlD7QBao5XKrH4Tn/iC7ZsG7DYtemxw3QH+0gZxvVDTiWM
f9ytLnhIrZXIF38gr3wyMBV9EfFHYzebOJBFdUCeClq9hA5jZo8Orq5BNBOgYY/k
RpSL9pFRnif+y4rCWw77eyym4ef9mG0kSahnlDpl4ulNAzPpZs09ElfbCIDdC3hx
a74XZpSqcC/vATkjD7HBwnog0XCm4QyL3NQ+TzX3mqEIKk2/+aBGr13kXYtIIQko
TlSdq4LM8jiWW1HpxaiedlJGYDKxNxo1lj97vDAgb2/BxGXNDkGKY2jif1eZxtR/
Ua4LwObRSMw3eyQrcimZB+qUarr1MVf7/m/+1TDge0zgtH4MaX9+LPyemQlchg16
bg26CmVCB9zTtPt+sM7dwpAaPlFuryCmCW8Ox3cs7Lcxzl0tsMixCyCA8YhQ6uWY
8ewx9nuqgjrisfJDBQ0Sba7C4/A7RvEZDwoh2ABJQ9Uo9oAmVt7rVEl1Iq5gIGv9
7H1snIQjNbtARKhGiI1kz9Cr29WXT7hgRSXCG7OYkzF+VW+0BlQ=
=eKF6
-----END PGP SIGNATURE-----

--2YCy4zVG6KX+RefL--
