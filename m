Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE86A41917C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 11:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhI0J0z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 05:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233657AbhI0J0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 05:26:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58E9D61157;
        Mon, 27 Sep 2021 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632734716;
        bh=cP8PfFLU4L7YAzlJqL8lEQFvTuQfa2qj9goDRM4Zc94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XZmL1vyV3ONn2aDYW+HBkgtZAQ8Nn7JWBASqYGqw7L8rOVpbsj0dHCgmbfGq8PqRa
         /9TvskfeaBT/oYW3Z/B03U0+hxAQUGPm+8cb43+M5/7pHtzXSQQanpXwc5slZtNOta
         +UJ3AC9yRjUjEKTdcvXnM4C0SecTSF9DHfSfeCRaZQ8qfwq7mlrjq/X+fMDJQGfIvZ
         tSe266cZyfodVB409WHy/6ikf0XWbbkN9P+gMyrly80pd+vgvqSdm0mYpAC6AGLfMP
         ZEXXRBQWRYC/PeE8pABsCzSgUUBq3Ur03BT1y8b1KGdoO/49nY3u9IkegoOHRziAnK
         rSVlw697Pjw3A==
Date:   Mon, 27 Sep 2021 11:25:13 +0200
From:   'Wolfram Sang' <wsa@kernel.org>
To:     Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for
 HyperFlash
Message-ID: <YVGN+Z1L8qPQg2uB@shikoro>
Mail-Followup-To: 'Wolfram Sang' <wsa@kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
 <YU7x8cabSsQiUJuE@kunai>
 <000901d7b1fa$ff9b57f0$fed207d0$@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N2GQsXvBUVT92+1/"
Content-Disposition: inline
In-Reply-To: <000901d7b1fa$ff9b57f0$fed207d0$@mentor.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--N2GQsXvBUVT92+1/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

> It could make sense if "from" would not change along the function.

Yes. And using a pointer to unsigned long would neither make the code a
lot more readable, I am afraid.

> I don't like #ifdef's inside the function body too, but the problem is that
> "__raw_readq" is defined in arch/arm64/include/asm/io.h unconditionally,
> but in include/asm-generic/io.h under "#ifdef CONFIG_64BIT" only.

I see. Bad luck then :(

> I looked through the whole kernel code too, and unfortunately didn't find
> any similar code that could be re-used or had some parts, extractable as
> a common helper. That's why I ended up with a local custom function,
> at least so far, until it could be found useful by somebody else ;)

Thanks for confirming you also had a look.

Okay, the function is not exactly pretty, but my comments have been
addressed and it fixes a serious bug, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Still, if someone has ideas how to make the function more readable, we
could incrementally improve it.

Kind regards,

   Wolfram


--N2GQsXvBUVT92+1/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFRjfkACgkQFA3kzBSg
Kbavdg//RQfFQIluYe9zs3pw4Z1TgRz/5fo8cu3x9+pnwxa7iSJJ1d3hITW3P7No
Q15o1n+ap2mbbl2kJufUwfcJ9GIhJ5GrjZV3eRR7We+QDZDybJxOGSflT6tONEL8
GZsHsWCVo87wdDmtC9UnMZca5NI2B43owKPcBEJbPDUGC1jNt3t4T0+9WC/SQDh2
VjVGaog5GcwM/xYkNKQpO/0qXt2IzG7pr4lzi5bhZBHiZkCWbn5CGGR+7WokVKva
z5UfGTQ4KVFIIfXQeu14rVMHSmEhpKp0S82WtbtO6aXcT7MggRUdRzMhbaS+qvZj
uahUj1yzq6p5ntK0/inJbVDTM8lV9ofB2aalGDMjiyRh+OJmEMabCXTcBKYkzCzA
+TtEOjxdXOMx5FrzAKrB7gpmga/kL6KKGZRKdqu0iTdcw4vplWZTZJp+a763NKWZ
hIcMYVEJ1Gvp1ApjaRmURobCy1qdBY5UG6+/+DsmAK17O/7z+xqh1Yyj728Kj4Ya
TQUVcIvpb3ZMI/BuTa1de58JNRKxWPwTBLwF7ikO4nCwam2PgdpdQYGaOWKeTYy0
xwsrC9ETE/vc1mNtI/MGRQFoV67JIE8quwmyRw3rvtIhGseLEoEnWgCiT1M+Ig6I
s7mlaQCMS0SG3/6K2cDAbnx/VM5NrhBlQxlpvSgDm+fQJwyT/pc=
=N873
-----END PGP SIGNATURE-----

--N2GQsXvBUVT92+1/--
