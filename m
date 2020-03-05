Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4FF317A130
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2020 09:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgCEIYV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Mar 2020 03:24:21 -0500
Received: from sauhun.de ([88.99.104.3]:45142 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgCEIYV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 03:24:21 -0500
Received: from localhost (p54B330C6.dip0.t-ipconnect.de [84.179.48.198])
        by pokefinder.org (Postfix) with ESMTPSA id A7A422C1F28;
        Thu,  5 Mar 2020 09:24:18 +0100 (CET)
Date:   Thu, 5 Mar 2020 09:24:15 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dennis Zhou <dennis@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] include/bitmap.h: add new functions to documentation
Message-ID: <20200305082415.GA1079@ninjato>
References: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
 <20200304140920.6109-3-wsa+renesas@sang-engineering.com>
 <20200304204026.GA55400@dennisz-mbp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200304204026.GA55400@dennisz-mbp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I found these functions only by chance although I was looking exactly
> > for something like them. So, add them to the list of functions to make
> > them more visible.
> >=20
> > Fixes: e837dfde15a4 ("bitmap: genericize percpu bitmap region iterators=
")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: Dennis Zhou <dennis@kernel.org>
>=20
> Ah thanks. That was a miss not adding the documentation. I can pick
> these up unless Andrew would rather run them through his tree. I have a
> few other miscellaneous documentation cleanups for percpu I need to run
> anyway.

That sounds like a good fit to me. Will you take both of the patches?

Thanks,

   Wolfram


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5gtysACgkQFA3kzBSg
KbaSyQ//a6OXSGwK/vLNNCOnhGY6pviH+BI2Kt82p5SuaSru/5vIskDNeMCMALkn
KX+e9JA87IyNXX8nGSznpbWOpS5Mr8Olmomhl6cYoEODwW06AEPvzsqxIKn/I1DO
0Hvcj1bUbt/wCUuP1GdQAGBJvNYDdDUwwsNVixJCRdM6pxfmTPAWzybogTVy6g1I
HIQkUqpZS3WQ2euffU0z4fJ/hThAGnLK5T3J9irqZnGDp054f+DS64ytrmMCeboD
7aITrunzud7KaMYCSV3bf957MZiU7wqZJZZZbhsVnFdyTLRF9hE5bRVQdAb3SXYN
lhHMhGTkUvZdgRLWPWMaRhGpEj7GWRvhIlql4+s+OK4GDUPHW/5X7EqwZEC2ZQ5r
hX+hHi+cokiOTrHA6YvGWAnrC+6W0IlEVNJQ6phKC30x+wvNStnZLoa5htO+kNzT
wvbHOgpaK/sGD2+cmTQMDgZ99v7Zok6pkBMs/Qu4e/HrnLALLIfH7DCkkBkI0w2i
6cOARozzG7k1NPEGKjEj1N1Re+O3HfIqcHf33N3nbU2hcCmeiv4GL7AxA/g1Z3Nn
mCVW6YL9PktQkc/zzAuD55h5BKBwuQtVBPwXAdSyhXwBaQwd1abbKDdiS42BmOA6
C2PxnxZBr3q3tB8mhZjzM+y9DDpig4t1yuMo6RdFkcmE6UeJhIY=
=vIoE
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
