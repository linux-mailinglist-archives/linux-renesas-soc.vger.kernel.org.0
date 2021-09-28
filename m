Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4360041ACFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 12:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240243AbhI1KdR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 06:33:17 -0400
Received: from www.zeus03.de ([194.117.254.33]:55804 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240125AbhI1KdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 06:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=N/VpWKGlbH6nequ3RPCBlEmkYTJo
        a51QU/nk/DOKT1M=; b=qD3uKS6KtOHH9dzxLIJbk6Ns0O53QXtPYVlU3A95YqCR
        zJ+V7LL1mnyAcmS7bz08yCe0WnB2MEwMJkVD31iT6Tj02UqYsBXB5/Z9RfEF7EPa
        zUrJWAuhDsm2UXmLcqahbL5NVgaGyAXTfbPh9NiPF6TabcgT5BPxYQ76FeCJfLY=
Received: (qmail 1202542 invoked from network); 28 Sep 2021 12:31:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 12:31:31 +0200
X-UD-Smtp-Session: l3s3148p1@QWSQtwvNDuUgARa4Rac9ATot9flkfyHw
Date:   Tue, 28 Sep 2021 12:31:31 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer
 in Manual mode
Message-ID: <YVLvA3x0RUg8ZhxB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
 <beb6c373-e9d8-b0f1-78c5-cf21d01a5a9b@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DGSkqikuL/wpHU+q"
Content-Disposition: inline
In-Reply-To: <beb6c373-e9d8-b0f1-78c5-cf21d01a5a9b@canonical.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DGSkqikuL/wpHU+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for testing and comments. Any Fixes tag for it?

Sure:

Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")

Thanks!


--DGSkqikuL/wpHU+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFS7v8ACgkQFA3kzBSg
Kba2eA//SDNbMjoCwrF9hS48yXnmhcsmgJrLZv3E8NcerXPE4+f4UGw+uk8qLQ1W
Nzo9ZsxRnj/rTJ8qFejd4+3ecse7+R/wthi7WR3pe3fOaBBLg4N9jnpKjXKQ+jf+
E++IM3ueBx1aYgyS0FNaxGDX0gGR5BBQphHgpDrR1gEYEzNZkhhcTcxNhoJ+n6Ae
wKmJmdRNEBWkH7xKATOK07clbKj0FHrmJvsqd5aG8r38ZUbzpBh02E9Pxu1/ve2T
QF56SGljMNe3NqgRS1x6VYF4A/cDB+hqb+dEKpmuUAmwMx6vs2WwhD27xcxd8Nup
Ilqdd7NMCy4d8qWBas75jERq+/O24TwjvL7fkqBqzy20aN+K/BjesY+hXl1kLSOY
s4/AwiFjrxa6Z8HT7OKUkDjkzyt6S+A81hBnS4RJtFig2PqFnY2uiQA2iA85mSzh
QxyUTKV5iT13eW1o7kAoIR8AOAe4mNapJfJrJkEiegchdXEhYfROpp8PL4KFrxm4
MM2WnWB/D6YTP74kmFgGxonTNt5PFDr49d4e+jyw1ZJQhic/eq6XMgw04452Min7
2FPun18lZNn9vVnOd4HHCE2zMpjUwUzh0ZWB5spuogCDw7t+qLWeVedSCHrKQcIh
JdoXQ+JRGYHHK+g5nIJ1ACrVGqwTksglJRVZ49zfjHLf80pPSrs=
=nAgk
-----END PGP SIGNATURE-----

--DGSkqikuL/wpHU+q--
