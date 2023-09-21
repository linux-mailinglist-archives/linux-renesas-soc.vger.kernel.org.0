Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9DF7A9DA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 21:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjIUTnm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 15:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjIUTn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 15:43:29 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F8DD6053
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=V1kb
        ZKaeBF0F5K/2Kj1B6ba1QB1LHzQhfqk1IatGkro=; b=e/BT+m2r0zYyYKHOmiyd
        eF1BqGjYIdmKLpQsKQAttPAN4KoXyBoJ73Fdo9sBZRmFT8eCeiAREHtH84dsrpkL
        y3xutBx2dmMi/IYesTj8L9QanCvCyGDAI1NykgkPBXYGcih40eRSydV0l6qaE+Kx
        a38wBmPqubtdZkWPJxc2XXVlpe2BLuq1ZmNUc3mwjhE+xY9vBVcNu7sh7fEDEFKb
        THrfKcQB4RcYgA8bDxLFfKkKGGdfDNNbZkzNTrcQWC6b2y4xlmglB/v5j4YduzqL
        6NtA436f/tWnluoYq8dBO72a3mIpKmsHFSMj47iWpa/pq+jSsT53A4VJGwtQr+w/
        zA==
Received: (qmail 868944 invoked from network); 21 Sep 2023 10:01:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2023 10:01:13 +0200
X-UD-Smtp-Session: l3s3148p1@nCpK5dkFksQujntX
Date:   Thu, 21 Sep 2023 10:01:13 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
Message-ID: <ZQv4SY8VUXMZ600S@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
 <ZQtY+NHFzFBWhrZj@shikoro>
 <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iPBva2WjhK6ywcD2"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--iPBva2WjhK6ywcD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > IIRC, that means that the ATF uses 200MHz for the data channel but
> > disables the 800MHz for the SCC. Because of that, I assume ATF doesn't
> > do tuning then? Isn't that risky to operate at 200MHz without tuning?
>=20
> Perhaps these products don't care about using SDHI for booting (i.e. use
> HyperFLASH instead), and thus expect only the application OS (Linux)
> to use SDHI?

Even then, I think ATF needs fixing because it sets up a clock divider
which is not recommended.

> An alternative would be to let cpg_sdh_clk_register() sanitize the
> pre-existing contents of the SD-IFn Clock Frequency Control Register,
> so there would be no need to extend cpg_sdh_div_table[].  An advantage
> of that approach would be that it can handle all invalid combinations,
> not just the few that have been seen in the wild.
> (following the old networking mantra: "be strict when sinding, be
> liberal when receiving').

That sounds very reasonable to me.


--iPBva2WjhK6ywcD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUL+EgACgkQFA3kzBSg
KbYI5RAAi0JYg1CjCIC7ad8lacBc2BXv5Abajp5hwLrYXMhvCgbya4OYUjrPG8ou
1CWD/yub7H3m0wQDjYPW477fPzSKEodJu7vRrseiEbVvxyYhPL7kQ4bZFKMrIq6G
fT4Z26vJzD2O3pet/ZZot2F4AFAH/GPjGYPNuLenLycM8J1813Li+5W43IsTirb1
EeGnR6d5mrmQ4qHCSeYXzOgivV3B4k4V11UlsuF8Fe74cD7wZ/xM9IPKBuOQqBy8
o0/8E+1Pmu/H19538v7Y7Q11MXg5RddnVbSu/eM3GFRdj+HbA8ivkpR8LNBZQTFd
F/38t0Q7n6hmappCJSR+C86vrSEminlVAUcnaibcEDyqRG7k49muHIgWGZeFUEb/
nssU41RxdCVzWeubiG+g87mfkzWmqu0waQsrwV+xb6xGVBHQxXWRUC8GGovxYyzp
53Rs3vSBNxjbNjHY4GZG9T4dFrlgnp5308VK31bG7xxd4mYZsIke84Sqcq3AHC6D
t90KC6iKczezgE2oEAkGZraohtJ772Z8Ghwcg43UISdk6Y2za0N4KrabKRxyGUMC
g7AQbapOh/SyFhgNH7XWPGWwsMIxzYth9Zkx5e7vxkKsOrxPyLe7UUlv1uTzW2N8
IcP+5cFV0cU0MsoxGqLPptjnFhr2+RhKM/LlW+w+h9dE0j4wD24=
=S0nc
-----END PGP SIGNATURE-----

--iPBva2WjhK6ywcD2--
