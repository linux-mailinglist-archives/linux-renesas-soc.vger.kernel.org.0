Return-Path: <linux-renesas-soc+bounces-493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E778007C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 10:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 745272817D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62FF1EA73;
	Fri,  1 Dec 2023 09:57:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30D82134;
	Fri,  1 Dec 2023 01:57:43 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-db510605572so322835276.0;
        Fri, 01 Dec 2023 01:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701424662; x=1702029462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDOIqFg4pESUQz8ST7BsU3RSPktSqE3GKIxBJ7SXCTM=;
        b=RYdqDyRpsXDhlymiuPrIzXx3bwpBvTm4FoFWZUk/GPTHCjt/py4Yb19kx7jgdnU/Vn
         oxcynVqMOAtZsLcwbIk6Y4hMivHWXYdcRxXBrpVQUrIl/ihhU/QbKxz5g8AIgtwVpFRY
         TeLHn6Pjskl7OAv/GG4MpsJIIYkZdlfpb64svQexFq9grxVRGdGGg7ZboYWKxaC9idHz
         l8VxorEoh8TY0wlnsPeSpd3FlFoDsQkqLcAP7Us0XohHAMwphMUcAX+eEGawKlLpuUH5
         VF3N6kcDSSwERBtH+soSmsc/CkG3SfYYvr1i9/YNENfiXa5VsJ97PVek8dn/vVZdnmtC
         oSNw==
X-Gm-Message-State: AOJu0YwqWSK39qCIfcKKomHd0vYMXfFfylkEm5t5sSXtwPf359q2GFx0
	ht7m+DMs1V6AKIJpWXArx3g/DDYKkQQmag==
X-Google-Smtp-Source: AGHT+IHY5Vfq0h4QhouT3wnV7oV0XZfnBeef88ASo/MtLd1cFnHGr45GkLyjel5mZJo6H7agECKSnw==
X-Received: by 2002:a05:6902:e81:b0:da0:cea9:2b3b with SMTP id dg1-20020a0569020e8100b00da0cea92b3bmr27301329ybb.62.1701424662324;
        Fri, 01 Dec 2023 01:57:42 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id e134-20020a25e78c000000b00d9a36ded1besm283114ybh.6.2023.12.01.01.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 01:57:41 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d33574f64eso18843277b3.3;
        Fri, 01 Dec 2023 01:57:40 -0800 (PST)
X-Received: by 2002:a0d:c607:0:b0:5c8:708f:1ea with SMTP id
 i7-20020a0dc607000000b005c8708f01eamr26098779ywd.32.1701424660131; Fri, 01
 Dec 2023 01:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 10:57:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXf=xDeM7qz=n-YNPpkZD25R04RQZMG0C+BP5O6VvMDiA@mail.gmail.com>
Message-ID: <CAMuHMdXf=xDeM7qz=n-YNPpkZD25R04RQZMG0C+BP5O6VvMDiA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: errata: andes: Probe for IOCP only once in boot stage
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:27=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> We need to probe for IOCP only once during boot stage, as we were probing
> for IOCP for all the stages this caused the below issue during module-ini=
t
> stage,
>
> [9.019104] Unable to handle kernel paging request at virtual address ffff=
ffff8100d3a0
> [9.027153] Oops [#1]
> [9.029421] Modules linked in: rcar_canfd renesas_usbhs i2c_riic can_dev s=
pi_rspi i2c_core
> [9.037686] CPU: 0 PID: 90 Comm: udevd Not tainted 6.7.0-rc1+ #57
> [9.043756] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> [9.050339] epc : riscv_noncoherent_supported+0x10/0x3e
> [9.055558]  ra : andes_errata_patch_func+0x4a/0x52
> [9.060418] epc : ffffffff8000d8c2 ra : ffffffff8000d95c sp : ffffffc8003a=
bb00
> [9.067607]  gp : ffffffff814e25a0 tp : ffffffd80361e540 t0 : 000000000000=
0000
> [9.074795]  t1 : 000000000900031e t2 : 0000000000000001 s0 : ffffffc8003a=
bb20
> [9.081984]  s1 : ffffffff015b57c7 a0 : 0000000000000000 a1 : 000000000000=
0001
> [9.089172]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : ffffffff8100=
d8be
> [9.096360]  a5 : 0000000000000001 a6 : 0000000000000001 a7 : 000000000900=
031e
> [9.103548]  s2 : ffffffff015b57d7 s3 : 0000000000000001 s4 : 000000000000=
031e
> [9.110736]  s5 : 8000000000008a45 s6 : 0000000000000500 s7 : 000000000000=
003f
> [9.117924]  s8 : ffffffc8003abd48 s9 : ffffffff015b1140 s10: ffffffff8151=
a1b0
> [9.125113]  s11: ffffffff015b1000 t3 : 0000000000000001 t4 : fefefefefefe=
feff
> [9.132301]  t5 : ffffffff015b57c7 t6 : ffffffd8b63a6000
> [9.137587] status: 0000000200000120 badaddr: ffffffff8100d3a0 cause: 0000=
00000000000f
> [9.145468] [<ffffffff8000d8c2>] riscv_noncoherent_supported+0x10/0x3e
> [9.151972] [<ffffffff800027e8>] _apply_alternatives+0x84/0x86
> [9.157784] [<ffffffff800029be>] apply_module_alternatives+0x10/0x1a
> [9.164113] [<ffffffff80008fcc>] module_finalize+0x5e/0x7a
> [9.169583] [<ffffffff80085cd6>] load_module+0xfd8/0x179c
> [9.174965] [<ffffffff80086630>] init_module_from_file+0x76/0xaa
> [9.180948] [<ffffffff800867f6>] __riscv_sys_finit_module+0x176/0x2a8
> [9.187365] [<ffffffff80889862>] do_trap_ecall_u+0xbe/0x130
> [9.192922] [<ffffffff808920bc>] ret_from_exception+0x0/0x64
> [9.198573] Code: 0009 b7e9 6797 014d a783 85a7 c799 4785 0717 0100 (0123)=
 aef7
> [9.205994] ---[ end trace 0000000000000000 ]---
>
> This is because we called riscv_noncoherent_supported() for all the stage=
s
> during IOCP probe. riscv_noncoherent_supported() function sets
> noncoherent_supported variable to true which has an annotation set to
> "__ro_after_init" due to which we were seeing the above splat. Fix this b=
y
> probing for IOCP only once in boot stage by having a boolean variable
> "done" which will be set to true upon IOCP probe in errata_probe_iocp()
> and we bail out early if "done" is set to true.
>
> While at it make return type of errata_probe_iocp() to void as we were
> not checking the return value in andes_errata_patch_func().
>
> Fixes: e021ae7f5145 ("riscv: errata: Add Andes alternative ports")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

