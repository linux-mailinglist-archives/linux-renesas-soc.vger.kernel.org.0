Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5D21EEB05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 21:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgFDTVH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jun 2020 15:21:07 -0400
Received: from www.zeus03.de ([194.117.254.33]:40566 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728696AbgFDTVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jun 2020 15:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=WiGsQ2qsBhvS3Xj7NDBbPyphfBwY
        +yhHsYYqF17bInQ=; b=F/CIgZLClYzydv7oHc1cNqtlSf2cnHcyRF43yEmoMVY9
        R0N61nSoPli8p+rDJ7KUlZLtQGCuDxZTgXbAkao9jJlXt5q/OTuEtIPUbnEDYFi+
        aDxb1M7g0ACYLHSoVl4HXyG4rByl+RgOcZVVz3qhyHxE4QYkg3EwuGVxz8Zvr4c=
Received: (qmail 1832535 invoked from network); 4 Jun 2020 21:21:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2020 21:21:04 +0200
X-UD-Smtp-Session: l3s3148p1@Ary3C0enjoQgAwDPXw1XANux7yWtmp4Z
Date:   Thu, 4 Jun 2020 21:21:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [RFC PATCH v3 2/2] mmc: renesas_sdhi: support manual calibration
Message-ID: <20200604192104.GA26501@ninjato>
References: <20200604120633.22795-1-wsa+renesas@sang-engineering.com>
 <20200604120633.22795-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20200604120633.22795-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if (ver == SDHI_VER_GEN3_SDMMC && quirks && quirks->hs400_calib_table) {
> +		host->fixup_request = renesas_sdhi_fixup_request;
> +		priv->adjust_hs400_calib_table = *(
> +			res->start == SDHI_GEN3_MMC0_ADDR ?
> +			quirks->hs400_calib_table :
> +			quirks->hs400_calib_table + 1);
> +	}
> +

Testing revealed that this chunk should be moved up before calling
tmio_mmc_host_probe(). After that, output from R-Car M3-N and H3 ES2.0
were as expected. Updated debug test patch was pushed out to the branch
as well. Tomorrow, I will test R-Car H2 and if all goes well, I will
send out the fixed and non-RFC version of this series.


--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7ZSZwACgkQFA3kzBSg
KbbY/Q/+NiC7/Src/5Iai+hH/M8S2HdKtBIZ1E7pXzdPpAkDBma6B8NYKG+2pf78
iLNJzW2uxfLSvbcwg7Xf5OCYk+9S3lwNAxtCZfi598nbhnmp5NOGR5odfixW9ZwT
Gur36AhJzbpYMHYOmkDGzfVcxMoUMdVWjWBOrUeB+k8eP5H/Cwa9gZLzkPt4H/3+
my92rqw0cy7CIlqHMEHv3RXG+FfytvVxNBLr9ECi19MlZM5V6aMp61OfosIU5p8I
x5caTY3Z0qWBAjgjThzNN+oX722u7cwIrOSyp2jpxJXAZ17bGes40irSaIl+6s9U
NwZ1djFe58nE/gzgpn/IynGwzdSmz205qD7632a8G7FhOzle2OrRTXF6czaJXwBu
SwXcMianV7vIztjKIlTrUHeT0R0/B4Hs/W/Ft9F1TSZ5xwlU2bs8l+3Qthsw+P79
cJRnrJsCrAp4dy43hG8qKhma2fIebmle6QOHC0tlqdJBECsXSoYlzGm4TlX1aWVd
ls5RgvxWg92+A9YM3u1QqSsph90ZFxGdQv5sgh/+g6ieBe5ldARlMGhgfmXfztDJ
brjTbt5GVIP+nur3TwM18LiwWyYu2jZem9B+7fDr1Fgg27k2bJQEBlVsKyxg5IH9
VPPj2R/SV/G2QrcPTEGyN6pRbUr2byHRUimNy0QqBC1BdrYFf3Q=
=1tZH
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
