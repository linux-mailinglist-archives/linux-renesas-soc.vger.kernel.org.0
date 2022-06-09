Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52245443EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 08:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238473AbiFIGlV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 02:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiFIGlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:41:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D47263EB4;
        Wed,  8 Jun 2022 23:41:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96A37B82BCD;
        Thu,  9 Jun 2022 06:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA9C34114;
        Thu,  9 Jun 2022 06:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654756874;
        bh=kLB5QiJlgoMACwQcDmkse4lG1SyNwj6UWYRlD+5XHuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qHVOVvt5Y2zaBg2h/Wn1BNm9xgCCBDMRssss1+smRampYRymnMgC/szQcPoCzPn8o
         R9T+45d0jev5OaykhQjmHY1m3rWynMYqbFZm8Tj1IVmGz2RZNWBUwuTqiPaXiSNjTa
         kfpnJEOCQ7gWdo7b5xqhPNtHLda75wfzY4LS4wWExlDy1DOshMTzeTujbUPjIEL1Ke
         2Wi3vq0VJHjcKvxJzozYSudjVOFA37sfeUIYnRHPDOVXH2oHq2tdr0mGhZUg1sVbV6
         R+CQCGwt02zchgP4dQoe13Z9bs2HIFDQdTO2E4hK32MdRc0Sp3sDDLO7WHDYKtZC8h
         rs/NfKDmDJ8Vw==
Date:   Thu, 9 Jun 2022 08:41:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: renesas: sh73a0: Remove sh73a0_cpg.reg
Message-ID: <YqGWBhTtf7bi2Rs6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1654694831.git.geert+renesas@glider.be>
 <5423e43d0cf518691965412fb510097d23ac5955.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v2nI8aL2vyQQyf4L"
Content-Disposition: inline
In-Reply-To: <5423e43d0cf518691965412fb510097d23ac5955.1654694831.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--v2nI8aL2vyQQyf4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 03:41:12PM +0200, Geert Uytterhoeven wrote:
> The register block base pointer as stored in the reg member of the
> sh73a0_cpg structure is only used during initialization.  Hence move
> it to a local variable, and pass it as a parameter to
> sh73a0_cpg_register_clock().
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--v2nI8aL2vyQQyf4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhlgYACgkQFA3kzBSg
KbYd2g//Uhdrb0outBAw5N1uRMakSp8ZY4bzcT8LEdslzwwQ7A3vJkXFyHZToh5g
odsE2antbpkjLFahyX2twA2X1EfMd7+REbHoaQLh4kvdRMmU/DFCqESEgadERYo7
112hELth3Rxv1l+RUyVknO5j2iGaTKgDfkLap9ca4BLcogXLDs/qphe+WCkTdmbk
ikKesCZAUnXZv+LgzSZ0Fkj8PNAK5/sJl4EQsKIv0xW1rvzuadKAWd/PY02S5Q1N
alnPedf7yxBUg1mOwwEMPV+8GqwyR/tcDjyAxVO4Eoe8SYzae4ACZkih/7LvPZ+j
w6q5nIm9FlSXQg2lCQML3p/oOyUeR/UCymxITHb7gpSusQ5u7fxHMK8BySsRmjXz
mUl0eDaWyXIWqC9t3gjXtKwN14dn+zFZ/dN93KbMIE5F0vf4kjnQ0Fj+6J9f8/j4
MtHoiAdsnsP8qbmw1B4oPTn+wCDNP+6T4Co8J4iKW9dsjt5knIz0N5oRjOJBI+o6
1tqdtdTW8dnkPDkqG2ERBT1d1K0ldplYu/XtgHt23GcbWHfKwz3+/43giY5NZvw0
y0wxII6/p+fR/VX7jxug4IiMmliJ0MxqgBl1ju7cSaZj927ekDgfIEF9tRDd4OSv
pwjRl7zwsNvCinXDWBYlSB1yhUTGxACfo5TkypfpialE7UWW52s=
=Xhvg
-----END PGP SIGNATURE-----

--v2nI8aL2vyQQyf4L--
