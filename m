Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0886E544449
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 08:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbiFIGyc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 02:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiFIGyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:54:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2381D53C52;
        Wed,  8 Jun 2022 23:54:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9B10B82C1F;
        Thu,  9 Jun 2022 06:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD7FC34114;
        Thu,  9 Jun 2022 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654757668;
        bh=UKSkebHXjnNwP4MSPX6tKsgNzFZGfknF/j2pA30Oq3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHngj1g7HiCiV0yiijx3ho903JlLislICD5BB132Q+vE744iaypvkqLK4YsTaI790
         vawbJf3kstcfqDhibfFcE6Ng0vJyEXLOmo3nFbPfBEOCwsBLEX2PEwNtBiiJ/HVLJp
         7LhztoiYTSfuppW1wYF3uGZInfVr+GSWWl/a5UumeaIwnmVKlpEGhpmvjhRHIU9ecN
         uqHVycZUiSGDeIm9nTVmG9lUC2UQxIjtR2NDuuZ95/Fvm/K9fJfp8gHYlpIt8vJmCX
         5QZJN+mLzJ2KdD8y3+OmlNPVEquINN69hZFa0u0zRC3H/wM7PX4CGuX6OXFQePVWLj
         b6IwrEQNqhg7A==
Date:   Thu, 9 Jun 2022 08:54:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/6] clk: renesas: rza1: Remove struct rz_cpg
Message-ID: <YqGZIO/e9ZWD5E1s@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1654694831.git.geert+renesas@glider.be>
 <2380285576edaa4ad3dc5eca7e0ca418f068c6ef.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i5FLtgB8mM5yVMmZ"
Content-Disposition: inline
In-Reply-To: <2380285576edaa4ad3dc5eca7e0ca418f068c6ef.1654694831.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--i5FLtgB8mM5yVMmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 03:41:15PM +0200, Geert Uytterhoeven wrote:
> The register block base pointer as stored in the reg member of the
> rz_cpg structure is only used during initialization.  Hence move
> it to a local variable, and pass it as a parameter to
> rz_cpg_register_clock().
>=20
> After this, the data member is the only remaining member of the rz_cpg
> structure, so the whole structure can be replaced by the data member.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I totally forgot I modified this driver in 2014. Nice memories, though.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Disclaimer: My reviews for this series were visual. I don't have the HW
but it all LGTM.

>  	 * let them run at fixed current speed and implement the details later.

Seems that was never needed :)


--i5FLtgB8mM5yVMmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhmSAACgkQFA3kzBSg
Kba8MQ/+PN2i5CBjxF/PeoBCIqwlX0nyPCreCiOstobCqx31KtwCAGTI5/ExCpoW
Nhtvtuwg13lLJQwr3GyoqCdK2ZxTORuXaVZ6Hi0y+vGOXkcK8XsU7V8UVhZIZ4PZ
GErYHB6Ke8L/5Ap03vLb7E8hLgwOFI3LD4JwuZs7PYBwlxTNQl1mnAacOpK7GjwH
KJMC4y6U4a5qFJG4oUKfvX0gavLCvT+HsTztqgWqklmRdCR4vQYz+8iypJI6N//3
ldXln5RXiJEhpHVcrDvk3G7kCZ4+PkqfbRc2l6BRDA+n4v8a/RpJ40u2iMlniJ61
kaNDjFHt2xhl+M4hI5ScL3Ku2NDvAHGlxrHsrgXISRkdPinXzDtkZT6WK5oFdxd6
84miZw3b1+/UT9DgKCtWNFYmnyBlUedLNEFFcfi99wf12juOX4xOy0W+FdaNu9xI
Lzmtxz+3QtRHbgp00x0FmK/18NNIOtAUMLcWgzSy5N+acaqbkLGHNXvGdabWgKU4
A4aG83QCssh7VEtRow+Q35ylisYCqQPe0RHgRaoULKkEIfat1gaeFFTF1q/KGDSc
jOXmbOnUdsbbfRFxdbnuOoEqhO8G08/D+wwfQIa18dNEWUAfHGv958EbEsRLojle
22cOnNO5kvYTs6raBt3qcMOTCaImtkAGt6rUUDPIvVQTClOzm+Y=
=l2vQ
-----END PGP SIGNATURE-----

--i5FLtgB8mM5yVMmZ--
