Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F9D33220B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 10:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhCIJfr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 04:35:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:44608 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229546AbhCIJf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 04:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=n7IZtrf6HP1LR1xM7z7VmZuPyfdL
        6oRFIfd19Uniic8=; b=Kqapk4x2ny6cIqlxzJxcgBQ8wQGF+eVNQD8NlAa017sh
        /or/UUDdOwMhRwtNaSfGTaONgmxRWqe6NoswQ0bg5Qc/XUIwctvb1RHIfvK99U9a
        s9PydUQMNcCG06q2itlBjepcez52c2F8s7FOxFEEw/sKdVP5rJM9k3fICEBhi4g=
Received: (qmail 3423366 invoked from network); 9 Mar 2021 10:35:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2021 10:35:25 +0100
X-UD-Smtp-Session: l3s3148p1@EvkkRRe99IogAwDPXw8WAIb6kxwVO+fo
Date:   Tue, 9 Mar 2021 10:35:25 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Phong Hoang <phong.hoang.wz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] clocksource: sh_cmt: use CMTOUT_IE only when supported
Message-ID: <20210309093525.GB2538@ninjato>
References: <20210305132859.8208-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX9f_G9zMR4=snbHUOP0ufNg8CvSxX8P6+W-z7hBRbQ2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9f_G9zMR4=snbHUOP0ufNg8CvSxX8P6+W-z7hBRbQ2g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> But given my comments below, I think it would make sense to change the
> one-line summary to e.g. "clocksource: sh_cmt: R-Car Gen2/Gen3 do not
> have CMTOUT_IE".

Makes sense. I will resend.

> SH_CMT_48BIT:
> sh73a0/r8a7740: CMTOUT_IE supported on channels 1/2/3, not on 0/4/5

Oh, I didn't spot this, sorry!

> So even not all older models support this bit.
> Probably this bit should only be set when the timer is configured as a
> wake-up source.  But that is out-of-scope for this patch.

Ack.


--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBHQV0ACgkQFA3kzBSg
KbbUyw/8C6Io79yVtr6yxqO0MuUvsVCLmpoanc2pKkUOQ6uLXyuS11KZhms/oHO0
us5CCqCVzC5DoUg1f17Yyp58M8oc/aacm4aeGPKGHZ3jMPz0jWDVmShQZ33QvRV6
Or+bJ0upaSiGEOqmu/k04XcIEcYzdLlniN7vuWjwSdU5JGmhtLt0c/SGpC5lBw9a
H+ygVLS7ch5Ajrj6BOhN7yghdsu7ECrsdwvlsE77VMOER18WIEpiJGsMRbwOX6cj
17jDCbu1d4NnUYx/7sK3rRKvH3eQXge4mmu1rMJDNY3H9o5m1ovadHXdpSM5mJEw
ZRcBlax1bVzafzBMzTQtSjA/gR1+VtgMUg0++CXvEwgjW6/8TM6vNwJQgYTBdSfL
eiFy635irB0EqMVR9qzWfDGXpebtyLb3Ufrv89To3eWp/CoU1FvfPwuV9DrNElUD
UHpu+1pSFTwcTXtYKKx9+qIv8VzGiI1SNysKmB0zVHFu1NuoamtXtUNRYXE4f8B4
9S9aYZT6KfdDsc6GbX76HzcfypSKvk2/FzVuMPVNpdRlWepTsIVg92CdkaA5MUno
jvPshyWig4PJyZ7R1nrDJl+05ZpeHt1zgF6VzOtRh/3kbpOsI/lvGm2OT/gM/qVD
lCjt/gSOymq7tWn/z1VLHu8IQFetGC7gSbV/V39zYpj5Silm8Qo=
=jkZK
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
