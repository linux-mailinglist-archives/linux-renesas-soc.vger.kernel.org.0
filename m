Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2442F7AC06F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Sep 2023 12:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbjIWKZ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Sep 2023 06:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjIWKZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Sep 2023 06:25:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2951B2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Sep 2023 03:25:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57453C433C7;
        Sat, 23 Sep 2023 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695464748;
        bh=Q3Y7t0Lpv4O8LxXpOYTrQfyQd9RMu7ml1ykCJ09i0So=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D3XJIweX871CqMOIaHHipt11EREXzfg2FoIRdC2GlabW2UWDr77bvfpiQnW6VqpX2
         IrInx2zSMQrWTcK7PCWKcTu2boVcKo3rkcerPNfLFYz5WsFb7SBQW8rqHhWDm+7pTx
         +aLLjjXNDZWqEWv/1goXqkfRefyvbp8fqjgWggWcYpY4BwCJg8LcJTId4C9UsA6tAz
         GU0NNqVIDt3OZduOV4HoPZlJEEDNeQqlzaupvqSU9AsQtghk6gncjir72tcevg7vJq
         DIIyY29iZNaTX/yjd8fVC/u+KcoZfEBB/eXoK87Ip2Qr2ft1JmbdOcatZIsgniKzNS
         qhQwxOrN/+DKA==
Date:   Sat, 23 Sep 2023 11:25:42 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Guo Ren <guoren@kernel.org>
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
        Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <20230923-snowsuit-angled-f49237d27c83@spud>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-8-conor@kernel.org>
 <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="47AsyQWf2LP0qoEw"
Content-Disposition: inline
In-Reply-To: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--47AsyQWf2LP0qoEw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 03:50:36PM +0800, Guo Ren wrote:
> On Fri, Sep 22, 2023 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Convert the th1520 devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dt=
s/thead/th1520.dtsi
> > index ce708183b6f6..723f65487246 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -20,6 +20,9 @@ c910_0: cpu@0 {
> >                         compatible =3D "thead,c910", "riscv";
> >                         device_type =3D "cpu";
> >                         riscv,isa =3D "rv64imafdc";
> > +                       riscv,isa-base =3D "rv64i";

> Why not riscv,isa-base =3D "rv64"? I saw "i" in the riscv,isa-extensions.

I did it that way as a hedge against things changing in the future. I
have little trust in that part of the ISA specifications.

--47AsyQWf2LP0qoEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ69JQAKCRB4tDGHoIJi
0vX6AQDE7jhpSu4VP4wtSRPrVTHRRS7VcBWe2XyVZJTOd9TWXAD7BBHlwAPzKSGb
vt2Z0iGrgkRVFsQ1U/vLuYvhM1ucsgE=
=fcfM
-----END PGP SIGNATURE-----

--47AsyQWf2LP0qoEw--
