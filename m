Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF795443FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 08:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbiFIGoy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 02:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiFIGox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:44:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD2BD4C;
        Wed,  8 Jun 2022 23:44:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C32561DB4;
        Thu,  9 Jun 2022 06:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FAEC34114;
        Thu,  9 Jun 2022 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654757090;
        bh=b5vPMO4oZShpmt0r/go55Fc2weZtp8efmLhs1iXNzWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZGmKa5ys0mU2VlGh+nV5GBIt6+R8YRQ8QYtDpYm8FYIZwumD59xJPgARcsOJuMn9x
         YdjVa2KQRSbGk099N2NNgWkFEWQMtlRUlhShrXgo+65uAIBrnXdAPmKtlDu+8sjx9R
         qHXM6rotlVIXxKUiACCLByf2R/Gikexo8edBZs2r9p4Wf+4f8/iOb42UA7SBMC22e5
         kt/DAbT1K+gM219TDAlJAOSdr313aZeXT1GuqCKCbAUdguMGG9U7LLNT9W/dpAo4CC
         pwJs/x7uroaQRYm5SIn21UTCuQILUsp6lkLoh43lOdPfuRW/I0NFm+48lVbKqi1t0Z
         hkpvQ1CiWwThA==
Date:   Thu, 9 Jun 2022 08:44:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: renesas: r8a7778: Remove struct r8a7778_cpg
Message-ID: <YqGW3k8hWw77QnYU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1654694831.git.geert+renesas@glider.be>
 <4123c1c40a901195f00a825d434553d2052829aa.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fU9DjPlbrDS2gcbV"
Content-Disposition: inline
In-Reply-To: <4123c1c40a901195f00a825d434553d2052829aa.1654694831.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fU9DjPlbrDS2gcbV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 03:41:13PM +0200, Geert Uytterhoeven wrote:
> All but the data member of the r8a7778_cpg structure are unused, so the
> whole structure can be replaced by the single member used.
>=20
> Remove the mapping of the CPG registers, as no code uses the mapped
> registers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--fU9DjPlbrDS2gcbV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhlt4ACgkQFA3kzBSg
Kbbo/w/+IaFzCn6dBUu9z0Ls7ZCGKFZZksaYd/ImahF5uZn0oKiztKqPiXU/rVIf
fSSKbDQ93fT/zi9l8QVEudFnR3qtRSOeSmlG7i+6AzhAI1DJpHR2d5Cm3NrnTrop
nOFplsOSOvT1EHNyfe4pKXSi/IndBFRsaQhOnZc7DcUOZ3IbYI099esS+5xW95C2
KRqFawiUeuUtyyEhfHpng6+09Sntc6REz49BAu63qGtaCk2RPEO7goZPrxhvZl3Q
6uXfICVFUpZ2J3ZLc5FfWHGfeAg5qcZ8AQNDLfvE3802wYw+OnG+99up3mbPdL4a
i+3L/GfVdNmuysTDQSA/K/kw9ft8G0vubx0oUSLwSxheUmC3z2CP86GBReynCHT7
Y4qYBcByxVnPoHGlioUmcABPywfdEnAXUTeioMf0/0aJovOUFBAkR2IbgranWES+
k8kJseCVMtv3TqZJrK4UrKOGC2ONily8zUwrbWCkpnYk+iCgb3zUeNP/avHrpGxD
hOfUmP3dtIudJSA3Evb/rnRpxte7eWMpqH4URHe8orqK7RqhSM/WOQ9mTTSll60S
j67pLCIlLHF8BMOeq0mRNo52zGPAMpzc8R+QiMqAzcCSfzrfuhercwsHxmRuwBFM
wAiZPgQyKN1fJZ6TS6WCib05hrIAYujeZPPmgk2TNlNTJ2XIf0Q=
=kAtO
-----END PGP SIGNATURE-----

--fU9DjPlbrDS2gcbV--
