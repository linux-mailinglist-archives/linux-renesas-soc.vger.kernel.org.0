Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1748B419FD6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 22:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236833AbhI0UL6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 16:11:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:44578 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236819AbhI0UL5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Lo9KtH5qereCiXeVvqgkiJ3BSpmr
        rcCVH9XteZer0kQ=; b=QV9yi66/0BVmIY/okuI+Z/NoNV5ZHK46E7IpMgdA8Bpn
        CpCpJW+XtK5mbwRwpQk4y9aGQxY9pBbzrDFJAVbZnwfvS1FCGTh4xb5c1tmvnj/z
        5cdbu2WnveNWATldkb7xebfaaNuPH6Q+52KUZP5CMI8soXvgclg+qzwXevXsoeA=
Received: (qmail 987346 invoked from network); 27 Sep 2021 22:10:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2021 22:10:17 +0200
X-UD-Smtp-Session: l3s3148p1@I5ZWr//MkNwgAwDPXwgMAPxYBY5AXpUr
Date:   Mon, 27 Sep 2021 22:10:13 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer
 in Manual mode
Message-ID: <YVIlJQNTccMgqfRx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
 <CA+V-a8su7780XxmdL5qsM+YFoK_4+OJauQkyC9AaJMxFtxM=Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2ox8QipdN31+1Qwj"
Content-Disposition: inline
In-Reply-To: <CA+V-a8su7780XxmdL5qsM+YFoK_4+OJauQkyC9AaJMxFtxM=Cw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2ox8QipdN31+1Qwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> I hit the exact same issue on RZ/G2L where erase/write operation
> screwed some random sectors and made the board un-bootable. With the
> patch applied, read/write/erase worked as expected. Below are the logs
> on RZ/G2L SMARC EVK.

Thanks for testing. Glad it works for you as well!

All the best,

   Wolfram


--2ox8QipdN31+1Qwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFSJSEACgkQFA3kzBSg
KbZrKxAAhHHVmc27sbdh3WAwXhaKotc6BzSzmGTnRqG7U4ceQhjCMNntAvOmRMuP
ZPFOlNGEFYv8CuOaHHYgt/Y0jC8HDJHK3pGf6FdumOdKSmIkwR6nh8zDJUxj/IXj
yY2KDZFak0fnaV6KTj3nGKHgNVN78baO6Iqjlmau+dnlSTolfSYzWIWqi3T/2Pgl
D1Q8d7HvIgwT10qRWUTzQYAXpKwnTcZaTriBqtRpMNj805bEMRGhCHSthzZrfqjn
btIIvKIb7hXbYwJ/+6d15gek2qjMjoWJj2AQkJlUvviGhWNXZPkXPw06ZoMm8fcH
Mdtso6vqX1uzrY80oPbErKajE9ZmkTDmfWH2LewfD+2sfGcvTCTUPLW1P6TKXzo2
ssYHh9+NzmtISCVxy8TkseTGJGL8EH8xO0D4MYsir1HREdXyK5u48kB6ntnZrow0
82fUlC1htJx1TKR6NC7chUknt85MnxOp4SKJRf+7NBrz3CNVlN41ASueUsoSCv4D
b4Ili4j2YmBn1WG76LLG3a0XYkNf1fvsXG27KCJw+aj2f6JOMMZGcY9Ihb5LNgwo
e+K9w/+HgNXngdSy5RAKkM11D77fbcMv5DaUDhHQ2KYq8HVMZ0QaSRBxLPNzrryl
aK6Wxr2E9UMkLcvmySw4EKfwAZRx1udTPRQJutGdDRbF9X1xG2k=
=voob
-----END PGP SIGNATURE-----

--2ox8QipdN31+1Qwj--
