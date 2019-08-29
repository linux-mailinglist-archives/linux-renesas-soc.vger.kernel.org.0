Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E346AA2258
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 19:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfH2ReJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 13:34:09 -0400
Received: from sauhun.de ([88.99.104.3]:41424 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727410AbfH2ReJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 13:34:09 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 56C322C001C;
        Thu, 29 Aug 2019 19:34:07 +0200 (CEST)
Date:   Thu, 29 Aug 2019 19:34:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: sdhi: fill in actual_clock
Message-ID: <20190829173406.GA1127@kunai>
References: <20190828185518.4340-1-tszucs@protonmail.ch>
 <CAMuHMdWcp-3B7ZZjbyo02ECyzDX_rQxXF645OCutCkjUu_jWaA@mail.gmail.com>
 <FaBiPuw0MFfdsj60MQTULROSN-8cSV7sNRlgO5SSVPo5jfQopmm9zTq4JT71VxaO32qdcAhisOrhFYG_QLByLNHcBrMgshsI_WwP9rlH2ms=@protonmail.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <FaBiPuw0MFfdsj60MQTULROSN-8cSV7sNRlgO5SSVPo5jfQopmm9zTq4JT71VxaO32qdcAhisOrhFYG_QLByLNHcBrMgshsI_WwP9rlH2ms=@protonmail.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It would be possible to call clk_get_rate() unconditionally but
> there's usually no need, thus the ternary. Are you in favor of that
> though?

I like Geert's suggestion. Even if it is "usually" not needed, I think
it is better to be always proper. This is not a hot code path.


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oDIoACgkQFA3kzBSg
KbbqQxAAkEIlIUR/pH7ns6rpMdSMyadvSmUCzGCB0JMIOOCsQvvEg5jdC3cP+9+x
p2ynHXyxOVKmMPGy6zKeGfv2AgMoa6rCGnDSX7v1Yuj2vLC6y+a+dkw3dZILXvtQ
15aAGYOpGNqMqWYyuj3O7Q/AELjh7oDYbovJyqL19pQd7SdFpJ3BEPwdbSMgPT+L
dU5fqll6UvpstB+U1S6m5wBLOnNkCUBciIPoTvjC/YOde8jbJEWgTgnlH0ZDvZnx
lX63Yigqn/jLgUG2XMV7E7VzLhH/CUFGNFNBn7RqoPbqO20nPrIIrbd19WmXwlkU
piEh+mEPtLpzIoUXJu28x8MUQiQyOu9OhlbePBQij2Vjhh+ki98LJF2qbHajCBIt
rnTO9BOtZjlt4UnHbe3sDnnHQxdu0zGeXdI++ieUqZ+GqJQvBKwdoiIWqVvs3Yc9
9ccDwUARByNOTJf3icbzMnZWfnP3jiTgRWeggJM/n+4s1l0ds89QS2cyGCDTfZnt
jAjw2pUz3Xwz5aQ23/FSBbNtQF9IRvH4rWDYeAuDU4Ek2hBd0hT/HpK9R1XNyqFe
KnnadHFlPGJiWeEBLjmYS6wQlMYPoLpa8aw5LjgpQE1NNfGMVoYG9pEnJtlLrFm+
rQt1gbAeAWqrNKKu7R/G9inj85a67I0pxNZxGnGrGHHbputXWkA=
=KOsZ
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
