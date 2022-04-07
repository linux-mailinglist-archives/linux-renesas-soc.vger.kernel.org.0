Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D814F7689
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 08:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235680AbiDGGsK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 02:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241366AbiDGGsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 02:48:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76A9211EC9;
        Wed,  6 Apr 2022 23:46:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8C892B8174F;
        Thu,  7 Apr 2022 06:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4B9C385A0;
        Thu,  7 Apr 2022 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649313967;
        bh=JVlK5dG/ahpnYbfzEZ3q8jQHxJoXHPZ6XKp289k6Cgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z9Pt0Bb6/8vMrUlwXwVyDyYdjLQaG/1q5pUGFmZ2mZrE7l7C+BdHY6WkNetzxs89c
         UNbu7R6x9prl6MhbZrQgfqlRTVlFG/moE97tJI99FqHCB7J8cLfdZ0KnPx5MvZbqJI
         d4RVEmEYINbDvTZlvd0vuUjuald6heyRDJzLb3Ma/3tIuMxpDPl/raH5GpcXm2Jq3p
         Hq1BRkNg1RtzEfNlu4RU8Jf5LpmKn7PncRCeAPUGQTsab5JbPXytu+579YEda/vGPX
         mdyaTX2hL2CM9KDGZnBi5xF6qNO2d9GRzJbIWC8FuStvKCVvF5PyOeeVbj8//AOUDM
         6L+X5+7zC1JHQ==
Date:   Thu, 7 Apr 2022 08:46:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: renesas: r8a77990: Add RPC clocks
Message-ID: <Yk6IqweUS/INEJiC@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <cover.1648546700.git.geert+renesas@glider.be>
 <3295013f27f1e4b8fbf3f79b950d65157ea95ef2.1648546700.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xi2MF2/6sUk+Az02"
Content-Disposition: inline
In-Reply-To: <3295013f27f1e4b8fbf3f79b950d65157ea95ef2.1648546700.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xi2MF2/6sUk+Az02
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 11:44:25AM +0200, Geert Uytterhoeven wrote:
> Describe the various clocks used by the SPI Multi I/O Bus Controller
> (RPC-IF) on the R-Car E3 SoC: RPCSRC internal clock, RPC{,D2} clocks
> derived from it, and RPC-IF module clock.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

One minor question, though:

> +	DEF_FIXED_RPCSRC_E3(".rpcsrc", CLK_RPCSRC, CLK_PLL0, CLK_PLL1),
> +
>  	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
> =20
>  	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
> @@ -107,6 +110,11 @@ static const struct cpg_core_clk r8a77990_core_clks[=
] __initconst =3D {
>  	DEF_GEN3_SD("sd1",     R8A77990_CLK_SD1,   R8A77990_CLK_SD1H, 0x0078),
>  	DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   R8A77990_CLK_SD3H, 0x026c),
> =20
> +	DEF_BASE("rpc",		R8A77990_CLK_RPC, CLK_TYPE_GEN3_RPC,
> +		 CLK_RPCSRC),
> +	DEF_BASE("rpcd2",	R8A77990_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
> +		 R8A77990_CLK_RPC),
> +

Any reason the RPC clocks are not grouped together? All other SoCs I
checked have that.


--xi2MF2/6sUk+Az02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOiKsACgkQFA3kzBSg
KbYu6Q//SJPCkYutGoT58DPnkL40fNy16RDSXHgHP8HguacNInKt1pGxPgA4aa6e
B/4oGxlV9PgeGzdR4HW0jHrV2K/IlxGNG6gq7jI2RTo/je1dPi3TVKBKTwlbK7/6
88kBP+P2ZakcZxeh87sXCy7aIzUERcCM1nRbskLK6KJ70RHbdKx/cSneU1jVuBRs
Lalk4znLSml68MV5Tubw+r0SihL+yh/SyV03k45/TgUPNU4evNlgaRvtqeqTErnd
nCJu6vhFSSJJfuOGBEJZU5jWY8InziYiYm//t/Byj2l2MDP/sJfx5hRpxKgBvgVP
JHhWqcRq0x/WCIMxvhavdTYdR28vZ44scKbNHy5pKzHH9CS3QZVRGyBGHg5LqGEZ
IB3icJ8025KODpVCCdJhvjl4qezl7/ACAV7EczZ9NtYmQOt1UjxGjpPRhOrfpq5w
QRzSTC7aw6AJqajYhfOiNRzmHkxX7M7rcR2nqE2Z2zAi7iXr7wBOnw07/zcd5LGS
C7p0RKS0urogkQDqeAtDRVFzwhKBflWM21KnSU7rYDXb26MPaAYkgbR3mmJrkEgP
Z5AqBsUA2eMMTSaqa8Sm0aXgZ0BnqGSRRzUuGLq7afkzHDnncLld2j4ry8WiH0QY
y9TSDMVlGkb1TRn7Njowj9XzpyYHqYF4Crx/fVwu8enbT8u9gHc=
=/umx
-----END PGP SIGNATURE-----

--xi2MF2/6sUk+Az02--
