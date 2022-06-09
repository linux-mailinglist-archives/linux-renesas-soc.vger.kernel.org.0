Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8768E544400
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 08:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236960AbiFIGqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 02:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiFIGqk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:46:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D18B28;
        Wed,  8 Jun 2022 23:46:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5403F61DA6;
        Thu,  9 Jun 2022 06:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB8EC34115;
        Thu,  9 Jun 2022 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654757198;
        bh=0HAVrobeyP0h+48N4p+YRsAeVrg+hJFVVk+vL9uuHKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XYA4UlcqDNuGmDP8QFfiNORTDO481In+GcrNgOTaFJKw0uEdHc9QfZLc6Y8ZD46iy
         UFkvuiVltAABqT2GSjvKaBlsMhjHSMoHq2mC6XffwrpYTzqYaCCj41lXZnEj4L2TLc
         5GuqzVReifVQ1Ja56Gyc55BPO+vG0nNmrTJClXI8vatY5UIHNkLVOKKwh7MZ4bsz1D
         ijuWj1+OPxVOh5aZrRJleU0ltJnGJ5i7PGM13VE5EFs2aFPbzwH70LIZC5nwQzB8hF
         49MHp3su6AJjp1FjtobVdpoO9wayJpx5Ekg6rUxAZBvcJVUTOrzGiyWTq798XF8Azj
         qCXoDqOPI14Zg==
Date:   Thu, 9 Jun 2022 08:46:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] clk: renesas: r8a7779: Remove struct r8a7779_cpg
Message-ID: <YqGXSmwG+gLMsWuB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1654694831.git.geert+renesas@glider.be>
 <eb94c0f6c54a4f3a7e0e07f12781333a700c0a05.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVk+gvsM9FE3Nk5/"
Content-Disposition: inline
In-Reply-To: <eb94c0f6c54a4f3a7e0e07f12781333a700c0a05.1654694831.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EVk+gvsM9FE3Nk5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 03:41:14PM +0200, Geert Uytterhoeven wrote:
> All but the data member of the r8a7779_cpg structure are unused, so the
> whole structure can be replaced by the single member used.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--EVk+gvsM9FE3Nk5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhl0oACgkQFA3kzBSg
KbYCqA/8DqmpKxWwi4ZJRhH9j07qHjEWqpbKKit+X+hpM5+TvRU7Hs0gTe04zOjI
tstUqPQ1Ai8tBVXDiPf2Jj5ce3WmVRkH8lYpjESXjm9Z56mnOeEyNSUrYPS7NWTy
zDNyyauJdpoRTMPQdafBjoSpy5K+yMAsVKI9jkv2pvbqU0R9dFxtERcL8+uLwAIe
RLHtJuuXt2Idv8kPFTbghYODpWNSzrhL6l5LzmV3yG06ID5gFMUm4FPVRQ+1qfF0
gtUO3M6GJMZljKVhLSzL5dMXHZrqrvcRqcyWo2NKyRQYU+8Q9GIXwnPQQ3Xemmvi
cnHoP5WUFiXNl2FaK+ZZfIKq69kKUoZ1sA4DzhaKCmVawjflYyNcPnWeFmUUE8tX
4smQXYJ1O3aItoxY4EyvV9jfFyBPwd2y+xANY+QD7iGkignByhg44pwGoMoM8cG2
WhvarM+rctjxlZE8fPuNobkvLpJpXKcRuhdvJIRuWLwX3FiNFNF11Uu7fXzzyLk2
rp5+Wy1ShuTSiPYO1pG71J46hI9pqT7uoE8C/nWXXdKQu/lNzx2X0mzhVir8seJ2
rlqoxHH9N7WctKv3aizcsoEV+1GTH+6U+s5LGVBsns29+FcEkCfZIyRK0DJbl148
b/2qMQDI3sT+btjuwrvT0vgewaW3BiU/npa/TOMh0tmNAU47wFc=
=jbjf
-----END PGP SIGNATURE-----

--EVk+gvsM9FE3Nk5/--
