Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C311D2CE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 12:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgENKb0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 06:31:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENKb0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 06:31:26 -0400
Received: from localhost (p5486CC88.dip0.t-ipconnect.de [84.134.204.136])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BE852073E;
        Thu, 14 May 2020 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589452286;
        bh=Qul+EPv6Ik9sdVnnnJ7opIUQ3v5vuNqnq2e1PF+x8qs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dJsuZTuzS+QAc8wArSUkE5Q/1qLjXnPePTzuY9Okt9hpkoaFVdlncjmSwnkfoQuhw
         tqLP2hMNKTmnP1qDuHrWRrWLcixsixDiDftvNFnQrXD2tToskd/4lVpHjTBgZ2kRQ+
         U+oCwviaHBhxUea5uPf8CdWo1pRGtD9EThZ0+Mkw=
Date:   Thu, 14 May 2020 12:31:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RFC PATCH] mmc: tmio: properly balance RPM on remove
Message-ID: <20200514103118.GA1589@ninjato>
References: <20200513171206.6600-1-wsa@kernel.org>
 <CAPDyKFrgsZ7z=tvfpg6q0ofurneTQMo3Y5CnXRZXX4fmDQ=YOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <CAPDyKFrgsZ7z=tvfpg6q0ofurneTQMo3Y5CnXRZXX4fmDQ=YOA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I did start to look at it, but got sidetracked with other things.
> Anyway, I will check in the next couple of days.

Much appreciated, thanks!


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl69HfIACgkQFA3kzBSg
KbbOYw/+OYP97RCgn4nGKcYbGZdJ4A5Xq5E0Bsk8HUfh3cbQSThnMcyjLA9TMsH5
prUMIzdHS0VtEocmy9ur917WhdzwyBgbWAZ8gv4TizCKo4EizzOceRCZ/YKE0stR
ggd/Mt+T+/j9kTqeLomYgV52v3/WTD4vMkJ2LoLF7rhGHKa1D2f7AyDQkf5MvxAx
Gdxqui6/WCuC6dqOHiTzaQcwFyMnoZYlBckKrccQNS9ZkfrToiwE0vc2EvuHrDT0
NjooGiO8P2FWNVY5fGmXFDBnXOLVJqwPzniW3koQKf4R3OUa8p6LuLM6kVV7Ys8V
Xy8uqfe2rX7vjT9NN8XGFfriYWgjZwdeloCtv+tsUOa74DH8amqaTKSJYGDWki3v
3Vv123x4aS8LYBmOILaEtU13EYB2C9G0IHNfL9Ibz0m1p7aDes1weNeqBB7PMA97
ERvrclMwQwU4qXYg518xXFTISFmN2QejkKirJVwzlsGxUc1F0Uvg/0BJpzwAF7LD
++DF0Qc6k9khKjunq/NbyR5Wemp/lDemxNDN8AJVtM2vwgNnL1Jyrm/19Jek49Cv
dI4Mt6bOkGVSLd4WMupOBQnMVwEf7nAgUU3JGZiCzl0CCsRJbYzvLpkBBLVtjjXS
8g9UUQdG9RaZz6zWgWTNRu64aLrErIsgRaHfZg+sGEriSDnRNfg=
=sbCR
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
