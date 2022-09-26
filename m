Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415955EB0EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 21:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiIZTIm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 15:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiIZTIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 15:08:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D944BA71
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vw+JKRmxcEVLInkDUh1AVHpoLVMA
        JhvYGdtbyKCJoLM=; b=uxgcgzdp1ycy/kLV0dBsmZOQqiSofPuI2lmVLE02miOz
        yIXQmMibf9LF9Pe9wwKfxF/nG2qBStLf7LNChQo00AXzNbw3vJxKnPwnUVgS9S+r
        krhAZPK9q9BL5LjAQRihLs+0qCm2eDCCfMk78OFUtzhm32VTTex0IcJRDkd/PvI=
Received: (qmail 3232996 invoked from network); 26 Sep 2022 21:06:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2022 21:06:23 +0200
X-UD-Smtp-Session: l3s3148p1@0m9BOZnpIs0gAwDtxwncAPgJb5TsabMI
Date:   Mon, 26 Sep 2022 21:06:22 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Message-ID: <YzH4LsJzq8rRgRlm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SWnf/U3U2mtcaPSz"
Content-Disposition: inline
In-Reply-To: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SWnf/U3U2mtcaPSz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 06:10:02PM +0100, Biju Das wrote:
> Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
> with a lower clock rate compared to a higher one.
> For eg: The rounding error (533333333 Hz / 4 * 4 =3D 533333332 Hz < 53333=
33
> 33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.
>=20
> This patch fixes this issue by adding a margin of (1/1024) higher to
> the clock rate.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Looks very good to me now! Thanks for keeping at it:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--SWnf/U3U2mtcaPSz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMx+C4ACgkQFA3kzBSg
KbY3KA/9HPW+ldJ6FGYDHHhOXQAxWHHlKimNPIQvHpvWEqHiHMNP40oJYrPi+uds
sWTS7562uZ8Cug90pFzMNlGhHzJHifHrNwyQmsjebJNIgK5HyqNT6JTAcEcZLI1b
c1nEEp4mgdL8yhhVWfoHyzTwFZkTZ3qzgzK29oEOLePgqvtySl30GfuDndSeMPYW
5l9FPNWrnkfR6Loe+oLUkgc4xCPPrAOJfJGEHjLTil9SDxUBBv6vA7RNRgN9zWk2
ClBh+UUukNVjPjsKoc1R7/VRlp1RI1UxL9SxmIB4aRRUt5irs+kdGvQVEo19s1sl
vuwsbKPp7+UrYGZtPmUAr8m+yMEvIs1VJhOcrlU3HzrSNZOubnZJEPr0NwT1BpuC
K24x+Mv/wG2Q6algastD1HDBf7N+dgiek4aG3hf0qgVXHD8cfRFVEgq5PA411MSI
xHEwFTBHSmKXiZ7wCbzzRabt5r8m2rImF+eNA8L4K06BUDXxjJJEQ4ltWSDAlbp+
uHmkWfwpZs7Bu529M9w/oiYKgpXeTEpF21dNYiOcPoueUe89DDPLElV3cev52J+y
AvAT3jcRwEKYLu06zCh2W1SJenMHwK87hhCuZFdCIIA+Kp2x9DQhzGfNhpaCaaGo
qZuPYtRpuMrQ7igYpqD7G3yhqHSSGxbw0zp45HptUtPMdtF59wM=
=Mrck
-----END PGP SIGNATURE-----

--SWnf/U3U2mtcaPSz--
