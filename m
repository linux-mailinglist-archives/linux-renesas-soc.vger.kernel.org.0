Return-Path: <linux-renesas-soc+bounces-96-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBB7F42AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 10:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43BCAB20DC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 09:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB7156463;
	Wed, 22 Nov 2023 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4381992;
	Wed, 22 Nov 2023 01:48:16 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5744443276.1;
        Wed, 22 Nov 2023 01:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646495; x=1701251295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHbDG7xmjaDmF5SrcycK4m6QkPhjKBtcpVNj6/N9Z2c=;
        b=MbUhLX1nxEJy3wzF/pHmHTkeoTUpQ7Kmob4ggN+op9c+AkmKaa5jmaOt/3ij/DlAZJ
         R6cK2GcsDOyA8AJjrxp5IW3e9F56n5IYA7zshzNJYtM3qmBwEUjufIW2sD3sQE2655rw
         rzHik2YUUE5K9sqfuJZiyuNSjfAMVhFrDTb2b6Au6QMiQL4r7TywDZA1FBWuvjLDCNB5
         /GPSru9IVn+h9T5aAcLbdTPePPT6NHALTfk2ZUAesBIyNtMKxw5rl1X5xtEqYFIEYwBn
         2ryqPqcQG6k1VTfmvg58pXRcWs07EyZSZ9MigkDBg6gFb816AquqKtBccj/wHMULkq98
         GzpQ==
X-Gm-Message-State: AOJu0YxhxGezyM69Ldmh8Z30EA391ra57K+5OW1qaeakE//CqNiOeDjt
	kHcIYBcmrvdx5Jh1Wi9uAi3NonNCEP0DtA==
X-Google-Smtp-Source: AGHT+IEXP39RpYbdL/xeBR0uJXB41pcBA81e8J7ZynucJ35MfH0nU/63jBlUxk43I6RxgfPcLf1CDg==
X-Received: by 2002:a25:6942:0:b0:db3:628d:c7af with SMTP id e63-20020a256942000000b00db3628dc7afmr1582503ybc.47.1700646495541;
        Wed, 22 Nov 2023 01:48:15 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id j84-20020a256e57000000b00d9ace05037csm1292654ybc.13.2023.11.22.01.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 01:48:14 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-db3fd3e971cso611375276.3;
        Wed, 22 Nov 2023 01:48:14 -0800 (PST)
X-Received: by 2002:a5b:8ca:0:b0:d0f:846c:ef7b with SMTP id
 w10-20020a5b08ca000000b00d0f846cef7bmr1608826ybq.17.1700646493868; Wed, 22
 Nov 2023 01:48:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXozB7PVOZM+SQa9D6Zca3x_+LE63RhmBGPDvmOma1fUA@mail.gmail.com> <CA+V-a8tfN8goMf=sc2t6dovBsGmFbioWt7cdbOca8QHJF=EP_w@mail.gmail.com>
