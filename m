Return-Path: <linux-renesas-soc+bounces-465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33F7FF52D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 17:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3182D1C20FCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 16:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B94B54F8F;
	Thu, 30 Nov 2023 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D238110EF;
	Thu, 30 Nov 2023 08:26:33 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5c8c8f731aaso12799747b3.0;
        Thu, 30 Nov 2023 08:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701361593; x=1701966393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dzm/OK6dWfwxFy4S7+eG/Ses5Wb27zKAUsAAq7TyMMo=;
        b=h7ssx/WqJ+ws45R+NAH/PZg7MKzPnzaeDXMIt2HkbtgTpK2xcy2PI1QZXifnuDkWyn
         WPlUm/zXcz2/aNBLVgC8PKskO38QVUNFWOpw7BfRhEzCj4cUlzdgwBTuxNunqBdd/qqp
         NLLT9s7AnpG5Ok4dWHLpnlOjrmRiMQA2XNvHcMWjbBTpIitM8Cv+m1YPZzNYgGWOW0ay
         AIK0ZrIJm5FPd9rz96f8PxMSRqnu/IGd38lda3YZbtaEM8AxOEGV0FtmO8cqYTlahM/V
         l6HXs+aCzsbTkjBeNLuw8a7yTLegOYKwa4W4VbTG+y1kp0y4lDUivOWdaUjHoW9tjTN+
         e9zQ==
X-Gm-Message-State: AOJu0Yzvfc6mdmu9E2AUWXv4FSD5HZj21ZSqDRRRJc1d8AShnbG6dbhS
	PMX3CjFyJLZ6ojC7A8cZsXApPsZjvNGisg==
X-Google-Smtp-Source: AGHT+IEJaCcGR0P7UkUYTGWYD6+eIISnC1n62LhW4LNzZv/qYAVy64nCxpk+QJ+/nmo2MNZJQrn9qg==
X-Received: by 2002:a05:690c:2505:b0:5ce:e0a8:ed6f with SMTP id dt5-20020a05690c250500b005cee0a8ed6fmr22109654ywb.22.1701361592739;
        Thu, 30 Nov 2023 08:26:32 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id m190-20020a0dfcc7000000b005463e45458bsm451107ywf.123.2023.11.30.08.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:26:31 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-da41acaea52so1032969276.3;
        Thu, 30 Nov 2023 08:26:30 -0800 (PST)
X-Received: by 2002:a25:ac5:0:b0:dae:4b98:16f9 with SMTP id
 188-20020a250ac5000000b00dae4b9816f9mr22852909ybk.0.1701361590415; Thu, 30
 Nov 2023 08:26:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com> <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
In-Reply-To: <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 17:26:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
Message-ID: <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Nov 30, 2023 at 5:23=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Nov 30, 2023 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, Nov 30, 2023 at 1:56=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > We need to probe for IOCP only once during boot stage, as we were pro=
bing
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
> > > probing for IOCP only once in boot stage by having a boolean variable
> > > is_iocp_probe_done which will be set to true upon IOCP probe in
> > > errata_probe_iocp() and we bail out early if is_iocp_probe_done is se=
t.
> > >
> > > While at it make return type of errata_probe_iocp() to void as we wer=
e
> > > not checking the return value in andes_errata_patch_func().
> > >
> > > Fixes: e021ae7f5145 ("riscv: errata: Add Andes alternative ports")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2
> > > * As RISCV_ALTERNATIVES_BOOT stage can happen twice add a is_iocp_pro=
be_done
> > >   variable to probe for IOCP only once.
> > > * Updated commit message
> > > * Make return value of errata_probe_iocp() to void
> >
> > Thanks for the update!
> >
> > > --- a/arch/riscv/errata/andes/errata.c
> > > +++ b/arch/riscv/errata/andes/errata.c
> > > @@ -38,29 +38,36 @@ static long ax45mp_iocp_sw_workaround(void)
> > >         return ret.error ? 0 : ret.value;
> > >  }
> > >
> > > -static bool errata_probe_iocp(unsigned int stage, unsigned long arch=
_id, unsigned long impid)
> > > +static void errata_probe_iocp(unsigned int stage, unsigned long arch=
_id, unsigned long impid)
> > >  {
> > > +       static bool is_iocp_probe_done;
> >
> > done?
> >
> OK I'll rename it to "done".
>
> > > +
> > >         if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
> > > -               return false;
> > > +               return;
> > > +
> > > +       if (is_iocp_probe_done)
> > > +               return;
> > >
> >
> > Why not keep it simple, and just do
> >
> >     done =3D true;
> >
> OK.
>
> > here?
> > Can arch_id or impid suddenly change, so you have to recheck?
> I only check arch_id and impid here. Are you suggesting I drop it?

No, I do not suggest to drop it.
I suggested moving the "done =3D true" up, so the check is done only once.

> > If the SBI call in ax45mp_iocp_sw_workaround() fails, is there really
> > a need to try it again later?
> >
> No if it fails we just continue with a broken system.
>
> Cheers,
> Prabhakar
> > >         if (arch_id !=3D ANDESTECH_AX45MP_MARCHID || impid !=3D ANDES=
TECH_AX45MP_MIMPID)
> > > -               return false;
> > > +               return;
> > >
> > > -       if (!ax45mp_iocp_sw_workaround())
> > > -               return false;
> > > +       if (!ax45mp_iocp_sw_workaround()) {
> > > +               is_iocp_probe_done =3D true;
> > > +               return;
> > > +       }
> > >
> > >         /* Set this just to make core cbo code happy */
> > >         riscv_cbom_block_size =3D 1;
> > >         riscv_noncoherent_supported();
> > > -
> > > -       return true;
> > > +       is_iocp_probe_done =3D true;
> > >  }

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

