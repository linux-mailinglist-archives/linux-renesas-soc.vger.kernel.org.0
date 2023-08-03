Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7FC76EEF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 18:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbjHCQCj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 12:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbjHCQCh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 12:02:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E67E3AB1;
        Thu,  3 Aug 2023 09:02:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 213B661E27;
        Thu,  3 Aug 2023 16:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15010C433C8;
        Thu,  3 Aug 2023 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691078551;
        bh=isJq7/sl++Vn8+2s/zCENj8DEoK0XHxsN/VIjnyr6k8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YPsz5ds2kuO6ZuApV4w+2HCR0aqD054SpHqw3EKfukZ6JdZxjWY2wHcSf3nLTxmaf
         y5o/VF/QpdiDnON5wiyqWa+GIfvPKCMZK+L8OR2AIyOfpkaeRU2accktFpMwXSeM9V
         T7IchoT8tmaTnP9xt8PwKVwsePglwI1gkX7GOcTmQUe3o9ePX20eKNsJHKoRIphvxE
         3WJAF3ytaqC8LiZ7cb6scfP04y2Eb9SSC57Bxc9qnQz+MCVP3TZHpJs8RpnoHAFUEV
         ENJlgujbRvnqqPPOTe1tTnnnWLUvvHva5w/VU5PMSgKzHTl+iyu0Jwom8w5odojpA0
         oaI6o3GxS35ZA==
Date:   Thu, 3 Aug 2023 17:02:26 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Message-ID: <20230803-imminent-impound-559c483b75b9@spud>
References: <20230802122510.275420-1-biju.das.jz@bp.renesas.com>
 <20230802122510.275420-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cKvpK9tiOT1DB7q9"
Content-Disposition: inline
In-Reply-To: <20230802122510.275420-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--cKvpK9tiOT1DB7q9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Biju,

On Wed, Aug 02, 2023 at 01:25:08PM +0100, Biju Das wrote:
> Document clock-output-names property. Update the example according to
> Table 3. ("Output Source") in the 5P35023 datasheet.
>=20
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4X=
paejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock genera=
tor bindings")

Nothing in this commit message explains why this is a fix for this
binding addition :(

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

--cKvpK9tiOT1DB7q9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMvPkgAKCRB4tDGHoIJi
0o0YAP9zLCboe2xNWhkVqz6z+l18uuPdVdX/H3koNrVvPYgr1gD/fikhXqSkzKQx
sEzVbObwSGnYYTzAQZqhjFh4pXR0TgM=
=KzLk
-----END PGP SIGNATURE-----

--cKvpK9tiOT1DB7q9--
