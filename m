Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC014F6C75
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 23:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbiDFVVs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 17:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbiDFVVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 17:21:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196C9A1B3
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Apr 2022 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PQr3wD2bv7Ugjk3EFJrghrQ2xkAG
        j0Dbn0dT+6caGCs=; b=o9qLOszRMg995eXzG9hTtbsZ4979l9Hz6qK1CT6X/IbJ
        TrElaKYLhJ4Rpatd10vjQKs1OSCwy5t6LQTbhV8/8vh8n//4QcWvza75Ca2Puxup
        hETaloI3X4JN0fUrGwQug9/DFS6eC5M81p26mth5Kj7i5ChoKAxmFiGzkmNotnc=
Received: (qmail 2883230 invoked from network); 6 Apr 2022 22:14:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Apr 2022 22:14:42 +0200
X-UD-Smtp-Session: l3s3148p1@MwIAAwLc4McgAQnoAH8rAHnYTrcYCkZJ
Date:   Wed, 6 Apr 2022 22:14:41 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to
 HS400
Message-ID: <Yk30sViNEfQm3Ef8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVJ7r1RXgoHAP1+RLtm11XMFzs1zht7+KQnUss=Rx4sBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gH+JPDsZwgUQg7pE"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJ7r1RXgoHAP1+RLtm11XMFzs1zht7+KQnUss=Rx4sBg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gH+JPDsZwgUQg7pE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm wondering if we've lost the critical mass for keeping the bools?

So, I had a look at this and think that the current version is still way
better in terms of readability. I think the compilers will optimize
enough. It is not a hot path anyway. So, I'd like to keep the code.


--gH+JPDsZwgUQg7pE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJN9K4ACgkQFA3kzBSg
KbaCQw//fZsqZhj9tp6ozsKRL43FyMZwITbg9seMQR+3XqmChr4CJLIyrpVzT/fw
ZiCVOG/nk90JHBZrAInzMUc/p2v/yXgDZzYSxhm5QeKzxGpuMOst9KajH9eAp08z
3Hmxe/TmNj474mqNZL+ococrcI+/O9qHbvCVcK8c4Z/30Fq3TCSJJb8Ea72YRNgt
iZis1exUwWonZEScAd3cYJQ/RusC8iKpUUr5RPgKCzarsVE4SN4+c2BhRsjjtnzr
gSnNQGUAbR1ARz+PkALgd/QZM5Qi53ysAAGDzqKz4CakWgvxETUSRnwcQt2qEysR
9jdEH1kCYyDWdoSTw6YGAlxEgPmhtn5lcHexxjmeWqDih8ADyEIe0DryXWjPjFvR
IM4JVQ5aVBSRC4t4ualqP2cfzbmFc2q1PLbX8eSsfdRZp24OP1SyZed6Ms37DhKg
JY3EQ1WxVBLym0HRwXpBe478IaVf5pviwK3Q6ndit7WV7N9eJNqv8FT12an1pnBw
YSvuI5A2tMBzhwMPiWZ8y2XcAySe+3H2DwIJqoLa3dombKPTxOvaTUWPONI5FvpS
Ls3xvfspWHZCjI2zxggwz2Mi4xK3T7tNYF+kCvTEablujcGDfy8/Rgo5iu0KTFDw
4K1J/McRyXU3OpLjTmDFpyqYR5iZ1vhT0W7yKVqrbHSxvL9tXzo=
=04K3
-----END PGP SIGNATURE-----

--gH+JPDsZwgUQg7pE--
