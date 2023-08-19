Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A86781861
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Aug 2023 10:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjHSIbG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Aug 2023 04:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjHSIbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Aug 2023 04:31:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D63B488A5;
        Sat, 19 Aug 2023 01:31:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36F6461489;
        Sat, 19 Aug 2023 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA58C433C8;
        Sat, 19 Aug 2023 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692433863;
        bh=QSBOluYybtxO4tKot9jNeLxorSiFqLCUATwDVsgqjAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HnxIrCLXRM55inC1Mjw94VsUxujysWxXrEP+vbWMUyooq0WcAfQ2wmCjcXVmIqXRW
         hJbQio9FD0+vxiB3Sam8on8eSShzRZH+u4Qr5Pk7CMh/FNB40pPf+XvJ/cW6DW+A1R
         IC98ofk+4HwlQ7FC+cO05Gxv2jwz7+PviZHkAGczOM0TkqTgGOX5V17zXW1UtM2CIM
         6jSDfglyJX3mHZStRviAzEGT2V/3NQw3K9FdgbFi39ic8erO+p49MGQVsQC2M/tAVd
         anBl2ZftQRKN8DT35noAwkOxEHofBgS7Qfa2FrgSJafdFDek4uR2ieVkkzif8Si/sU
         /2jUu8nuXYFgg==
Date:   Sat, 19 Aug 2023 09:30:58 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Message-ID: <20230819-starlit-vixen-ed35a46f065f@spud>
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
 <20230817090810.203900-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uTd1bS2sUh/E+Q2z"
Content-Disposition: inline
In-Reply-To: <20230817090810.203900-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--uTd1bS2sUh/E+Q2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 10:08:08AM +0100, Biju Das wrote:
> Document clock-output-names property and fix the "assigned-clock-rates"
> for each clock output in the example based on Table 3. ("Output Source")
> in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
>=20
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4X=
paejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock genera=
tor bindings")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> v1->v2:
>  * Updated commit description to make it clear it fixes
>    "assigned-clock-rates" in the example based on 5P35023 datasheet.
> ---
>  .../devicetree/bindings/clock/renesas,5p35023.yaml | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml=
 b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> index 839648e753d4..db8d01b291dd 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> @@ -49,6 +49,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint8-array
>      maxItems: 37
> =20
> +  clock-output-names:
> +    maxItems: 6
> +
>  required:
>    - compatible
>    - reg
> @@ -68,7 +71,7 @@ examples:
>              reg =3D <0x68>;
>              #clock-cells =3D <1>;
> =20
> -            clocks =3D <&x1_x2>;
> +            clocks =3D <&x1>;
> =20
>              renesas,settings =3D [
>                  80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
> @@ -76,11 +79,14 @@ examples:
>                  80 b0 45 c4 95
>              ];
> =20
> +            clock-output-names =3D "ref", "se1", "se2", "se3",
> +                                 "diff1", "diff2";
> +
>              assigned-clocks =3D <&versa3 0>, <&versa3 1>,
>                                <&versa3 2>, <&versa3 3>,
>                                <&versa3 4>, <&versa3 5>;
> -            assigned-clock-rates =3D <12288000>, <25000000>,
> -                                   <12000000>, <11289600>,
> -                                   <11289600>, <24000000>;
> +            assigned-clock-rates =3D <24000000>, <11289600>,
> +                                   <11289600>, <12000000>,
> +                                   <25000000>, <12288000>;
>          };
>      };
> --=20
> 2.25.1
>=20

--uTd1bS2sUh/E+Q2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOB9wgAKCRB4tDGHoIJi
0mrFAP9PzDRMb0YuFu9ZBqs7dSHjJkiLk6VDZV0JY/oR0PyDigD6Aw1D+UgSwdRJ
nzj5i0IMk3CHIz8hDmRvBeaSBUoUpgA=
=EnSt
-----END PGP SIGNATURE-----

--uTd1bS2sUh/E+Q2z--
