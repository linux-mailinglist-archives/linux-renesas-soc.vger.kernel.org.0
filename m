Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BE14180E4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 11:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237469AbhIYJ4g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 05:56:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234958AbhIYJ4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 05:56:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6910461284;
        Sat, 25 Sep 2021 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632563701;
        bh=c5T6zU+SY35ikONG9tjbB3e3jqrFD/ZNAqs8TooyR2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKnBdgn/WObAYXYY0yCoHxyiRDiTeLjmdOn4S1gygSBxfkgkhT1fUkdlT/wxyVXOg
         qTw/gBXa3RyOu+5MQxKoA1gRD92MPpdXfsnGkwbFqflacLMCprNZx57oFoPYwjI1M6
         i7rzyyct4wYfvoCgerNBPLQFgr+FCDLeOb7OgjQERd91k9BJURUBAW4RfytG/D72e0
         qI+CrUTHyVW3HYE01L5TeOQpS2J3HJxTLTRfBZf7W7N0uSxBaQ32B2kviwksrjSz/k
         7I9zAK2ENXfsqIvAIrC1AC9KJQU6p5r/oI7ra7XKpDW45A2hY4ZsLQDktpjHnsybeA
         xIK7b8Nku/RPg==
Date:   Sat, 25 Sep 2021 11:54:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for
 HyperFlash
Message-ID: <YU7x8cabSsQiUJuE@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2b2Mt6ZnuCr/rhGc"
Content-Disposition: inline
In-Reply-To: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2b2Mt6ZnuCr/rhGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

thanks for this patch!

> +	const int maxw = (IS_ENABLED(CONFIG_64BIT)) ? 8 : 4;
> +	u8 buf[2];

I could imagine the code becomes more readable if we make use of
something like:

	unsigned long from_ul = from;

and then use it throughout the function?

> +#ifdef CONFIG_64BIT
> +		*(u64 *)to = __raw_readq(from);
> +#else
> +		*(u32 *)to = __raw_readl(from);
> +#endif

To keep the ifdeffery minimal:

	if (maxw == 8)
		*(u64 *)to = __raw_readq(from);
	else
 		*(u32 *)to = __raw_readl(from);

and let the compiler do its job.

I wondered if this could be a helper function somewhere instead of open
coded in this driver. However, I did not find any similar code in the
kernel yet, so it might be too early to make this a helper. Have you
looked for similar code? I might have just missed it.

Happy hacking,

   Wolfram


--2b2Mt6ZnuCr/rhGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFO8e0ACgkQFA3kzBSg
KbZwkw//fYRLpolAFcv9y54WDH7ljhB211G0EVedO+4iVz4hOte3H+dxZTwSao9P
YDCCrnozgj1nW7efgH/6lFumvFV2R0RV2zNK7iiJCibtLqp3s7hmba9Qk3Po/MTI
JDaLBsEUgxqcgFCm425JKc68M3gczRELCJPCmUP4k/vpK7dH2ZwWqW0kv9CVQAaG
x7/9OQ++iBUdkt/qXryY/+0dW8I2PBOqOqhTe/wz+zftf/+V21C5zBnQ82MbB+Nn
ABlZDiF2LEF84MIuSOdmH3wPDo3LLuE/+hqT5DO5YPuRloka/8U2t2Y745p8urTN
s+X74Q6MrewEl2FI/j8z7VeVcaoKwiLEQORRMzPJil0pLGxmSwz8NH++oQfrVCz3
wYKkKjfcMup8zohCTsitS82dg49dlI/a+IVf6UkWU7vxpCzLsYQ/UhKEmLBTgcoQ
s7sAQp318RlrMy+N7TISe8ijF61qNputUEzbKenESYvtQWJUClBZniCDT68U56uC
Ssvp9ZQwy92/jkXCRHg0e6M+/4xgQqs6JPiIZDVJGdf1+fKHTElCWPmr1nVx7owB
AtRRfsdPSv3G6v6wj+20AcdW4TCNSFHPPS/lyvr7lYeWQ/lPTWi+lPSx0s7/ELXl
H7vOVQzcop5OAPl238BhxZmjpvOvCeGc+74q4bjwT1Q10jFmck0=
=iify
-----END PGP SIGNATURE-----

--2b2Mt6ZnuCr/rhGc--
