Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28067AE8B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 11:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbjIZJPH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 05:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjIZJPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 05:15:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2DEE6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 02:15:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85849C433C7;
        Tue, 26 Sep 2023 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695719699;
        bh=vB7h+RwIQEyHyA8z9mX6Uv3Ewigxx2fwQEemoQsoyjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OeDAwLOqMtoG55ZOKPBUBsxnJl72Ss+YtwmT4mbtRZIrBpYZhO5WN+SJkYsZc+EX3
         VFv6nHtskokd873w3RS66Pme8sWt6a2acYYrH6n8ljTleT8s5N/nofWkPqjc3VM1w8
         V7ZD1HyMlkofAH5VdA09gA2PjSpr8wBvsp7L77oMwLskqqacZh4452xafdyS2/qVkc
         8iRJpE2FN3FEMhXjFqwuFDjPCUEQHZ2kpFDJnbMVWD0UA5SL54jqcTNGWC6PpHRSJX
         xKc5TwDtBrLdm3q7+dcaSPikS0a2LdYSoP9MBlB2zbblIOgbKY146OKKrtkneDHvPo
         VCLG5KvkVmosQ==
Date:   Tue, 26 Sep 2023 10:14:53 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Icenowy Zheng <uwu@icenowy.me>
Cc:     linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
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
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <20230926-ramp-couch-431e9bb5d18b@spud>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-8-conor@kernel.org>
 <f3b8d0823150797bde975a09b1faf6d3826d1ea8.camel@icenowy.me>
 <20230925-semantic-euphemism-f0c7e85ac317@spud>
 <c80bf6710d8cc7a1c0d49d52ad6410d04c6a0858.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H7Qevf7mE+3lJqt1"
Content-Disposition: inline
In-Reply-To: <c80bf6710d8cc7a1c0d49d52ad6410d04c6a0858.camel@icenowy.me>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--H7Qevf7mE+3lJqt1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 11:15:27AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2023-09-25=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 16:59 +0100=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Sun, Sep 24, 2023 at 07:22:30AM +0800, Icenowy Zheng wrote:
> > > =E5=9C=A8 2023-09-22=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 09:13 +0100=
=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >=20
> > > > Convert the th1520 devicetrees to use the new properties
> > > > "riscv,isa-base" & "riscv,isa-extensions".
> > > > For compatibility with other projects, "riscv,isa" remains.
> > > >=20
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > =C2=A0arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
> > > > =C2=A01 file changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > index ce708183b6f6..723f65487246 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > @@ -20,6 +20,9 @@ c910_0: cpu@0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0compatible =3D "thead,c910", "riscv";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0device_type =3D "cpu";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0riscv,isa =3D "rv64imafdc";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ris=
cv,isa-base =3D "rv64i";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ris=
cv,isa-extensions =3D "i", "m", "a",
> > > > "f",
> > > > "d", "c", "zicntr", "zicsr",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei",
> > > > "zihpm";
> > >=20
> > > Zfh is supported by T-Head C9xx with float too.
> >=20
> > You say xx, so just to be sure: Is it always supported, or only with
> > some config for the IP (I wanna know if I need to look out for it
> > while
> > reviewing other SoCs etc)?
>=20
> I think it's grouped with FD.
>=20
> > Also, do you have a link to the documentation for it? English is the
> > only relevant language I speak, so if the doc is in Chinese, I'll
> > need
> > some help!
>=20
> Sorry, but T-Head's official document [1] is only in Chinese. In
> addition, in this document half-float is listed as a "T-Head
> extension", but the encoding matches Zfh. See 15.6 Appendix B-6 Half
> Float (15.6 =E9=99=84=E5=BD=95 B-6 =E6=B5=AE=E7=82=B9=E5=8D=8A=E7=B2=BE=
=E5=BA=A6=E6=8C=87=E4=BB=A4=E6=9C=AF=E8=AF=AD) .

Hmm, I'm not sure that I want to do this. Since it is only an "I think"
and it's not *actually* advertised as being Zfh but apparently has
matching encoding, I would rather someone who is capable of understanding
that document submitted the patch.

> [1]
> https://github.com/T-head-Semi/openc910/blob/main/doc/%E7%8E%84%E9%93%81C=
910%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf
>=20
> >=20
> > > In addition, should X extensions get listed here?
> >=20
> > Yes, but someone who cares about documenting these extensions should
> > do
> > it ;)
>=20
> Well at least a bunch of Xthead's are now documented.

I meant documented in the dt-binding, not documented in a pdf on GitHub.

> Maybe they will get appended after this patchset get introduced.
>=20
> By the way, how to deal with the draft V of C9xx?

Same deal, it'll have to be defined as a vendor extension in the
dt-binding.

Cheers,
Conor.

--H7Qevf7mE+3lJqt1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRKhDQAKCRB4tDGHoIJi
0qTtAP4x++Jg7pM9GwGEgluyCfrCMdeE1MAS2B2Y3kcXvPex9gD7BHscbzSugnAf
eBqMy9rEm4q+NNq2Q19snrpYWGeagQw=
=BJRY
-----END PGP SIGNATURE-----

--H7Qevf7mE+3lJqt1--
