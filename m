Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D16135F9A87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 09:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbiJJH4I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 03:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiJJH4H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 03:56:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC12FD03
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 00:56:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF85D60E75
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 07:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7B6C433C1;
        Mon, 10 Oct 2022 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665388562;
        bh=X9X8kqocGw7LQV0BdLDoaVSy4mFZQQ99TtUzFvBsMKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nP1v1eAHMzOn2xIf5FZXWonG/9K5S+ucEjnTMoBdCMudKzlfdj7A5pNX21H8gUA+4
         AnMb1cz0pSROzKKHHYuL2uEl714PIGKblELyWPUraMDOBOrST6tVA/Rrq/VGup50/J
         ynjqFq0gkmNb9+7HVWsd7eaWI/YLiW4iWEyEYKz07qDcGUDhYgDwrJ0SGmT57CFLfG
         bCqkHxCnDZ/vvGC2LzGp9J4VGnxle3ZVZtwIbqulXoYcDMJJmfPrF7fKfb96jLYMHb
         7LLFg0lry3+EszUF27PIAqGYs/AU7YUkuMHY/OLsZXxwEOIELqp+qF577WVtXzk4se
         sw5niW/o92BSw==
Date:   Mon, 10 Oct 2022 09:55:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Fix HSCIF0 "brg_int" clock
Message-ID: <Y0PQDVzGj8O4oZZY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <a5bd4148f92806f7c8e577d383370f810315f586.1665155947.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o/rusjh+K/6dtUIE"
Content-Disposition: inline
In-Reply-To: <a5bd4148f92806f7c8e577d383370f810315f586.1665155947.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--o/rusjh+K/6dtUIE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 05:20:03PM +0200, Geert Uytterhoeven wrote:
> As serial communication requires a clock signal, the High Speed Serial
> Communication Interfaces with FIFO (HSCIF) are clocked by a clock that
> is not affected by Spread Spectrum or Fractional Multiplication.
>=20
> Hence change the clock input for the HSCIF0 Baud Rate Generator internal
> clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
> same clock rate), cfr. R-Car V4H Hardware User's Manual rev. 0.54.
>=20
> Fixes: 987da486d84a5643 ("arm64: dts: renesas: Add Renesas R8A779G0 SoC s=
upport")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Do we need to wait for the clarification about the docs mentioned in
another thread?


--o/rusjh+K/6dtUIE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmND0A0ACgkQFA3kzBSg
KbYKwRAAiiN1kpiV9HNaLWbIdPTUK9HOg4GxRw1htWD3VjZoodWbTQKSZ8EOvuvi
YcZGT0tLJ5ciR1g7P14LvHcNeQzR/16LYsJcBqHmS0TE7VpNrQn9cOhZcIMmo0R/
fp0q7mCFSxild4wzcRDp/uhBpghICSJlHHId2UkGgj1Rko5I5nTyXsW8XXi6Pd3Q
Z/8hA2fcnK4QU8kmIKH+PHMruer9Q7D2IjmJLyY9MKXJN3VLVVbLlmqYrpjKIqsR
TurxgsjTaQZMA7rt5Ld2U3SFbbhZlJdwU0vT+B5wy14ZT+Qau/QHaPAJWaVtQgrI
tPs2p2LyxNsSvAU3okQ9HmT9JN6ZgknUDpl74dkGg5wVEYCpIMvLzJqw6cR/m/xC
Zi86HzOiyC0xClDItfFDhmQoF723jPYwMtPeKBwaCB5ABdhhTIbRmh2jxUxQUQNn
vf/zlg/+tz1fmnXwJcZOwZBHCUzS0MQk3eEUPIKJJiOyKntaam7firpiJXuM9SST
ZbsB2XdQOEs2ovDsYu044T9LWwaVgZG74DFBhZkhfWi53WCulm3eBFe6SmP97xjW
UVtyc3o/RLNt6nMOAWNLjCk4XJxEafPPPnt7rh+4BDdloGVxgPC08Da+8R4F7iag
Ms2c+kjNBDWUyBj6fqkt39r96/vfrUuzzVDl+h8cmU+5QBnIAnA=
=oco5
-----END PGP SIGNATURE-----

--o/rusjh+K/6dtUIE--