In-Reply-To: <CA+V-a8tfN8goMf=sc2t6dovBsGmFbioWt7cdbOca8QHJF=EP_w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 10:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZyata02WfphsROjY5fJE0r0AkXyHMoxVK8cAFvnEP1A@mail.gmail.com>
Message-ID: <CAMuHMdXZyata02WfphsROjY5fJE0r0AkXyHMoxVK8cAFvnEP1A@mail.gmail.com>
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Nov 22, 2023 at 10:45=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Nov 22, 2023 at 8:23=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, Nov 21, 2023 at 9:25=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > We should be probing for IOCP during boot stage only. As we were prob=
ing
> > > for IOCP for all the stages this caused the below issue during module=
-init
> > > stage,
> > >
> > > [9.019104] Unable to handle kernel paging request at virtual address =
ffffffff8100d3a0
> > > [9.027153] Oops [#1]
> > > [9.029421] Modules linked in: rcar_canfd renesas_usbhs i2c_riic can_d=
ev spi_rspi i2c_core
> > > [9.037686] CPU: 0 PID: 90 Comm: udevd Not tainted 6.7.0-rc1+ #57
> > > [9.043756] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT=
)
> > > [9.050339] epc : riscv_noncoherent_supported+0x10/0x3e
> > > [9.055558]  ra : andes_errata_patch_func+0x4a/0x52
> > > [9.060418] epc : ffffffff8000d8c2 ra : ffffffff8000d95c sp : ffffffc8=
003abb00
> > > [9.067607]  gp : ffffffff814e25a0 tp : ffffffd80361e540 t0 : 00000000=
00000000
> > > [9.074795]  t1 : 000000000900031e t2 : 0000000000000001 s0 : ffffffc8=
003abb20
> > > [9.081984]  s1 : ffffffff015b57c7 a0 : 0000000000000000 a1 : 00000000=
00000001
> > > [9.089172]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : ffffffff=
8100d8be
> > > [9.096360]  a5 : 0000000000000001 a6 : 0000000000000001 a7 : 00000000=
0900031e
> > > [9.103548]  s2 : ffffffff015b57d7 s3 : 0000000000000001 s4 : 00000000=
0000031e
> > > [9.110736]  s5 : 8000000000008a45 s6 : 0000000000000500 s7 : 00000000=
0000003f
> > > [9.117924]  s8 : ffffffc8003abd48 s9 : ffffffff015b1140 s10: ffffffff=
8151a1b0
> > > [9.125113]  s11: ffffffff015b1000 t3 : 0000000000000001 t4 : fefefefe=
fefefeff
> > > [9.132301]  t5 : ffffffff015b57c7 t6 : ffffffd8b63a6000
> > > [9.137587] status: 0000000200000120 badaddr: ffffffff8100d3a0 cause: =
000000000000000f
> > > [9.145468] [<ffffffff8000d8c2>] riscv_noncoherent_supported+0x10/0x3e
> > > [9.151972] [<ffffffff800027e8>] _apply_alternatives+0x84/0x86
> > > [9.157784] [<ffffffff800029be>] apply_module_alternatives+0x10/0x1a
> > > [9.164113] [<ffffffff80008fcc>] module_finalize+0x5e/0x7a
> > > [9.169583] [<ffffffff80085cd6>] load_module+0xfd8/0x179c
> > > [9.174965] [<ffffffff80086630>] init_module_from_file+0x76/0xaa
> > > [9.180948] [<ffffffff800867f6>] __riscv_sys_finit_module+0x176/0x2a8
> > > [9.187365] [<ffffffff80889862>] do_trap_ecall_u+0xbe/0x130
> > > [9.192922] [<ffffffff808920bc>] ret_from_exception+0x0/0x64
> > > [9.198573] Code: 0009 b7e9 6797 014d a783 85a7 c799 4785 0717 0100 (0=
123) aef7
> > > [9.205994] ---[ end trace 0000000000000000 ]---
> > >
> > > This is because we called riscv_noncoherent_supported() for all the s=
tages
> > > during IOCP probe. riscv_noncoherent_supported() function sets
> > > noncoherent_supported variable to true which has an annotation set to
> > > "__ro_after_init" due to which we were seeing the above splat. Fix th=
is by
> > > probing IOCP during boot stage only.
> > >
> > > Fixes: e021ae7f5145 ("riscv: errata: Add Andes alternative ports")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/riscv/errata/andes/errata.c
> > > +++ b/arch/riscv/errata/andes/errata.c
> > > @@ -60,7 +60,8 @@ void __init_or_module andes_errata_patch_func(struc=
t alt_entry *begin, struct al
> > >                                               unsigned long archid, u=
nsigned long impid,
> > >                                               unsigned int stage)
> > >  {
> > > -       errata_probe_iocp(stage, archid, impid);
> > > +       if (stage =3D=3D RISCV_ALTERNATIVES_BOOT)
> > > +               errata_probe_iocp(stage, archid, impid);
> > >
> > >         /* we have nothing to patch here ATM so just return back */
> > >  }
> >
> > I believe this still causes errata_probe_iocp() to be called twice:
> > once from apply_boot_alternatives(), and a second time (if CONFIG_MMU=
=3Dy)
> > from apply_vdso_alternatives().  Is that OK?
> >
> Hmm during my testing I didnt see this being called twice (maybe
> because alternative section was not found) in
> apply_vdso_alternatives().
>
> > Perhaps instead you want to add a check to errata_probe_iocp() (after
> > the check for CONFIG_ERRATA_ANDES_CMO), to bail out if the function
> > was called before?
> >
> OK so I'll have a static variable ("riscv_noncoherent_set") in
> errata_probe_iocp() and if it's being set I'll bail out early.

Just call it "done" or "called", it can be a local static variable ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

