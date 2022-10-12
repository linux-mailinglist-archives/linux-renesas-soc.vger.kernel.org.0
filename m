Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53BE25FCB11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 20:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiJLSya (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 14:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiJLSyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 14:54:03 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72FFFF82
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=mdli+5W0iMbEZZhNFqXBEVX7jQsu
        Qak8nhRWi+5MI+s=; b=kIcAA0sCBzE4ZBnul/iLZz8NdWlg3CdD+2IHgvlCGRDs
        l0GCLlvGTUMP5ng8TkhwDTZ0Hh5RQMjA7Dbr6Uf3IWjegG0XAWiOlPl8pivzldWo
        GKUDItsDAoWWH78H+1E+4v4eX4DQ6TmzgbVR6EXU2NjLxtuHALX/h8W/e1GG/xs=
Received: (qmail 813859 invoked from network); 12 Oct 2022 20:53:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 20:53:55 +0200
X-UD-Smtp-Session: l3s3148p1@essc6trqYrYgAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 20:53:54 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779g0: Add SDHI clocks
Message-ID: <Y0cNQlvGaMSN4gRv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <e9b05d102160cc3f7395ac53a533e81c07307d5e.1665558175.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jc23R8y0S3a3AVbY"
Content-Disposition: inline
In-Reply-To: <e9b05d102160cc3f7395ac53a533e81c07307d5e.1665558175.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jc23R8y0S3a3AVbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:05:05AM +0200, Geert Uytterhoeven wrote:
> Add the SD0H core clock and the SDHI module clock, which are used by the
> SD Card/MMC Interface on the Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--jc23R8y0S3a3AVbY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHDUIACgkQFA3kzBSg
KbbYxRAAngzAsdjISMP4yJc98pCgkiTJKXx2L0PUjZyLeATf1GWD9/7nRzwZb8zz
ToPJo1UiO0GdVhlM99KNiAaKHn5+znWitmNNHYhq++2pGEy8nXpqudQUEAsdgd7j
kiKCFxLQ3kjtpd2yP7lGNGAmFRBP4lhJk0HpZ0Xlf43Reh2sUyUw5pSRHpTKrzi+
hUtR/NhsdVrSSU8nIC5RrNV5h1lJ4d17N6ARpvNClxIgr4xZfDl7dnRS5+DduH/M
IZ/HZ7vsXS45a8W1w37y8g/LsevytlCrLdFDz0lYQE9WIs8vK6mFWte4uG65ggKR
+EjkGkA5K2rQEYxVyM0+igZm1RUTWEmm3w1ERpvZtRytFEj9xFOwXr4hYFFQJL+A
6a0wsZ4RiR+ev3XuD/2TUCFUH38ePl1utaSLlzz7WbVjsgw+pvmACwR4O8xs3Fp4
kZgSzPRotF4c6gr3933MMCp2QXLt+1lk2u9rKWxZmOhGAmbqXeDs7cH3PWqmIpul
+wXlB6bozZnw+lTpg8aPPanWkNGaLt1w4K9z1IQs+k54hwTdJOzyLaNLwOQ6IYDV
xcMS8TJQYB+Jct8XcGWM7RHDrJjIMA3i0b2RFXTAEngyw+NZAywKDwbvxPSfaysE
N+66DlDyPx8OXHrl5H4XsrQLfz5RUWstc3KnCMfLU4TDhsSTpO8=
=TM38
-----END PGP SIGNATURE-----

--jc23R8y0S3a3AVbY--
