Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61087BD199
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 03:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjJIBBc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Oct 2023 21:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjJIBBc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Oct 2023 21:01:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9A3AB
        for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Oct 2023 18:01:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C6FC433C8;
        Mon,  9 Oct 2023 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696813290;
        bh=12V8BUvOQDiMroiIaSqNg+ekaSPMnUVQbV6cs0RaO7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fHFveZ0CQSUsuNBwIPok0GacL5mh+087UwreYFIFEyjLsPwuCEAU3Qun4X1Cxed00
         AQtYzylaY2DDJmz69Zs4PW3cp856jqZhbm54SA6lmNwajzKpLN7lRBHvSF6FTmQdVz
         eJ37ZTP8iKUdp14y6bZVrVIZsCq8LfVv9NMUZZ85G/jWiTIFfk2hJYj+9XLq08hHDO
         0mscV+Bo2LKs8fI9SYRhzkKMt5i70vZ0+hilfk5Gv+3CscqUmc/Qrp97qls23/adXf
         udnE+p3PUmXS6zPWptd7/uWz6TrAKoMmvhAYf//V5ps/eTjh9sSPHV0LVtPxtlytxF
         eV2twhhYyjl8w==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-536071e79deso8768949a12.1;
        Sun, 08 Oct 2023 18:01:30 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywj2s4Urq3GWkkAhVsRL8gpQC+HO8YrmUJ483nsm/4O0u1QKkY2
        0CqxXk6SIy1rgPh6kE/cF1L4MuG07aa0ugn5GfQ=
X-Google-Smtp-Source: AGHT+IHIfsPYV3LL5MmuuW4fRb62rbHbzO3zKIowTx57SQthg3QHBVuMCr03hUmOCe0pZutvENlB/38cG81IZDD3OGQ=
X-Received: by 2002:a50:fb0c:0:b0:530:8759:a3ac with SMTP id
 d12-20020a50fb0c000000b005308759a3acmr10568781edq.2.1696813289399; Sun, 08
 Oct 2023 18:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230922081351.30239-2-conor@kernel.org> <20230922081351.30239-8-conor@kernel.org>
 <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com> <20230923-snowsuit-angled-f49237d27c83@spud>
In-Reply-To: <20230923-snowsuit-angled-f49237d27c83@spud>
From:   Guo Ren <guoren@kernel.org>
Date:   Mon, 9 Oct 2023 09:01:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+PJcZguUEN8+Ls_DX4U3xpW+4O-ztrJ0NzM2ODrc_5w@mail.gmail.com>
Message-ID: <CAJF2gTQ+PJcZguUEN8+Ls_DX4U3xpW+4O-ztrJ0NzM2ODrc_5w@mail.gmail.com>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new properties
To:     Conor Dooley <conor@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 23, 2023 at 6:25=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Sep 23, 2023 at 03:50:36PM +0800, Guo Ren wrote:
> > On Fri, Sep 22, 2023 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Convert the th1520 devicetrees to use the new properties
> > > "riscv,isa-base" & "riscv,isa-extensions".
> > > For compatibility with other projects, "riscv,isa" remains.
> > >
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/=
dts/thead/th1520.dtsi
> > > index ce708183b6f6..723f65487246 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -20,6 +20,9 @@ c910_0: cpu@0 {
> > >                         compatible =3D "thead,c910", "riscv";
> > >                         device_type =3D "cpu";
> > >                         riscv,isa =3D "rv64imafdc";
> > > +                       riscv,isa-base =3D "rv64i";
>
> > Why not riscv,isa-base =3D "rv64"? I saw "i" in the riscv,isa-extension=
s.
>
> I did it that way as a hedge against things changing in the future. I
> have little trust in that part of the ISA specifications.
Okay, that's clear enough.

Acked-by: Guo Ren <guoren@kernel.org>


--=20
Best Regards
 Guo Ren
