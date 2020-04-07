Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5892A1A0FDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2020 17:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgDGPGF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Apr 2020 11:06:05 -0400
Received: from sauhun.de ([88.99.104.3]:54070 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgDGPGF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 11:06:05 -0400
Received: from localhost (p54B3320F.dip0.t-ipconnect.de [84.179.50.15])
        by pokefinder.org (Postfix) with ESMTPSA id D07F92C07CD;
        Tue,  7 Apr 2020 17:06:03 +0200 (CEST)
Date:   Tue, 7 Apr 2020 17:06:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH RFT 1/3] mmc: renesas_sdhi: refactor calculation of best
 TAP
Message-ID: <20200407150603.GB4308@ninjato>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
 <20200306093159.6155-2-wsa+renesas@sang-engineering.com>
 <TYAPR01MB4544AD566F267EB89F479C3CD8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB4544AD566F267EB89F479C3CD8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

> +		if (re - 1 - rs + 1 > tap_cnt) {	// "if (re - rs > tap_cnt)" is more better?

Oops, looks really like an off-by-one error on my side :( Yes, I think
're - rs' is good here...

> +			tap_end = re - 1;

... plain 'tap_end = re;' here ...

> +			tap_start = rs;
> +			tap_cnt = tap_end - tap_start + 1;

... and drop the '+ 1' here.

I will double check, and resend soon.

Thank you very much!

   Wolfram


--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6MltcACgkQFA3kzBSg
KbYDYA/8DjU47e7yKn2LDzde0lmuchoF4tyG3S69q6O1MuuLJwBCDS39Jvg2WQNc
GNeXZwZYwgdee3N8FJFftJvwS8GfYA9jrvpgd+5ZRCQPH4RZo3ymOKUVC5H8ENmb
6P8cD42LFdQCP7SQy6hCHPNwvJLhNomrwFf45++j0PMH+/PPvSNi4uVixacxmJdY
RVst+ibpq2/EWXNAFVtDEsVKWz5GtiL68sX16VBgfaiKpLcLw03wMloTFJF7jZx4
bJraeSlJWKkKLlKjc5XKJp3hRhkrdRHDsUTR8sAZCxAxhmfJrrJeX7D3ay/QRpKo
QQ9ArM7SRS7o7/UgcKChPTIz8B7OUv2OoKKZRPT3mooXJMyrrpOajaS3mZvaO3Jh
uQIs1Dd8j1YE2VVY8HBD1mm9DDvGxABhxbliECf+SBzCzUwb8/1+7WG4TnZRIORp
jI0wDuEEHgIug61mk9AHCFziilPu30KDI8APvfR7+VeKluRfguW5GmAY1/WW2zQz
tkteKCUapV8M1e0Cvv5UakJmvHBGOBUvPhegG0HXaOKJiRq3xTE/NfDo28yDa/vt
AORRxeC2RbroMqfrH4N4dwIr6Yc8LZyhuDm4X/jubPSQdiRrMgL0uFmpNz7zpevb
Tou9wFPjWUS9TfUa2aq7kIObhPNyC1h6OOrkY1iFS7c+XCrIBhQ=
=Bg6V
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
