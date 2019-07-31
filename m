Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E577C0F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 14:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfGaMQE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 08:16:04 -0400
Received: from ozlabs.org ([203.11.71.1]:41763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfGaMQE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 08:16:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45zC7h6dQ5z9sDQ;
        Wed, 31 Jul 2019 22:16:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1564575361;
        bh=5sST4uA7a8v2Bkt32XwqcTJdnvlaNvANZv414a4LsFk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N/ZCazuBTeGS96zt63PfnYIsZlNDHt6v9XqOrgUIZ7kX7ZoHqylhgwn3yPHS528P6
         7MGlGbmQz5av3B8CRavNabQYbPJNlG6Ks0dPiTDcDLXmESDDnu+Rf+yXMfjVzc4Iew
         WFdMVn2t8GAWRCLpGp74S0o5Z5FfKCtdfrza/gOxsISXnscY/ITg2sOWOGF29tZP3+
         cJNelRxlEbrPh2aju4gZhXccxFUmdlVaBrkAHtq9sYlhrB4BwnH+HnNQ49/rfUa7rC
         l/Jsv9p+A2DGK8Ou8zpcq+c0QsqZlG6MwgRIcGIMRNFerzrNbG5vkAQ8Nr5/XEwd/p
         t+A5c//Q9rjmw==
Date:   Wed, 31 Jul 2019 22:15:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: New Renesas SoC tree for linux-next (was: [PATCH] MAINTAINERS:
 Add Geert as Renesas SoC Co-Maintainer)
Message-ID: <20190731221550.5be0a103@canb.auug.org.au>
In-Reply-To: <CAMuHMdV1zXCq6dbcg6=YmHgYqE5tfc1e7DbB3UgTVPm-5rU2Bw@mail.gmail.com>
References: <20190729175658.13672-1-geert+renesas@glider.be>
        <CAMuHMdV1zXCq6dbcg6=YmHgYqE5tfc1e7DbB3UgTVPm-5rU2Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8KjFQ.PEdR.jGnI=ekR7oRB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--Sig_/8KjFQ.PEdR.jGnI=ekR7oRB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, 31 Jul 2019 09:33:19 +0200 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> Apparently Gmail marked my previous email as spam, so probably that's
> why I don't see my branch in linux-next.

Nothing to do with Gmail, just me not reading well enough. Sorry about
that.

> Can you please add it?

Will do.

> Stephen: Can you please add my branch to linux-next, after Simon's
>          branch, which may still receive fixes for v5.3?
>
>  ARM/RENESAS ARM64 ARCHITECTURE
>  M:     Simon Horman <horms@verge.net.au>
> +M:     Geert Uytterhoeven <geert+renesas@glider.be>
>  M:     Magnus Damm <magnus.damm@gmail.com>
>  L:     linux-renesas-soc@vger.kernel.org
>  Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.g=
it next
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
> next
>=20
>  ARM/SHMOBILE ARM ARCHITECTURE
>  M:     Simon Horman <horms@verge.net.au>
> +M:     Geert Uytterhoeven <geert+renesas@glider.be>
>  M:     Magnus Damm <magnus.damm@gmail.com>
>  L:     linux-renesas-soc@vger.kernel.org
>  Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.g=
it next
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
> next

Added from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/8KjFQ.PEdR.jGnI=ekR7oRB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1BhnYACgkQAVBC80lX
0Gx5Pwf/fKj1HnU164D+WFaWT4dvkgdOvqCh/Ea+X4sToOmjyrjF0nTKKGnXlL7T
6jeeP1EBm7n4Z7YHb7tgMC8gNFgK/P5gg5JVMAFOqYJu9iKr3SDUpnbm8YO80OJ9
xMbTLTfPjWku05jLiSUAQJXPvBl7juPdN7NTzN5SOp3UK+Y7QgHo8BJIUdzIFQ+L
dhB/8D18K7T+xiO4TidCFCzDC4xxMCbMfGaW+OshqVDkFjwAPvnMltp6hfKrTD3r
19KR5yQ+X8mw5jmTI3oiJRsk783DS/2gJDciVqiUMkIe6GiE+unaWl48huFuBS+x
LeJ8wt8oANI8CROwpPYFfNqP9lPqZQ==
=BiaT
-----END PGP SIGNATURE-----

--Sig_/8KjFQ.PEdR.jGnI=ekR7oRB--
