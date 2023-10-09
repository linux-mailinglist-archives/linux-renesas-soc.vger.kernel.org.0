Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042EA7BE61B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 18:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377115AbjJIQQJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 12:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377177AbjJIQQI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 12:16:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B33A9C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Oct 2023 09:16:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAB7C433C8;
        Mon,  9 Oct 2023 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696868167;
        bh=TUuYHkOnACwqBBmD9bJNqds06LCxmeRiTfbnAwarBgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eU2EVyLZvP0ynT/R9wgeiq9r9+GUMtVerH0hdEET3jzhYlaDfeI/DmNIjffFhYsRs
         c29FAKVXTo9TBjOwydx+byNRi0CpoqNqEQBstZC0fL+OdsHQ0VTJ5+MPxrU6yvvTVy
         DoND44aejrDEG2pU1yl/Z8ziE5sQ5aEiecoNKpfebw63j/PKR8Q33OqJvLqSCn4z4I
         MVZTLvStj7UDzGDV1NwogxSnxHTBdZdxjx3QRb8z6zO/qAPz5CpvamzCPE4jCwqI5O
         0T0H0pFkF0YY7YDPpzIkOnLI+5ng5KYYqjwsziP55JOvz2EWx2Z8cZ0IbcWdtHuk+T
         TDEGHZ/bTsriQ==
Date:   Mon, 9 Oct 2023 17:16:00 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new
 properties
Message-ID: <20231009-underpass-decorator-12e153d8f8e7@spud>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-smog-gag-3ba67e68126b@wendy>
 <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qLX05ACkobQ/OGT+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qLX05ACkobQ/OGT+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 02:15:47PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, Oct 9, 2023 at 11:44=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > Convert the RZ/Five devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> > --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > @@ -24,6 +24,9 @@ cpu0: cpu@0 {
> >                         reg =3D <0x0>;
> >                         status =3D "okay";
> >                         riscv,isa =3D "rv64imafdc";
> > +                       riscv,isa-base =3D "rv64i";
> > +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d=
", "c", "zicntr", "zicsr",
> > +                                              "zifencei", "zihpm";
>=20
> LGMT, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> I could not review the "zi*" parts, as the documentation that I have
> does not mention these.

These are effectively the assumptions that the kernel already makes, for
things that used to be part of the base isa (or were assumed to be) that
are now extensions in their own right.

The Zihpm it'd be good if someone from the Renesas or Andes sides could
confirm though.

Cheers,
Conor.

>=20
> >                         mmu-type =3D "riscv,sv39";
> >                         i-cache-size =3D <0x8000>;
> >                         i-cache-line-size =3D <0x40>;
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

--qLX05ACkobQ/OGT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQnQAAKCRB4tDGHoIJi
0pk+AQCDTGDR196WU+S3VHp6GoZyYrKV0pxVwcmVbOTky5SKxAD/bz6cONYAr9SE
2ryKqLVowNyGAA93Sr/qimPdZABBYgc=
=nGga
-----END PGP SIGNATURE-----

--qLX05ACkobQ/OGT+--
